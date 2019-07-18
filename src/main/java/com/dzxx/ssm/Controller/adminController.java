package com.dzxx.ssm.Controller;
import java.util.List;
import com.dzxx.ssm.Model.Role;
import com.dzxx.ssm.Model.User;
import com.dzxx.ssm.Service.RoleService;
import com.dzxx.ssm.Service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

/**
 * @AuthClass
 */
@Controller
public class adminController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    //@GetMapping("/admin/user_manager.html")
    @RequestMapping( value = "/admin/user_manager.html",produces = "text/html;charset=utf-8")
    public String user(Model model, Integer pageNum, Integer pageSize, HttpServletResponse response){
        response.setContentType("text/html;charset=UTF-8");
        if(pageNum==null||pageNum==0){
            pageNum = 1;
        }
        if(pageSize ==null||pageSize==0) {
            pageSize = 5;
        }
        List<Role> roleList = roleService.selectAll();
       // System.out.println("用户类型为"+roleList);
        PageInfo<User> userPageInfoList = userService.selectByPage(pageNum, pageSize);
        model.addAttribute("userPageInfoList",userPageInfoList);
        model.addAttribute("result",roleList);
        return "admin/user";
    }
    @GetMapping("/admin/user")
    public String user1(){
        return "admin/user";
    }
}
