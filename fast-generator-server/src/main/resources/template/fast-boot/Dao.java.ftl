package ${package}<#if moduleName??>.${moduleName}</#if>.dao<#if subModuleName??>.${subModuleName}</#if>;

import tk.mybatis.mapper.common.Mapper;

/**
* ${tableComment}
*
* @author ${author}
* @since ${version} ${date}
*/
public interface ${ClassName}Dao extends Mapper<${ClassName}DO> {
	
}