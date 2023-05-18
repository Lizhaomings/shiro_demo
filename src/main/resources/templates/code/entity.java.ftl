package ${package.Entity};

import cn.tellsea.frame.dto.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * ${table.comment!} 实体类
 *
 * @author ${author}
 * @date ${date}
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("${table.name}")
@ApiModel(value = "${entity}对象", description = "")
public class ${entity} extends ${superEntityClass} {
<#list table.fields as field>

    @ApiModelProperty(value = "${field.comment}")
    <#if field.name == "id">
    @TableId(value = "id", type = IdType.AUTO)
    <#elseif (field.name == "create_user") || (field.name == "create_time") || (field.name == "status")>
    @TableField(value = "${field.name}", fill = FieldFill.INSERT)
    <#else>
    @TableField("${field.name}")
    </#if>
    private ${field.propertyType} ${field.propertyName};
</#list>
}
