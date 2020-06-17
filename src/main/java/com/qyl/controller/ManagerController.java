package com.qyl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qyl.bean.Manager;
import com.qyl.bean.Reader;
import com.qyl.service.ManagerService;
import com.qyl.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * projectName:  SSM
 * packageName: com.qyl.controller
 * date: 2020-06-12 12:05
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Controller
public class ManagerController {
    @Autowired
    ManagerService managerService;
    @Autowired
    ReaderService readerService;

    @RequestMapping("/toPageUpdateManager")
    public String toPageUpdateManager() {
        return "updateManager";
    }

    @RequestMapping("/getManagerByUsername")
    public String getManagerByUsername(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                       @RequestParam(value = "username", defaultValue = "1") String username, Model model) {
        Manager manager = managerService.getManagerByUsername(username);
        System.out.println(manager);
        model.addAttribute("manager", manager);
        model.addAttribute("pageNum", pageNum);
        return "updateManager";
    }

    @RequestMapping("/insertManager")
    public String insertManager(Manager manager) {
        managerService.insertManager(manager);
        return "redirect:fuzzyQueryAllManagers";
    }

    @RequestMapping("/updateManager")
    public String updateManager(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Manager manager) {
        managerService.updateManager(manager);
        return "redirect:fuzzyQueryAllManagers?pageNum=" + pageNum;
    }

    @RequestMapping("/fuzzyQueryAllManagers")
    public String fuzzyQueryAllManagers(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String name, String tel, Model model) {
        PageHelper.startPage(pageNum, 5);
        List<Manager> managers = managerService.fuzzyQueryAllManagers(name, tel);
        PageInfo<Manager> info = new PageInfo<Manager>(managers, 5);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("nums", nums);
        model.addAttribute("info", info);
        return "managerList";
    }

    @RequestMapping("/deleteManagerByUsername")
    public String deleteManagerByUsername(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "username", defaultValue = "1") String username) {
        managerService.deleteManagerByUsername(username);
        return "redirect:fuzzyQueryAllManagers?pageNum=" + pageNum;
    }



    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("username");
        session.removeAttribute("authority");
        return "redirect:/jsp/index.jsp";
    }
    @ResponseBody
    @RequestMapping("/CreateCode")
    public String CreateCode(){
        String verifyCode = UUID.randomUUID().toString().substring(0,4);
        return verifyCode;
    }
}

