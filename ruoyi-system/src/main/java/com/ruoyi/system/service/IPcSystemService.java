package com.ruoyi.system.service;

import com.ruoyi.system.domain.PcSystem;

import java.util.List;

public interface IPcSystemService {
    Integer addSystemData(PcSystem system);

    Integer updateSystemData(PcSystem system);

    List<PcSystem> getSystemDataList();

    Integer deleteSystemData(Integer systemId);

    List<PcSystem> getAllSystemDataList();

    PcSystem getSystemDataById(Long systemId);

    List<PcSystem> getSystemDataListByKeyword(String keyword);
}
