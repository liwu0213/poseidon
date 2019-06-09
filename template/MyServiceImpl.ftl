package ${content.serviceImpl.classPackage};
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import com.muggle.base.BaseService;
import com.muggle.base.PoseidonException;
import com.muggle.base.ResultBean;
import lombok.extern.slf4j.Slf4j;
<#list content.entity.attrs as item>
	<#if item.field == "tenantId">
import com.muggle.server.entity.out.sys.BackAccountVO;
	</#if>
</#list>

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.muggle.base.PoseidonProperties;
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
public class ${content.serviceImpl.className} extends BaseService implements ${content.service.className} {

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
	public ResultBean ${content.service.item.update.value!}(${content.entity.className} bean){

		<#list content.entity.attrs as item>
			<#if item.field == "tenantId">
        BackAccountVO account = UserContext.getAccount();
        if (account != null) {
            bean.setTenantId(account.getId().toString());
        };
			</#if>
		</#list>

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

        }

        ${content.dao.className?uncap_first}.save(bean);
        return ResultBean.getInstance();
	}

<#if content.entity.primaryKeyAttr??>
	/**
	 * 通过${content.entity.className}的ids删除${content.entity.className}
	 *
	 * @return
	 */
	@Transactional
	@Override
	public ResultBean ${content.service.item.delete.value!}(String id){
		if(id==null){
			throw new PoseidonException(PoseidonProperties.NULL_DATA_ERROR,"数据有误，请再次确认后提交");
		}
		<#assign x = 0>
			<#list content.entity.attrs as item>
				<#if item.field == "deletedAt">
					<#assign x = 1>
				</#if>
			</#list>
		<#if x == 1>
		if(id != null){

			${content.entity.className} entity = ${content.dao.className?uncap_first}.findById(id).get();
			if(entity==null){
				throw new PoseidonException(PoseidonProperties.NORMAL_EXCEPTION_CODE,"要删除的数据不存在");
			}
			entity.setDeletedAt(new Date());
			${content.dao.className?uncap_first}.save(entity);

		}
		<#else>
		if(id != null){
			${content.dao.className?uncap_first}.deleteById(id);
		}
		</#if>
        return ResultBean.getInstance();
	}

	/**
	 * 通过${content.entity.className}的id获得${content.entity.className}对象
	 *
	 * @return
	 */
	@Override
	public ResultBean ${content.service.item.show.value!}(String id){


		${content.entity.className} entity = ${content.dao.className?uncap_first}.findById(id).get();

		return ResultBean.getInstance(entity);
	}
</#if>

	/**
	 * 获得${content.entity.className}数据集
	 *
	 * @return
	 */
	@Override
	public ResultBean ${content.service.item.index.value!}(${content.entity.className} bean){
		List<${content.entity.className}> all=${content.dao.className?uncap_first}.findAll((root, criteriaQuery, criteriaBuilder) -> {
		Predicate predicate = criteriaBuilder.isNull(root.get("deleteTime"));
		<#list content.entity.attrs as item>
			if(bean.${item.fget}()!=null){
				predicate = criteriaBuilder.and(predicate, criteriaBuilder.equal(root.get("${item.field}"), bean.${item.fget}()));
			}

		</#list>
 			return criteriaQuery.where(predicate).getRestriction();
		});


		return ResultBean.getInstance(all);
	}

/** @Override
	public ResultBean ${content.service.item.index.value!}(){

	}
*/

}