package com.nf147.pet.controller;

import com.nf147.pet.dao.PetMapper;
import com.nf147.pet.entity.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetMapper petMapper;

    @RequestMapping(method = RequestMethod.GET)
    //查找所有宠物
    public String selectAll(Model model) {
        List<Pet> petList = petMapper.selectAll();
        model.addAttribute("petList",petList);
        return "pet.jsp";
    }
    //添加宠物
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestBody List<Pet> list) {
        int a = petMapper.add(list);
        if (a > 0)
            return "{\"msg\":\"ok\"}";
        return "{\"msg\":\"no\"}";
    }
    //根据编号删除宠物
    @RequestMapping("/del/{pid}")
       public String del(@PathVariable("pid") String  pid){
                petMapper.deleteByPrimaryKey(pid);
        return "redirect:/pet";
       }
    }
