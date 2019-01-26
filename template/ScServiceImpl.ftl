package ${content.serviceImpl.classPackage};
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import cn.shencom.scloud.common.jpa.scpage.MyLink;
import cn.shencom.scloud.common.jpa.util.query.LinkUtil;
import cn.shencom.scloud.common.jpa.scpage.ScQuery;
import cn.shencom.scloud.common.jpa.scpage.ScSort;
import cn.shencom.scloud.common.util.BeanUtil;
<#--import cn.shencom.common.util.UserContext;-->
import cn.shencom.scloud.common.jpa.util.export.ScExport;
import cn.shencom.scloud.common.jpa.util.query.ScQueryUtil;
import cn.shencom.scloud.common.base.Result;
import cn.shencom.scloud.common.server.service.BaseImpl;
import lombok.extern.slf4j.Slf4j;
<#list content.entity.attrs as item>
	<#if item.field == "tenantId">
import cn.shencom.server.entity.out.sys.BackAccountVO;
	</#if>
</#list>

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Predicate;
import java.util.*;

import ${content.service.classPackage}.${content.service.className};
import ${content.dao.classPackage}.${content.dao.className};
import ${content.entity.classPackage}.${content.entity.className};
/**
 * ${content.entity.className}的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
@Slf4j
public class ${content.serviceImpl.className} extends BaseImpl implements ${content.service.className} {

	@Autowired
	private ${content.dao.className} ${content.dao.className?uncap_first};

	/**
	 * 新增或修改${content.entity.className}中属性值
	 *
	 * @param bean
	 * @return
	 */
	@Transactional
	@Override
	public Result ${content.service.item.update.value!}(${content.entity.className} bean){

		<#list content.entity.attrs as item>
			<#if item.field == "tenantId">
        BackAccountVO account = UserContext.getAccount();
        if (account != null) {
            bean.setTenantId(account.getId().toString());
        };
			</#if>
		</#list>

		${content.entity.className} entity = new ${content.entity.className}();
        if (bean.getId() == null) {
			<#list content.entity.attrs as item>
				<#if item.field == "createdAt">
			bean.setCreatedAt(new Date());
				</#if>
			</#list>
        } else {
			<#list content.entity.attrs as item>
				<#if item.field == "updatedAt">
            bean.setUpdatedAt(new Date());
				</#if>
			</#list>
            entity = ${content.dao.className?uncap_first}.findById(bean.getId()).get();
        }

        BeanUtil.copyProperties(bean, entity);
        ${content.dao.className?uncap_first}.save(entity);
        return success();
	}

<#if content.entity.primaryKeyAttr??>
	/**
	 * 通过${content.entity.className}的ids删除${content.entity.className}
	 *
	 * @return
	 */
	@Transactional
	@Override
	public Result ${content.service.item.delete.value!}(List<String> ids){
		<#assign x = 0>
			<#list content.entity.attrs as item>
				<#if item.field == "deletedAt">
					<#assign x = 1>
				</#if>
			</#list>
		<#if x == 1>
		if(ids != null){
			for (String id : ids) {
				${content.entity.className} entity = ${content.dao.className?uncap_first}.findById(id).get();
				entity.setDeletedAt(new Date());
				${content.dao.className?uncap_first}.save(entity);
			}
		}
		<#else>
		if(ids != null){
			for (String id : ids) {
				${content.dao.className?uncap_first}.deleteById(id);
			}
		}
		</#if>
        return success();
	}

	/**
	 * 通过${content.entity.className}的id获得${content.entity.className}对象
	 *
	 * @return
	 */
	@Override
	public Result ${content.service.item.show.value!}(${content.entity.className} bean){
		${content.entity.className} entity = ${content.dao.className?uncap_first}.findById(bean.getId()).get();
		//todo
		Map<String, MyLink> linkMap = LinkUtil.convertLink(bean.getClass());
		List<${content.entity.className}> entitys=new ArrayList<>();
		entitys.add(entity);
		PageImpl page=new PageImpl(entitys);
		dealWith(page,linkMap);
		return success(entity);
	}
</#if>

	/**
	 * 获得${content.entity.className}数据集
	 *
	 * @return
	 */
	@Override
	public Result ${content.service.item.index.value!}(${content.entity.className} bean){

		List<ScSort> sorts = bean.getSorts();
    	List<ScQuery> queries = bean.getQuery();

        Map<String, MyLink> linkMap = LinkUtil.convertLink(bean.getClass());
        Map<String, Join<Object, Object>> joinMap = new HashMap<>();

        Page<${content.entity.className}> res = ${content.dao.className?uncap_first}.findAll((root, query, builder) -> {

		//用于拼接条件
		List<Predicate> ps = new ArrayList<>();

		<#list content.entity.attrs as item>
			<#if item.field == "deletedAt">
		Predicate predicate = builder.isNull(root.get("deletedAt"));
		ps.add(predicate);
			</#if>
		</#list>

         //查询条件
		if (queries != null && queries.size() > 0) {
			Predicate constructPredicate = ScQueryUtil.constructQuery(queries, root, builder, linkMap, joinMap);
			if (constructPredicate != null) {
				ps.add(constructPredicate);
			}
		}

		//排序
		List<Order> orders = ScQueryUtil.constructSort(sorts, root, builder, linkMap, joinMap);
		if(orders != null && orders.size() > 0){
			query.orderBy(orders);
        }

		if (ps.size() > 0) {
			query
				.distinct(true)
				.where(builder.and(ps.toArray(new Predicate[]{})));
		}

		return query.getRestriction();

		}, new PageRequest(bean.getPage(), bean.getSize()));

		dealWith(res,linkMap);

		return success(res);
	}

	//处理数据
	private void dealWith(Page<${content.entity.className}> res,Map<String, MyLink> linkMap) {
         ScQueryUtil.dealWith(res,linkMap);
    }

	/**
	 * 导出${content.entity.className}的数据
	 *
	 * @return
	 */
	@Override
	public Result ${content.service.item.export.value!}(${content.entity.className} bean){

		List<ScSort> sorts = bean.getSorts();
		List<ScQuery> queries = bean.getQuery();

		Map<String, MyLink> linkMap = LinkUtil.convertLink(bean.getClass());
		Map<String, Join<Object, Object>> joinMap = new HashMap<>();

		Page<${content.entity.className}> res = ${content.dao.className?uncap_first}.findAll((root, query, builder) -> {

		//用于拼接条件
		List<Predicate> ps = new ArrayList<>();

		<#list content.entity.attrs as item>
			<#if item.field == "deletedAt">
		Predicate predicate = builder.isNull(root.get("deletedAt"));
		ps.add(predicate);
			</#if>
		</#list>

		//查询条件
		if (queries != null && queries.size() > 0) {
			Predicate constructPredicate = ScQueryUtil.constructQuery(queries, root, builder, linkMap, joinMap);
			if (constructPredicate != null) {
				ps.add(constructPredicate);
			}
		}

		//排序
		List<Order> orders = ScQueryUtil.constructSort(sorts, root, builder, linkMap, joinMap);
			if(orders != null && orders.size() > 0){
				query.orderBy(orders);
		}

		if (ps.size() > 0) {
			query
				.distinct(true)
				.where(builder.and(ps.toArray(new Predicate[]{})));
		}

		return query.getRestriction();

		}, new PageRequest(bean.getPage(), bean.getSize()));

        dealWith(res,linkMap);

        ArrayList<${content.entity.className}> content = new ArrayList<>(res.getContent());
        ScExport.export(bean.getCfg(),content,${content.entity.className}.class);

	    return success(res);
	}
}