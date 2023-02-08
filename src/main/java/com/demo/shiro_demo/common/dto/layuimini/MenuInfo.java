package com.demo.shiro_demo.common.dto.layuimini;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @Author Jerry
 * @Description 菜单类
 * @Create 23/12/2022 3:10 PM
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class MenuInfo {

    private String title;

    private String icon;

    private String href;

    private String target;

    private List<MenuInfo> child;
}
