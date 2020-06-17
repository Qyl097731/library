package com.qyl.dao;

import com.qyl.bean.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.dao
 * date: 2020-06-06 17:30
 * copyright(c) 2020 南晓18卓工 邱依良
 */

public interface BookDao {


    void saveBook(Book book);
    void insertBooksBatch(List<Book> books);

    Book getBookById(Integer id);
    void updateBook(Book book);
    void updateBooksBatch(List<Book> books);

    void deleteBookById(Integer id);

    List<Book> fuzzyQueryAllBooks(@Param("bookName") String bookName, @Param("bookEncrypt") String bookEncrypt,
                                  @Param("pubName") String pubName, @Param("author") String author,
                                  @Param("typeName") String typeName);

    List<Book> accurateQueryAllBooks(@Param("bookName") String bookName, @Param("bookEncrypt") String bookEncrypt,
                                     @Param("pubName") String pubName, @Param("author") String author,
                                     @Param("typeName") String typeName);
}
//
//    private Integer id;
//    private String bookName;
//    private Integer stock;              //存量
//    private String author;
//    private String bookEncrypt;            //图书编码
//    private String pubName;
//    private Integer typeId;
