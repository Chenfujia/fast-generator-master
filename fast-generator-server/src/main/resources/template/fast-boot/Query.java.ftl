package ${package}<#if moduleName??>.${moduleName}</#if>.query<#if subModuleName??>.${subModuleName}</#if>;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.pinma.msx.model.common.PageQuery;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
* ${tableComment}查询
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Data
public class ${ClassName}Query extends PageQuery {
<#list columnList as column>
<#if column.query>
    <#if column.columnComment!?length gt 0>
    @Schema(description = "${column.columnComment}")
    </#if>
    private ${column.attrType} ${column.attrName};

</#if>
</#list>
}