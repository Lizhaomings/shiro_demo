package com.demo.shiro_demo.common.dto.layuimini;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Author Jerry
 * @Description 登录信息
 * @Create 23/12/2022 3:10 PM
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class LoginInfo {

    private String title;

    private String image;

    private String href;
}
