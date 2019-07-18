package com.dzxx.ssm.Web;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

public class initWebServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //两个初始化，一个初始化：spring的ico容器的引用初始化到InitWebServlet类的一个静态方法
    private static ApplicationContext applicationContext;
    public static ApplicationContext getApplicationContext(){
        return applicationContext;
    }

    @Override
    public void init() throws ServletException {
        super.init();
        // 1.在此进行applicationContext的初始化
        ServletContext servletContext = getServletContext();//返回web项目中最大的域对象
        applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        //2.初始化权限
        try{
            //packageName实施权限控制的包全名
            String packageName = "com.dzxx.ssm.Controller";
            String packageNamePath = packageName.replace(".", "/"); //  ---> com/dzxx/ssm/Controller,类路径下的相对路径
            String packageNameRealPath = this.getClass().getClassLoader().getResource(packageNamePath).getPath();//磁盘当中的绝对路径
            System.out.println("磁盘当中的绝对路径"+packageNameRealPath);
            File file = new File(packageNameRealPath); //file就是controller在磁盘的这个文件夹
            //遍历这个文件夹里所有的.class文件
            String[] classFileNames = file.list(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    if(name.endsWith(".class")) {
                        return true;
                    }
                    return false;
                }
            });
            //构造出这个class文件的包全名
            List<String> resources = new ArrayList<>();
            for(String classFileName : classFileNames) {
                //.class这个后缀给删除掉
                classFileName = classFileName.substring(0,classFileName.indexOf(".class"));
                //拿到纯粹的类的包全名
                String classAllpackageName = packageName + "." + classFileName;
                //拿到纯粹的类的包全名，可以通过他们获取到对应的类的对象，通过反射
                Class clazz = Class.forName(classAllpackageName);
                //拿到这些controller的对象，获取到在他们身上的注解
                //if(!clazz.isAnnotationPresent()) continue;
               // if(clazz.isAnnotationPresent(AuthClass.class))
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }
    /* public void init() throws ServletException {


            List<String> resources = new ArrayList<>();

            for(String classFileName : classFileNames) {
                //.class这个后缀给删除掉
                classFileName = classFileName.substring(0,classFileName.indexOf(".class"));
                //拿到纯粹的类的包全名
                String classAllpackageName = packageName + "." + classFileName;
                //拿到纯粹的类的包全名，可以通过他们获取到对应的类的对象，通过反射
                Class clazz = Class.forName(classAllpackageName);
                //拿到这些controller的对象，获取到在他们身上的注解
                if(!clazz.isAnnotationPresent(AuthClass.class)) continue;
                //剩下的类，都是有@AuthClass这个注解的类，这些类都要进行权限控制的
                //拿到这些类的所有方法
                Method[] methods = clazz.getDeclaredMethods();//包含private
                for(Method method : methods) {
                    if(!method.isAnnotationPresent(AuthMethod.class)) continue;
                    //都是有@AuthMethod的方法,拿到要保存到permission表里resource字段的值
                    //1:cn.ybzy.sshweb.controller.UserConroller.addUser
                    //2:/getAllUsers
                    RequestMapping reqMapping = method.getAnnotation(RequestMapping.class);
                    resources.add(reqMapping.value()[0]);
                    //String resource = classAllpackageName + "." + method.getName();
                }
            }
            //List<String> resources ： 包含了controller包里，所有被@AuthClass和@AuthMethod共同作用的
            //方法上面的@RequestMapping的value值，都在里面！
            PermissionService permissionService = (PermissionService) applicationContext.getBean("permissionService");
            permissionService.initPermisstions(resources);
            context.setAttribute("allPermRes", resources);  // 系统中所有的需要权限控制的方法的权限控制标记
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }*/
}
