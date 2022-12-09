package ${package}<#if moduleName??>.${moduleName}</#if>.service<#if subModuleName??>.${subModuleName}</#if>.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.pinma.msx.enums.CommonStatusEnum;
import com.pinma.msx.enums.YesNoEnum;
import com.pinma.msx.horizon.bean.domain.BannerConfigDO;
import com.pinma.msx.horizon.common.enums.ErrorCode;
import com.pinma.msx.horizon.common.exception.CommonBizException;
import com.pinma.msx.horizon.dao.BannerConfigDao;
import com.pinma.msx.model.common.PageResult;
import com.pinma.msx.util.tool.BaseConverter;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Component
public class ${ClassName}Manager{

    @Resource
    private  ${ClassName}Dao ${className}Dao;

    public ${ClassName}DTO queryByID(Long id) {
         Preconditions.checkArgument(StringUtils.isNotEmpty(Long.toString(id)), "id不能为空");
         ${ClassName}DO partnerDO = new ${ClassName}DO();
         partnerDO.setId(id);
         partnerDO.setIsDeleted(YesNoEnum.NO.getValue());
         ${ClassName}DO ${className}DO = ${className}Dao.selectOne(partnerDO);
         return BaseConverter.convertObject(${className}DO, ${ClassName}DTO.class);
     }

    public PageResult<${ClassName}DTO> pageQuery(${ClassName}Query pageQuery) {
       Example example = to${ClassName}Example(pageQuery);
       PageResult<${ClassName}DTO> pageResult = new PageResult(pageQuery);
       int count = ${className}Dao.selectCountByExample(example);
        if (count <= 0) {
            pageResult.setDatas(Lists.newArrayList());
            return pageResult;
        }
         PageHelper.startPage(pageQuery.getPageNo(), pageQuery.getPageSize());
         List<${ClassName}DO> datas = ${className}Dao.selectByExample(example);
         pageResult.setDatas(BaseConverter.convertList(datas, ${ClassName}DTO.class));
         pageResult.setCount(count);
         return pageResult;
    }

     public Long create(${ClassName}DTO ${className}DTO) {
            Preconditions.checkArgument(${className}DTO.getId() == null, "不能指定id");

            ${ClassName}DO saveDO = BaseConverter.convertObject(${className}DTO, ${ClassName}DO.class);
            saveDO.defaultInitBaseField();
             ${className}Dao.insert(saveDO);
            return  saveDO.getId();
        }



        public Long update(${ClassName}DTO ${className}DTO) {
            ${ClassName}DO updateDO = BaseConverter.convertObject(${className}DTO, ${ClassName}DO.class);
            ${className}Dao.insert(updateDO);
            return  updateDO.getId();
        }


        public void disable(Long id) {
            ${ClassName}DTO userDTO = queryByID(id);
            if (userDTO == null) {
                 throw new CommonBizException(ErrorCode.PARAM_ILLEGAL, "信息不存在,id:" + id);
              }
              if (!CommonStatusEnum.NORMAL.getCode().equals(userDTO.getStatus())) {
                 throw new CommonBizException(ErrorCode.PARAM_ILLEGAL, "当前已是不可用状态");
                }
                 this.updateChannelStatus(id, CommonStatusEnum.DISABLE);
              }

        public void enable(Long id) {
               ${ClassName}DTO userDTO = queryByID(id);
                if (userDTO == null) {
                    throw new CommonBizException(ErrorCode.PARAM_ILLEGAL,  "信息不存在,id:" + id);
                }
                if (!CommonStatusEnum.DISABLE.getCode().equals(userDTO.getStatus())) {
                    throw new CommonBizException(ErrorCode.PARAM_ILLEGAL, "当前已是可用状态");
                }
                this.updateChannelStatus(id, CommonStatusEnum.NORMAL);

            }

        private void updateChannelStatus(Long id, CommonStatusEnum statusEnum) {
                ${ClassName}DO updateDO = new ${ClassName}DO();
                updateDO.setId(id);
                updateDO.setBannerStatus(statusEnum.getCode());
                updateDO.setGmtModified(new Date());
                ${className}Dao.updateByPrimaryKeySelective(updateDO);
            }

     private Example to${ClassName}Example(${ClassName}Query pageQuery) {
           Example example = new Example(${ClassName}DO.class);
           Example.Criteria criteria = example.createCriteria();
           criteria.andEqualTo("isDeleted", YesNoEnum.NO.getValue());
        <#list columnList as column>
        <#if column.query>
            if (pageQuery.get${column.attrName?cap_first}() != null && !("".equals(pageQuery.get${column.attrName?cap_first}()))) {
                  criteria.andEqualTo("${column.attrName}", pageQuery.get${column.attrName?cap_first}());
                }
        </#if>
        </#list>
           example.orderBy("id").desc();
           return example;
       }

}
