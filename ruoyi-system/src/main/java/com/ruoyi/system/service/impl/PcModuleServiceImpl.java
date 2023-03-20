package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.system.domain.PcModule;
import com.ruoyi.system.domain.PcSystem;
import com.ruoyi.system.mapper.PcModuleMapper;
import com.ruoyi.system.service.IPcModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PcModuleServiceImpl implements IPcModuleService {
    @Autowired
    private PcModuleMapper pcModuleMapper;

    @Override
    public Integer addPcModuleData(PcModule pcModule) {
        pcModule.setCreateTime(new Date());
        return pcModuleMapper.insert(pcModule);
    }

    @Override
    public List<PcModule> getModuleDataList() {

        return pcModuleMapper.getPcModuleList();
    }

    @Override
    public Integer deleteModuleData(Integer moduleId) {
        QueryWrapper<PcModule> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("module_id", moduleId);

        return pcModuleMapper.delete(queryWrapperUser);
    }

    @Override
    public Integer updatePcModuleData(PcModule pcModule) {
        QueryWrapper<PcModule> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("module_id", pcModule.getModuleId());

        return pcModuleMapper.update(pcModule, queryWrapperUser);
    }

    @Override
    public List<PcModule> getModuleDataListBySystem(Integer systemId) {
        QueryWrapper<PcModule> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("system_id", systemId);

        return pcModuleMapper.selectList(queryWrapperUser);
    }

    public List<PcModule> getModuleDataListByKeyword(String keyword) {
        return pcModuleMapper.getPcModuleListLike(keyword);
//        QueryWrapper<PcModule> queryWrapperUser = Wrappers.query();
//        queryWrapperUser.like("module_name", "%" + keyword + "%");
//
//        return pcModuleMapper.selectList(queryWrapperUser);
    }
}
