package ${package.Controller};

import ${package.Service}.${table.serviceName};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* ${table.comment!} 控制器
*
* @author ${author}
* @date ${date}
*/
@Controller
@RequestMapping("/${cfg.entityName}")
public class ${table.controllerName} {

    @Autowired
    private ${table.serviceName} ${cfg.entityName}Service;
}