package ${package}<#if moduleName??>.${moduleName}</#if>.entity<#if subModuleName??>.${subModuleName}</#if>;

import com.pinma.msx.model.common.BaseDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * ${tableComment}
 *
 * @author ${author}
 * @since ${version} ${date}
 */
@Data
public class ${ClassName}DTO extends BaseDTO{
<#list columnList as column>
	<#if baseClassEntity?? && baseClassEntity.fields?split(",")?seq_contains(column.columnName)>
    <#else>
	<#if column.columnComment!?length gt 0>
    	@ApiModelProperty(value = "${column.columnComment}")
    </#if>
	private ${column.attrType} ${column.attrName};

	</#if>
</#list>
}