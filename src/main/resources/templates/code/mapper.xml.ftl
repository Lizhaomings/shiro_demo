<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

    <sql id="allField">
        <#list table.fields as field>
        A.${field.name},
        </#list>
    </sql>

    <sql id="search">
        where A.status = 1
    </sql>
</mapper>
