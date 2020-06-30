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

/**
 * projectName:  SSM
 * packageName: com.qyl.controller
 * date: 2020-06-10 13:31
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Controller
public class ReaderController {
    @Autowired
    ReaderService readerService;
    @Autowired
    ManagerService managerService;

    @RequestMapping("/insertReader")
    public String insertReader(Reader reader) {
        readerService.insertReader(reader);
        return "redirect:fuzzyQueryAllReaders";
    }

    @RequestMapping("/getReaderByUsername")
    public String getReaderByUsername(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                      @RequestParam(value = "username", defaultValue = " ") String username, Model model) {
        Reader reader = readerService.getReaderByUsername(username);
        model.addAttribute("reader", reader);
        model.addAttribute("pageNum", pageNum);
        return "updateReader";
    }


    // List<Reader> fuzzyQueryAllReader(@Param("name") String name, @Param("tel") String tel, @Param("ifViolate") Integer ifViolate);
    @RequestMapping("/fuzzyQueryAllReaders")
    public String fuzzyQueryAllReaders(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String name, String tel, @RequestParam(value = "ifViolate", defaultValue = " ", required = false) Integer ifViolate, Model model) {
        PageHelper.startPage(pageNum, 5);
        List<Reader> readers = readerService.fuzzyQueryAllReaders(name, tel, ifViolate);
        PageInfo<Reader> info = new PageInfo<Reader>(readers, 5);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("nums", nums);
        model.addAttribute("info", info);
        return "readerList";
    }

    @RequestMapping("/toPageUpdateReader")
    public String toPageUpdateReader() {
        return "updateReader";
    }

    @RequestMapping("/updateReader")
    public String updateReader(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Reader reader) {
        readerService.updateReader(reader);
        return "redirect:fuzzyQueryAllReaders?pageNum=" + pageNum;
    }


    @RequestMapping("/deleteReaderByUsername")
    public String deleteReaderByUsername(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "username", defaultValue = "1") String username) {
        readerService.deleteReaderByUsername(username);
        return "redirect:fuzzyQueryAllReaders?pageNum=" + pageNum;
    }


    @RequestMapping("/updateMyReaderInfo")
    public String updateMyReaderInfo(Reader reader) {
        readerService.updateReader(reader);
        return "redirect:getMyInfo?path=manage";
    }

    @RequestMapping("/updateMyManagerInfo")
    public String updateMyReaderInfo(Manager manager) {
        System.out.println(manager);
        managerService.updateManager(manager);
        return "redirect:getMyInfo?path=manage";

    }

    @RequestMapping("/checkUser")
    public String checkUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String identify = request.getParameter("userType");
        if (identify.equals("-1")) {
            Manager manager = managerService.getManagerByUsername(username);
            if (manager != null) {
                if (username.equals(manager.getUsername()) && password.equals(manager.getPassword())) {
                    session.setAttribute("username",username);
                    session.setAttribute("authority",-1);
                    return "redirect:getMyInfo?path=manage";
                }else{
                    request.getRequestDispatcher("/jsp/login.jsp?wrongInfo=密码错误").forward(request, response);
                    return null;
                }
            } else {
                request.getRequestDispatcher("/jsp/login.jsp?wrongInfo=账号不存在").forward(request, response);
                return null;
            }
        }else {
            Reader reader = readerService.getReaderByUsername(username);
            if (reader != null) {
                if (username.equals(reader.getUsername()) && password.equals(reader.getPassword())) {
                    session.setAttribute("username",username);
                    session.setAttribute("authority",1);
                    System.out.println(reader.getIfViolate());
                    if(reader.getIfViolate()==1){
                        request.setAttribute("msg","您有图书长期未还，将每日扣除￥0.1从您的饭卡");
                    }
                    request.getRequestDispatcher("getMyInfo?path=manage").forward(request, response);
                    return null;
                }else{
                    request.getRequestDispatcher("/jsp/login.jsp?wrongInfo=密码错误").forward(request, response);
                    return null;
                }
            } else {
                request.getRequestDispatcher("/jsp/login.jsp?wrongInfo=账号不存在").forward(request, response);
                return null;
            }
        }
    }
    @RequestMapping("/getMyInfo")
    public String getMyInfo(HttpSession session,String path,Model model) {
        if(path==null){
            path = "updatePersonInfo";
        }
        String authority = session.getAttribute("authority").toString();
        String username = session.getAttribute("username").toString();
        if(authority.equals("-1")){
            Manager manager = managerService.getManagerByUsername(username);
            model.addAttribute("user",manager);
        }else{
            Reader reader = readerService.getReaderByUsername(username);
            model.addAttribute("user",reader);
        }
        return path;
    }

    @ResponseBody
    @RequestMapping("/checkUsername")
    public Object checkUsername(String username,String authority){
        if(authority=="-1"){
            return  managerService.getManagerByUsername(username);
        }else {
            return readerService.getReaderByUsername(username);
        }
    }

}