package com.qyl.service;

import com.qyl.bean.BookType;
import com.qyl.dao.BookTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.service
 * date: 2020-06-09 17:23
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Service
public class BookTypeService {
    @Autowired
    private BookTypeDao bookTypeDao;

    public List<BookType> fuzzyQueryAllBookTypes(String typeName) {
        return bookTypeDao.fuzzyQueryAllBookTypes(typeName);
    }


    public void saveBookType(String bookType){
        bookTypeDao.saveBookType(bookType);
    }
}