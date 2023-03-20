package com.ruoyi.web.controller.pc;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.PcSystem;
import com.ruoyi.system.service.IPcSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pc/system")
public class SystemController extends BaseController {
    @Autowired
    private IPcSystemService iSystemService;

    @GetMapping("list")
    public TableDataInfo list() {
        startPage();
        List<PcSystem> data = iSystemService.getSystemDataList();

        return getDataTable(data);
    }

    @GetMapping("all")
    public TableDataInfo all() {
        List<PcSystem> data = iSystemService.getSystemDataList();

        return getDataTable(data);
    }


    @PostMapping(path = "add")
    public AjaxResult add(@RequestBody PcSystem pcSystem) {
        Integer resultNum = iSystemService.addSystemData(pcSystem);
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }


    @PostMapping(path = "edit")
    public AjaxResult edit(@RequestBody PcSystem pcSystem) {
        Integer resultNum = iSystemService.updateSystemData(pcSystem);
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    @PostMapping(path = "/{systemId}")
    public AjaxResult delete(@PathVariable Long systemId) {
        Integer resultNum = iSystemService.deleteSystemData(Math.toIntExact(systemId));
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }
}
