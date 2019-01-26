package ${content.controller.classPackage};

import cn.shencom.scloud.common.base.Result;
import cn.shencom.scloud.common.server.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import ${content.service.classPackage}.${content.service.className};
import ${content.entity.classPackage}.${content.entity.className};

/**
 * ${content.entity.className}的路由接口服务
 *
 * @author
 *
 */
@RestController
@RequestMapping("${content.controller.item.r_mapping.value?lower_case}")
public class ${content.controller.className} extends BaseController {

    /** ${content.entity.className}Service服务 */
	@Autowired
	private ${content.service.className} ${content.service.className?uncap_first};


    /**
     * ${content.controller.item.f_index.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_index.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public Result ${content.controller.item.f_index.value}(@RequestBody ${content.entity.className} bean){
        return ${content.service.className?uncap_first}.${content.service.item.index.value!}(bean);
    }


    /**
     * ${content.controller.item.f_update.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_update.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public Result ${content.controller.item.f_update.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.update.value!}(bean);
    }

    /**
     * ${content.controller.item.f_delete.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_delete.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public Result ${content.controller.item.f_delete.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.delete.value!}(bean.getIds());
    }

    /**
     * ${content.controller.item.f_create.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_create.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public Result ${content.controller.item.f_create.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.update.value!}(bean);
    }


    /**
     * ${content.controller.item.f_show.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_show.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public Result ${content.controller.item.f_show.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.show.value!}(bean);
    }

    /**
     * ${content.controller.item.f_export.describe!}
     * @param bean
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_export.value}"},
        produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Result ${content.controller.item.f_export.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.export.value!}(bean);
     }

}
