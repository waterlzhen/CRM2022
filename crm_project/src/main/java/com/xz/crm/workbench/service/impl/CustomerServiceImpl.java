package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.Customer;
import com.xz.crm.workbench.mapper.CustomerMapper;
import com.xz.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-上午 07:07
 * @since 2022/8/22 0022-上午 07:07
 */
@Service
public class CustomerServiceImpl  implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public List<String> queryCustomerNameByCondition(String customerName) {
        return customerMapper.selectCustomerNameByCondition(customerName);
    }

    @Override
    public Customer queryCustomerByName(String name) {
        return customerMapper.selectCustomerByName(name);
    }
}
