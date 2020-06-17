package com.qyl.controller;

import com.qyl.bean.BookType;
import com.qyl.service.BookTypeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.controller
 * date: 2020-06-09 17:35
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Controller
public class BookTypeController {
    @Autowired
    BookTypeService bookTypeService;

    @RequestMapping("/fuzzyQueryAllBookTypes")
    public String fuzzyQueryAllBookTypes(@RequestParam(value = "typeName", defaultValue = " ") String typeName, Model model) {
        List<BookType>bookTypes = bookTypeService.fuzzyQueryAllBookTypes(typeName);
        model.addAttribute("bookTypes",bookTypes);
        return "updateBook";
    }

    @RequestMapping("/saveBookType")
    public String saveBookType(@Param("typeName") String typeName) {
        bookTypeService.saveBookType(typeName);
        return "redirect:fuzzyQueryAllBookTypes";
    }
}