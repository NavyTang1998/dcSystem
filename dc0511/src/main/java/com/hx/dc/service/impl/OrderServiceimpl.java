package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Goods;
import com.hx.dc.entity.Order;
import com.hx.dc.mapper.OrderMapper;
import com.hx.dc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SuperMr.gong on 2020/5/25.
 */
@Service("orderService")
public class OrderServiceimpl extends  BaseServiceimpl<Order> implements OrderService {
    @Override
    public int insert(Order order) {
       int order1 = orderMapper.insert(order);
        return order1;
    }


   /* @Override
    public Order select(String orderId) {
        return orderMapper.selectByPrimaryKey(orderId);

    }*/


}
