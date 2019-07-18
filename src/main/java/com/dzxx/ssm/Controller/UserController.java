package com.dzxx.ssm.Controller;
import com.dzxx.ssm.Model.Role;
import com.dzxx.ssm.Model.User;
import com.dzxx.ssm.Service.RoleService;
import com.dzxx.ssm.Service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @ResponseBody
    @GetMapping("/test")
    public List<User> testUser(){
       List<User> userList = userService.selectAll();
       return  userList;
    }
    @PostMapping("/addjsp")
    public String add(User user, Integer[]roles){
        userService.addUser(user,roles);
        return "redirect:/admin/user_manager.html?pageNum=1&pageSize=5";
    }
    @ResponseBody
    @RequestMapping(value = "/admin/updateUser",method = RequestMethod.GET,produces = "text/html;charset=utf-8")
    /*修改用户当中涉及到用户的类型，所以在修改的方法中调用了Sercice层中的根据id关联查询的方法*/
    public String updateUser(Integer id, HttpServletRequest request){
        String path = request.getContextPath();
        User user = userService.selectById(id);
        /*
        获取到用户类型表里面的数据注入到编辑页面
        定义空字符串用来连接用户类型的字符串
        */
        Role role1 = user.getRole();
        String type = role1.getName();
        String str = "";
        List<Role> roleList =  roleService.selectAll();
        for(Role role:roleList){

                str+="                            <option value=\""+role.getId()+"\">"+role.getName()+"</option>\n";

        }
        return"<div class=\"modal-header\">\n" +
                "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
                "                <h4 class=\"modal-title\">编辑用戶</h4>\n" +
                "            </div>\n" +
                "            <div class=\"modal-body\">\n" +
                "                <form id =\"updateUserForm\" action=\""+path+"/admin/updateUser11.html\" method=\"post\">\n" +
                "                     <input type= \"hidden\" name=\"id\" value=\""+user.getId()+"\"> "+
                "                    <div class=\"form-group\">\n" +
                "                        <label>用户名:</label>\n" +
                "                        <input type=\"text\" name=\"username\" class=\"form-control\" value=\""+user.getUsername()+"\" >\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>密码:</label>\n" +
                "                        <input type=\"password\" name=\"password\" class=\"form-control\" value=\"+"+user.getPassword()+"\">\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>手机号:</label>\n" +
                "                        <input type=\"text\" name=\"phone\" class=\"form-control\" value=\""+user.getPhone()+"\">\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>邮箱:</label>\n" +
                "                        <input type=\"text\" name=\"email\" class=\"form-control\" value=\""+user.getEmail()+"\">\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>用户类别:</label>\n" +
                "                        <select name=\"roles\" class=\"form-control\">\n" +
                                            str +
                "                        </select>\n" +
                "                    </div>\n" +
                "                </form>\n" +
                "            </div>\n" +
                "            <div class=\"modal-footer\">\n" +
                "                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">退出</button>\n" +
                "                <button onclick=\"submit()\" type=\"button\" class=\"btn btn-primary\">修改</button>\n" +
                "            </div>";
    }
    @PostMapping("/admin/updateUser11.html")
    public String update(User user,Integer[]roles ){
        System.out.println(user);
        System.out.println(Arrays.toString(roles));
        userService.updateUser(user,roles);
        return "redirect:/admin/user_manager.html";
    }
    @GetMapping("/admin/removeUser")
    public String removeUser(int id){
        if(userService.removeUser(id)){
            return "redirect:/admin/user_manager.html";
        }
        else{
            return "error";
        }
    }
    @ResponseBody
    @PostMapping(value = "/admin/deleteUsers.html")
    public String deleteUsers(String uid){
       uid= uid.substring(1,uid.length()-1);
        uid = uid.replaceAll("\"","");
        String []array = uid.split(",");
        Integer[]integers = new Integer[array.length];
        for(int i = 0;i<array.length;i++){
            integers[i] = Integer.parseInt(array[i]);
        }
        System.out.println(Arrays.toString(integers));
        userService.deleteUsers(integers);
        return "success";
    }
    @PostMapping("/admin/userSearch.html")
    public String searchUsers(Model model,String studentInfo){
       int pageNum = 1;
       int pageSize = 5;
        List<Role> roleList = roleService.selectAll();
        PageInfo<User> userPageInfoList = userService.selectUsersBySearchPage(pageNum, pageSize,studentInfo);
        model.addAttribute("userPageInfoList",userPageInfoList);
        model.addAttribute("result",roleList);
        return "admin/user";
    }
    @RequestMapping("/json")
    public void testJson(@RequestAttribute User user){
        System.out.println("hello");
        System.out.println(user.toString());
        System.out.println("username:"+user.getUsername()+" "+"pass: "+user.getPassword());
    }
    @RequestMapping("/aaa")
    public String testJson1(){
       return "test";
    }
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request,HttpSession session){
        String captchaCode = request.getParameter("captcha");
        String googleCode = (String) request.getSession().getAttribute("code");
        String username = user.getUsername();
        String password = user.getPassword();
        int count = userService.selectByNameAndMiMa(username,password);
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        System.out.println("sessionVerifyCode"+sessionVerifyCode);
              if(count > 0){
                  if (!googleCode.equals(captchaCode))  {
                    request.setAttribute("code","验证码输入错误");
                    return "login";
                }else
                    return "redirect:/admin";
            }else{
                request.setAttribute("result","用户名或密码错误");
                return "login";
            }
    }

    /* 获取校验码 */
    /*@RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);
        // 将校验码保存到session中
        session.setAttribute("verifyCodeValue", verifyCodeValue);

        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();

        }
    }

    /* 绘制验证码 */
    /*private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /* 获取随机参数 */
    /*private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }*/
}
