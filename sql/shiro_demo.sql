/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : 127.0.0.1:3306
 Source Schema         : straw_shiro

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 08/06/2021 21:17:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_info`;
CREATE TABLE `sys_dept_info`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                  `pid` int(11) NULL DEFAULT 0 COMMENT '父级ID',
                                  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
                                  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                                  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                  `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept_info
-- ----------------------------
INSERT INTO `sys_dept_info` VALUES (1, 0, '海绵科技有限公司', '公司名称', 0, 1, '2021-04-06 23:57:37', 1);
INSERT INTO `sys_dept_info` VALUES (2, 1, '开发部', '开发部负责公司的系统开发', 0, 1, '2021-04-06 23:57:11', 1);
INSERT INTO `sys_dept_info` VALUES (3, 1, '研发部', '开发部负责公司营业方向的研发', 0, 1, '2021-04-06 23:57:28', 1);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
                                  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
                                  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
                                  `is_enable` int(11) NULL DEFAULT NULL COMMENT '是否启用 1-启用 2-停用',
                                  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                  `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 'user_info_sex', '男', '1', 2, '性别男', 1, 1, '2021-04-09 15:47:12', 1);
INSERT INTO `sys_dict_data` VALUES (2, 'user_info_sex', '女', '2', 1, '性别女', 1, 1, '2021-04-09 15:19:58', 1);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
                                  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
                                  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                  `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'user_info_sex', '用户性别列表', 0, 1, '2021-04-09 13:47:23', 1);
INSERT INTO `sys_dict_type` VALUES (2, '测试字典', 'test', '测试字典列表', 1, 1, '2021-04-09 14:46:40', 1);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
                                  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
                                  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
                                  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备',
                                  `code` int(11) NULL DEFAULT NULL COMMENT '响应编码',
                                  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应消息',
                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
                                  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 405 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (4, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-04 16:13:30', 2);
INSERT INTO `sys_login_log` VALUES (23, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-10 12:43:52', 2);
INSERT INTO `sys_login_log` VALUES (24, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-10 12:43:52', 2);
INSERT INTO `sys_login_log` VALUES (25, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 19:54:47', 2);
INSERT INTO `sys_login_log` VALUES (26, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 19:55:12', 2);
INSERT INTO `sys_login_log` VALUES (27, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 19:59:36', 2);
INSERT INTO `sys_login_log` VALUES (28, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-08-11 20:03:50', 2);
INSERT INTO `sys_login_log` VALUES (29, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-08-11 20:04:30', 2);
INSERT INTO `sys_login_log` VALUES (30, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-08-11 21:59:32', 2);
INSERT INTO `sys_login_log` VALUES (31, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-08-11 22:01:03', 2);
INSERT INTO `sys_login_log` VALUES (32, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 22:01:13', 2);
INSERT INTO `sys_login_log` VALUES (33, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 22:07:26', 2);
INSERT INTO `sys_login_log` VALUES (34, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-08-11 22:10:16', 2);
INSERT INTO `sys_login_log` VALUES (35, 'admin', '192.168.1.105', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10Chrome -- Windows 10', 200, '登录成功', '2019-08-11 22:23:49', 2);
INSERT INTO `sys_login_log` VALUES (36, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-09-04 13:52:21', 2);
INSERT INTO `sys_login_log` VALUES (37, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 13:54:29', 2);
INSERT INTO `sys_login_log` VALUES (38, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 13:56:46', 2);
INSERT INTO `sys_login_log` VALUES (39, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 14:03:07', 2);
INSERT INTO `sys_login_log` VALUES (40, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-09-04 14:04:17', 2);
INSERT INTO `sys_login_log` VALUES (41, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 14:06:14', 2);
INSERT INTO `sys_login_log` VALUES (42, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 14:07:06', 2);
INSERT INTO `sys_login_log` VALUES (43, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-09-04 14:09:27', 2);
INSERT INTO `sys_login_log` VALUES (44, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 14:09:36', 2);
INSERT INTO `sys_login_log` VALUES (45, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-09-04 14:52:16', 2);
INSERT INTO `sys_login_log` VALUES (46, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-04 14:52:26', 2);
INSERT INTO `sys_login_log` VALUES (47, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 09:15:00', 2);
INSERT INTO `sys_login_log` VALUES (48, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 10:15:50', 2);
INSERT INTO `sys_login_log` VALUES (49, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 11:41:18', 2);
INSERT INTO `sys_login_log` VALUES (50, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 11:46:06', 2);
INSERT INTO `sys_login_log` VALUES (51, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 14:57:38', 2);
INSERT INTO `sys_login_log` VALUES (52, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:20:53', 2);
INSERT INTO `sys_login_log` VALUES (53, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:24:36', 2);
INSERT INTO `sys_login_log` VALUES (54, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:28:56', 2);
INSERT INTO `sys_login_log` VALUES (55, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:32:25', 2);
INSERT INTO `sys_login_log` VALUES (56, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:34:15', 2);
INSERT INTO `sys_login_log` VALUES (57, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:42:22', 2);
INSERT INTO `sys_login_log` VALUES (58, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 500, '验证码错误', '2019-09-05 15:43:47', 2);
INSERT INTO `sys_login_log` VALUES (59, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:46:35', 2);
INSERT INTO `sys_login_log` VALUES (60, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:46:55', 2);
INSERT INTO `sys_login_log` VALUES (61, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-05 15:50:51', 2);
INSERT INTO `sys_login_log` VALUES (62, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 11:41:23', 2);
INSERT INTO `sys_login_log` VALUES (63, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 11:43:21', 2);
INSERT INTO `sys_login_log` VALUES (64, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 11:48:21', 2);
INSERT INTO `sys_login_log` VALUES (65, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 11:50:57', 2);
INSERT INTO `sys_login_log` VALUES (66, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 11:59:09', 2);
INSERT INTO `sys_login_log` VALUES (67, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 12:01:05', 2);
INSERT INTO `sys_login_log` VALUES (68, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 12:04:37', 2);
INSERT INTO `sys_login_log` VALUES (69, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 12:07:07', 2);
INSERT INTO `sys_login_log` VALUES (70, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-06 22:16:33', 2);
INSERT INTO `sys_login_log` VALUES (71, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-07 12:14:49', 2);
INSERT INTO `sys_login_log` VALUES (72, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-09 15:02:57', 2);
INSERT INTO `sys_login_log` VALUES (73, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-09 15:05:26', 2);
INSERT INTO `sys_login_log` VALUES (74, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 15:38:54', 2);
INSERT INTO `sys_login_log` VALUES (75, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:04:35', 2);
INSERT INTO `sys_login_log` VALUES (76, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:05:29', 2);
INSERT INTO `sys_login_log` VALUES (77, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:21:48', 2);
INSERT INTO `sys_login_log` VALUES (78, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:23:53', 2);
INSERT INTO `sys_login_log` VALUES (79, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:39:37', 2);
INSERT INTO `sys_login_log` VALUES (80, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:41:06', 2);
INSERT INTO `sys_login_log` VALUES (81, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-11 16:50:26', 2);
INSERT INTO `sys_login_log` VALUES (82, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-17 21:25:07', 2);
INSERT INTO `sys_login_log` VALUES (83, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-20 20:52:51', 2);
INSERT INTO `sys_login_log` VALUES (84, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-09-23 09:35:50', 2);
INSERT INTO `sys_login_log` VALUES (95, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2019-12-24 23:01:35', 2);
INSERT INTO `sys_login_log` VALUES (96, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-01-01 11:14:01', 2);
INSERT INTO `sys_login_log` VALUES (97, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-01-01 11:38:12', 2);
INSERT INTO `sys_login_log` VALUES (98, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-01-01 13:25:47', 2);
INSERT INTO `sys_login_log` VALUES (99, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-02-26 12:04:44', 2);
INSERT INTO `sys_login_log` VALUES (100, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-02-28 15:36:55', 2);
INSERT INTO `sys_login_log` VALUES (101, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome -- Windows 10', 200, '登录成功', '2020-04-18 14:11:47', 2);
INSERT INTO `sys_login_log` VALUES (102, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 11:40:11', 2);
INSERT INTO `sys_login_log` VALUES (103, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 12:19:30', 2);
INSERT INTO `sys_login_log` VALUES (104, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 12:22:56', 2);
INSERT INTO `sys_login_log` VALUES (105, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 12:24:28', 2);
INSERT INTO `sys_login_log` VALUES (106, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 12:47:33', 2);
INSERT INTO `sys_login_log` VALUES (107, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '登录成功', '2021-04-05 12:49:42', 2);
INSERT INTO `sys_login_log` VALUES (108, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 12:52:29', 2);
INSERT INTO `sys_login_log` VALUES (109, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 12:53:55', 2);
INSERT INTO `sys_login_log` VALUES (110, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 12:55:05', 2);
INSERT INTO `sys_login_log` VALUES (111, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 13:01:00', 2);
INSERT INTO `sys_login_log` VALUES (112, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 13:01:20', 1);
INSERT INTO `sys_login_log` VALUES (113, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 16:06:57', 1);
INSERT INTO `sys_login_log` VALUES (114, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 16:08:25', 1);
INSERT INTO `sys_login_log` VALUES (115, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 16:14:15', 1);
INSERT INTO `sys_login_log` VALUES (116, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 17:01:26', 1);
INSERT INTO `sys_login_log` VALUES (117, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-05 17:20:22', 1);
INSERT INTO `sys_login_log` VALUES (118, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 17:04:42', 1);
INSERT INTO `sys_login_log` VALUES (119, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 17:12:44', 1);
INSERT INTO `sys_login_log` VALUES (120, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 17:25:25', 1);
INSERT INTO `sys_login_log` VALUES (121, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 17:28:45', 1);
INSERT INTO `sys_login_log` VALUES (122, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 19:25:50', 1);
INSERT INTO `sys_login_log` VALUES (123, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 20:10:56', 1);
INSERT INTO `sys_login_log` VALUES (124, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 20:45:16', 1);
INSERT INTO `sys_login_log` VALUES (125, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:18:38', 1);
INSERT INTO `sys_login_log` VALUES (126, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:19:11', 1);
INSERT INTO `sys_login_log` VALUES (127, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:27:53', 1);
INSERT INTO `sys_login_log` VALUES (128, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:50:44', 1);
INSERT INTO `sys_login_log` VALUES (129, 'test', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:53:00', 1);
INSERT INTO `sys_login_log` VALUES (130, 'test', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:54:33', 1);
INSERT INTO `sys_login_log` VALUES (131, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 22:55:00', 1);
INSERT INTO `sys_login_log` VALUES (132, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:20:58', 1);
INSERT INTO `sys_login_log` VALUES (133, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:25:41', 1);
INSERT INTO `sys_login_log` VALUES (134, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:29:09', 1);
INSERT INTO `sys_login_log` VALUES (135, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:34:24', 1);
INSERT INTO `sys_login_log` VALUES (136, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:38:08', 1);
INSERT INTO `sys_login_log` VALUES (137, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:42:06', 1);
INSERT INTO `sys_login_log` VALUES (138, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:51:04', 1);
INSERT INTO `sys_login_log` VALUES (139, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:55:04', 1);
INSERT INTO `sys_login_log` VALUES (140, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-06 23:56:56', 1);
INSERT INTO `sys_login_log` VALUES (141, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-07 10:05:15', 1);
INSERT INTO `sys_login_log` VALUES (142, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-07 10:05:20', 1);
INSERT INTO `sys_login_log` VALUES (143, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-07 10:05:38', 1);
INSERT INTO `sys_login_log` VALUES (144, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-07 10:05:43', 1);
INSERT INTO `sys_login_log` VALUES (145, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 10:05:48', 1);
INSERT INTO `sys_login_log` VALUES (146, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 11:43:19', 1);
INSERT INTO `sys_login_log` VALUES (147, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 13:04:06', 1);
INSERT INTO `sys_login_log` VALUES (148, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 13:29:52', 1);
INSERT INTO `sys_login_log` VALUES (149, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 13:44:14', 1);
INSERT INTO `sys_login_log` VALUES (150, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 13:51:48', 1);
INSERT INTO `sys_login_log` VALUES (151, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 14:09:29', 1);
INSERT INTO `sys_login_log` VALUES (152, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 14:27:39', 1);
INSERT INTO `sys_login_log` VALUES (153, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 14:31:19', 1);
INSERT INTO `sys_login_log` VALUES (154, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 16:47:43', 1);
INSERT INTO `sys_login_log` VALUES (155, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 16:59:08', 1);
INSERT INTO `sys_login_log` VALUES (156, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 17:02:00', 1);
INSERT INTO `sys_login_log` VALUES (157, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:13:03', 1);
INSERT INTO `sys_login_log` VALUES (158, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:16:44', 1);
INSERT INTO `sys_login_log` VALUES (159, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:21:07', 1);
INSERT INTO `sys_login_log` VALUES (160, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:35:14', 1);
INSERT INTO `sys_login_log` VALUES (161, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:39:28', 1);
INSERT INTO `sys_login_log` VALUES (162, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:43:59', 1);
INSERT INTO `sys_login_log` VALUES (163, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:54:26', 1);
INSERT INTO `sys_login_log` VALUES (164, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 20:58:39', 1);
INSERT INTO `sys_login_log` VALUES (165, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:17:56', 1);
INSERT INTO `sys_login_log` VALUES (166, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:21:07', 1);
INSERT INTO `sys_login_log` VALUES (167, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:23:00', 1);
INSERT INTO `sys_login_log` VALUES (168, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:30:42', 1);
INSERT INTO `sys_login_log` VALUES (169, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:33:34', 1);
INSERT INTO `sys_login_log` VALUES (170, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:34:43', 1);
INSERT INTO `sys_login_log` VALUES (171, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:55:26', 1);
INSERT INTO `sys_login_log` VALUES (172, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:58:06', 1);
INSERT INTO `sys_login_log` VALUES (173, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-07 23:59:48', 1);
INSERT INTO `sys_login_log` VALUES (174, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 00:00:45', 1);
INSERT INTO `sys_login_log` VALUES (175, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 00:15:06', 1);
INSERT INTO `sys_login_log` VALUES (176, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 00:42:39', 1);
INSERT INTO `sys_login_log` VALUES (177, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 00:44:49', 1);
INSERT INTO `sys_login_log` VALUES (178, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 00:45:44', 1);
INSERT INTO `sys_login_log` VALUES (179, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 09:14:16', 1);
INSERT INTO `sys_login_log` VALUES (180, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 10:12:23', 1);
INSERT INTO `sys_login_log` VALUES (181, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 12:44:58', 1);
INSERT INTO `sys_login_log` VALUES (182, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 18:12:30', 1);
INSERT INTO `sys_login_log` VALUES (183, 'tellsea', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:13:12', 1);
INSERT INTO `sys_login_log` VALUES (184, 'tellsea', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:15:10', 1);
INSERT INTO `sys_login_log` VALUES (185, 'tellsea', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:32:22', 1);
INSERT INTO `sys_login_log` VALUES (186, 'tellsea', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:51:25', 1);
INSERT INTO `sys_login_log` VALUES (187, 'tellsea', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:52:25', 1);
INSERT INTO `sys_login_log` VALUES (188, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 22:54:28', 1);
INSERT INTO `sys_login_log` VALUES (189, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 23:06:16', 1);
INSERT INTO `sys_login_log` VALUES (190, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-08 23:07:23', 1);
INSERT INTO `sys_login_log` VALUES (191, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 13:33:33', 1);
INSERT INTO `sys_login_log` VALUES (192, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 13:37:46', 1);
INSERT INTO `sys_login_log` VALUES (193, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 13:43:05', 1);
INSERT INTO `sys_login_log` VALUES (194, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 13:43:32', 1);
INSERT INTO `sys_login_log` VALUES (195, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 13:56:39', 1);
INSERT INTO `sys_login_log` VALUES (196, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 14:09:12', 1);
INSERT INTO `sys_login_log` VALUES (197, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 14:19:02', 1);
INSERT INTO `sys_login_log` VALUES (198, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 14:29:47', 1);
INSERT INTO `sys_login_log` VALUES (199, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 14:59:21', 1);
INSERT INTO `sys_login_log` VALUES (200, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 15:18:37', 1);
INSERT INTO `sys_login_log` VALUES (201, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 15:44:15', 1);
INSERT INTO `sys_login_log` VALUES (202, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 15:46:57', 1);
INSERT INTO `sys_login_log` VALUES (203, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 15:48:46', 1);
INSERT INTO `sys_login_log` VALUES (204, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 17:12:55', 1);
INSERT INTO `sys_login_log` VALUES (205, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 22:48:44', 1);
INSERT INTO `sys_login_log` VALUES (206, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 22:55:07', 1);
INSERT INTO `sys_login_log` VALUES (207, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 22:55:51', 1);
INSERT INTO `sys_login_log` VALUES (208, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 22:57:57', 1);
INSERT INTO `sys_login_log` VALUES (209, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-09 23:08:00', 1);
INSERT INTO `sys_login_log` VALUES (210, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 12:00:25', 1);
INSERT INTO `sys_login_log` VALUES (211, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 13:03:23', 1);
INSERT INTO `sys_login_log` VALUES (212, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 16:36:06', 1);
INSERT INTO `sys_login_log` VALUES (213, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 16:54:21', 1);
INSERT INTO `sys_login_log` VALUES (214, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 16:58:57', 1);
INSERT INTO `sys_login_log` VALUES (215, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 17:40:14', 1);
INSERT INTO `sys_login_log` VALUES (216, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 17:43:25', 1);
INSERT INTO `sys_login_log` VALUES (217, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 17:51:46', 1);
INSERT INTO `sys_login_log` VALUES (218, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-10 23:22:45', 1);
INSERT INTO `sys_login_log` VALUES (219, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-11 20:49:45', 1);
INSERT INTO `sys_login_log` VALUES (220, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 08:59:47', 1);
INSERT INTO `sys_login_log` VALUES (221, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 09:43:10', 1);
INSERT INTO `sys_login_log` VALUES (222, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 09:58:06', 1);
INSERT INTO `sys_login_log` VALUES (223, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 10:01:56', 1);
INSERT INTO `sys_login_log` VALUES (224, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 10:59:09', 1);
INSERT INTO `sys_login_log` VALUES (225, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:01:37', 1);
INSERT INTO `sys_login_log` VALUES (226, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:13:41', 1);
INSERT INTO `sys_login_log` VALUES (227, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:26:33', 1);
INSERT INTO `sys_login_log` VALUES (228, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 11:26:39', 1);
INSERT INTO `sys_login_log` VALUES (229, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 11:26:41', 1);
INSERT INTO `sys_login_log` VALUES (230, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 11:27:04', 1);
INSERT INTO `sys_login_log` VALUES (231, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:27:49', 1);
INSERT INTO `sys_login_log` VALUES (232, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:28:01', 1);
INSERT INTO `sys_login_log` VALUES (233, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 11:30:36', 1);
INSERT INTO `sys_login_log` VALUES (234, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:30:41', 1);
INSERT INTO `sys_login_log` VALUES (235, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:31:28', 1);
INSERT INTO `sys_login_log` VALUES (236, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:33:50', 1);
INSERT INTO `sys_login_log` VALUES (237, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 11:33:58', 1);
INSERT INTO `sys_login_log` VALUES (238, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:34:03', 1);
INSERT INTO `sys_login_log` VALUES (239, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:37:36', 1);
INSERT INTO `sys_login_log` VALUES (240, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:45:11', 1);
INSERT INTO `sys_login_log` VALUES (241, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:45:21', 1);
INSERT INTO `sys_login_log` VALUES (242, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:46:55', 1);
INSERT INTO `sys_login_log` VALUES (243, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:47:17', 1);
INSERT INTO `sys_login_log` VALUES (244, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:47:51', 1);
INSERT INTO `sys_login_log` VALUES (245, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:48:57', 1);
INSERT INTO `sys_login_log` VALUES (246, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:49:12', 1);
INSERT INTO `sys_login_log` VALUES (247, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:49:52', 1);
INSERT INTO `sys_login_log` VALUES (248, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:50:01', 1);
INSERT INTO `sys_login_log` VALUES (249, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:50:41', 1);
INSERT INTO `sys_login_log` VALUES (250, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:51:22', 1);
INSERT INTO `sys_login_log` VALUES (251, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 11:55:47', 1);
INSERT INTO `sys_login_log` VALUES (252, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 12:01:50', 1);
INSERT INTO `sys_login_log` VALUES (253, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 12:02:05', 1);
INSERT INTO `sys_login_log` VALUES (254, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 12:57:49', 1);
INSERT INTO `sys_login_log` VALUES (255, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 12:57:56', 1);
INSERT INTO `sys_login_log` VALUES (256, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:03:22', 1);
INSERT INTO `sys_login_log` VALUES (257, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:03:54', 1);
INSERT INTO `sys_login_log` VALUES (258, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:04:03', 1);
INSERT INTO `sys_login_log` VALUES (259, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:08:44', 1);
INSERT INTO `sys_login_log` VALUES (260, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:10:21', 1);
INSERT INTO `sys_login_log` VALUES (261, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Microsoft Edge -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:10:26', 1);
INSERT INTO `sys_login_log` VALUES (262, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 13:13:39', 1);
INSERT INTO `sys_login_log` VALUES (263, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:53:38', 1);
INSERT INTO `sys_login_log` VALUES (264, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:53:44', 1);
INSERT INTO `sys_login_log` VALUES (265, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:53:52', 1);
INSERT INTO `sys_login_log` VALUES (266, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:55:33', 1);
INSERT INTO `sys_login_log` VALUES (267, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:55:44', 1);
INSERT INTO `sys_login_log` VALUES (268, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:56:36', 1);
INSERT INTO `sys_login_log` VALUES (269, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:09', 1);
INSERT INTO `sys_login_log` VALUES (270, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:10', 1);
INSERT INTO `sys_login_log` VALUES (271, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:11', 1);
INSERT INTO `sys_login_log` VALUES (272, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:11', 1);
INSERT INTO `sys_login_log` VALUES (273, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:11', 1);
INSERT INTO `sys_login_log` VALUES (274, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:12', 1);
INSERT INTO `sys_login_log` VALUES (275, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:12', 1);
INSERT INTO `sys_login_log` VALUES (276, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:12', 1);
INSERT INTO `sys_login_log` VALUES (277, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (278, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (279, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (280, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (281, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (282, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (283, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:13', 1);
INSERT INTO `sys_login_log` VALUES (284, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:14', 1);
INSERT INTO `sys_login_log` VALUES (285, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:14', 1);
INSERT INTO `sys_login_log` VALUES (286, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:14', 1);
INSERT INTO `sys_login_log` VALUES (287, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:14', 1);
INSERT INTO `sys_login_log` VALUES (288, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 13:59:14', 1);
INSERT INTO `sys_login_log` VALUES (289, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 14:08:25', 1);
INSERT INTO `sys_login_log` VALUES (290, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 14:08:32', 1);
INSERT INTO `sys_login_log` VALUES (291, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"密码错误\"}', '2021-04-12 14:09:12', 1);
INSERT INTO `sys_login_log` VALUES (292, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账号或密码错误\"}', '2021-04-12 14:09:13', 1);
INSERT INTO `sys_login_log` VALUES (293, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账号或密码错误\"}', '2021-04-12 14:09:24', 1);
INSERT INTO `sys_login_log` VALUES (294, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账号或密码错误\"}', '2021-04-12 14:09:25', 1);
INSERT INTO `sys_login_log` VALUES (295, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账号或密码错误\"}', '2021-04-12 14:09:26', 1);
INSERT INTO `sys_login_log` VALUES (296, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":5,\"msg\":\"密码错误，重试次数：{}\"}', '2021-04-12 14:28:08', 1);
INSERT INTO `sys_login_log` VALUES (297, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，重试次数：3\"}', '2021-04-12 14:29:15', 1);
INSERT INTO `sys_login_log` VALUES (298, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，重试次数：1\"}', '2021-04-12 14:29:30', 1);
INSERT INTO `sys_login_log` VALUES (299, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:32', 1);
INSERT INTO `sys_login_log` VALUES (300, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:35', 1);
INSERT INTO `sys_login_log` VALUES (301, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:51', 1);
INSERT INTO `sys_login_log` VALUES (302, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:52', 1);
INSERT INTO `sys_login_log` VALUES (303, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:52', 1);
INSERT INTO `sys_login_log` VALUES (304, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:52', 1);
INSERT INTO `sys_login_log` VALUES (305, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:52', 1);
INSERT INTO `sys_login_log` VALUES (306, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:53', 1);
INSERT INTO `sys_login_log` VALUES (307, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:53', 1);
INSERT INTO `sys_login_log` VALUES (308, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:53', 1);
INSERT INTO `sys_login_log` VALUES (309, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:53', 1);
INSERT INTO `sys_login_log` VALUES (310, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"data\":\"admin\",\"msg\":\"账户已锁定：\"}', '2021-04-12 14:29:53', 1);
INSERT INTO `sys_login_log` VALUES (311, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 14:31:04', 1);
INSERT INTO `sys_login_log` VALUES (312, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 14:31:05', 1);
INSERT INTO `sys_login_log` VALUES (313, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 14:31:07', 1);
INSERT INTO `sys_login_log` VALUES (314, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:32:21', 1);
INSERT INTO `sys_login_log` VALUES (315, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:32:30', 1);
INSERT INTO `sys_login_log` VALUES (316, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：4\"}', '2021-04-12 14:33:00', 1);
INSERT INTO `sys_login_log` VALUES (317, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 14:33:01', 1);
INSERT INTO `sys_login_log` VALUES (318, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：2\"}', '2021-04-12 14:33:02', 1);
INSERT INTO `sys_login_log` VALUES (319, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 14:33:03', 1);
INSERT INTO `sys_login_log` VALUES (320, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：4\"}', '2021-04-12 14:33:17', 1);
INSERT INTO `sys_login_log` VALUES (321, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 14:33:22', 1);
INSERT INTO `sys_login_log` VALUES (322, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：2\"}', '2021-04-12 14:33:23', 1);
INSERT INTO `sys_login_log` VALUES (323, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 14:33:24', 1);
INSERT INTO `sys_login_log` VALUES (324, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：4\"}', '2021-04-12 14:33:36', 1);
INSERT INTO `sys_login_log` VALUES (325, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 14:33:36', 1);
INSERT INTO `sys_login_log` VALUES (326, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：2\"}', '2021-04-12 14:33:37', 1);
INSERT INTO `sys_login_log` VALUES (327, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 14:33:38', 1);
INSERT INTO `sys_login_log` VALUES (328, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:33:39', 1);
INSERT INTO `sys_login_log` VALUES (329, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:34:58', 1);
INSERT INTO `sys_login_log` VALUES (330, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:38:56', 1);
INSERT INTO `sys_login_log` VALUES (331, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:54', 1);
INSERT INTO `sys_login_log` VALUES (332, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:55', 1);
INSERT INTO `sys_login_log` VALUES (333, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:55', 1);
INSERT INTO `sys_login_log` VALUES (334, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:55', 1);
INSERT INTO `sys_login_log` VALUES (335, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:55', 1);
INSERT INTO `sys_login_log` VALUES (336, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (337, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (338, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (339, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (340, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (341, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (342, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:43:56', 1);
INSERT INTO `sys_login_log` VALUES (343, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定：admin\"}', '2021-04-12 14:53:44', 1);
INSERT INTO `sys_login_log` VALUES (344, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 15:03:58', 1);
INSERT INTO `sys_login_log` VALUES (345, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：4\"}', '2021-04-12 15:04:16', 1);
INSERT INTO `sys_login_log` VALUES (346, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 15:04:16', 1);
INSERT INTO `sys_login_log` VALUES (347, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：2\"}', '2021-04-12 15:04:17', 1);
INSERT INTO `sys_login_log` VALUES (348, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 15:04:17', 1);
INSERT INTO `sys_login_log` VALUES (349, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:04:17', 1);
INSERT INTO `sys_login_log` VALUES (350, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:04:17', 1);
INSERT INTO `sys_login_log` VALUES (351, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:04:19', 1);
INSERT INTO `sys_login_log` VALUES (352, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 297秒后重试\"}', '2021-04-12 15:04:20', 1);
INSERT INTO `sys_login_log` VALUES (353, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 296秒后重试\"}', '2021-04-12 15:04:20', 1);
INSERT INTO `sys_login_log` VALUES (354, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 296秒后重试\"}', '2021-04-12 15:04:21', 1);
INSERT INTO `sys_login_log` VALUES (355, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 15:21:16', 1);
INSERT INTO `sys_login_log` VALUES (356, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：4\"}', '2021-04-12 15:21:21', 1);
INSERT INTO `sys_login_log` VALUES (357, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：3\"}', '2021-04-12 15:21:23', 1);
INSERT INTO `sys_login_log` VALUES (358, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：2\"}', '2021-04-12 15:21:24', 1);
INSERT INTO `sys_login_log` VALUES (359, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：1\"}', '2021-04-12 15:21:25', 1);
INSERT INTO `sys_login_log` VALUES (360, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:21:25', 1);
INSERT INTO `sys_login_log` VALUES (361, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:21:25', 1);
INSERT INTO `sys_login_log` VALUES (362, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (363, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 299秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (364, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (365, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (366, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (367, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:26', 1);
INSERT INTO `sys_login_log` VALUES (368, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:27', 1);
INSERT INTO `sys_login_log` VALUES (369, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 298秒后重试\"}', '2021-04-12 15:21:27', 1);
INSERT INTO `sys_login_log` VALUES (370, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 297秒后重试\"}', '2021-04-12 15:21:27', 1);
INSERT INTO `sys_login_log` VALUES (371, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"账户已锁定，请 263秒后重试\"}', '2021-04-12 15:22:01', 1);
INSERT INTO `sys_login_log` VALUES (372, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 15:22:56', 1);
INSERT INTO `sys_login_log` VALUES (373, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 15:28:39', 1);
INSERT INTO `sys_login_log` VALUES (374, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"密码错误，剩余重试次数：5\"}', '2021-04-12 15:46:41', 1);
INSERT INTO `sys_login_log` VALUES (375, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 15:57:37', 1);
INSERT INTO `sys_login_log` VALUES (376, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 16:08:43', 1);
INSERT INTO `sys_login_log` VALUES (377, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 16:10:18', 1);
INSERT INTO `sys_login_log` VALUES (378, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-12 16:29:18', 1);
INSERT INTO `sys_login_log` VALUES (379, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-13 13:44:18', 1);
INSERT INTO `sys_login_log` VALUES (380, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mobile Safari -- Mac OS X (iPhone)', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-13 14:35:51', 1);
INSERT INTO `sys_login_log` VALUES (381, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mobile Safari -- Mac OS X (iPhone)', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-13 14:51:56', 1);
INSERT INTO `sys_login_log` VALUES (382, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-20 13:21:41', 1);
INSERT INTO `sys_login_log` VALUES (383, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"验证码错误\"}', '2021-04-20 13:44:55', 1);
INSERT INTO `sys_login_log` VALUES (384, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 500, '{\"code\":500,\"count\":0,\"msg\":\"验证码错误\"}', '2021-04-20 13:44:57', 1);
INSERT INTO `sys_login_log` VALUES (385, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-20 13:45:12', 1);
INSERT INTO `sys_login_log` VALUES (386, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-21 17:54:35', 1);
INSERT INTO `sys_login_log` VALUES (387, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-22 14:34:30', 1);
INSERT INTO `sys_login_log` VALUES (388, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-22 14:48:00', 1);
INSERT INTO `sys_login_log` VALUES (389, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-22 14:50:31', 1);
INSERT INTO `sys_login_log` VALUES (390, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-22 14:52:03', 1);
INSERT INTO `sys_login_log` VALUES (391, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-22 14:54:15', 1);
INSERT INTO `sys_login_log` VALUES (392, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-26 16:33:17', 1);
INSERT INTO `sys_login_log` VALUES (393, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-26 17:50:02', 1);
INSERT INTO `sys_login_log` VALUES (394, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-26 17:51:30', 1);
INSERT INTO `sys_login_log` VALUES (395, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-26 17:54:35', 1);
INSERT INTO `sys_login_log` VALUES (396, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-27 10:37:13', 1);
INSERT INTO `sys_login_log` VALUES (397, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-27 14:29:59', 1);
INSERT INTO `sys_login_log` VALUES (398, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-28 18:03:37', 1);
INSERT INTO `sys_login_log` VALUES (399, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-29 08:09:37', 1);
INSERT INTO `sys_login_log` VALUES (400, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-29 08:14:19', 1);
INSERT INTO `sys_login_log` VALUES (401, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-29 08:20:34', 1);
INSERT INTO `sys_login_log` VALUES (402, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-04-29 08:21:16', 1);
INSERT INTO `sys_login_log` VALUES (403, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-06-08 20:48:39', 1);
INSERT INTO `sys_login_log` VALUES (404, 'admin', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Chrome 8 -- Windows 10', 200, '{\"code\":200,\"count\":0,\"data\":\"/\",\"msg\":\"登录成功\"}', '2021-06-08 21:17:07', 1);

-- ----------------------------
-- Table structure for sys_map_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_map_role_resource`;
CREATE TABLE `sys_map_role_resource`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                          `role_id` int(11) NOT NULL COMMENT '角色ID',
                                          `resource_id` int(11) NOT NULL COMMENT '菜单/按钮ID',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_map_role_resource
-- ----------------------------
INSERT INTO `sys_map_role_resource` VALUES (164, 7, 1);
INSERT INTO `sys_map_role_resource` VALUES (165, 7, 3);
INSERT INTO `sys_map_role_resource` VALUES (166, 7, 4);
INSERT INTO `sys_map_role_resource` VALUES (167, 7, 10);
INSERT INTO `sys_map_role_resource` VALUES (168, 7, 5);
INSERT INTO `sys_map_role_resource` VALUES (169, 7, 17);
INSERT INTO `sys_map_role_resource` VALUES (170, 7, 6);
INSERT INTO `sys_map_role_resource` VALUES (171, 7, 20);
INSERT INTO `sys_map_role_resource` VALUES (217, 3, 1);
INSERT INTO `sys_map_role_resource` VALUES (218, 3, 3);
INSERT INTO `sys_map_role_resource` VALUES (219, 3, 7);
INSERT INTO `sys_map_role_resource` VALUES (220, 3, 22);
INSERT INTO `sys_map_role_resource` VALUES (221, 3, 23);
INSERT INTO `sys_map_role_resource` VALUES (222, 3, 24);
INSERT INTO `sys_map_role_resource` VALUES (223, 3, 25);
INSERT INTO `sys_map_role_resource` VALUES (224, 3, 26);
INSERT INTO `sys_map_role_resource` VALUES (332, 2, 1);
INSERT INTO `sys_map_role_resource` VALUES (333, 2, 3);
INSERT INTO `sys_map_role_resource` VALUES (334, 2, 4);
INSERT INTO `sys_map_role_resource` VALUES (335, 2, 8);
INSERT INTO `sys_map_role_resource` VALUES (336, 2, 9);
INSERT INTO `sys_map_role_resource` VALUES (337, 2, 10);
INSERT INTO `sys_map_role_resource` VALUES (338, 2, 11);
INSERT INTO `sys_map_role_resource` VALUES (339, 2, 12);
INSERT INTO `sys_map_role_resource` VALUES (340, 2, 13);
INSERT INTO `sys_map_role_resource` VALUES (341, 2, 27);
INSERT INTO `sys_map_role_resource` VALUES (342, 2, 28);
INSERT INTO `sys_map_role_resource` VALUES (343, 2, 5);
INSERT INTO `sys_map_role_resource` VALUES (344, 2, 14);
INSERT INTO `sys_map_role_resource` VALUES (345, 2, 15);
INSERT INTO `sys_map_role_resource` VALUES (346, 2, 16);
INSERT INTO `sys_map_role_resource` VALUES (347, 2, 17);
INSERT INTO `sys_map_role_resource` VALUES (348, 2, 6);
INSERT INTO `sys_map_role_resource` VALUES (349, 2, 18);
INSERT INTO `sys_map_role_resource` VALUES (350, 2, 19);
INSERT INTO `sys_map_role_resource` VALUES (351, 2, 20);
INSERT INTO `sys_map_role_resource` VALUES (352, 2, 21);
INSERT INTO `sys_map_role_resource` VALUES (353, 2, 7);
INSERT INTO `sys_map_role_resource` VALUES (354, 2, 22);
INSERT INTO `sys_map_role_resource` VALUES (355, 2, 29);
INSERT INTO `sys_map_role_resource` VALUES (356, 2, 30);
INSERT INTO `sys_map_role_resource` VALUES (357, 2, 33);
INSERT INTO `sys_map_role_resource` VALUES (358, 2, 36);
INSERT INTO `sys_map_role_resource` VALUES (359, 2, 23);
INSERT INTO `sys_map_role_resource` VALUES (360, 2, 31);
INSERT INTO `sys_map_role_resource` VALUES (361, 2, 32);
INSERT INTO `sys_map_role_resource` VALUES (362, 2, 34);
INSERT INTO `sys_map_role_resource` VALUES (363, 2, 35);

-- ----------------------------
-- Table structure for sys_map_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_map_user_role`;
CREATE TABLE `sys_map_user_role`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                      `user_id` int(11) NOT NULL COMMENT '用户ID',
                                      `role_id` int(11) NOT NULL COMMENT '角色ID',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_map_user_role
-- ----------------------------
INSERT INTO `sys_map_user_role` VALUES (10, 1, 1);
INSERT INTO `sys_map_user_role` VALUES (11, 2, 2);
INSERT INTO `sys_map_user_role` VALUES (12, 4, 7);
INSERT INTO `sys_map_user_role` VALUES (15, 3, 3);
INSERT INTO `sys_map_user_role` VALUES (16, 5, 3);
INSERT INTO `sys_map_user_role` VALUES (17, 6, 3);

-- ----------------------------
-- Table structure for sys_resource_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_info`;
CREATE TABLE `sys_resource_info`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源编号',
                                      `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
                                      `pid` int(11) NULL DEFAULT 0 COMMENT '父级ID',
                                      `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
                                      `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
                                      `type` int(11) NOT NULL DEFAULT 0 COMMENT '0 未使用 1 菜单 2 按钮 3 链接',
                                      `target` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '链接类型 1-内部 2-外部',
                                      `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
                                      `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                      `is_visible` tinyint(1) NULL DEFAULT 0 COMMENT '是否可见 1-是 2-否',
                                      `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                      `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                      `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource_info
-- ----------------------------
INSERT INTO `sys_resource_info` VALUES (1, '系统模块', 0, '', '', 1, '_self', '', 1, 1, 1, '2021-04-08 22:48:24', 1);
INSERT INTO `sys_resource_info` VALUES (2, '首页', 1, '/home', NULL, 1, '_self', 'fa-home', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (3, '系统管理', 1, '', NULL, 1, '_self', 'fa-gears', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (4, '用户管理', 3, '/system/userInfo/init', 'system:userInfo:view', 1, '_self', 'fa-group', 2, 1, 1, '2021-04-06 23:59:18', 1);
INSERT INTO `sys_resource_info` VALUES (5, '角色管理', 3, '/system/roleInfo/init', 'system:roleInfo:view', 1, '_self', 'fa-check', 3, 1, 1, '2021-04-06 23:59:25', 1);
INSERT INTO `sys_resource_info` VALUES (6, '菜单管理', 3, '/system/resourceInfo/init', 'system:resourceInfo:view', 1, '_self', 'fa-reorder', 4, 1, 1, '2021-04-06 23:59:32', 1);
INSERT INTO `sys_resource_info` VALUES (7, '日志管理', 3, '', '', 1, '_self', 'fa-calendar', 7, 1, 1, '2021-04-09 13:35:05', 1);
INSERT INTO `sys_resource_info` VALUES (8, '新增用户', 4, '', 'system:userInfo:save', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (9, '更新用户', 4, NULL, 'system:userInfo:update', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (10, '查询用户', 4, NULL, 'system:userInfo:list', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (11, '删除用户', 4, NULL, 'system:userInfo:delete', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (12, '导入用户', 4, NULL, 'system:userInfo:import', 2, '_self', NULL, 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (13, '导出用户', 4, NULL, 'system:userInfo:export', 2, '_self', NULL, 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (14, '新增角色', 5, NULL, 'system:roleInfo:save', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (15, '更新角色', 5, NULL, 'system:roleInfo:update', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (16, '查询角色', 5, NULL, 'system:roleInfo:list', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (17, '删除角色', 5, NULL, 'system:roleInfo:delete', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (18, '新增菜单', 6, NULL, 'system:resourceInfo:save', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (19, '更新菜单', 6, NULL, 'system:resourceInfo:update', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (20, '查询菜单', 6, NULL, 'system:resourceInfo:list', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (21, '删除菜单', 6, NULL, 'system:resourceInfo:delete', 2, '_self', '', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (22, '操作日志', 7, '/system/systemLog/init', 'system:systemLog:view', 1, '_self', 'fa-deaf', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (23, '登录日志', 7, '/system/loginLog/init', 'system:loginLog:view', 1, '_self', 'fa-arrow-circle-o-right', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (24, '开发工具', 1, '', 'common:tool:view', 1, '_self', 'fa-anchor', 0, 1, 1, '2021-04-07 20:45:38', 2);
INSERT INTO `sys_resource_info` VALUES (25, '数据监控', 37, '/monitor/druid/init', 'monitor:druid:view', 1, '_self', 'fa-building-o', 0, 1, 1, '2021-04-06 20:06:09', 1);
INSERT INTO `sys_resource_info` VALUES (26, '接口文档', 39, '/common/swagger/init', 'common:swagger:view', 1, '_self', 'fa-sitemap', 0, 1, 1, '2021-04-09 17:13:16', 1);
INSERT INTO `sys_resource_info` VALUES (27, '重置密码', 4, '', 'system:userInfo:resetPwd', 2, '_self', 'fa-refresh', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (28, '用户详情', 4, '', 'system:userInfo:detail', 2, '_self', 'fa-align-left', 0, 1, 1, '2021-04-06 17:21:33', 1);
INSERT INTO `sys_resource_info` VALUES (29, '操作日志详情', 22, '', 'system:systemLog:detail', 2, '_self', 'fa-align-left', 0, 1, 1, '2021-04-09 13:39:53', 1);
INSERT INTO `sys_resource_info` VALUES (30, '清空操作日志', 22, '', 'system:systemLog:clean', 2, '_self', 'fa-close', 0, 1, 1, '2021-04-09 13:39:58', 1);
INSERT INTO `sys_resource_info` VALUES (31, '登录日志详情', 23, '', 'system:loginLog:detail', 2, '_self', 'fa-align-center', 0, 1, 1, '2021-04-09 13:40:05', 1);
INSERT INTO `sys_resource_info` VALUES (32, '清空登录日志', 23, '', 'system:loginLog:clean', 2, '_self', 'fa-window-close-o', 0, 1, 1, '2021-04-09 13:40:10', 1);
INSERT INTO `sys_resource_info` VALUES (33, '查询操作日志', 22, '', 'system:systemLog:list', 2, '_self', '', 0, 1, 1, '2021-04-09 13:40:15', 1);
INSERT INTO `sys_resource_info` VALUES (34, '查询登录日志', 23, '', 'system:loginLog:list', 2, '_self', '', 0, 1, 1, '2021-04-09 13:40:33', 1);
INSERT INTO `sys_resource_info` VALUES (35, '删除操作日志', 23, '', 'system:loginLog:delete', 2, '_self', 'fa-window-close-o', 0, 1, 1, '2021-04-09 13:40:40', 1);
INSERT INTO `sys_resource_info` VALUES (36, '删除登录日志', 22, '', 'system:systemLog:delete', 2, '_self', 'fa-window-close-o', 0, 1, 1, '2021-04-09 13:40:34', 1);
INSERT INTO `sys_resource_info` VALUES (37, '系统监控', 0, '', '', 1, '_self', '', 2, 1, 1, '2021-04-08 22:48:25', 1);
INSERT INTO `sys_resource_info` VALUES (38, '服务监控', 37, '/monitor/server/init', 'monitor:server:view', 1, '_self', 'fa-eraser', 0, 1, 1, '2021-04-06 20:13:06', 1);
INSERT INTO `sys_resource_info` VALUES (39, '开发工具', 0, '', '', 1, '_self', '', 3, 1, 1, '2021-04-08 22:48:27', 1);
INSERT INTO `sys_resource_info` VALUES (40, '部门管理', 3, '/system/deptInfo/init', 'system:deptInfo:view', 1, '_self', 'fa-address-book', 1, 1, 1, '2021-04-06 23:59:02', 1);
INSERT INTO `sys_resource_info` VALUES (41, '新增部门', 40, '', 'system:deptInfo:save', 2, '_self', NULL, 0, 1, 1, '2021-04-06 23:37:44', 1);
INSERT INTO `sys_resource_info` VALUES (42, '更新部门', 40, '', 'system:deptInfo:update', 2, '_self', '', 0, 1, 1, '2021-04-06 23:35:37', 1);
INSERT INTO `sys_resource_info` VALUES (43, '查询部门', 40, '', 'system:deptInfo:list', 2, '_self', '', 0, 1, 1, '2021-04-06 23:35:37', 1);
INSERT INTO `sys_resource_info` VALUES (44, '删除部门', 40, '', 'system:deptInfo:delete', 2, '_self', '', 0, 1, 1, '2021-04-06 23:35:37', 1);
INSERT INTO `sys_resource_info` VALUES (45, '上传下载', 39, '/common/file/init', '', 1, '_self', 'fa-arrows-v', 0, 1, 1, '2021-04-07 14:33:59', 1);
INSERT INTO `sys_resource_info` VALUES (46, '系统配置', 3, '/system/systemConfig/updatePage', 'system:systemConfig:updatePage', 1, '_self', 'fa-cubes', 6, 1, 1, '2021-04-09 15:56:47', 1);
INSERT INTO `sys_resource_info` VALUES (47, '更新系统配置', 46, '', 'system:systemConfig:update', 2, '_self', '', 0, 1, 1, '2021-04-07 23:59:35', 1);
INSERT INTO `sys_resource_info` VALUES (48, '构建表单', 39, '/common/buildForm/init', '', 1, '_self', 'fa-arrows', 0, 1, 1, '2021-04-08 09:15:15', 1);
INSERT INTO `sys_resource_info` VALUES (49, '代码生成', 39, '/common/gen/init', '', 1, '_self', 'fa-anchor', 0, 1, 1, '2021-04-08 23:07:05', 1);
INSERT INTO `sys_resource_info` VALUES (50, '字典管理', 3, '/system/dictType/init', 'system:dictType:view', 1, '_self', 'fa-graduation-cap', 5, 1, 1, '2021-04-09 15:56:35', 1);
INSERT INTO `sys_resource_info` VALUES (51, '新增字典类型', 50, '', 'system:dictType:save', 2, '_self', '', 0, 1, 1, '2021-04-09 13:38:57', 1);
INSERT INTO `sys_resource_info` VALUES (52, '更新字典类型', 50, '', 'system:dictType:update', 2, '_self', '', 0, 1, 1, '2021-04-09 13:40:50', 1);
INSERT INTO `sys_resource_info` VALUES (53, '删除字典类型', 50, '', 'system:dictType:delete', 2, '_self', '', 0, 1, 1, '2021-04-09 13:41:51', 1);
INSERT INTO `sys_resource_info` VALUES (54, '查询字典类型', 50, '', 'system:dictType:list', 2, '_self', '', 0, 1, 1, '2021-04-09 13:38:57', 1);
INSERT INTO `sys_resource_info` VALUES (55, '查询字典数据', 50, '', 'system:dictData:view', 2, '_self', '', 0, 1, 1, '2021-04-09 13:38:57', 1);
INSERT INTO `sys_resource_info` VALUES (56, '运行监控', 37, '/monitor/server/tailLog', 'monitor:server:tailLog', 1, '_self', 'fa-clock-o', 0, 1, 1, '2021-04-09 22:49:57', 1);
INSERT INTO `sys_resource_info` VALUES (57, '移动端', 39, '/common/jqueryWeUi/init', '', 1, '_blank', 'fa-whatsapp', 0, 1, 1, '2021-04-13 14:04:12', 1);

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                                  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
                                  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
                                  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                                  `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES (1, '超级管理员', 'admin', '拥有所有权限', 1, '2021-04-04 15:42:02', 1);
INSERT INTO `sys_role_info` VALUES (2, '系统管理员', 'system', '只有系统管理，并且不能删除与重置密码', 1, '2021-04-04 15:42:40', 1);
INSERT INTO `sys_role_info` VALUES (3, '系统监控员', 'monitor', '日志管理、Druid监控、Swagger文档', 1, '2021-04-04 15:42:56', 1);
INSERT INTO `sys_role_info` VALUES (4, 'test', 'test', 'test', 0, '2021-04-04 15:40:45', 2);
INSERT INTO `sys_role_info` VALUES (5, 'test', 'test', 'test', 0, '2021-04-04 15:40:51', 2);
INSERT INTO `sys_role_info` VALUES (7, '游客', 'visitor', '访客，只能查看，不能新增、编辑、删除', 1, '2021-04-04 15:41:46', 1);
INSERT INTO `sys_role_info` VALUES (8, 'test啊', 'admin', '超级管理员，系统最高级权限', 1, '2021-04-01 17:48:34', 2);

-- ----------------------------
-- Table structure for sys_system_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_config`;
CREATE TABLE `sys_system_config`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                      `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统Logo',
                                      `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
                                      `short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统简称',
                                      `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
                                      `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统描述',
                                      `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                      `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                      `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_system_config
-- ----------------------------
INSERT INTO `sys_system_config` VALUES (1, '/static/layuimini/images/logo.png', 'StrawShiro权限管理系统', 'StrawShiro版', 'SpringBoot+Shiro权限管理系统', '权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！', 1, '2021-04-29 08:21:30', 1);

-- ----------------------------
-- Table structure for sys_system_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_log`;
CREATE TABLE `sys_system_log`  (
                                   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作用户',
                                   `operation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
                                   `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
                                   `time` int(11) NULL DEFAULT 0 COMMENT '耗时(毫秒)',
                                   `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法',
                                   `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作参数',
                                   `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
                                   `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
                                   `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
                                   `status` int(1) NULL DEFAULT 1 COMMENT '状态 1-正常 2-删除',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_system_log
-- ----------------------------
INSERT INTO `sys_system_log` VALUES (1, '1', '新增用户', 'POST', 3, 'saveUserInfo', 'UserInfo[\"userName\": \"tellsea\",\"password\":\"123456\"]', '127.0.0.1', '操作地点', '2019-12-21 22:25:57', 2);
INSERT INTO `sys_system_log` VALUES (2, '1', '更新菜单', 'POST', 13, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-arrow-circle-o-right\",\"id\":23,\"isVisible\":1,\"limit\":0,\"name\":\"登录日志\",\"offset\":0,\"page\":0,\"perms\":\"system:loginLog:view\",\"pid\":7,\"sort\":0,\"type\":1,\"url\":\"/system/loginLog/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-05 17:01:51', 2);
INSERT INTO `sys_system_log` VALUES (3, 'admin', '更新角色', 'POST', 55, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"只有系统管理，并且不能删除与重置密码\",\"id\":2,\"limit\":0,\"name\":\"系统管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,3,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35\",\"role\":\"system\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-05 17:36:56', 2);
INSERT INTO `sys_system_log` VALUES (4, 'admin', '清空操作日志', 'GET', 18, 'ResponseResult cn.tellsea.module.system.controller.SystemLogController.deleteAll()', '{}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-05 17:38:32', 2);
INSERT INTO `sys_system_log` VALUES (5, 'admin', '清空操作日志', 'GET', 7, 'ResponseResult cn.tellsea.module.system.controller.SystemLogController.deleteAll()', '{}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-05 17:38:55', 1);
INSERT INTO `sys_system_log` VALUES (6, 'admin', '更新菜单', 'POST', 31, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"\",\"id\":8,\"isVisible\":1,\"limit\":0,\"name\":\"新增用户\",\"offset\":0,\"page\":0,\"perms\":\"system:userInfo:save\",\"pid\":4,\"sort\":0,\"type\":2,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-05 17:43:00', 1);
INSERT INTO `sys_system_log` VALUES (7, 'admin', '新增菜单', 'POST', 28, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617710511452,\"createUser\":1,\"icon\":\"fa-eye\",\"id\":37,\"isVisible\":1,\"limit\":0,\"name\":\"系统监控\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 20:01:52', 1);
INSERT INTO `sys_system_log` VALUES (8, 'admin', '更新菜单', 'POST', 30, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-building-o\",\"id\":25,\"isVisible\":1,\"limit\":0,\"name\":\"数据监控\",\"offset\":0,\"page\":0,\"perms\":\"dev:tool:druid\",\"pid\":37,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/druid\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 20:04:58', 1);
INSERT INTO `sys_system_log` VALUES (9, 'admin', '更新菜单', 'POST', 28, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-building-o\",\"id\":25,\"isVisible\":1,\"limit\":0,\"name\":\"数据监控\",\"offset\":0,\"page\":0,\"perms\":\"monitor:druid:view\",\"pid\":37,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/monitor/druid/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 20:06:09', 1);
INSERT INTO `sys_system_log` VALUES (10, 'admin', '新增菜单', 'POST', 57, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617711185718,\"createUser\":1,\"icon\":\"fa-eraser\",\"id\":38,\"isVisible\":1,\"limit\":0,\"name\":\"服务监控\",\"offset\":0,\"page\":0,\"perms\":\"monitor:server:view\",\"pid\":37,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/monitor/server/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 20:13:06', 1);
INSERT INTO `sys_system_log` VALUES (11, 'admin', '更新角色', 'POST', 102, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35,24,26,37,25,38\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:18:57', 1);
INSERT INTO `sys_system_log` VALUES (12, 'admin', '新增菜单', 'POST', 25, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617720223052,\"createUser\":1,\"icon\":\"\",\"id\":39,\"isVisible\":1,\"limit\":0,\"name\":\"开发工具\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:43:43', 1);
INSERT INTO `sys_system_log` VALUES (13, 'admin', '更新菜单', 'POST', 50, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-sitemap\",\"id\":26,\"isVisible\":1,\"limit\":0,\"name\":\"接口文档\",\"offset\":0,\"page\":0,\"perms\":\"dev:tool:swagger\",\"pid\":39,\"sort\":0,\"target\":\"_blank\",\"type\":1,\"url\":\"/doc.html\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:44:50', 1);
INSERT INTO `sys_system_log` VALUES (14, 'admin', '删除菜单', 'POST', 16, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.deleteById(int)', '{\"id\":24}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:45:08', 1);
INSERT INTO `sys_system_log` VALUES (15, 'admin', '更新菜单', 'POST', 18, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"\",\"id\":1,\"isVisible\":1,\"limit\":0,\"name\":\"系统管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/home\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:51:00', 1);
INSERT INTO `sys_system_log` VALUES (16, 'admin', '更新菜单', 'POST', 10, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"\",\"id\":1,\"isVisible\":1,\"limit\":0,\"name\":\"系统管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:51:24', 1);
INSERT INTO `sys_system_log` VALUES (17, 'admin', '更新菜单', 'POST', 17, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"\",\"id\":1,\"isVisible\":1,\"limit\":0,\"name\":\"权限管理系统\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 22:51:42', 1);
INSERT INTO `sys_system_log` VALUES (18, 'admin', '新增菜单', 'POST', 15, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617722773268,\"createUser\":1,\"icon\":\"fa-address-book\",\"id\":40,\"isVisible\":1,\"limit\":0,\"name\":\"部门管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":3,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:26:13', 1);
INSERT INTO `sys_system_log` VALUES (19, 'admin', '更新菜单', 'POST', 28, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-address-book\",\"id\":40,\"isVisible\":1,\"limit\":0,\"name\":\"部门管理\",\"offset\":0,\"page\":0,\"perms\":\"system:deptInfo:view\",\"pid\":3,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/system/deptInfo/view\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:27:18', 1);
INSERT INTO `sys_system_log` VALUES (20, 'admin', '更新菜单', 'POST', 6, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-address-book\",\"id\":40,\"isVisible\":1,\"limit\":0,\"name\":\"部门管理\",\"offset\":0,\"page\":0,\"perms\":\"system:deptInfo:view\",\"pid\":3,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/system/deptInfo/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:27:38', 1);
INSERT INTO `sys_system_log` VALUES (21, 'admin', '更新角色', 'POST', 63, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35,40,37,25,38,26\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:27:53', 1);
INSERT INTO `sys_system_log` VALUES (22, 'admin', '新增菜单', 'POST', 13, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617723337467,\"createUser\":1,\"icon\":\"fa-folder-o\",\"id\":41,\"isVisible\":1,\"limit\":0,\"name\":\"新增部门\",\"offset\":0,\"page\":0,\"perms\":\"system:deptInfo:save\",\"pid\":40,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":2,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:35:37', 1);
INSERT INTO `sys_system_log` VALUES (23, 'admin', '更新角色', 'POST', 74, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35,40,41,42,43,44,37,25,38,26\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:38:02', 1);
INSERT INTO `sys_system_log` VALUES (24, 'admin', '新增用户', 'POST', 18, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.save(DeptInfo)', '{\"entity\":{\"createTime\":1617724289679,\"createUser\":1,\"id\":2,\"limit\":0,\"name\":\"开发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"\",\"sort\":0,\"status\":1}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:51:30', 1);
INSERT INTO `sys_system_log` VALUES (25, 'admin', '新增用户', 'POST', 23, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.save(DeptInfo)', '{\"entity\":{\"createTime\":1617724301335,\"createUser\":1,\"id\":3,\"limit\":0,\"name\":\"研发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"\",\"sort\":0,\"status\":1}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:51:41', 1);
INSERT INTO `sys_system_log` VALUES (26, 'admin', '更新用户', 'POST', 31, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.updateById(DeptInfo)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"开发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"\",\"sort\":2}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:51:48', 1);
INSERT INTO `sys_system_log` VALUES (27, 'admin', '更新用户', 'POST', 12, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.updateById(DeptInfo)', '{\"entity\":{\"id\":3,\"limit\":0,\"name\":\"研发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"开发部负责公司的系统开发\",\"sort\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:52:25', 1);
INSERT INTO `sys_system_log` VALUES (28, 'admin', '删除用户', 'POST', 18, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.deleteById(int)', '{\"id\":2}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:55:27', 1);
INSERT INTO `sys_system_log` VALUES (29, 'admin', '更新用户', 'POST', 33, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.updateById(DeptInfo)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"开发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"开发部负责公司的系统开发\",\"sort\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:57:12', 1);
INSERT INTO `sys_system_log` VALUES (30, 'admin', '更新用户', 'POST', 10, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.updateById(DeptInfo)', '{\"entity\":{\"id\":3,\"limit\":0,\"name\":\"研发部\",\"offset\":0,\"page\":0,\"pid\":1,\"remark\":\"开发部负责公司营业方向的研发\",\"sort\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:57:29', 1);
INSERT INTO `sys_system_log` VALUES (31, 'admin', '更新用户', 'POST', 20, 'ResponseResult cn.tellsea.module.system.controller.DeptInfoController.updateById(DeptInfo)', '{\"entity\":{\"id\":1,\"limit\":0,\"name\":\"海绵科技有限公司\",\"offset\":0,\"page\":0,\"pid\":0,\"remark\":\"公司名称\",\"sort\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:57:38', 1);
INSERT INTO `sys_system_log` VALUES (32, 'admin', '更新菜单', 'POST', 12, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-address-book\",\"id\":40,\"isVisible\":1,\"limit\":0,\"name\":\"部门管理\",\"offset\":0,\"page\":0,\"perms\":\"system:deptInfo:view\",\"pid\":3,\"sort\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/system/deptInfo/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:59:03', 1);
INSERT INTO `sys_system_log` VALUES (33, 'admin', '更新菜单', 'POST', 17, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-group\",\"id\":4,\"isVisible\":1,\"limit\":0,\"name\":\"用户管理\",\"offset\":0,\"page\":0,\"perms\":\"system:userInfo:view\",\"pid\":3,\"sort\":2,\"target\":\"_self\",\"type\":1,\"url\":\"/system/userInfo/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:59:19', 1);
INSERT INTO `sys_system_log` VALUES (34, 'admin', '更新菜单', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-check\",\"id\":5,\"isVisible\":1,\"limit\":0,\"name\":\"角色管理\",\"offset\":0,\"page\":0,\"perms\":\"system:roleInfo:view\",\"pid\":3,\"sort\":3,\"target\":\"_self\",\"type\":1,\"url\":\"/system/roleInfo/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:59:26', 1);
INSERT INTO `sys_system_log` VALUES (35, 'admin', '更新菜单', 'POST', 14, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-reorder\",\"id\":6,\"isVisible\":1,\"limit\":0,\"name\":\"菜单管理\",\"offset\":0,\"page\":0,\"perms\":\"system:resourceInfo:view\",\"pid\":3,\"sort\":4,\"target\":\"_self\",\"type\":1,\"url\":\"/system/resourceInfo/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:59:33', 1);
INSERT INTO `sys_system_log` VALUES (36, 'admin', '更新菜单', 'POST', 15, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-calendar\",\"id\":7,\"isVisible\":1,\"limit\":0,\"name\":\"日志管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":3,\"sort\":4,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-06 23:59:50', 1);
INSERT INTO `sys_system_log` VALUES (37, 'admin', '更新菜单', 'POST', 14, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-calendar\",\"id\":7,\"isVisible\":1,\"limit\":0,\"name\":\"日志管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":3,\"sort\":5,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 00:00:05', 1);
INSERT INTO `sys_system_log` VALUES (38, 'admin', '新增用户', 'POST', 14, 'ResponseResult cn.tellsea.module.system.controller.UserInfoController.save(UserInfoVo)', '{\"entity\":{\"createTime\":1617775102056,\"createUser\":1,\"deptId\":3,\"description\":\"4353434534\",\"id\":6,\"limit\":0,\"name\":\"dev\",\"nickName\":\"研发一号\",\"offset\":0,\"page\":0,\"password\":\"d21a75b08ec64484abfdf0f4d9f2e0dd\",\"phone\":\"17777777777\",\"roleIds\":\"3\",\"salt\":\"GPW2lczKEb0cHQx3ynKbqIltbHT0aIy5\",\"sex\":1,\"status\":1}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 13:58:22', 1);
INSERT INTO `sys_system_log` VALUES (39, 'admin', '更新菜单', 'POST', 21, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-sitemap\",\"id\":26,\"isVisible\":1,\"limit\":0,\"name\":\"接口文档\",\"offset\":0,\"page\":0,\"perms\":\"common:swagger:view\",\"pid\":39,\"sort\":0,\"target\":\"_blank\",\"type\":1,\"url\":\"/common/swagger/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 14:28:00', 1);
INSERT INTO `sys_system_log` VALUES (40, 'admin', '新增菜单', 'POST', 20, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617777238655,\"createUser\":1,\"icon\":\"fa-arrows-v\",\"id\":45,\"isVisible\":1,\"limit\":0,\"name\":\"上传下载\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":39,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/common/file/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 14:33:59', 1);
INSERT INTO `sys_system_log` VALUES (41, 'admin', '更新角色', 'POST', 61, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 16:48:18', 1);
INSERT INTO `sys_system_log` VALUES (42, 'admin', '新增菜单', 'POST', 59, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617808787446,\"createUser\":1,\"icon\":\"fa-cubes\",\"id\":46,\"isVisible\":1,\"limit\":0,\"name\":\"系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:detail\",\"pid\":3,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/system/systemConfig/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:19:47', 1);
INSERT INTO `sys_system_log` VALUES (43, 'admin', '更新菜单', 'POST', 36, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-cubes\",\"id\":46,\"isVisible\":1,\"limit\":0,\"name\":\"系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:detail\",\"pid\":3,\"sort\":6,\"target\":\"_self\",\"type\":1,\"url\":\"/system/systemConfig/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:20:22', 1);
INSERT INTO `sys_system_log` VALUES (44, 'admin', '更新角色', 'POST', 110, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,7,22,29,30,33,36,23,31,32,34,35,46,37,25,38,39,26,45\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:20:53', 1);
INSERT INTO `sys_system_log` VALUES (45, 'admin', '更新菜单', 'POST', 18, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-calendar\",\"id\":7,\"isVisible\":1,\"limit\":0,\"name\":\"日志管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":3,\"sort\":6,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:21:32', 1);
INSERT INTO `sys_system_log` VALUES (46, 'admin', '更新菜单', 'POST', 16, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-cubes\",\"id\":46,\"isVisible\":1,\"limit\":0,\"name\":\"系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:detail\",\"pid\":3,\"sort\":5,\"target\":\"_self\",\"type\":1,\"url\":\"/system/systemConfig/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:21:44', 1);
INSERT INTO `sys_system_log` VALUES (47, 'admin', '更新菜单', 'POST', 33, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"\",\"id\":1,\"isVisible\":1,\"limit\":0,\"name\":\"系统模块\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":0,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:34:01', 1);
INSERT INTO `sys_system_log` VALUES (48, 'admin', '更新菜单', 'POST', 18, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-cubes\",\"id\":46,\"isVisible\":1,\"limit\":0,\"name\":\"系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:updatePage\",\"pid\":3,\"sort\":5,\"target\":\"_self\",\"type\":1,\"url\":\"/system/systemConfig/updatePage\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:34:25', 1);
INSERT INTO `sys_system_log` VALUES (49, 'admin', '新增菜单', 'POST', 26, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617811174709,\"createUser\":1,\"icon\":\"\",\"id\":47,\"isVisible\":1,\"limit\":0,\"name\":\"更新系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:update\",\"pid\":46,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":2,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:59:35', 1);
INSERT INTO `sys_system_log` VALUES (50, 'admin', '更新角色', 'POST', 137, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-07 23:59:41', 1);
INSERT INTO `sys_system_log` VALUES (51, 'admin', '更新角色', 'POST', 74, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,47,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:00:37', 1);
INSERT INTO `sys_system_log` VALUES (52, 'admin', '更新系统配置', 'POST', 13, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"id\":1,\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统1\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:00:55', 1);
INSERT INTO `sys_system_log` VALUES (53, 'admin', '更新系统配置', 'POST', 16, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"id\":1,\"limit\":0,\"logo\":\"/upload/system_config/2021-04-08/6d3e58b6-55f5-412f-a4de-89281f7ea99a.jpg\",\"name\":\"StrawShiro权限管理系统\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:01:08', 1);
INSERT INTO `sys_system_log` VALUES (54, 'admin', '更新系统配置', 'POST', 10, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"id\":1,\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统1\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:04:21', 1);
INSERT INTO `sys_system_log` VALUES (55, 'admin', '更新系统配置', 'POST', 43, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"description\":\"权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！\",\"id\":1,\"keywords\":\"SpringBoot+Shiro权限管理系统\",\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统1\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:21:05', 1);
INSERT INTO `sys_system_log` VALUES (56, 'admin', '更新系统配置', 'POST', 21, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"description\":\"权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！\",\"id\":1,\"keywords\":\"SpringBoot+Shiro权限管理系统\",\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 00:21:14', 1);
INSERT INTO `sys_system_log` VALUES (57, 'admin', '新增菜单', 'POST', 20, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617844514840,\"createUser\":1,\"icon\":\"fa-arrows\",\"id\":48,\"isVisible\":1,\"limit\":0,\"name\":\"构建表单\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":39,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/common/buildForm/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 09:15:15', 1);
INSERT INTO `sys_system_log` VALUES (58, 'admin', '更新菜单', 'POST', 12, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-sitemap\",\"id\":26,\"isVisible\":1,\"limit\":0,\"name\":\"接口文档\",\"offset\":0,\"page\":0,\"perms\":\"common:swagger:view\",\"pid\":39,\"sort\":0,\"target\":\"_blank\",\"type\":1,\"url\":\"/common/swagger/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 09:15:29', 1);
INSERT INTO `sys_system_log` VALUES (59, 'tellsea', '更新角色', 'POST', 123, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,47,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 22:13:52', 1);
INSERT INTO `sys_system_log` VALUES (60, 'tellsea', '更新角色', 'POST', 111, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,47,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45,48\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 22:51:54', 1);
INSERT INTO `sys_system_log` VALUES (61, 'admin', '新增菜单', 'POST', 19, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617894425088,\"createUser\":1,\"icon\":\"fa-anchor\",\"id\":49,\"isVisible\":1,\"limit\":0,\"name\":\"代码生成\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":39,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/common/gen/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 23:07:05', 1);
INSERT INTO `sys_system_log` VALUES (62, 'admin', '更新角色', 'POST', 116, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,47,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45,48,49\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-08 23:07:15', 1);
INSERT INTO `sys_system_log` VALUES (63, 'admin', '新增菜单', 'POST', 31, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617946488741,\"createUser\":1,\"icon\":\"fa-graduation-cap\",\"id\":50,\"isVisible\":1,\"limit\":0,\"name\":\"字典管理\",\"offset\":0,\"page\":0,\"perms\":\"system:dictType:view\",\"pid\":3,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/system/dictType/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:34:49', 1);
INSERT INTO `sys_system_log` VALUES (64, 'admin', '更新菜单', 'POST', 23, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-calendar\",\"id\":7,\"isVisible\":1,\"limit\":0,\"name\":\"日志管理\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":3,\"sort\":7,\"target\":\"_self\",\"type\":1,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:35:06', 1);
INSERT INTO `sys_system_log` VALUES (65, 'admin', '更新菜单', 'POST', 6, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-graduation-cap\",\"id\":50,\"isVisible\":1,\"limit\":0,\"name\":\"字典管理\",\"offset\":0,\"page\":0,\"perms\":\"system:dictType:view\",\"pid\":3,\"sort\":6,\"target\":\"_self\",\"type\":1,\"url\":\"/system/dictType/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:35:14', 1);
INSERT INTO `sys_system_log` VALUES (66, 'admin', '新增菜单', 'POST', 15, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617946737499,\"createUser\":1,\"icon\":\"\",\"id\":51,\"isVisible\":1,\"limit\":0,\"name\":\"新增字典类型\",\"offset\":0,\"page\":0,\"perms\":\"system:dictType:save\",\"pid\":50,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":2,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:38:58', 1);
INSERT INTO `sys_system_log` VALUES (67, 'admin', '新增菜单', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617946737880,\"createUser\":1,\"icon\":\"\",\"id\":52,\"isVisible\":1,\"limit\":0,\"name\":\"新增字典类型\",\"offset\":0,\"page\":0,\"perms\":\"system:dictType:save\",\"pid\":50,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":2,\"url\":\"\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:38:58', 1);
INSERT INTO `sys_system_log` VALUES (68, 'admin', '更新角色', 'POST', 58, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"resourceIds\":\"1,2,3,40,41,42,43,44,4,8,9,10,11,12,13,27,28,5,14,15,16,17,6,18,19,20,21,46,47,50,51,52,53,54,55,7,22,29,30,33,36,23,31,32,34,35,37,25,38,39,26,45,48,49\",\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:43:23', 1);
INSERT INTO `sys_system_log` VALUES (69, 'admin', '新增字典类型', 'POST', 20, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.save(DictType)', '{\"entity\":{\"createTime\":1617947558159,\"createUser\":1,\"id\":2,\"limit\":0,\"name\":\"测试字典\",\"offset\":0,\"page\":0,\"remark\":\"测试字典列表\",\"sort\":1,\"status\":1,\"type\":\"test\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:52:38', 1);
INSERT INTO `sys_system_log` VALUES (70, 'admin', '更新字典类型', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.updateById(DictType)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"测试字典1\",\"offset\":0,\"page\":0,\"remark\":\"测试字典列表1\",\"sort\":11,\"type\":\"test1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:54:59', 1);
INSERT INTO `sys_system_log` VALUES (71, 'admin', '更新字典类型', 'POST', 4, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.updateById(DictType)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"测试字典1\",\"offset\":0,\"page\":0,\"remark\":\"测试字典列表1\",\"sort\":11,\"type\":\"test1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:55:29', 1);
INSERT INTO `sys_system_log` VALUES (72, 'admin', '更新字典类型', 'POST', 15, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.updateById(DictType)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"测试字典1\",\"offset\":0,\"page\":0,\"remark\":\"测试字典列表1\",\"sort\":11,\"type\":\"test1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:56:51', 1);
INSERT INTO `sys_system_log` VALUES (73, 'admin', '更新字典类型', 'POST', 9, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.updateById(DictType)', '{\"entity\":{\"id\":2,\"limit\":0,\"name\":\"测试字典\",\"offset\":0,\"page\":0,\"remark\":\"测试字典列表\",\"sort\":1,\"type\":\"test\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 13:56:59', 1);
INSERT INTO `sys_system_log` VALUES (74, 'admin', '删除字典类型', 'POST', 24, 'ResponseResult cn.tellsea.module.system.controller.DictTypeController.deleteByType(String)', '{\"type\":\"test\"}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:46:32', 1);
INSERT INTO `sys_system_log` VALUES (75, 'admin', '新增字典数据', 'POST', 88, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"isEnable\":1,\"limit\":0,\"offset\":0,\"page\":0,\"remark\":\"\",\"sort\":0,\"type\":\"user_info_sex\",\"value\":\"女\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:57:16', 1);
INSERT INTO `sys_system_log` VALUES (76, 'admin', '新增字典数据', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"isEnable\":1,\"limit\":0,\"offset\":0,\"page\":0,\"remark\":\"\",\"sort\":0,\"type\":\"user_info_sex\",\"value\":\"女\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:57:51', 1);
INSERT INTO `sys_system_log` VALUES (77, 'admin', '新增字典数据', 'POST', 6059, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"isEnable\":1,\"limit\":0,\"offset\":0,\"page\":0,\"remark\":\"\",\"sort\":0,\"type\":\"user_info_sex\",\"value\":\"女\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:58:30', 1);
INSERT INTO `sys_system_log` VALUES (78, 'admin', '新增字典数据', 'POST', 5, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"isEnable\":1,\"limit\":0,\"offset\":0,\"page\":0,\"remark\":\"\",\"sort\":0,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:58:43', 1);
INSERT INTO `sys_system_log` VALUES (79, 'admin', '新增字典数据', 'POST', 16, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"createTime\":1617951573469,\"createUser\":1,\"id\":1,\"isEnable\":1,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"\",\"sort\":0,\"status\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 14:59:33', 1);
INSERT INTO `sys_system_log` VALUES (80, 'admin', '更新字典数据', 'POST', 6, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男1\",\"offset\":0,\"page\":0,\"remark\":\"1\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"11\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:07:39', 1);
INSERT INTO `sys_system_log` VALUES (81, 'admin', '更新字典数据', 'POST', 4, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男1\",\"offset\":0,\"page\":0,\"remark\":\"1\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"11\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:17:32', 1);
INSERT INTO `sys_system_log` VALUES (82, 'admin', '更新字典数据', 'POST', 27, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":1,\"limit\":0,\"name\":\"男1\",\"offset\":0,\"page\":0,\"remark\":\"1\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"11\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:18:56', 1);
INSERT INTO `sys_system_log` VALUES (83, 'admin', '更新字典数据', 'POST', 10, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男1\",\"offset\":0,\"page\":0,\"remark\":\"1\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"11\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:19:02', 1);
INSERT INTO `sys_system_log` VALUES (84, 'admin', '更新字典数据', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":1,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:19:23', 1);
INSERT INTO `sys_system_log` VALUES (85, 'admin', '新增字典数据', 'POST', 19, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.save(DictData)', '{\"entity\":{\"createTime\":1617952776515,\"createUser\":1,\"id\":2,\"isEnable\":1,\"limit\":0,\"name\":\"女\",\"offset\":0,\"page\":0,\"remark\":\"性别女\",\"sort\":1,\"status\":1,\"type\":\"user_info_sex\",\"value\":\"2\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:19:37', 1);
INSERT INTO `sys_system_log` VALUES (86, 'admin', '删除字典数据', 'POST', 5, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.deleteById(int)', '{\"id\":2}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:19:53', 1);
INSERT INTO `sys_system_log` VALUES (87, 'admin', '更新字典数据', 'POST', 17, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"offset\":0,\"page\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:38:25', 1);
INSERT INTO `sys_system_log` VALUES (88, 'admin', '更新字典数据', 'POST', 7, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"offset\":0,\"page\":0}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:38:45', 1);
INSERT INTO `sys_system_log` VALUES (89, 'admin', '更新字典数据', 'POST', 5, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:43:12', 1);
INSERT INTO `sys_system_log` VALUES (90, 'admin', '更新字典数据', 'POST', 5, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":1,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:43:19', 1);
INSERT INTO `sys_system_log` VALUES (91, 'admin', '更新字典数据', 'POST', 9, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:44:27', 1);
INSERT INTO `sys_system_log` VALUES (92, 'admin', '更新字典数据', 'POST', 93937, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:46:39', 1);
INSERT INTO `sys_system_log` VALUES (93, 'admin', '更新字典数据', 'POST', 17, 'ResponseResult cn.tellsea.module.system.controller.DictDataController.updateById(DictData)', '{\"entity\":{\"id\":1,\"isEnable\":2,\"limit\":0,\"name\":\"男\",\"offset\":0,\"page\":0,\"remark\":\"性别男\",\"sort\":1,\"type\":\"user_info_sex\",\"value\":\"1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:47:13', 1);
INSERT INTO `sys_system_log` VALUES (94, 'admin', '更新菜单', 'POST', 20, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-graduation-cap\",\"id\":50,\"isVisible\":1,\"limit\":0,\"name\":\"字典管理\",\"offset\":0,\"page\":0,\"perms\":\"system:dictType:view\",\"pid\":3,\"sort\":5,\"target\":\"_self\",\"type\":1,\"url\":\"/system/dictType/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:56:35', 1);
INSERT INTO `sys_system_log` VALUES (95, 'admin', '更新菜单', 'POST', 14, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-cubes\",\"id\":46,\"isVisible\":1,\"limit\":0,\"name\":\"系统配置\",\"offset\":0,\"page\":0,\"perms\":\"system:systemConfig:updatePage\",\"pid\":3,\"sort\":6,\"target\":\"_self\",\"type\":1,\"url\":\"/system/systemConfig/updatePage\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 15:56:48', 1);
INSERT INTO `sys_system_log` VALUES (96, 'admin', '更新菜单', 'POST', 10, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-sitemap\",\"id\":26,\"isVisible\":1,\"limit\":0,\"name\":\"接口文档\",\"offset\":0,\"page\":0,\"perms\":\"common:swagger:view\",\"pid\":39,\"sort\":0,\"target\":\"_self\",\"type\":1,\"url\":\"/common/swagger/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 17:13:17', 1);
INSERT INTO `sys_system_log` VALUES (97, 'admin', '新增菜单', 'POST', 25, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1617979797297,\"createUser\":1,\"icon\":\"fa-clock-o\",\"id\":56,\"isVisible\":1,\"limit\":0,\"name\":\"运行监控\",\"offset\":0,\"page\":0,\"perms\":\"monitor:server:tailLog\",\"pid\":37,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/monitor/server/tailLog\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 22:49:57', 1);
INSERT INTO `sys_system_log` VALUES (98, 'admin', '更新角色', 'POST', 50, 'ResponseResult cn.tellsea.module.system.controller.RoleInfoController.updateById(RoleInfoVo)', '{\"entity\":{\"description\":\"拥有所有权限\",\"id\":1,\"limit\":0,\"name\":\"超级管理员\",\"offset\":0,\"page\":0,\"role\":\"admin\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-09 22:55:43', 1);
INSERT INTO `sys_system_log` VALUES (99, 'admin', '新增菜单', 'POST', 28, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.save(ResourceInfo)', '{\"entity\":{\"createTime\":1618293372854,\"createUser\":1,\"icon\":\"fa-whatsapp\",\"id\":57,\"isVisible\":1,\"limit\":0,\"name\":\"移动端\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":39,\"sort\":0,\"status\":1,\"target\":\"_self\",\"type\":1,\"url\":\"/common/jqueryWeUi/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-13 13:56:13', 1);
INSERT INTO `sys_system_log` VALUES (100, 'admin', '更新菜单', 'POST', 14, 'ResponseResult cn.tellsea.module.system.controller.ResourceInfoController.updateById(ResourceInfo)', '{\"entity\":{\"icon\":\"fa-whatsapp\",\"id\":57,\"isVisible\":1,\"limit\":0,\"name\":\"移动端\",\"offset\":0,\"page\":0,\"perms\":\"\",\"pid\":39,\"sort\":0,\"target\":\"_blank\",\"type\":1,\"url\":\"/common/jqueryWeUi/init\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-13 14:04:12', 1);
INSERT INTO `sys_system_log` VALUES (101, 'admin', '更新系统配置', 'POST', 13, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"description\":\"权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！\",\"id\":1,\"keywords\":\"SpringBoot+Shiro权限管理系统\",\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro版\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-29 08:14:33', 1);
INSERT INTO `sys_system_log` VALUES (102, 'admin', '更新系统配置', 'POST', 6, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"description\":\"权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！\",\"id\":1,\"keywords\":\"SpringBoot+Shiro权限管理系统\",\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro版1\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-29 08:21:24', 1);
INSERT INTO `sys_system_log` VALUES (103, 'admin', '更新系统配置', 'POST', 12, 'ResponseResult cn.tellsea.module.system.controller.SystemConfigController.updateById(SystemConfig)', '{\"entity\":{\"description\":\"权限管理系统模板，够轻便、够快捷、够高效，你，值得拥有！\",\"id\":1,\"keywords\":\"SpringBoot+Shiro权限管理系统\",\"limit\":0,\"logo\":\"/static/layuimini/images/logo.png\",\"name\":\"StrawShiro权限管理系统\",\"offset\":0,\"page\":0,\"shortName\":\"StrawShiro版\"}}', '127.0.0.1', '0|0|0|内网IP|内网IP', '2021-04-29 08:21:31', 1);

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
                                  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
                                  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户，登录名，不可更改',
                                  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
                                  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐值',
                                  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
                                  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
                                  `sex` int(1) NULL DEFAULT 0 COMMENT '性别 1男 2女',
                                  `is_lock` int(11) NULL DEFAULT 1 COMMENT '账号状态 1-正常 2-锁定',
                                  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                                  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
                                  `login_times` int(11) NULL DEFAULT 0 COMMENT '登录次数',
                                  `create_user` int(11) NULL DEFAULT 0 COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `status` int(1) NULL DEFAULT 0 COMMENT '状态 1-正常 2-删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, 2, 'admin', '汤海鸿', 'a994fef0ddad5f9eed20804e7b18f559', 'VKqvum8YW0xNaTDFbrcijhTG6wUP5xAZ', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2562372298,495845374&fm=26&gp=0.jpg', '18386474459', 1, 2, 'I am Iron Man', '2021-06-08 21:17:07', 79, 1, '2021-06-08 21:17:06', 1);
INSERT INTO `sys_user_info` VALUES (2, 2, 'tellsea', '小海绵', '44eb196feb810ee770047cc34da66133', 'V1D9h266hLYqYfF5DnZCjlJKyG3Gx36c', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3041599764,2432042915&fm=26&gp=0.jpg', '15836541252', 1, 1, '我不想打字', NULL, 0, 1, '2021-04-12 13:52:46', 1);
INSERT INTO `sys_user_info` VALUES (3, 2, 'monitor', '监控员', '221605ef8256bb0cfbbfa5fb7688eaf1', '2HI9EdHJjSYsfyqSdbWlXZRxJNXvFnrE', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=584948523,1006436504&fm=26&gp=0.jpg', '15356521441', 2, 1, '中二病晚期', NULL, 0, 1, '2021-04-12 13:52:46', 1);
INSERT INTO `sys_user_info` VALUES (4, 2, 'test', '测试', 'ca77996da6aa4879c139c42adae1e324', 'RwS5Y8B7jV8DJxomL8sC2EWXlcpkEywn', NULL, '18386465555', 1, 1, '简介', NULL, 0, 1, '2021-04-12 13:52:46', 1);
INSERT INTO `sys_user_info` VALUES (5, 3, 'devUser', '研发一号', '7735212e923e34a60acd756d266e3544', 'Nj3nvXbhqjOUJnrvUpv8yIdZRziEBYlC', NULL, '18666666666', 1, 1, '6666666666666666666', NULL, 0, 1, '2021-04-12 13:52:46', 1);
INSERT INTO `sys_user_info` VALUES (6, 3, 'dev', '研发一号', 'd21a75b08ec64484abfdf0f4d9f2e0dd', 'GPW2lczKEb0cHQx3ynKbqIltbHT0aIy5', NULL, '17777777777', 1, 1, '4353434534', NULL, 0, 1, '2021-04-12 13:52:46', 1);

SET FOREIGN_KEY_CHECKS = 1;
