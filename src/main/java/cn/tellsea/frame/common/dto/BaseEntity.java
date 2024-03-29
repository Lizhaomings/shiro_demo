package cn.tellsea.frame.common.dto;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

/**
 * @author Tellsea
 * @date 2021/03/29
 */
public class BaseEntity implements Serializable {

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
