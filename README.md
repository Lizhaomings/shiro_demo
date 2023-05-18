# Straw-Shiro

## 1、项目简介

基于 springboot、shiro 实现的后台管理系统模板，主要可以用于线上项目、外包项目、企业项目的生产使用，其中使用的相关组件均为开源组件，并未涉及授权购买等相关问题，可以放心使用。使用的相关技术均为市面上通用的技术，不会存在有问题，没答案的现象。

## 2、相关链接

- [项目文档：http://shiro.tellsea.cn/](http://doc.tellsea.cn/)
- [项目预览：http://doc.tellsea.cn/](http://shiro.tellsea.cn/)
- [项目源码：https://gitee.com/tellsea/Straw-Shiro](https://gitee.com/tellsea/Straw-Shiro)

## 3、基础功能

| 功能     | 代表                                                                         |
| :------- | ---------------------------------------------------------------------------- |
| 部门管理 | 部门管理负责各个部门之间的层级管理                                           |
| 用户管理 | 系统核心就是用户，用户是必不可少的一份子                                     |
| 角色管理 | 分配用户的使用权限，对于整个系统来说，非常重要                               |
| 菜单管理 | 菜单管理实际上也叫权限管理，负责整合系统的请求与权限的配置，增加系统安全性   |
| 字典管理 | 字典管理有父子两张表，父表为类型表，字表为数据表，对于管理维表信息非常方便   |
| 系统配置 | 通过配置的形式管理系统名称，项目名称，图标等定制化信息                       |
| 登录日志 | 记录系统的登录人、登录时间、登录地点等信息                                   |
| 操作日志 | 记录系统操作接口的详细信息，方便后期处理问题时查找源头                       |
| 数据监控 | 监控数据源、性能、查询细节等各方面信息，可以找出 SQL 查询慢的原因            |
| 服务监控 | 监控服务器的各方面指标是否在正常的范围内                                     |
| 运行监控 | 实时查看系统日志，方便开发者不连接服务器的情况下调节 bug                     |
| 接口文档 | 接口文档分模块统一管理各种接口的调用规则                                     |
| 上传下载 | 通过案例模板，方便开发中直接复制粘贴常用上传下载组件                         |
| 构建表单 | 拖拽生成各种表单，快速复制粘贴，一键生成表单                                 |
| 代码生成 | 一键生成 Controller、Service、ServiceImpl、Mapper、Entity、Vo 等支持定制模板 |

## 4、技术选型

| 名称           | 版本      | 简介        | 地址                                                                                                                             |
| :------------- | --------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------- |
| SpringBoot     | 2.4.3     | 核心框架    | [https://spring.io/projects/spring-boot](https://spring.io/projects/spring-boot)                                                 |
| Shiro          | 1.4.1     | 安全框架    | [http://shiro.apache.org/](http://shiro.apache.org/)                                                                             |
| MybatisPlus    | 3.3.1     | ORM 框架    | [https://mp.baomidou.com/](https://mp.baomidou.com/)                                                                             |
| Thymeleaf      | 2.4.3     | 模板引擎    | [https://www.thymeleaf.org/](https://www.thymeleaf.org/)                                                                         |
| Layuimini      | iframe 版 | 静态样式    | [http://layuimini.99php.cn/](http://layuimini.99php.cn/)                                                                         |
| Redis          |           | 缓存组件    | [https://redis.io/](https://redis.io/)                                                                                           |
| MySQL          | 8.0.22    | 数据库      | [https://www.mysql.com/](https://www.mysql.com/)                                                                                 |
| Druid          | 1.2.4     | 连接池      | [https://druid.apache.org/](https://druid.apache.org/)                                                                           |
| knife4j        | 3.0.2     | 接口文档    | [https://swagger.io/](https://swagger.io/)                                                                                       |
| fastjson       | 1.2.75    | Json 工具   | [https://github.com/alibaba/fastjson](https://github.com/alibaba/fastjson)                                                       |
| commons-io     | 2.6       | IO 工具     | [http://commons.apache.org/proper/commons-io/](http://commons.apache.org/proper/commons-io/)                                     |
| UserAgentUtils | 1.21      | 设备信息    | [https://mvnrepository.com/artifact/eu.bitwalker/UserAgentUtils](https://mvnrepository.com/artifact/eu.bitwalker/UserAgentUtils) |
| ip2region      | 1.7.2     | IP 地址     | [https://gitee.com/lionsoul/ip2region](https://gitee.com/lionsoul/ip2region)                                                     |
| hutool-all     | 5.4.3     | Hutool 工具 | [https://hutool.cn/docs/#/](https://hutool.cn/docs/#/)                                                                           |
| oshi           | 5.7.0     | 系统信息    | [https://github.com/oshi/oshi](https://github.com/oshi/oshi)                                                                     |
| zxing          | 3.3.0     | 二维码      |                                                                                                                                  |
| EasyPoi        | 4.2.0     | 导入导出    | [http://easypoi.mydoc.io/](http://easypoi.mydoc.io/)                                                                             |

## 5、项目截图

| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608204818481.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![](https://img-blog.csdnimg.cn/20210608204856632.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70)                   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205300785.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205333172.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205404533.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205439432.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205513389.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205524706.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205639872.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205654905.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205719455.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205729372.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205807800.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205830761.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608205857649.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/202106082059287.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70)   |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608210008496.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/2021060821011081.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70)  |
| ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608210143876.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) | ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210608210219790.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NzYyMjM3,size_16,color_FFFFFF,t_70) |

## 6、常见问题

提问建议通过 Issue 发布，[Issue 提问](https://gitee.com/tellsea/Straw-Shiro/issues/new)

## 7、开源协议

Straw-Shiro 使用的是 Apache 2.0 许可。详细信息请参见[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)文件

# 微信公众号
![每天Get一个小技巧](https://img-blog.csdnimg.cn/20210317114147258.jpg#pic_center)
