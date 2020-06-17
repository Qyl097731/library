package com.qyl.service;

import com.qyl.bean.Book;
import com.qyl.bean.Borrow;
import com.qyl.dao.BookDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.service
 * date: 2020-06-06 17:19
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Service
public class BookService {
    @Autowired
    private BookDao bookDao;




    public void insertBooksBatch(List<Book> books) {
        bookDao.insertBooksBatch(books);
    }

    public void saveBook(Book book) {
        bookDao.saveBook(book);
    }

    public void updateBooksBatch(List<Book> books) {
        bookDao.updateBooksBatch(books);
    }

    public Book getBookById(Integer id) {
        return bookDao.getBookById(id);
    }
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    public void deleteBookById(Integer id) {
        bookDao.deleteBookById(id);
    }


    public List<Book> fuzzyQueryAllBooks(String bookName, String bookEncrypt,
                                         String pubName, String author, String typeName) {
        return bookDao.fuzzyQueryAllBooks(bookName, bookEncrypt, pubName, author, typeName);
    }

    public List<Book> accurateQueryAllBooks(String bookName, String bookEncrypt, String pubName, String author, String typeName) {
        return bookDao.accurateQueryAllBooks(bookName,bookEncrypt,pubName,author,typeName);
    }
}
