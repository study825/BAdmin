package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.system.domain.PcModule;
import com.ruoyi.system.domain.PcSystem;
import com.ruoyi.system.mapper.PcSystemMapper;
import com.ruoyi.system.service.IPcSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PcSystemServiceImpl implements IPcSystemService {
    @Autowired
    private PcSystemMapper pcSystemMapper;

    @Override
    public Integer addSystemData(PcSystem system) {
        system.setCreateTime(new Date());
        return pcSystemMapper.insert(system);
    }

    @Override
    public Integer updateSystemData(PcSystem system) {
        QueryWrapper<PcSystem> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("system_id", system.getSystemId());

        return pcSystemMapper.update(system, queryWrapperUser);
    }

    @Override
    public List<PcSystem> getSystemDataList() {
        return pcSystemMapper.getPcSystemList();
    }

    @Override
    public Integer deleteSystemData(Integer systemId) {
        QueryWrapper<PcSystem> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("system_id", systemId);

        return pcSystemMapper.delete(queryWrapperUser);
    }

    @Override
    public List<PcSystem> getAllSystemDataList() {
        return pcSystemMapper.getPcSystemList();
    }

    @Override
    public PcSystem getSystemDataById(Long systemId) {
        QueryWrapper<PcSystem> queryWrapperUser = Wrappers.query();
        queryWrapperUser.eq("system_id", systemId);

        return pcSystemMapper.selectOne(queryWrapperUser);
    }

    @Override
    public List<PcSystem> getSystemDataListByKeyword(String keyword) {
        QueryWrapper<PcSystem> queryWrapperUser = Wrappers.query();
        queryWrapperUser.like("system_name", "%" + keyword + "%");

        return pcSystemMapper.selectList(queryWrapperUser);
    }
}
