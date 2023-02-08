package com.demo.shiro_demo.common.dto.layuimini;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Author Jerry
 * @Description 复选框设计类
 * @Create 23/12/2022 3:09 PM
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class CheckArr {

    /**
     * 复选框标记
     */
    private Integer type = 0;

    /**
     * 复选框是否选中
     */
    private Integer checked = 0;
}
