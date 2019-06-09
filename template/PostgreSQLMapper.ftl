<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${content.dao.classPackage}.${content.dao.className}">
	<!-- ${content.entity.className}的resultMap,column是给数据库列起的别名,它对应property类的属性 -->
	<resultMap id="${content.mapper.item.resultMap.value}" type="${content.entity.classPackage}.${content.entity.className}">
		<#if content.entity.primaryKeyAttr??><id column="${content.entity.primaryKeyAttr.columnName}" property="${content.entity.primaryKeyAttr.field}" /></#if>
		<#if content.entity.cantNullAttrs??><#list content.entity.cantNullAttrs as item>
		<result column="${item.columnName}" property="${item.field}" />
		</#list></#if>
		<#if content.entity.otherAttrs??><#list content.entity.otherAttrs as item>
		<result column="${item.columnName}" property="${item.field}" />
		</#list></#if>
	</resultMap>

</mapper>