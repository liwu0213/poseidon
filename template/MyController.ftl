package ${content.controller.classPackage};

import com.muggle.base.BaseController;
import com.muggle.base.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
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
     * @return
     */
     @GetMapping(value = {"${content.controller.item.r_index.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResultBean ${content.controller.item.f_index.value}(${content.entity.className} bean){
        return ${content.service.className?uncap_first}.${content.service.item.index.value!}(bean);
    }


    /**
     * ${content.controller.item.f_update.describe!}
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_update.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResultBean ${content.controller.item.f_update.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.update.value!}(bean);
    }

    /**
     * ${content.controller.item.f_delete.describe!}
     * @return
     */
    @DeleteMapping(value = {"${content.controller.item.r_delete.value}/{id}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResultBean ${content.controller.item.f_delete.value}(@PathVariable String id) {
        return ${content.service.className?uncap_first}.${content.service.item.delete.value!}(id);
    }

    /**
     * ${content.controller.item.f_create.describe!}
     * @return
     */
    @PostMapping(value = {"${content.controller.item.r_create.value}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResultBean ${content.controller.item.f_create.value}(@RequestBody ${content.entity.className} bean) {
        return ${content.service.className?uncap_first}.${content.service.item.update.value!}(bean);
    }


    /**
     * ${content.controller.item.f_show.describe!}
     * @return
     */
    @GetMapping(value = {"${content.controller.item.r_show.value}/{id}"},
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResultBean ${content.controller.item.f_show.value}(@PathVariable String id) {
        return ${content.service.className?uncap_first}.${content.service.item.show.value!}(id);
    }


}
