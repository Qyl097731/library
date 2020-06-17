package com.qyl.service;

import com.qyl.bean.Borrow;
import com.qyl.dao.BorrowDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.service
 * date: 2020-06-13 19:12
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Service
public class BorrowService {
    @Autowired
    BorrowDao borrowDao;

    public void insertBorrowLog(Borrow borrow){
        System.out.println("存储日志>>>>>>>>"+borrow);
        borrowDao.insertBorrowLog(borrow);
    }

    public List<Borrow> getLogByUsername(String username){
        return borrowDao.getLogByUsername(username);
    }

    public List<Borrow> fuzzyQueryAllBorrowLog(String username, Integer bookId) {
        return borrowDao.fuzzyQueryAllBorrowLog(username,bookId);
    }

}