package ${content.entity.classPackage};

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import cn.shencom.scloud.common.base.snowflake.SnowflakeGenerator;
import cn.shencom.scloud.common.jpa.util.query.ScBaseBean;
import cn.shencom.scloud.common.util.Date2LongSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

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
@Getter
@Setter
@NoArgsConstructor
@DynamicUpdate
@ExcelTarget("${content.entity.tableName}")
public class ${content.entity.className} extends ScBaseBean implements Serializable {
//===========================数据库字段================================
<#list content.entity.attrs as item>
        /**${item.remarks!}*/
	<#if item.field == "id">
        @Id
        @Column(name = "id")
        @GenericGenerator(name = "snowflake", strategy = SnowflakeGenerator.TYPE)
        @GeneratedValue(generator = "snowflake")
        @Excel(name = "${item.remarks!}",needMerge = false,width = 25)
        private String ${item.field};
    <#elseif item.javaType = "java.util.Date">
        @Column(name = "${item.orgField}")
        @Excel(name = "${item.remarks!}",needMerge = false,width = 25)
        @Temporal(TemporalType.TIMESTAMP)
        @JsonSerialize(using = Date2LongSerializer.class)
        private ${item.javaType} ${item.field};
	<#else>
        @Column(name = "${item.orgField}")
        @Excel(name = "${item.remarks!}",needMerge = false,width = 25)
        private ${item.javaType} ${item.field};
	</#if>
</#list>
//===========================表关联====================================




//===========================自定义字段=================================

}
