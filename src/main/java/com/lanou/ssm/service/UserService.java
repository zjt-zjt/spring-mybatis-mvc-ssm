package com.lanou.ssm.service;


import com.lanou.ssm.bean.User;

import java.util.List;

public interface UserService {
    List<User> queryBy(User user);


}
