/*
 Navicat Premium Data Transfer

 Source Server         : ss
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 47.122.37.13:3306
 Source Schema         : ss

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 27/03/2023 20:56:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pc_module
-- ----------------------------
DROP TABLE IF EXISTS `pc_module`;
CREATE TABLE `pc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `detail_url` varchar(255) DEFAULT NULL,
  `system_id` int(11) DEFAULT NULL,
  `module_content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pc_module
-- ----------------------------
BEGIN;
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (2, '分析统计模块', 'https://space-pmnukz.w.eolink.com/home/api-studio/inside/ppXATqDcdc064f9251940cf4e835827b641e8d8c0321f40/api/2334808/detail/50267022?spaceKey=space-pmnukz', 2, '<p><strong class=\"ql-size-large\">展示界面﻿</strong></p><p>	可对每日项目数、天窗点施工占比、当日施工人数统计、项目详情、每日工作人数、年龄结构、告警记录进行可视化查看施工总览界面</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/微信截图_20230320090023_20230321094116A007.png\"></p><p>	系统主界面，可以显示施工项目和人数信息。同时显示可视化图、单位管理、数据查询、告警记录、账号管理、总/分包管理、人员管理、施工计划功能模块键入按钮布置。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/微信截图_20230320090123_20230321094124A008.png\"></p>', NULL);
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (3, '系统功能模块', '', 2, '<p><strong class=\"ql-size-large\">1.总/分包单位管理</strong></p><p>(1) “名称”字段要求录入“项目部名称”</p><p>(2) “单位名称”要求录入“所属承包商处级单位” (3)增加“标段”字段内容：按照合同名称录入</p><p>(4)总包单位上传项目合同、单位法人信息、营业执照信息</p><p>(5)分包单位上传分包合同、劳务单位法人信息、营业执照信息</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/Snipaste_2023-03-21_09-46-30_20230321094644A009.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/微信截图_20230321094719_20230321094728A010.png\"></p><p><br></p><p><strong class=\"ql-size-large\">2.总/分包人员管理</strong></p><p>(1)总/分包人员信息具备报表自动生成和导出功能</p><p>(2)一人一档，可以批量导入人员信息，也可以单人增加信息。支持图片信息单独逐人导入</p><p>(3)总/分包人员信息采用总包和分包2级架构录入</p><p>(4)总/分包人员“职务栏”：项目经理、副经理、总工、副总工、工程部长（技术负责人）、安质部长、安全总监（安全负责人）、其他管理人员、施工负责人、驻站联络员、现场防护员、安全员、施工人员、特种作业人员。一人可选多职。</p><p>(5)总/分包人员须有相关附件的上传功能项目部管理人员：人事命令、劳动合同、社保证明。项目部其他人员：人事调令、劳动合同、社保证明。劳务分包单位“四大员”：劳动合同、社保证明。特种作业人员：资格证书</p><p>(6)总/分包人员实现超龄禁止录入</p><p>(7)总/分包人员上传资格证件：上岗证、“四大员”安全培训合格证和“培训合格证（沿线用工\\后备军）”</p><p>(8)总/分包人员需区分“沿线用工\\后备军”和“非沿线用工”</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/Snipaste_2023-03-21_09-54-43_20230321095812A011.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/总分包人员管理流程图_20230321095901A012.png\"></p>', '2023-03-19 19:39:36');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (14, '项目管理模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述</strong></p><p>1.通过勾选的方式调用“人员管理”中的所有“字段”信息纳入“项目管理”</p><p>2.同一项目，分包单位名称最多不得超过四个</p><p>3.项目管理需包含项目的合同信息及起止日期。通过人工输入或自动从工程管理信息系统接入合同起止时间，超期不得输入施工计划和记录员工考勤。合同延期需提交申请并经项目主管工程师审批</p><p>4.查看/上传项目内人员的考核试卷及考核结果</p><p>5.选择相应的项目需展示项目内的关键信息：总包单位及人员信息、分包单位及人员信息、项目每日施工计划、项目施工告警（非在库人员告警、缺少4大员告警）</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/项目管理_20230321100244A014.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/项目管理流程图_20230321100249A015.png\"></p>', '2023-03-21 10:02:52');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (15, '施工计划/施工告警模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述</strong></p><p>1.施工计划按时间倒序显示</p><p>2.施工计划增加施工人员疫情防控两码及核酸信息</p><p>3.施工人员录入按层级分类显示：项目部盯控管理人员、施工负责人、安全员、驻站联络员、现场防护员、远端防护员、其他施工人员等</p><p>4.施工告警（非在库人员告警）</p><p>5.施工告警（缺少4大员告警）</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/施工计划施工告警1_20230321100647A016.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/施工计划施工告警2_20230321100652A017.png\"><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/施工计划施工告警流程图_20230321100657A018.png\"></p>', '2023-03-21 10:07:00');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (16, '审核功能模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述</strong></p><p>1.审核总包/分包人员、单位信息：</p><p>(1)项目部管理人员：人事命令、劳动合同、社保证明。</p><p>(2)项目部其他人员：人事调令、劳动合同、社保证明。</p><p>(3)劳务分包单位“四大员”：劳动合同、社保证明。</p><p>(4)特种作业人员：资格证书</p><p>(5)资格证件：上岗证、“四大员”安全培训合格证和“培训合格证（沿线用工\\后备军）”</p><p>2.对临时增加的施工人员信息的审核，审核通过后的人员，方可纳入施工人员范围</p><p>3.对项目信息、人员考核信息的审核</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/审核功能_20230321100853A019.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/审核功能流程图_20230321100903A020.png\"></p>', '2023-03-21 10:09:06');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (17, '考核评价模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述</strong></p><p>1.分公司各级管理人员（含施工盯控人），有权对施工单位开具记分通知单，录入“记分事由”、“违章条款”、“记分分值”，提交后流转施工单位确认，处罚完毕，发起人结束流程</p><p>2.“违章记分”项设置导出、统计分析功能。由系统管理员分配导出权限或者写除承包商单位和查询用户，其他用户具备导出权限，导出表格内容包含委外承包单位、施工人员姓名、身份证号码、职务、记分事由、对应条款、记分分值、记分日期等</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/考核评价_20230321101037A021.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/考核评价流程图_20230321101042A022.png\"></p>', '2023-03-21 10:10:44');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (18, '人员考勤模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述：</strong></p><p>1.承包商施工人员作业前，现场管理人员使用终端识别施工人员信息，识别成功自动考勤并记录。</p><p>2.考勤内容：项目信息、施工单位、人员信息、考勤时间、位置信息。</p><p>3.考勤信息支持查询、导出。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/人员考勤_20230321101221A023.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/人员考勤流程图_20230321101226A024.png\"></p>', '2023-03-21 10:12:29');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (19, '人员分组核验模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能描述：</strong></p><p>1.大型施工或同一时间、同一公里标，多人多处施工，可通过承包商上报施工计划的管理进行人员分组识别，同时进行人脸核验。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/人员分组核验_20230321101423A025.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/人员分组核验流程图_20230321101431A026.png\"></p>', '2023-03-21 10:14:33');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (20, '系统管理模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能介绍</strong></p><p>1.告警信息</p><p>对施工告警生产的信息进行记录，以列表的方式显示，支持查找。告警信息：告警内容、项目信息、施工单位、告警时间、告警详情（非在库人员告警、缺少4大员告警）。</p><p>2.账号管理</p><p>承包商与公司、子分公司（中心）签订合同后，公司、子分公司（中心）项目管理部门在此模块中分配相应的账号。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/系统管理模块_20230321101540A027.png\"></p>', '2023-03-21 10:15:42');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (21, '系统接口模块', NULL, 2, '<p><strong class=\"ql-size-large\">功能介绍：</strong></p><p><span class=\"ql-cursor\">﻿</span>1.本质安全管理信息系统</p><p>施工计划数据（包括施工时间、施工地点、施工内容）</p><p>2.电子定位平台系统接口</p><p>施工人员实时位置信息、施工现场实时音视频信息数据</p>', '2023-03-21 10:16:12');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (22, '可视化展示模块', NULL, 3, '<p><strong class=\"ql-size-large\">功能介绍</strong></p><p>	可视化界面采用浅蓝色调，可视化界面展示对应急队伍数量、告警信息、历史数据、系统录入应急终端数量做汇总呈现。升级后的应急通信系统采用于新的组织架构适用朔黄铁路其他分子公司及工队进行使用，并可对应急设备发起视频拉流。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/可视化展示模块_20230321101958A028.png\"></p>', '2023-03-21 10:20:05');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (23, '应急设备拉流模块', NULL, 3, '<p><strong class=\"ql-size-large\">功能介绍</strong></p><p>1.&nbsp;通过该模块可对加入应急平台的设备发起实时视频拉流</p><p><br></p><p>2.&nbsp;通过该模块可以对已拉流设备进行实时音频通话</p><p><br></p><p>3.&nbsp;通过该模块，可实现单路画面上墙，在不影响其他设备拉流的情况下单独拉出一路视频播放应急通信系统可对在线注册的设备进行音视频拉流，对需要重点研判的可以单独画面进行显示。不影响其他画面集中显示。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/应急设备拉流模块_20230321102116A029.png\"></p><p><br></p>', '2023-03-21 10:21:24');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (24, '设备管理模块', NULL, 3, '<p><strong class=\"ql-size-large\">功能介绍</strong></p><p>1.&nbsp;通过该模块可支持添加多种应急设备</p><p><br></p><p>2.&nbsp;通过该模块可支持添加应急部门资源及应急人员</p><p class=\"ql-align-justify\">应急通信设备管理模块，采用标准的GB/T28181-2016接入协议，支持根据不同的应急单位建立应急设备，支持添加应急单双网单兵、应急手电、应急头盔、应急指挥箱、星光夜视仪。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/设备管理模块流程图_20230321102304A030.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/设备管理模块_20230321102310A031.png\"></p>', '2023-03-21 10:23:13');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (25, '数据管理模块', NULL, 3, '<p><strong class=\"ql-size-large\">功能介绍：</strong></p><p>1.&nbsp; 应急单兵现场录制的视频实时上传后台存储</p><p><br></p><p>2.&nbsp; 系统可在线播放应急单兵所上传录制的视频文件，并支持在线下载应急通信系统中现场应急设备，支持通过网络上传的方式，将设备所拍摄的视频文件上传至系统历史数据管理模块；系统可在线查看/下载所上传的视频文件。该模块支持模糊检索日期、设备编号。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/数据管理流程图_20230321102526A032.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/数据管理_20230321102534A033.png\"></p><p><br></p>', '2023-03-21 10:25:37');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (26, '应急手机APP', NULL, 3, '<p><strong class=\"ql-size-large\">功能介绍：</strong></p><p>1.&nbsp;独立手机APP账号密码</p><p><br></p><p>2.&nbsp;对现场接入的应急指挥箱做视频拉流，进入应急手机APP主界面时，可查看到所有在线的应急指挥箱的在线信息，对上线的指挥箱进行拉流，实时查看回传的音视频。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/应急手机APP_20230321102708A034.png\"></p><p><br></p>', '2023-03-21 10:27:10');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (27, '系统功能模块', NULL, 5, '<p><strong class=\"ql-size-large\">1.&nbsp; 三合一界面</strong></p><p>	<strong class=\"ql-size-large\">功能介绍：</strong></p><p>(1)统一账号根据权限登录三个平台系统</p><p>(2)统一汇总界面展示三套系统主要业务数据及汇总数据统计图</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/三合一流程图_20230321105513A037.png\"></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/三合一_20230321105519A038.png\"></p><p><strong class=\"ql-size-large\">2.&nbsp; 电子定位可视化视图</strong></p><p><strong class=\"ql-size-large\">功能介绍：</strong></p><p>(1)接入朔黄天气系统数据显示朔黄沿线车站每日天气情况</p><p><br></p><p>(2)接入朔黄行车数据显示朔黄沿线每日运行车辆数量进行统计</p><p><br></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/电子定位可视化视图_20230321105703A039.png\"></p><p><br></p>', '2023-03-21 10:57:24');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (28, '地图调度列车模块', NULL, 5, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>1.&nbsp;地图区分人员、列车、监控独立显示</p><p><br></p><p>2.&nbsp;显示列车实时运行位置信息，显示列车详细数据信息</p><p><br></p><p>3.&nbsp;根据列车实时运行位置显示列车附近一定范围内终端数量及相关信息</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/地图调度-列车_20230321105849A040.png\"></p>', '2023-03-21 10:58:52');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (29, '地图调度监控模块', NULL, 5, '<p><strong class=\"ql-size-large\">功能介绍：</strong></p><p>1.&nbsp; 与基石平台国标级联，接入基石平台固定监控</p><p><br></p><p>2.&nbsp; 固定监控地图点位显示</p><p><br></p><p>3.&nbsp; 对接入的固定监控进行拉流</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/地图调度-监控_20230321105955A041.png\"></p>', '2023-03-21 10:59:58');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (30, '行车室可视化电话监控一键拉流模块', NULL, 5, '<p><strong class=\"ql-size-large\">功能介绍：</strong></p><p>1.&nbsp;对已接入平台的行车室可视化电话及固定监控一键拉流</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/行车室可视化电话监控一键拉流_20230321110102A042.png\"></p>', '2023-03-21 11:01:07');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (31, '配置管理人员管理模块', NULL, 5, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>1.&nbsp; 平台所有录入的终端实行自动分配编号制，单模终端起始编号SH001；双模终端起始编号SHD001；手环起始编号SHW001。</p><p><br></p><p>2.&nbsp; 强制限制选择终端岗位，添加入平台的人员根据设备的使用单位及工队的不同选择对应的岗位信息</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/配置管理-人员管理_20230321110221A043.png\"></p>', '2023-03-21 11:02:29');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (32, '电子定位中间库模块', NULL, 5, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>1.&nbsp; 开发中间库界面，中间库界面合入电子定位平台中</p><p><br></p><p>2.&nbsp; 对接数据直接入库，中间库可推送或获取对接数据</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/电子定位中间库_20230321110322A044.png\"></p>', '2023-03-21 11:03:25');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (33, '网络拓扑', NULL, 7, '<p><strong class=\"ql-size-large\">拓扑说明：	</strong></p><p>无线车次号信息采集服务器用端口镜像采集网管中心3楼机房CTC至LTE接口服务器机柜内LTE接口交换机主和LTE接口交换机备的端口数据，无线车次号采集服务器安装在网管中心4楼机房，通过办公网将数据发送至基石项目中心服务器。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/网络拓扑_20230321111813A045.png\"></p>', '2023-03-21 11:18:16');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (34, '设备需求', NULL, 7, '<p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/设备需求_20230321111944A046.png\"></p>', '2023-03-21 11:19:46');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (35, '安装方案', NULL, 7, '<p><strong>新增设备安装在网管中心4楼既有E7机柜内，具体位置如图中虚线位置所示。</strong></p><p><strong><span class=\"ql-cursor\">﻿</span></strong><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/安装方案_20230321112048A047.png\"></p><p><br></p><p><br></p>', '2023-03-21 11:20:50');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (36, '网络跳线', NULL, 7, '<p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/网络条线_20230321112136A048.png\"></p>', '2023-03-21 11:21:38');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (37, '交换机配置', NULL, 7, '<p>（1）LTE接口交换机主（SW1）配置</p><p><br></p><p>	Monitor session 1 source interface f0/1 both</p><p><br></p><p>	Monitor session 1 destination interface f0/11 both</p><p><br></p><p>（2）LTE接口交换机备（SW2）配置</p><p><br></p><p>	Monitor session 1 source interface f0/1 both</p><p><br></p><p>	Monitor session 1 destination interface f0/11 both</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/交换机端口配置_20230321112229A049.png\"></p>', '2023-03-21 11:22:31');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (38, '系统结构', NULL, 8, '<p><strong class=\"ql-size-large\">结构说明	</strong></p><p>地面监测维护管理中心由通信/数据服务器、业务服务器、监控浏览终端等部分组成，系统结构如图所示</p><p>	通信/数据服务器主要负责接收CIR-L上报的监测数据以及故障数据，并进行数据存储；业务服务器主要负责，一是提供数据分析、故障检测、统计查询、数据展示等业务，二是作为接口服务器负责与本安管理系统及网管大数据系统等互联互通。业务服务器系统以Web服务方式提供各项业务服务，监测与查询结果以网页方式对外呈现；维护人员通过监控浏览终端上的浏览器可直接访问监控结果和统计数据。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/系统结构_20230321113459A050.png\"></p>', '2023-03-21 11:35:01');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (39, '软件结构图', NULL, 8, '<p><strong class=\"ql-size-large\">结构说明：	</strong></p><p>CIR-L动态监测维护系统软件体系结构可分为采集层、处理层、交互层三个层次。</p><p>	采集层实现对CIR-L设备多维度的监测数据采集；处理层是系统的核心功能区，实现监测数据处理和典型故障的自动检测和自动分析，告警通知，并对监测数据进行多维度大数据分析；交互层是用户使用界面，提供数据展示，统计分析业务。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/软件结构图_20230321113628A051.png\"></p>', '2023-03-21 11:36:30');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (40, '设备监测数据采集模块', NULL, 8, '<p>	<strong class=\"ql-size-large\">模块列表：</strong></p><p><br></p><p>   （1）机车运行状态数据采集</p><p><br></p><p>	（2）设备状态数据采集</p><p><br></p><p>	（3）功能单元状态数据采集</p><p><br></p><p>	（4）LTE网络状态数据采集</p><p><br></p><p>	（5）列尾风压数据采集</p><p><br></p><p>	（6）司机操作数据采集</p><p><br></p><p>	（7）呼叫事件数据采集</p><p><br></p><p>	（8）单元版本及关键配置数据采集</p><p><br></p><p>	（9）CIR板件数据ID采集</p>', '2023-03-21 11:37:40');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (41, '设备监测数据接收模块', NULL, 8, '<p>	实现CIR-L设备上报数据的接收，并存储入数据库服务。</p><p><br></p><p>	CIR-L监测数据接收处理后，可提供用于在线运行状态实时监测、故障自动告警、历史记录回放等功能。</p>', '2023-03-21 11:38:10');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (42, '运行状态实时监测模块', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p><span class=\"ql-cursor\">﻿</span>	CIR-L设备向监测维护系统发送在途运行状态监测信息，系统接收并进行处理后，提供CIR-L设备在途运行状态实时监测、历史状态记录回放等功能。</p><p><br></p><p>	监测维护系统实时显示全线路范围在用的CIR-L设备位置信息，点击电子地图可显示的设备详细信息，实时监测信息包括:</p><p><br></p><p>Ø&nbsp; 机车状态监测</p><p><br></p><p>	机车运行状态应包括但不限于机车号、车次号、运行模式、公里标、本补状态、速度、车次号、编组状态等信息。</p><p><br></p><p>Ø&nbsp; 设备状态监测</p><p><br></p><p>	设备状态信息应包括但不限于LTE登网状态、IP地址、POC注册状态、机车功能号注册状态、车次功能号注册状态、工作方式、工作模式、列尾连接状态、列尾风压、列尾ID号等信息。</p><p><br></p><p>Ø&nbsp; 功能单元状态监测</p><p><br></p><p>	功能单元状态监测应包括但不限于MMI工作状态、卫星定位单元状态、记录单元状态、音频单元状态、接口单元状态、TAX箱连接状态、列尾车载台连接状态、DTE连接状态、网络交换机状态等。</p><p><br></p><p>Ø&nbsp; LTE网络监测</p><p><br></p><p>	实时监测LTE模块的登网状态、当前小区、小区RSSI、RSRP、SNR值等。</p>', '2023-03-21 11:38:41');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (43, '运行状态历史查询模块', NULL, 8, '<p>	系统支持按时间段、机车号等组合作为检索条件，查询设备的运行状态历史记录。</p>', '2023-03-21 11:38:58');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (44, '设备故障告警模块', NULL, 8, '<p>	系统支持实时监测CIR-L设备典型故障并告警，监测故障告警包括：</p><p><br></p><p>Ø&nbsp; CIR-L LTE登网失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L POC注册失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L LTE脱网时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L POC下线时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 卫星单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 卫星定位失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 记录单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 音频单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 主控单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 主控单元重启时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 接口单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; MMI单元失效时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L工作状态异常时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CAN总线通信失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 串口通信失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 本地网卡通信失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 场强连续3min低于阈值时，系统立即告警。</p><p><br></p><p>Ø&nbsp; SIM卡未插入或异常时，系统立即告警。</p><p><br></p><p>Ø&nbsp; SD卡卡未插入或读写异常时，系统立即告警。</p><p><br></p><p>Ø&nbsp; 设备板件ID变更时，系统立即告警。</p>', '2023-03-21 11:39:19');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (45, '业务失效告警模块', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：	<span class=\"ql-cursor\">﻿</span></strong></p><p>系统支持实时监测CIR-L业务故障并告警，监测告警故障包括：</p><p><br></p><p>Ø&nbsp; CIR-L运行中获取不了车次号时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L运行中获取不了机车号时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L车次功能号注册失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L机车功能号注册失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L设备发起个呼失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L设备发起组呼失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L设备加入重联组失败，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L列尾连接丢失时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L列尾置号失败连续次数达到设定值（默认3次）时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L列尾排风失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L风压查询失败时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 在设定的时间内未收到CIR-L运行状态信息时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; CIR-L设备软件版本号与系统设定不符时，系统立即进行告警。</p><p><br></p><p>Ø&nbsp; 配置参数项与系统设定不符时，系统立即进行告警。</p>', '2023-03-21 11:39:58');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (46, '重要业务提示', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>Ø&nbsp; CIR-L连接可控列尾时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L可控列尾销号时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L启动列尾排风时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L可控列尾交权时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L复位或关机时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L发起和接入220临站呼叫时，系统立即进行提示。</p><p><br></p><p>Ø&nbsp; CIR-L发起和接入299紧急呼叫时，系统立即进行提示。</p>', '2023-03-21 11:42:21');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (47, '历史故障信息管理模块', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：	</strong></p><p>系统支持按时间段、机车号等组合作为检索条件，查询设备的历史故障记录。</p>', '2023-03-21 11:42:53');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (48, '设备故障管理', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p><span class=\"ql-cursor\">﻿</span>	库检/检修发现设备故障时，作业人员可通过浏览终端录入相关故障信息，包括机车号、车次、故障发生时间、故障发生地点、故障现象描述、故障影响范围以及故障部位判断等信息。</p><p><br></p><p>	设备运行中系统自动发现故障时，维护系统将自动录入故障记录。</p><p><br></p><p>	维护人员对作业人员提交的故障进行确认和处理后，录入故障处理过程和故障修复时间，完成故障处理流程的全过程管理。设备故障逾时未处理时，系统应自动进行提示。</p><p><br></p><p>	用户通过办公终端对故障设备进行多种条件的查询和导出。</p>', '2023-03-21 11:43:14');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (49, '用户管理', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p><span class=\"ql-cursor\">﻿</span>	系统可配置多用户，管理员支持对用户信息增、删、改、查。</p>', '2023-03-21 11:44:07');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (50, '用户权限管理模块', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：	</strong></p><p>系统采用多级用户管理，按用户身份配置相应权限。</p>', '2023-03-21 11:44:42');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (51, '系统配置模块', NULL, 8, '<p><strong class=\"ql-size-large\">功能说明：</strong>	</p><p>系统支持对CIR-L设备进行必要动态配置功能，配置信息可包括数据上报频率、可选上报数据项目、关键系统参数等。</p>', '2023-03-21 11:45:11');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (53, '系统功能架构', NULL, 9, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>集团数字档案馆系统功能分为：内容管理平台、系统配置和管理、档案管理、资料库、查询利用、统计、安全相关和系统首页部分，如下图所示</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/系统功能架构图_20230321115930A052.png\"></p><p>	上图中，内容管理平台为系统提供针对非结构化数据的处理、存储和管理等基础服务，为后台服务方式运行；</p><p><br></p><p>	数字档案馆系统包含了系统首页、档案管理、资料库、查询利用、统计、安全相关、系统配置和管理等档案业务功能，实现各单位档案管理业务功能，提供电子档案长久保存、数据资源编研开发、提供统一利用服务，主要提供档案管理员、部门兼职档案员和普通用户使用。</p><p><br></p>', '2023-03-21 11:59:45');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (54, '业务流程', NULL, 9, '<p><strong class=\"ql-size-large\">流程说明：</strong></p><p>	档案业务工作分为收集、整理、保管和开发利用四部分。总体流程为：数据的收集，按照档案管理要求进行整理和归档，对整理好并归档的数据进行科学保管，提供档案搜索、编研等开发利用。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/业务流程图_20230321120104A053.png\"></p><p>	<strong>1、收集阶段</strong></p><p><br></p><p>	档案的收集是档案工作的起点，是通过对线下各种载体手工录入、与电子文件管理等通用系统接口、对历史数据批量导入等方式收集文件资源。各部门兼职档案员依据分类检索体系对收集的数据补充相关属性信息，存放于文件库，以用于开发利用阶段信息的提取。文件库中数据按照归档范围经过筛选后符合归档条件的进入整编库，否则进入资料库。</p><p><br></p><p>	<strong>2、整理阶段</strong></p><p><br></p><p>	档案的整理是档案工作的重点，现阶段集团档案整理分为三种模式：文书档案按年度归档，科技档案按项目归档，科技项目等按阶段归档，过程中随办随归。整编库中数据通过系统按已定整理规则实现自动排序、自动组卷、自动编号等自动化整理工作。由兼职档案员对系统整理完毕的数据进行审查、修改使其符合归档要求并对整理好的数据进行移交，由管理员对移交的数据进行接收，最后由档案管理员对所有接收到的数据进行检查、编目并归档进入档案库。</p><p><br></p><p>	<strong>3、保管阶段</strong></p><p><br></p><p>	保管阶段主要是对实体档案和电子文件的保管，并通过日常维护确保其安全性。资料库和档案库是整个档案业务管理系统的数据存放实体库，两库中数据不重合，以保证检索结果的唯一性。</p><p><br></p><p>	<strong>4、开发利用阶段</strong></p><p><br></p><p>	档案的开发利用是对档案信息资源进行高层次和深度开发的有效方式，是挖掘档案价值的有利手段。开发利用主要是满足档案借阅管理、档案检索、档案编研等功能。通过对档案的开发利用所衍生的库一般为虚拟库，库内数据是对档案库和资料库信息资源的整合。</p><p><br></p><p>	数据检索中心是综合了档案库和资料库的内容，从利用者的角度，按照统一检索、统一分类、统一权限、统一应用的原则集中检索，通过统一检索平台对多库进行跨库检索，并提供多维度的分类检索以及统计功能。知识库是将常用档案信息资源分模块存储，包括：行业标准、社会责任报告、年报、简报、外部专业资料目录、培训资料等。档案编研是通过编纂、浓缩和加工提炼档案资料，积极、主动、系统地开发档案资源的主要方法，编研库是存放档案编研成果的库，可根据实际需要建立编研库，如：大事记、组织机构沿革、内部资料汇编等专题。</p>', '2023-03-21 12:01:10');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (55, '组织机构管理模块', NULL, 9, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p>提供对系统中机构信息的管理维护功能。</p><p><br></p><p>部门信息来自于外部统一机构系统，通过接口定时同步到档案系统，为与同步源保持一致，在档案系统中，这部分数据不允许进行修改。</p><p><br></p><p>当部门信息发生沿革时，部门沿革产生的增量数据信息将存储在部门历史表中进行保存，留待进行其他业务处理。</p>', '2023-03-21 12:02:21');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (56, '用户管理', NULL, 9, '<p><strong class=\"ql-size-large\">功能说明：</strong></p><p><span class=\"ql-cursor\">﻿</span>提供对系统中用户信息的管理维护功能。</p><p><br></p><p>用户信息来自于外部统计机构用户系统，通过同步接口定时同步到档案系统，为与同步源保持一致，在档案系统中，数据不允许进行修改。</p>', '2023-03-21 12:03:04');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (57, '全宗管理模块', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述</strong></p><p>提供对系统中档案全宗信息的管理维护功能。用户可进行全宗的添加、删除和修改等操作。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明</strong></p><p>系统实际运行时，全宗可动态进行添加。添加全宗时，需要从现有机构中选择一个机构建立对应关系。当全宗与实际机构建立对应关系后，某一全宗的归档部门即取自该机构下的部门。除需要与机构建立对应关系外，还需要由超级管理员预先分配好各个机构的全宗管理员，以用来“启动”这个全宗的管理功能。</p><p><br></p><p>全宗一经建立，只允许修改基本信息，如全宗名称和代码，其与机构的对应关系不允许修改。</p><p><br></p><p>全宗的删除需要满足下述条件：</p><p><br></p><p>全宗下已分配的档案门类不存在任何数据。</p><p><br></p><p>全宗下不存在子全宗。</p><p><br></p><p>全宗管理只能由系统中的超级用户进行使用。</p><p><br></p><p><strong>全宗的层级关系</strong></p><p><br></p><p>全宗建立时可以具有上下级关系，所有全宗构成一个树型目录结构，其层次关系依赖于全宗建立时的所给的参数信息，可与实际机构一致，也可与实际机构不一致。在系统中只能有一个根全宗，这里应选择总行作为根全宗的对应机构。</p><p><br></p><p><strong>全宗的初始化</strong></p><p><br></p><p>全宗建立后，系统并没有为其分配存储空间（即建立对应的数据表），因此需要后期由该全宗的全宗管理员进行【初始化】操作，以建立对应档案门类的数据表。</p>', '2023-03-21 12:04:49');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (58, '角色管理', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述</strong></p><p>提供对系统中角色信息的管理维护功能。用户可进行角色的添加、删除、修改以及配置等操作。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明</strong></p><p>系统默认将用户划分为以下角色（用户角色可以根据客户需求进行定制）：</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/角色管理_20230321120756A054.png\"></p><p><br></p><p>	但上述角色功能不是固定的，只是系统默认角色的功能。高级档案管理员和全宗档案管理员可通过权限管理对其它角色功能进行重新定义。高级档案管理员的权利可以根据情况下放，高级档案管理员对系统中档案管理业务的设置修改有日志记录。全宗档案管理员可以赋权给本单位的用户权限。</p><p><br></p><p><br></p>', '2023-03-21 12:08:12');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (59, '用户组管理模块', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述</strong></p><p>提供对系统中用户组的管理维护功能。用户可进行用户组的添加、删除、修改以及配置等操作。</p><h5><br></h5><h5><br></h5><p><strong class=\"ql-size-large\">设计说明</strong></p><p>为方便对用户进行数据访问权限配置，可将具有一定特征的用户加入一个用户组，再针对用户组进行授权。</p><p><br></p><p>管理员可根据需要建立多个用户组，再将用户加入到用户组中建立关联关系。用户和用户组的对应关系是多对多的关系。</p><p><br></p><p>实际进行权限判定时，要根据用户所属的所有用户组进行判定，遵循“无权”优先的原则，当对多个用户组的权限规则进行判断时，遇到一个“无权”判定即作为权限判定结果返回。</p><p><br></p><p>主要操作：</p><p><br></p><p> 用户组的添加、删除和修改。</p><p><br></p><p> 组内用户的查看、加入和删除。</p><p><br></p><p>本模块只有具有全宗管理员角色的用户可以使用。</p>', '2023-03-21 12:09:40');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (60, '目录数据访问模块', '', 9, '<p><strong class=\"ql-size-large\">模块描述</strong></p><p><br></p><p>提供对系统中数据访问权限的定义和管理功能，并对外提供相关权限判定接口，供各业务模块进行调用。</p><p><br></p><p>目录数据访问权限主要应用在档案管理和档案检索模块中，当用户对数据无权访问时，系统不会将数据展示给该用户，反之，则向用户进行展示。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明</strong></p><p>用户对数据的访问权限受2方面影响：用户所属角色和有关的规则权限。</p><p><br></p><p>1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>角色部分</p><p><br></p><p>不同的角色其对应具有不同的数据访问权限，如档案管理员默认具有对其所能够管理的档案门类的所有数据的访问权限。部门档案员默认具有对其所属部门内的其所能管理的所有档案门类的所有数据的访问权限。举例如下：用户甲的角色为档案管理员，可以管理的档案门类为A类，则甲可以访问到A门类下的所有数据，对B门类下的档案数据默认不具有访问权限。</p><p><br></p><p>角色权限是固化在系统中的，目前只支持预定义的几种角色，同时，其权限规则是对所有全宗起作用，这样才能保证角色的权限在整个系统中是统一的。</p><p><br></p><p>在档案管理模块，将只受角色权限的控制。</p><p><br></p><p>2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>规则权限部分</p><p><br></p><p>对于某一全宗来说，其全宗管理员可根据需要建立多个权限规则，定义时，档案管理员可针对不同的档案门类以及不同的档案管理层次（案卷、文件）进行分别定义，一条权限规则可表达为：“某类用户对具有一定特征的数据有权访问或无权访问”。规则权限的授体可以是用户组或单个用户，权限控制的目标数据可以通过定义数据特征来表示，例如下面的规则权限：</p><p><br></p><p>l&nbsp; 公司领导用户组对标题中含有“批评”关键字的目录数据有权访问</p><p><br></p><p>l&nbsp; 普通用户对标题中含有“批评”关键字的目录数据无权访问。</p><p><br></p><p>实际进行权限判定时，要根据用户所属的所有用户组进行判定，遵循“无权”优先的原则，当多个用户的权限规则判断时，遇到一个“无权”判定即返回权限结果。</p><p><br></p><p>规则权限在定义以后要保存到数据库中，并能够被解读或进行修改。</p><p><br></p><p>对档案检索模块，其数据访问权限判定结果受角色权限和规则权限共同作用。</p><p><br></p><p>	<strong>判定方式</strong></p><p><br></p><p>对于某一用户来讲，其在检索利用时所看到的数据是经过权限过滤后的数据，因此在实现时，由系统将角色权限和规则权限进行解析，并转换成关系数据库中的SQL语句，从而实现数据的权限过滤。</p>', '2023-03-21 12:11:20');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (61, '电子文件权限', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述：</strong></p><p>提供对系统中电子文件访问权限的定义和管理功能，并对外提供相关权限判定接口，供各业务模块进行调用。</p><p><br></p><p>电子文件的访问权限主要应用在档案检索模块中，用户对原文的权限最终体现为用户对电子原文是否具有浏览或下载等操作权限。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明</strong></p><p>用户对电子文件数据的访问权限受4方面影响：用户所属角色、有关的规则权限、ACL访问控制以及临时权限。以下分别进行说明：</p><p><br></p><p>1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>角色部分</p><p><br></p><p>角色权限部分同目录数据的访问权限中的角色权限部分一致。</p><p><br></p><p>2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>规则权限部分</p><p><br></p><p>规则权限部分与目录数据权限控制中的规则权限类似，所不同的是，规则是针对目录数据来定义，但权限控制的目标数据为电子文件，并且还需要对电子文件的类别进行设置。</p><p><br></p><p>例如下面的规则权限：</p><p><br></p><p>l&nbsp; 公司领导用户组对标题中含有“批评”关键字的目录数据的电子文件中的正文有权访问。</p><p><br></p><p>l&nbsp; 普通用户对标题中含有“批评”关键字的目录数据的电子文件中的正文无权访问。</p><p><br></p><p>规则权限在定以后要保存到数据库中，并能够被解读或进行修改。</p><p><br></p><p>对档案检索模块，其数据访问权限判定结果受角色权限和规则权限共同作用。</p><p><br></p><p>3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>ACL权限</p><p><br></p><p>管理员可针对电子原文直接进行访问控制设置，如设置某些用户能否有权浏览或下载某些电子文件。</p><p><br></p><p>4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>临时权限</p><p><br></p><p>临时权限是指当用户提出针对电子原文的赋权申请被审批后所具有的权限，该权限的赋权操作在借阅管理模块中实现。</p><p><br></p><p>临时权限具有时效性，超期后系统将自动收回已赋予的权限。</p><p><br></p><p>	<strong>判定方式</strong></p><p><br></p><p>对于某一用户来讲，其在检索利用时所看到的电子文件数据的访问权限判定遵循如下规则：</p><p><br></p><p>l&nbsp; 如果目录数据无权访问，则电子文件也无权访问。</p><p><br></p><p>l&nbsp; 如果目录数据有权访问，则判定电子文件是否具有访问权限，如有权，则可以根据权限内容对原文进行操作。</p><p><br></p><p>l&nbsp; 如规则权限无权访问，同样可查看到原文目录，但无权对原文进行任何操作，如需操作需要进行赋权申请。</p><p><br></p><p>经过权限过滤后的数据，因此在实现时，由系统将角色权限和规则权限进行解析，并转换成关系数据库中的SQL语句，从而实现数据的权限过滤。</p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/电子文件权限_20230321121955A055.png\"></p><p>由于规则权限的判定是最影响性能的，因此将其放在判定流程的最后进行判定。</p><p><br></p><p>与目录数据访问权限类似，由于规则权限判定方式最终是转换成Solr现数据的过滤，定义过多或较复杂的规则权限将影响系统的性能。因此，在定义规则权限时应谨慎，只在必要时才使用规则权限。</p>', '2023-03-21 12:20:24');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (62, '档案门类管理', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述：</strong></p><p>	档案门类是依据一定的标准，按照档案来源、时间、内容和<a href=\"http://baike.baidu.com/view/510630.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: windowtext;\">形式特征</a>的异同点，对档案进行有层次的区分，并形成相应的体系。档案类型是档案业务管理的最基本单位，原则上我们将数据结构不同的档案分成不同的门类</p><p><br></p><p>	档案门类是由默认系统管理员添加、修改和删除，由全宗管理员进行字段定义、整理规则、打印报表、全宗配置等操作。</p><p><br></p><p><strong class=\"ql-size-large\">业务流程：</strong></p><p><br></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/档案门类管理2_20230321122453A057.png\"></p><p><br></p><p><strong class=\"ql-size-large\">设计说明：</strong></p><p>	档案门类管理是定制档案的分类模块，为档案管理做定制准备。由默认系统管理员和全宗管理员做相应的配置。</p><p><br></p><p>	在档案门类管理中，对档案进行划分，如文书档案、声像档案、实物档案等。为每个档案类型配置所需字段、代码表、分配表、整理规则等信息。</p><p><br></p><p>	对于不同的档案门类，可以继承由默认系统管理员定制信息，也可以根据全宗不同由全宗管理自行配置。</p><p><br></p><p>	<strong>数据导航方式</strong></p><p><br></p><p>	进入档案门类管理时，首先由默认系统管理员进行手工录入，或由全宗管理员进行导入定制信息。</p><p><br></p><p>	<strong>主要操作</strong></p><p><br></p><p>	默认系统管理员主要操作有：</p><p><br></p><p class=\"ql-align-justify\">l&nbsp; 添加，添加档案类型配置。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 删除，删除档案类型配置。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 字段定义中添加，添加该档案类型的字段。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 字段定义中删除，删除该档案类型的字段。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 卡片录入，调整录入档案时格式、字段等信息。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">全宗管理员主要操作有：</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 导出xml文件，导出本全宗档案门类。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 导出数据迁移xml文件，导出数据迁移时所需要的全宗信息。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 导出全宗信息xml文件，导出数据迁移时所需要的档案门类信息。</p><p><br></p>', '2023-03-21 12:23:53');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (63, '报表管理', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述：</strong></p><p>	报表定制主要用于定义各档案类型实体管理所需的各类标准的目录，以及系统当中所用到的管理表单。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明：</strong></p><p><span class=\"ql-cursor\">﻿</span>	报表定义只是维护上述要打印目录表单的属性信息，并选择通过报表编辑器生成的报表模板文件即可。</p><p><br></p><p>	<strong>主要操作</strong></p><p><br></p><p class=\"ql-align-justify\">l&nbsp; 上传报表，上传报表编辑器生成的报表文件。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 设计报表，将报表文件下载，通过报表设计器完成设计。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 报表字段选择，选择报表字段。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 删除，删除报表。</p><p><br></p>', '2023-03-21 12:26:50');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (64, '档案分类管理', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述：</strong></p><p>	分类表分为系统分类表、标准分类表、全宗分类表。其中系统分类表由默认系统管理员新建编辑删除。标准分类表、全宗分类表由全宗管理员新建、编辑、删除。</p><p><br></p><p><strong class=\"ql-size-large\">设计说明：</strong></p><p>	<strong>分类表制定约束</strong></p><p><br></p><p>分类表的基本结构为：代码、说明。分类表还可以进行下列设置：</p><p><br></p><p>1.分类表节点与保管期限的对应，以便在收集整编时通过目录树上的保管期限筛选显示的分类表节点，以及在某分类节点下著录时自动带入保管期限。</p><p><br></p><p>需要在创建时选择保管期限代码表（文书、科技和会计的保管期限代码表会不同），然后定义分类表节点与保管期限的对应关系，一个分类节点只能单选某一确定的保管期限值，否则就不选（即对应所有保管期限）。下级分类节点的保管期限选择受到上级节点的约束。</p><p><br></p><p>2.文书、会计等档案门类的标准分类表可与归档责任部门的对应，用于通过系统在收集整编中限制各归档部门所能看到的分类节点、明确各部门的归档责任和范围；工程项目档案的分类表则可以对应归档责任部门，用于在工程项目档案收集整编中限制各归档部门和参建单位所能看到的分类节点、明确各部门和单位的归档责任和范围；</p><p><br></p><p>上述对应设置并不是全在分类表管理中完成，因此这里只做一个说明。</p><p><br></p><p>	<strong>分类表的沿革</strong></p><p><br></p><p>分类表存在沿革问题，因此需要对分类表进行版本管理，沿革之前的档案数据采用老版本的分类表，沿革之后采用新的版本，通过“全宗配置”和“年度项目管理”中选择分类表版本和使用层次确定采用的分类表版本和层次，因此可以在不同的年度和项目中采用不同版本的分类表；如果一个年度中分类表产生变化，则需要再建立一个新的年度，将变化前后的数据放到不同的年度中去。</p><p><br></p><p>	<strong>分类表注意事项</strong></p><p><br></p><p>在本系统已经进入正式使用阶段后，不能删除任何分类表；</p><p><br></p><p>分类表的修改会影响档案数据的展示，需要慎重。</p>', '2023-03-21 12:28:08');
INSERT INTO `pc_module` (`module_id`, `module_name`, `detail_url`, `system_id`, `module_content`, `create_time`) VALUES (65, '文件管理', NULL, 9, '<p><strong class=\"ql-size-large\">模块描述：</strong></p><p>文件库用来存放从OA捕获的电子文件，其数据可以转入整编库进行整理归档或者转入不归档库。文件库可以对捕获的电子文件进行修改。</p><p><br></p><p><br></p><p><strong class=\"ql-size-large\">业务流程：</strong></p><p><img src=\"http://47.122.37.13:8090/profile/upload/2023/03/21/文件管理_20230321123501A058.png\"></p><p><br></p><p>	文件管理基于电子文件管理流程，实现电子文件的捕获登记、分类组织、鉴定处置、存储管理、统计管理、检索利用等内容，为数字档案管理提供数据支撑。</p><p><br></p><p>	<strong>主要操作</strong></p><p><br></p><p class=\"ql-align-justify\">l&nbsp; 添加，添加未捕获或捕获失败的电子文件条目信息。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 编辑，编辑电子文件条目信息。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 删除，删除电子文件条目。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 批量修改，批量修改电子文件条目信息。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 转档案库，把文件条目转入档案库进行整编归档。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 不归档，把文件转入不归档库。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 检索，按需求检索文件库中的电子文件条目。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">l&nbsp; 导出Excel，导出检索出的电子文件条目。</p><p class=\"ql-align-justify\"><br></p><p><strong> 实现要点</strong></p><p>对电子文件的捕获</p><p><br></p><p>对电子文件的捕获进行详细的记录：捕获的条目数、成功的条目数、失败的条目数，未文件管理做统计管理提供依据。</p>', '2023-03-21 12:35:45');
COMMIT;

-- ----------------------------
-- Table structure for pc_system
-- ----------------------------
DROP TABLE IF EXISTS `pc_system`;
CREATE TABLE `pc_system` (
  `system_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_version` varchar(255) DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `system_leader` varchar(255) DEFAULT NULL,
  `system_status` varchar(255) DEFAULT NULL,
  `system_content` text,
  `system_background_image` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL COMMENT '拼音',
  `data_total` varchar(255) DEFAULT NULL,
  `data_day_add` varchar(255) DEFAULT NULL,
  `data_table_num` int(11) DEFAULT NULL,
  `data_table_type` varchar(255) DEFAULT NULL,
  `deploy_system` varchar(255) DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `use_company` varchar(255) DEFAULT NULL,
  `manage_company` varchar(255) DEFAULT NULL,
  `register_user` varchar(255) DEFAULT NULL,
  `api_num` int(11) DEFAULT NULL,
  `build_time` int(11) DEFAULT NULL,
  `sort` tinyint(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pc_system
-- ----------------------------
BEGIN;
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (2, 'v1.0.1', '承包商安全管控系统', '许虎', '正常', '《朔黄铁路承包商安全管控系统》是以人员上道作业管控为前提，进行详细的开发制作，确保施工人员上道前的一些列核验流程符合作业要求，确保施工单位人员作业安全。提高对承包商单位及分包商单位的人员管控', 'http://47.122.37.13:8090/profile/upload/2023/03/21/微信截图_20230320090023_20230321084948A002.png', 'Contractor Safety Management System', '3.51GB', '341MB', 391, 'MySQL', 'Linux', '信息中心', '国能朔黄铁路信息中心', '河北七星通信技术有限责任公司', '24487', 43, 1680364800, 1, '2023-03-19 12:55:18');
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (3, 'v1.23', '应急通信系统', '赵思', '正常', '应急通信系统2021年12月开始使用，使用范围肃宁分公司管内沿线神港电务电力工队、北港电务电力工队、肃宁北通信工队、黄骅南通信工队、灵寿通信工队6个工队。系统软件功能包括肃宁分公司组织架构、视频拉流、状态上报、定位显示、系统配置、系统告警、设备管理功能7个功能模块。', 'http://47.122.37.13:8090/profile/upload/2023/03/21/可视化展示模块_20230321102755A035.png', 'Emergency Communication System', '308GB', '2.6GB', 391, 'MySQL', 'Linux', '朔黄铁路信息中心', '国能朔黄铁路发展有限责任公司', '中电信数智科技有限公司河北分公司', '108', 21, 1633622400, 2, '2023-03-20 00:14:45');
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (5, 'v2.1', '人员电子定位平台', '赵思', '正常', '即有的电子定位平台为非国标音视频协议平台，可对各类的国标平台级联和国标设备接入；地图显示气象数据，机车数据精确；电子定位平台相关子系统拥有统一登录页面，系统登录方便；电子定位平台与其他业务平台对接时不仅能采用接口对接，业务改动时，无需系统厂家配合修改。', 'http://47.122.37.13:8090/profile/upload/2023/03/21/三合一_20230321105241A036.png', 'Personnel Electronic Positioning Platform', '31.4GB', '201MB', 65, 'MySQL', 'Linux', '信息中心', '国能朔黄铁路发展有限责任公司', '中电信数智科技有限公司河北分公司', '468', 21, 1680451200, 3, '2023-03-21 10:48:58');
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (7, 'v1.3', '无线车次号信息采集', '信息中心', '正常', '施工方案：无线车次号信息采集服务器用端口镜像采集网管中心3楼机房CTC至LTE接口服务器机柜内LTE接口交换机主和LTE接口交换机备的端口数据，无线车次号采集服务器安装在网管中心4楼机房，通过办公网将数据发送至基石项目中心服务器。', '', 'Wireless train number information collection', '37588.75MB', '637MB', 55, 'PostgreSQL', 'Linux', '朔黄铁路信息中心', '国能朔黄铁路发展有限责任公司', '国能朔黄铁路发展有限责任公司', '21', 26, 1521734400, 4, '2023-03-21 11:12:00');
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (8, 'v2.3', 'CIR-L动态监测维护系统', '蔺伟', '正常', 'CIR-L动态监测维护系统由车载采集单元、地面监测管理中心两部分组成，通过LTE网络进行数据传输，实现CIR-L动态监测维护管理功能，如图1所示。\n车载采集单元由CIR-L设备自身实现，采集CIR-L各类监测数据，并通过LTE模块传输至地面服务器进行分析。\n地面监测管理中心是CIR-L动态监测维护系统的核心，对CIR-L监测数据进行存储、分析，自动发现设备典型故障，分析故障原因，实现多方式的设备状态统计，并对设备进行集中管理。同时，地面监测管理中心提供用户数据浏览、统计、管理界面。', '', 'CIR-L dynamic monitoring and maintenance system', '2581.58MB', '221MB', 152, 'MySQL', 'Linux', '朔黄铁路信息中心', '国能朔黄铁路发展有限责任公司', '北京市华铁信息技术开发总公司', '10', 26, 1525881600, 5, '2023-03-21 11:29:53');
INSERT INTO `pc_system` (`system_id`, `system_version`, `system_name`, `system_leader`, `system_status`, `system_content`, `system_background_image`, `des`, `data_total`, `data_day_add`, `data_table_num`, `data_table_type`, `deploy_system`, `data_source`, `use_company`, `manage_company`, `register_user`, `api_num`, `build_time`, `sort`, `create_time`) VALUES (9, 'v2.1.0', '数字档案管理系统', '高军', '正常', '档案业务工作分为收集、整理、保管和开发利用四部分。总体流程为：数据的收集，按照档案管理要求进行整理和归档，对整理好并归档的数据进行科学保管，提供档案搜索、编研等开发利用。\n当前，电子文件已取代传统介质文件成为公司的基本信息支撑，从档案业务角度出发，企业档案管理呈现出“数据档案化、档案资产化”两个趋势；从档案信息化角度出发，数字档案馆建设呈现出向“电子文件单轨制归档和电子档案单套制管理的数据型档案馆、智慧型档案馆”发展的趋势。企业数字档案馆系统已从实现档案业务信息化为核心能力的业务系统，转换为以数据资源管理、共享和知识服务为核心能力的数据管理系统。', '', 'Digital Archives Management System', '287GB', '195MB', 206, 'MySQL', 'Linux', '朔黄铁路信息中心', '国能朔黄铁路发展有限责任公司', '紫光软件系统有限公司', '10997', 32, 1642608000, 6, '2023-03-21 11:52:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-19 22:47:04', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-19 22:47:04', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-19 22:47:04', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-19 22:47:04', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-19 23:04:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-19 23:52:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (3, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 01:22:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (4, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 01:24:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (5, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 07:57:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (6, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '1', '验证码已失效', '2023-03-20 08:10:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (7, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 08:10:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (8, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '1', '验证码错误', '2023-03-20 08:19:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (9, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 08:19:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (10, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 08:21:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (11, 'admin', '36.98.118.11', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 08:28:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (12, 'admin', '27.128.50.227', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 10:48:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (13, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '1', '验证码已失效', '2023-03-20 20:05:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (14, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 20:05:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 20:09:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (16, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 20:41:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (17, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-20 20:50:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (18, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-20 20:53:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (19, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 20:53:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (20, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 21:35:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (21, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 21:59:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (22, 'admin', '110.244.91.144', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 23:12:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (23, 'admin', '175.162.119.72', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-20 23:42:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (24, 'admin', '27.128.11.136', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 08:49:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (25, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 09:46:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (26, 'admin', '175.163.252.82', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 09:46:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (27, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 10:20:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 11:05:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (29, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 13:14:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (30, 'admin', '27.128.11.136', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 14:27:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 14:33:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (32, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 15:10:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 15:25:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 17:29:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (35, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 18:30:00');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 19:29:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (37, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 20:15:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (38, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 21:21:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (39, 'admin', '173.82.154.167', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-21 22:29:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (40, 'admin', '110.245.166.234', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-21 22:47:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (41, 'admin', '173.82.154.167', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-22 08:03:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-03-22 08:27:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (43, 'admin', '110.244.91.44', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 10:44:51');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '1', '0', '', 'system', 'admin', '2023-02-28 05:39:27', 'admin', '2023-03-20 01:26:23', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-28 05:39:27', 'admin', '2023-03-20 01:26:46', '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2023-02-28 05:39:27', 'admin', '2023-03-20 01:26:40', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-02-28 05:39:27', 'admin', '2023-03-18 03:43:02', '若依官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-28 05:39:27', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-02-28 05:39:27', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-02-28 05:39:27', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-02-28 05:39:27', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-02-28 05:39:27', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-02-28 05:39:27', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-02-28 05:39:27', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-02-28 05:39:27', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-28 05:39:27', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-02-28 05:39:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-02-28 05:39:27', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-02-28 05:39:27', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-02-28 05:39:27', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-02-28 05:39:27', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-02-28 05:39:27', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-02-28 05:39:27', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-02-28 05:39:27', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-02-28 05:39:27', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-02-28 05:39:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-02-28 05:39:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-02-28 05:39:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2000, '数据管理', 0, 9, 'pc', NULL, NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2023-03-18 03:44:46', 'admin', '2023-03-18 03:46:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2001, '用户管理', 2000, 1, '/pc/user', 'pc/user/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-03-18 03:45:55', 'admin', '2023-03-18 03:48:37', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2002, '系统列表', 2000, 2, '/pc/system', 'pc/system/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-03-18 03:48:27', 'admin', '2023-03-19 07:00:44', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2003, '模块管理', 2000, 3, '/pc/module', 'pc/module/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-03-18 03:50:02', 'admin', '2023-03-19 07:00:49', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2004, '模块内容页', 2000, 1, '/pc/detail', 'pc/detail/index', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2023-03-19 07:03:59', 'admin', '2023-03-19 07:07:56', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (1, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '110.245.166.234', 'XX XX', '{\"children\":[],\"createTime\":\"2023-02-28 05:39:27\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-20 01:26:23', 28);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (2, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '110.245.166.234', 'XX XX', '{\"children\":[],\"createTime\":\"2023-02-28 05:39:27\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-20 01:26:31', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (3, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '110.245.166.234', 'XX XX', '{\"children\":[],\"createTime\":\"2023-02-28 05:39:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-20 01:26:40', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (4, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '110.245.166.234', 'XX XX', '{\"children\":[],\"createTime\":\"2023-02-28 05:39:27\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-20 01:26:46', 11);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-19 22:47:04', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-19 22:47:04', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 117);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1060);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '110.244.91.44', '2023-03-22 10:44:51', 'admin', '2023-03-19 22:47:04', '', '2023-03-22 10:44:51', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-19 22:47:04', 'admin', '2023-03-19 22:47:04', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `create_time`) VALUES (1, 'aa', '80c227fd12f5c2436d9027b9471ae4ff', '739', '2023-03-19 23:09:58');
INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `create_time`) VALUES (2, 'fuxiaoxuone', 'bcbfe747f3457b92a2a87abfd6636e07', '803', '2023-03-19 23:23:35');
INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `create_time`) VALUES (3, 'aaa', '23647f1d3f9f36797a6e98547f427c16', '226', '2023-03-20 01:34:50');
INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `create_time`) VALUES (4, '123', '49e0429d8b43bfdb8ad580ec671702ea', '743', '2023-03-20 08:27:14');
INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `create_time`) VALUES (5, 'test', '24b906c8ffd6849b7bb44be87bf5dce9', '219', '2023-03-27 16:01:13');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
