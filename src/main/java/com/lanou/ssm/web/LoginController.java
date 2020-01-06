package com.lanou.ssm.web;

import com.lanou.ssm.bean.JsonUtil;
import com.lanou.ssm.bean.ResponseInfo;
import com.lanou.ssm.bean.User;
import com.lanou.ssm.bean.UserExample;
import com.lanou.ssm.mapper.UserMapper;
import com.lanou.ssm.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private UserMapper userMapper;
    @RequestMapping("/login")
    public void UserController(Model model , HttpServletRequest request, HttpServletResponse response ,User user) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rem = request.getParameter("rem");

        UserExample userExample = new UserExample();
       List<User> users= userMapper.selectByExample(userExample);

        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            String ret = JsonUtil.toJsonString(new ResponseInfo(421, "用户名和密码不能为空!"));
            out.println(ret);
            return ;

        }


       for( User user1 :users) {
           if (!user1.getAccount().equals(username)) {
               String ret = JsonUtil.toJsonString(new ResponseInfo(422, "用户名或密码错误!"));
               out.println(ret);
               return;
           }
           String ret = JsonUtil.toJsonString(new ResponseInfo(200, "登录成功", "/SMS.first.jsp"));
           out.println(ret);
       }



    }
}
