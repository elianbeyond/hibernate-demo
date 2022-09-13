package com.example.demo.controller;

import com.example.demo.common.R;
import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;


@RestController
@RequestMapping("/demo")
public class UserController {
    @Autowired
    UserMapper userRepo;

    @PostMapping("/login")
    public R<User> login(HttpServletRequest request, @RequestBody User user){

//        1.将页面提交的密码进行md5加密
        String username = user.getUsername();
        String password = user.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));

//        2.根据提交的username查询数据库
        User existUser = userRepo.findUserByUsername(username);
//        3.没查到返回失败结果
        if(existUser == null){
            return R.error("login failed");
        }
//        4.查到，对比密码是否相同，不一致则返回失败
        if(!existUser.getPassword().equals(password)){
            return R.error("failed:wrong password");
        }
//        5.查看该员工是否禁用状态，禁用则返回失败
        if(existUser.isBan() ){
            return R.error("this account has been banned");
        }
//        6.返回成功结果
        request.getSession().setAttribute("user",existUser.getId());
        return R.success(existUser);
    }


    @PostMapping("/register")
    public R<String> register(HttpServletRequest request, @RequestBody User user){

//        1.将页面提交的密码进行md5加密
        String username = user.getUsername();
        String password = user.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));

//        2.根据提交的username查询数据库
        User existUser = userRepo.findUserByUsername(username);
//        3.查到,说明用户名已经存在，返回失败结果
        if(existUser != null){
            return R.error("username already existed");
        }
//        4.未查到，则执行save操作
        user.setPassword(password);
        userRepo.save(user);

//        6.返回成功结果
        request.getSession().setAttribute("user",user.getId());

        return R.success("register success");
    }
}

