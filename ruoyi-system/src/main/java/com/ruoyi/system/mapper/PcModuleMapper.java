package com.ruoyi.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.PcModule;

import java.util.List;

public interface PcModuleMapper extends BaseMapper<PcModule> {
    List<PcModule> getPcModuleList(Integer systemId);

    List<PcModule> getPcModuleListLike(String keyword);
}
