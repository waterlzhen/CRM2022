package com.xz.crm.workbench.domain;

/**
 * @Description 用与返回个前端的 数据
 * @auther zhen
 * @create 2022-08-22-下午 05:18
 * @since 2022/8/22 0022-下午 05:18
 *
 */
public class FunnelVO {

    private String name;
    private String value;

    public FunnelVO() {
    }

    public FunnelVO(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
