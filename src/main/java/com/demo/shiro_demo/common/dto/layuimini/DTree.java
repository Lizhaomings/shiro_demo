package com.demo.shiro_demo.common.dto.layuimini;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @Author Jerry
 * @Description 树 类
 * @Create 23/12/2022 3:09 PM
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class DTree {

    /**
     * 节点ID
     */
    private Integer id;

    /**
     * 上级节点ID
     */
    private Integer parentId;

    /**
     * 节点名称
     */
    private String title;


    /**
     * 是否展开节点
     */
    private Boolean spread;

    /**
     * 是否最后一级节点
     */
    private Boolean last;

    /**
     * 是否隐藏
     */
    private Boolean hide;

    /**
     * 是否禁用
     */
    private Boolean disabled;

    /**
     * 自定义图标class
     */
    private String iconClass;

    /**
     * 表示用户自定义需要存储在树节点中的数据
     */
    private Object basicData;

    /**
     * 复选框集合
     */
    private List<CheckArr> checkArr;

    /**
     * 子节点集合
     */
    private List<DTree> children;
}
