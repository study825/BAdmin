package com.ruoyi.system.service;

import com.ruoyi.system.domain.PcModule;
import com.ruoyi.system.domain.PcSystem;

import java.util.List;

public interface IPcModuleService {
    Integer addPcModuleData(PcModule pcModule);

    List<PcModule> getModuleDataList();

    Integer deleteModuleData(Integer moduleId);

    Integer updatePcModuleData(PcModule pcModule);

    List<PcModule> getModuleDataListBySystem(Integer systemId);

    List<PcModule> getModuleDataListByKeyword(String keyword);
}
