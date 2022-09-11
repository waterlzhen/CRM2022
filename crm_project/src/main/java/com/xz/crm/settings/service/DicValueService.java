package com.xz.crm.settings.service;

import com.xz.crm.settings.domain.DicValue;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-19-下午 02:45
 * @since 2022/8/19 0019-下午 02:45
 */
public interface DicValueService {

    List<DicValue> queryDicValueByTypeCode(String typeCode);
}
