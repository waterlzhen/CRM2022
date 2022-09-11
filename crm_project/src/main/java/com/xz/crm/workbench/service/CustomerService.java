package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-上午 07:07
 * @since 2022/8/22 0022-上午 07:07
 */
public interface CustomerService {

    List<String> queryCustomerNameByCondition(String customerName);

   Customer queryCustomerByName(String name);
}
