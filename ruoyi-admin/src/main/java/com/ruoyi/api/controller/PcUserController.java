package com.ruoyi.api.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.sign.Md5Utils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.User;
import com.ruoyi.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("/api/user")
public class PcUserController {
    @Autowired
    private TokenService tokenService;

    @Autowired
    private IUserService iUserService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody User user) {
        User userInfo = iUserService.getUserInfoByName(user.getUsername());
        if (userInfo != null) {
            if (Objects.equals(userInfo.getPassword(), Md5Utils.hash(user.getPassword() + userInfo.getSalt()))) {
                LoginUser loginUser = new LoginUser();
                loginUser.setUserId(userInfo.getUserId());

                // 生成token
                String token = tokenService.createApiToken(loginUser);

                AjaxResult ajax = AjaxResult.success();
                ajax.put(Constants.TOKEN, token);
                return ajax;
            }
            return AjaxResult.error(4002, "用户密码错误");
        }

        return AjaxResult.error(4001, "用户不存在");
    }

    @PostMapping("/reg")
    public AjaxResult reg(@RequestBody User user) {
        Integer userNum = iUserService.getUserCountByName(user.getUsername());
        if (userNum > 0) {
            return AjaxResult.error(4000, "用户已存在");
        }

        Integer result = iUserService.insertUser(user.getUsername(), user.getPassword());
        if (result > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }
}
