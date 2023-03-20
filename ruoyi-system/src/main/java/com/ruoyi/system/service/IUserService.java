package com.ruoyi.system.service;

import com.ruoyi.system.domain.User;

import java.util.List;

public interface IUserService {
    Integer insertUser(String username, String password);

    Integer getUserCountByName(String username);

    User getUserInfoByName(String username);

    List<User> getUserList();

    Integer deletePcUser(Long userId);
}
