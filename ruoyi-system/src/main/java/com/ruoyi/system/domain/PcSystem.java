package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class PcSystem {
    private Long systemId;

    private String systemVersion;

    private String systemName;

    private String des;

    private String systemLeader;

    private String systemStatus;

    private String systemContent;

    private String dataTotal;

    private String dataDayAdd;

    private Integer dataTableNum;

    private String deploySystem;

    private String dataSource;

    private String dataTableType;

    private String useCompany;

    private String manageCompany;

    private String registerUser;

    private Integer buildTime;

    private Integer sort;

    private Integer apiNum;

    private String systemBackgroundImage;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
