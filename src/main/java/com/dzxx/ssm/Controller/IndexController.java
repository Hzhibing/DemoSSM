package com.dzxx.ssm.Controller;
import com.dzxx.ssm.Service.RoleService;
import com.dzxx.ssm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class IndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @GetMapping(value = {"/admin"})
    public String admin(){

        return "admin/admin";
    }
    @GetMapping("/index")
    public  String index(){
        return "index";
    }
    @GetMapping("/login")
    public  String login(){
        return "login";
    }

    @GetMapping("/admin/role_manager.html")
    public  String role(){
        return "admin/role";
    }

}
