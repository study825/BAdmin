package com.ruoyi.web.controller.pc;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.User;
import com.ruoyi.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pc/user")
public class UserController extends BaseController {
    @Autowired
    private IUserService iUserService;

    @GetMapping("list")
    public TableDataInfo list() {
        startPage();
        List<User> data = iUserService.getUserList();

        return getDataTable(data);
    }

    @PostMapping("/{userId}")
    public AjaxResult delete(@PathVariable Long userId) {
        Integer result = iUserService.deletePcUser(userId);
        if (result > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    @PostMapping("resetPwd")
    public AjaxResult resetPwd(@RequestBody User user) {
        Integer result = iUserService.updatePassword(user.getUserId(), user.getPassword());
        if (result > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }
}
