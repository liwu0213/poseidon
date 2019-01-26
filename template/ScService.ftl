package ${content.service.classPackage};

import cn.shencom.scloud.common.base.Result;
import ${content.entity.classPackage}.${content.entity.className};
import java.util.List;

/**
 * ${content.entity.className}的服务接口
 * 
 * @author 
 *
 */
public interface ${content.service.className} {

	/**
	 * 新增或修改${content.entity.className}中属性值
	 *
	 * @param bean
	 * @return
	 */
	Result ${content.service.item.update.value!}(${content.entity.className} bean);

	<#if content.entity.primaryKeyAttr??>

	/**
	 * 通过${content.entity.className}的id删除${content.entity.className}
	 *
	 * @return
	 */
	Result ${content.service.item.delete.value!}(List<String> ids);

	/**
	 * 通过${content.entity.className}的id获得${content.entity.className}对象
	 *
	 * @return
	 */
	Result ${content.service.item.show.value!}(${content.entity.className} bean);
	</#if>

	/**
	 * 获得${content.entity.className}数据集
	 *
	 * @return
	 */
	Result ${content.service.item.index.value!}(${content.entity.className} bean);

	/**
	 * 导出${content.entity.className}的数据
	 *
	 * @return
	 */
	Result ${content.service.item.export.value!}(${content.entity.className} bean);

}
