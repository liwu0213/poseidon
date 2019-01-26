package cn.shencom.model.fn.asm;

import cn.shencom.ScBaseBean;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * ${content.bean.tableName}实体类
 *
 * @author
 *
 */
public class ${content.bean.className} extends ScBaseBean{
    <#list content.bean.attrs as item>
        /**${item.remarks!}*/
        <#if item.field == "id">
        private String ${item.field};
        <#else>
        private ${item.javaType} ${item.field};
        </#if>
    </#list>
}
