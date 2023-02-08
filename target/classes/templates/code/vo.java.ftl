package ${cfg.basePackage}.vo;

import ${package.Entity}.${entity};
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* ${table.comment!} Vo类
*
* @author ${author}
* @date ${date}
*/
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class ${entity}Vo extends ${entity} {

}
