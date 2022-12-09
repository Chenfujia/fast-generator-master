
package net.maku.generator.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.impl.BaseServiceImpl;
import net.maku.generator.dao.BaseClassDao;
import net.maku.generator.entity.BaseClassEntity;
import net.maku.generator.service.BaseClassService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 基类管理
 *
 * @author 阿沐 babamu@126.com
 */
@Service
public class BaseClassServiceImpl extends BaseServiceImpl<BaseClassDao, BaseClassEntity> implements BaseClassService {

    @Override
    public PageResult<BaseClassEntity> page(Query query) {
        IPage<BaseClassEntity> page = baseMapper.selectPage(
            getPage(query), getWrapper(query)
        );

        return new PageResult<>(page.getRecords(), page.getTotal());
    }

    @Override
    public List<BaseClassEntity> getList() {
        return baseMapper.selectList(null);
    }
}