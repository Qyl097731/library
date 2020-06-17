package com.qyl.dao;

import com.qyl.bean.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.dao
 * date: 2020-06-13 19:11
 * copyright(c) 2020 南晓18卓工 邱依良
 */
public interface BorrowDao {
    void insertBorrowLog(Borrow borrow);
    List<Borrow> getLogByUsername(String username);

    List<Borrow> fuzzyQueryAllBorrowLog(@Param("username") String username, @Param("bookId")Integer bookId);


}
