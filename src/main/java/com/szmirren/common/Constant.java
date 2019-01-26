package com.szmirren.common;

import com.szmirren.Main;

/**
 * 工具需要用到的常量词
 * 
 * @author <a href="http://szmirren.com">Mirren</a>
 *
 */
public interface Constant {
	// 数据库名字
	/** MySQL */
	String MYSQL = "MySQL";
	/** PostgreSQL */
	String POSTGRE_SQL = "PostgreSQL";
	/** SqlServer */
	String SQL_SERVER = "SqlServer";
	/** Oracle */
	String ORACLE = "Oracle";

	/** java的后缀名.java */
	String JAVA_SUFFIX = ".java";

	/** default */
	String DEFAULT = "default";
	/** language */
	String LANGUAGE = "language";
	/** 模板的文件夹名称 */
	String TEMPLATE_DIR_NAME = "template/";
	/** 刷新模板文件夹 */
	String TEMPLATE_DIR_REFRESH = "刷新模板文件夹";
	/** 实体类模板的默认名字 */
//	String TEMPLATE_NAME_ENTITY = "Entity.ftl";
	String TEMPLATE_NAME_ENTITY = "ScEntity.ftl";
	/** Bean实体类模板的默认名字 */
//	String TEMPLATE_NAME_ENTITY = "Entity.ftl";
	String TEMPLATE_NAME_BEAN = "ScBean.ftl";
	/** Service模板的默认名字 */
//	String TEMPLATE_NAME_SERVICE = "Service.ftl";
	String TEMPLATE_NAME_SERVICE = "ScService.ftl";
	/** ServiceImpl模板的默认名字 */
//	String TEMPLATE_NAME_SERVICE_IMPL = "ServiceImpl.ftl";
	String TEMPLATE_NAME_SERVICE_IMPL = "ScServiceImpl.ftl";
	/** Controller模板的默认名字 */
//	String TEMPLATE_NAME_ROUTER = "Controller.ftl";
	String TEMPLATE_NAME_ROUTER = "ScController.ftl";
	/** Dao模板的默认名字 */
//	String TEMPLATE_NAME_DAO = "Dao.ftl";
	String TEMPLATE_NAME_DAO = "ScRepository.ftl";
	/** Mapper模板的默认名字 */
	String TEMPLATE_NAME_MAPPER = Main.LANGUAGE.get(LanguageKey.SET_ABSTRACT_AUTOMATIC).get();
	/** Mapper模板的默认名字 */
	String TEMPLATE_NAME_MAPPER_SUFFIX = "Mapper.ftl";
	/** SqlAssist模板的默认名字 */
	String TEMPLATE_NAME_SQL_ASSIST = "SqlAssist.ftl";
	/** 单元测试模板的默认名字 */
	String TEMPLATE_NAME_UNIT_TEST = "UnitTest.ftl";
}
