package com.demo.shiro_demo.common.dto;

import com.baomidou.mybatisplus.annotation.TableField;

/**
 * @Author Jerry
 * @Description
 * @Create 23/12/2022 3:05 PM
 */
public class BaseEntity {

    @TableField(exist = false)
    private int page;

    @TableField(exist = false)
    private int offset;

    @TableField(exist = false)
    private int limit;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getOffset() {
        return (page - 1) * limit;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
