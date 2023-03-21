package com.ruoyi.web.controller.pc;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.PcModule;
import com.ruoyi.system.service.IPcModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pc/module")
public class ModuleController extends BaseController {
    @Autowired
    private IPcModuleService iPcModuleService;

    @GetMapping("list")
    public TableDataInfo list(Integer systemId) {
        startPage();
        List<PcModule> data = iPcModuleService.getModuleDataList(systemId);

        return getDataTable(data);
    }

    @PostMapping(path = "add")
    public AjaxResult add(@RequestBody PcModule pcModule) {
        Integer resultNum = iPcModuleService.addPcModuleData(pcModule);
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }


    @PostMapping(path = "edit")
    public AjaxResult edit(@RequestBody PcModule pcModule) {
        Integer resultNum = iPcModuleService.updatePcModuleData(pcModule);
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    @DeleteMapping("/{moduleIds}")
    public AjaxResult delete(@PathVariable Long[] moduleIds) {
        Integer resultNum = iPcModuleService.deleteModuleData(moduleIds);
        if (resultNum > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }
}
