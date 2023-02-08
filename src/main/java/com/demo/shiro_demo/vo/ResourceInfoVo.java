package com.demo.shiro_demo.vo;

import com.demo.shiro_demo.entity.ResourceInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 资源表 Vo类
*
* @author Jerry
* @date 2022-12-23
*/
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class ResourceInfoVo extends ResourceInfo {

    private String pidName;
}
