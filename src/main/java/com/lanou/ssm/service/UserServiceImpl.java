package com.lanou.ssm.service;


import com.lanou.ssm.bean.User;
import com.lanou.ssm.bean.UserExample;
import com.lanou.ssm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> queryBy(User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();


        return userMapper.selectByExample(userExample);
    }




}
