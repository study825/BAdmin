package com.ruoyi.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.PcSystem;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 * 
 * @author ruoyi
 */
public interface PcSystemMapper extends BaseMapper<PcSystem>
{
    public List<PcSystem> getPcSystemList();
}
