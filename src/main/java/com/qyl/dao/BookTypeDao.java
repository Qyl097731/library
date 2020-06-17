package com.qyl.dao;

import com.qyl.bean.BookType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.dao
 * date: 2020-06-09 17:14
 * copyright(c) 2020 南晓18卓工 邱依良
 */
public interface BookTypeDao {
    List<BookType> fuzzyQueryAllBookTypes(@Param("typeName") String typeName);
    void saveBookType(@Param("typeName") String typeName);
}
