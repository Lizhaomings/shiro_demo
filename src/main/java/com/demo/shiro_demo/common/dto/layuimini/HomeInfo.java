package com.demo.shiro_demo.common.dto.layuimini;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Author Jerry
 * @Description 主页类
 * @Create 23/12/2022 3:09 PM
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class HomeInfo {

    /**
     * 标题
     */
    private String title;

    private String href;
}
