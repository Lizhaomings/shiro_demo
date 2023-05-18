package cn.tellsea.frame.core.config;

import cn.tellsea.frame.common.util.StrawStringUtils;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Mybatis plus 代码生成器配置
 * Mybatis plus 官网：https://mp.baomidou.com/guide/generator.html
 * https://blog.csdn.net/qq_43230007/article/details/108819628
 *
 * @author Tellsea
 * @date 2021/04/06
 * @see AbstractTemplateEngine
 */
public class CodeGenerator {

    private static final String projectPath = System.getProperty("user.dir");
    private static final String templatePathEntity = "/templates/code/entity.java.ftl";
    private static final String templatePathVo = "/templates/code/vo.java.ftl";
    private static final String templatePathController = "/templates/code/controller.java.ftl";
    private static final String templatePathService = "/templates/code/service.java.ftl";
    private static final String templatePathServiceImpl = "/templates/code/serviceImpl.java.ftl";
    private static final String templatePathMapper = "/templates/code/mapper.java.ftl";
    private static final String templatePathXml = "/templates/code/mapper.xml.ftl";
    private static final String templatePathHtml = "/templates/code/view.html.ftl";
    private static final String javaLocation = projectPath + "/src/main/java/cn/tellsea/module/";
    private static final String xmlLocation = projectPath + "/src/main/resources/mapper/";
    private static final String pageLocation = projectPath + "/src/main/resources/templates/views/";


    private static final String URL = "jdbc:mysql://127.0.0.1:3306/straw_shiro?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=true&characterEncoding=UTF-8";
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String USER_NAME = "root";
    private static final String PASS_WORD = "123456";
    private static final String author = "Tellsea";
    private static final String basePackage = "cn.tellsea.module";
    private static final String moduleName = "system";
    private static final String tablePrefix = "sys_";

    public static void main(String[] args) {
        String[] nameList = new String[]{"sys_demo"};
        for (int i = 0; i < nameList.length; i++) {
            codeGenerator(nameList[i]);
        }
    }

    public static void codeGenerator(String tableName) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();
        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor(author);
        // 是否打开输出目录
        gc.setOpen(false);
        // controller 命名方式，注意 %s 会自动填充表实体属性
        gc.setControllerName("%sController");
        // service 命名方式
        gc.setServiceName("%sService");
        // serviceImpl 命名方式
        gc.setServiceImplName("%sServiceImpl");
        // mapper 命名方式
        gc.setMapperName("%sMapper");
        // xml 命名方式
        gc.setXmlName("%sMapper");
        // 开启 swagger2 模式
        gc.setSwagger2(true);
        // 时间格式
        gc.setDateType(DateType.ONLY_DATE);
        // 是否覆盖已有文件
        gc.setFileOverride(true);
        // 是否开启 ActiveRecord 模式
        gc.setActiveRecord(false);
        // 是否在xml中添加二级缓存配置
        gc.setEnableCache(false);
        // 是否开启 BaseResultMap
        gc.setBaseResultMap(false);
        // XML columList
        gc.setBaseColumnList(false);
        // 全局 相关配置
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(URL);
        dsc.setDriverName(DRIVER_NAME);
        dsc.setUsername(USER_NAME);
        dsc.setPassword(PASS_WORD);
        mpg.setDataSource(dsc);

        // 基础包配置
        final PackageConfig pc = new PackageConfig();
        pc.setModuleName(moduleName);
        pc.setParent(basePackage);
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<>(16);
                // system
                map.put("moduleName", moduleName);
                // userInfo
                map.put("entityName", StrawStringUtils.underline2Camel(tableName.substring(tableName.indexOf("_") + 1), false));
                // cn.tellsea.module
                map.put("basePackage", basePackage);
                this.setMap(map);
            }
        };

        // 自定义输出配置，配置会被优先输出
        cfg.setFileOutConfigList(getFileOutConfig(moduleName));
        mpg.setCfg(cfg);

        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();
        templateConfig.setController(null);
        templateConfig.setXml(null);
        templateConfig.setEntity(null);
        templateConfig.setService(null);
        templateConfig.setServiceImpl(null);
        mpg.setTemplate(templateConfig);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        // 数据库表映射到实体的命名策略，驼峰原则
        strategy.setNaming(NamingStrategy.underline_to_camel);
        // 字数据库表字段映射到实体的命名策略，驼峰原则
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        // 实体类父类
        strategy.setSuperEntityClass("cn.tellsea.frame.dto.BaseEntity");
        // 实体是否生成 serialVersionUID
        strategy.setEntitySerialVersionUID(false);
        // 是否生成实体时，生成字段注解
        strategy.setEntityTableFieldAnnotationEnable(true);
        // 使用lombok
        strategy.setEntityLombokModel(true);
        // 指定生成的bean的数据库表名
        strategy.setInclude(tableName);
        // 表前缀
        strategy.setTablePrefix(tablePrefix);
        // 自动注入监听器配置
        ArrayList<TableFill> tableFills = new ArrayList<>();
        tableFills.add(new TableFill("create_user", FieldFill.INSERT));
        tableFills.add(new TableFill("create_time", FieldFill.INSERT));
        tableFills.add(new TableFill("status", FieldFill.INSERT));
        strategy.setTableFillList(tableFills);
        mpg.setStrategy(strategy);
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();
    }

    private static List<FileOutConfig> getFileOutConfig(String model) {
        List<FileOutConfig> focList = new ArrayList<>();

        // Entity
        focList.add(new FileOutConfig(templatePathEntity) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/entity/" + tableInfo.getEntityName() + StringPool.DOT_JAVA;
            }
        });

        // Vo
        focList.add(new FileOutConfig(templatePathVo) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/vo/" + tableInfo.getEntityName() + "Vo" + StringPool.DOT_JAVA;
            }
        });

        // Controller
        focList.add(new FileOutConfig(templatePathController) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/controller/" + tableInfo.getEntityName() + "Controller" + StringPool.DOT_JAVA;
            }
        });

        // Service
        focList.add(new FileOutConfig(templatePathService) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/service/" + tableInfo.getEntityName() + "Service" + StringPool.DOT_JAVA;
            }
        });

        // ServiceImpl
        focList.add(new FileOutConfig(templatePathServiceImpl) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/service/impl/" + tableInfo.getEntityName() + "ServiceImpl" + StringPool.DOT_JAVA;
            }
        });

        // Mapper.java
        focList.add(new FileOutConfig(templatePathMapper) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return javaLocation + model + "/mapper/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_JAVA;
            }
        });

        // Mapper.xml
        focList.add(new FileOutConfig(templatePathXml) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return xmlLocation + model + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });

        return focList;
    }
}
