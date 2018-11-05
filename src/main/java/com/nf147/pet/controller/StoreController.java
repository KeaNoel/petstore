package com.nf147.pet.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class StoreController {
    @RequestMapping
    //按状态返回宠物库
    public String state(Model model){
        return "";
    }
    @RequestMapping
    //订购一只宠物
    public String buy (Model model){
        return "";
    }
    //通过id查找订单
    public  String idOrderSel(Model model){
        return "";
    }
    //通过id删除订单
    public  String idOerderDer(Model model){
        return "";
    }


}
