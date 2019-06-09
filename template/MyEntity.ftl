package ${content.entity.classPackage};

import com.muggle.base.BaseBean;

import com.muggle.base.PoseidonIdGener;
import lombok.Data;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ${content.entity.tableName}实体类
 *
 * @author
 *
 */
@Entity
@Table(name = "${content.entity.tableName}")
@Data
@DynamicUpdate
public class ${content.entity.className} extends BaseBean implements Serializable {
//===========================数据库字段================================
<#list content.entity.attrs as item>
        /**${item.remarks!}*/
	<#if item.field == "id">
        @Id
        @Column(name = "id")
        @GeneratedValue(generator  = "myIdStrategy")
        @GenericGenerator(name = "myIdStrategy", strategy = PoseidonIdGener.TYPE)
        private String ${item.field};
    <#elseif item.javaType = "java.util.Date">
        @Column(name = "${item.orgField}")
        @Temporal(TemporalType.TIMESTAMP)
        @JsonSerialize(using = Date2LongSerializer.class)
        private ${item.javaType} ${item.field};
	<#else>
        @Column(name = "${item.orgField}")
        private ${item.javaType} ${item.field};
	</#if>
</#list>
//===========================表关联====================================




//===========================自定义字段=================================

}
