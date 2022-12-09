package ${package}<#if moduleName??>.${moduleName}</#if>.vo<#if subModuleName??>.${subModuleName}</#if>;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Table;
import java.util.Date;


/**
* ${tableComment}
*
* @author ${author}
* @since ${version} ${date}
*/
@Data
public class ${ClassName}DO extends BaseDO{

<#list columnList as column>

    <#if (column_index >= 6)>
        <#if column.columnComment!?length gt 0>
            @ApiModelProperty(value = "${column.columnComment}")
        </#if>
        private ${column.attrType} ${column.attrName};
    </#if>

</#list>

}