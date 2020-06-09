package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/base")
public class BaseController {

    @Resource
    ServletContext application;

    @RequestMapping("/goURL/{folder}/{file}")
    //定义一个通用的页面跳转的方法
    public String goURL(@PathVariable("folder")String folder, @PathVariable("file")String file){
        System.out.println("url："+folder+"/"+file);
        return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
    }

    public  <T> Map<String,Object> getPageMap(PageInfo<T> pageInfo){
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户数据列表
        return pageMap;
    }
}
