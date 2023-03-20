package com.ruoyi.api.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.PcModule;
import com.ruoyi.system.domain.PcSystem;
import com.ruoyi.system.service.IPcModuleService;
import com.ruoyi.system.service.IPcSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/system")
public class PcSystemController {
    @Autowired
    private IPcSystemService iPcSystemService;

    @Autowired
    private IPcModuleService iPcModuleService;

    @PostMapping("/list")
    public AjaxResult list() {
        List<PcSystem> pcSystemList = iPcSystemService.getAllSystemDataList();

        return AjaxResult.success(pcSystemList);
    }

    @PostMapping("/show")
    public AjaxResult show(@RequestBody Map<String, Integer> data) {
        PcSystem pcSystemData = iPcSystemService.getSystemDataById(Long.valueOf(data.get("systemId")));
        List<PcModule> moduleList = iPcModuleService.getModuleDataListBySystem(data.get("systemId"));

        HashMap<String, Object> result = new HashMap<>();
        result.put("system_data", pcSystemData);
        result.put("module_data", moduleList);

        return AjaxResult.success(result);
    }

    @PostMapping("/search")
    public AjaxResult search(@RequestBody Map<String, String> data) {
        String keyword = data.get("keyword");
        List<PcSystem> systemList = iPcSystemService.getSystemDataListByKeyword(keyword);
        List<PcModule> moduleList = iPcModuleService.getModuleDataListByKeyword(keyword);

        HashMap<String, Object> result = new HashMap<>();
        result.put("system_list", systemList);
        result.put("module_list", moduleList);

        return AjaxResult.success(result);
    }
}
