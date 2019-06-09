package ${content.service.classPackage};

import ${content.entity.classPackage}.${content.entity.className};
import java.util.List;
import com.muggle.base.ResultBean;
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
	ResultBean ${content.service.item.update.value!}(${content.entity.className} bean);

	<#if content.entity.primaryKeyAttr??>

	/**
	 * 通过${content.entity.className}的id删除${content.entity.className}
	 *
	 * @return
	 */
	ResultBean ${content.service.item.delete.value!}(String id);

	/**
	 * 通过${content.entity.className}的id获得${content.entity.className}对象
	 *
	 * @return
	 */
	ResultBean ${content.service.item.show.value!}(String id);
	</#if>

	/**
	 * 获得${content.entity.className}数据集
	 *
	 * @return
	 */
	ResultBean ${content.service.item.index.value!}(${content.entity.className} bean);

}
