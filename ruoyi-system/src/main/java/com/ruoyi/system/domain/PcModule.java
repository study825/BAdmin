package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class PcModule {
    private Long moduleId;

    private String moduleName;

    private String detailUrl;

    private Integer systemId;

    private String moduleContent;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date CreateTime;
}
