package cn.tellsea.module.system.consts;

/**
 * system 模块权限常量
 * view：视图页面
 * list：查询接口
 * save：新增接口
 * update：更新接口
 * delete：删除接口
 * import：导入接口
 * export：导出接口
 *
 * @author Tellsea
 * @date 2021/04/04
 */
public class SystemPerms {

    public class DeptInfo {
        public static final String VIEW = "system:deptInfo:view";
        public static final String LIST = "system:deptInfo:list";
        public static final String SAVE = "system:deptInfo:save";
        public static final String UPDATE = "system:deptInfo:update";
        public static final String DELETE = "system:deptInfo:delete";
    }

    public class UserInfo {
        public static final String VIEW = "system:userInfo:view";
        public static final String LIST = "system:userInfo:list";
        public static final String SAVE = "system:userInfo:save";
        public static final String DETAIL = "system:userInfo:detail";
        public static final String UPDATE = "system:userInfo:update";
        public static final String DELETE = "system:userInfo:delete";
        public static final String IMPORT = "system:userInfo:import";
        public static final String EXPORT = "system:userInfo:export";
        public static final String RESET_PWD = "system:userInfo:resetPwd";
    }

    public class RoleInfo {
        public static final String VIEW = "system:roleInfo:view";
        public static final String LIST = "system:roleInfo:list";
        public static final String SAVE = "system:roleInfo:save";
        public static final String UPDATE = "system:roleInfo:update";
        public static final String DELETE = "system:roleInfo:delete";
    }

    public class ResourceInfo {
        public static final String VIEW = "system:resourceInfo:view";
        public static final String LIST = "system:resourceInfo:list";
        public static final String SAVE = "system:resourceInfo:save";
        public static final String UPDATE = "system:resourceInfo:update";
        public static final String DELETE = "system:resourceInfo:delete";
    }

    public class LoginLog {
        public static final String VIEW = "system:loginLog:view";
        public static final String LIST = "system:loginLog:list";
        public static final String DETAIL = "system:loginLog:detail";
        public static final String DELETE = "system:loginLog:delete";
        public static final String CLAEN = "system:loginLog:clean";
    }

    public class SystemLog {
        public static final String VIEW = "system:systemLog:view";
        public static final String LIST = "system:systemLog:list";
        public static final String DETAIL = "system:systemLog:detail";
        public static final String DELETE = "system:systemLog:delete";
        public static final String CLAEN = "system:systemLog:clean";
    }

    public class SystemConfig {
        public static final String UPDATE_PAGE = "system:systemConfig:updatePage";
        public static final String UPDATE = "system:systemConfig:update";
    }

    public class DictType {
        public static final String VIEW = "system:dictType:view";
        public static final String LIST = "system:dictType:list";
        public static final String SAVE = "system:dictType:save";
        public static final String UPDATE = "system:dictType:update";
        public static final String DELETE = "system:dictType:delete";
    }

    public class DictData {
        public static final String VIEW = "system:dictData:view";
        public static final String LIST = "system:dictData:list";
        public static final String SAVE = "system:dictData:save";
        public static final String UPDATE = "system:dictData:update";
        public static final String DELETE = "system:dictData:delete";
    }
}
