package ${package.ServiceImpl};

import ${package.Mapper}.${table.mapperName};
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;

/**
* ${table.comment!} Service接口实现类
*
* @author ${author}
* @date ${date}
*/
@Service
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

}
