package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.UserInfo;
import cn.tellsea.module.system.vo.UserInfoVo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author Tellsea
 * @since 2021-03-29
 */
public interface UserInfoService extends IService<UserInfo> {

    ResponseResult listByTable(UserInfoVo entity);

    ResponseResult saveEntity(UserInfoVo entity);

    ResponseResult resetPwd(UserInfoVo entity);

    ResponseResult updateEntity(UserInfoVo entity);

    UserInfoVo getByName(String userName);

    ResponseResult updateInfoOrPwdById(UserInfoVo entity);

    /**
     * 校验是否锁定
     * @param userName
     * @return
     */
    Boolean checkLock(String userName);

    /**
     * 更新登录错误次数
     * @param userName
     */
    void updateLoginErrorTimes(String userName);

    /**
     * 获取登录错误次数
     * @param userName
     * @return
     */
    int getLoginErrorTimes(String userName);

    /**
     * 锁定用户
     * @param userName
     */
    void lock(String userName);
}
