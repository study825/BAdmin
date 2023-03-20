package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.utils.sign.Md5Utils;
import com.ruoyi.system.domain.PcSystem;
import com.ruoyi.system.domain.User;
import com.ruoyi.system.mapper.UserMapper;
import com.ruoyi.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Random;


@Service
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer insertUser(String username, String password) {
        Random r = new Random();
        String salt = String.valueOf(r.nextInt(1000));

        User userInfo = new User();
        userInfo.setUsername(username);
        userInfo.setPassword(Md5Utils.hash(password + salt));
        userInfo.setSalt(salt);
        userInfo.setCreateTime(new Date());

        return userMapper.insert(userInfo);
    }

    @Override
    public Integer getUserCountByName(String username) {
        QueryWrapper<User> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("username", username);

        return userMapper.selectCount(queryWrapperUser);
    }

    @Override
    public User getUserInfoByName(String username) {
        QueryWrapper<User> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("username", username);

        return userMapper.selectOne(queryWrapperUser);
    }

    @Override
    public List<User> getUserList() {
        QueryWrapper<User> queryWrapperUser = Wrappers.query();

        return userMapper.selectList(queryWrapperUser);
    }

    @Override
    public Integer deletePcUser(Long pcUserId) {
        QueryWrapper<User> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("user_id", pcUserId);

        return userMapper.delete(queryWrapperUser);
    }
}
