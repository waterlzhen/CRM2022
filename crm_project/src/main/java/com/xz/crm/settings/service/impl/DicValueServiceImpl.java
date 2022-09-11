package com.xz.crm.settings.service.impl;

import com.xz.crm.settings.domain.DicValue;
import com.xz.crm.settings.mapper.DicValueMapper;
import com.xz.crm.settings.service.DicValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-19-下午 02:45
 * @since 2022/8/19 0019-下午 02:45
 */
@Service
public class DicValueServiceImpl implements DicValueService {

    @Autowired
    private DicValueMapper dicValueMapper;

    @Override
    public List<DicValue> queryDicValueByTypeCode(String typeCode) {
        return dicValueMapper.selectDicValueByTypeCode(typeCode);
    }
}
