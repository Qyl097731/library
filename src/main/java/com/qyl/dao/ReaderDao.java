package com.qyl.dao;

import com.qyl.bean.Manager;
import com.qyl.bean.Reader;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.dao
 * date: 2020-06-08 16:44
 * copyright(c) 2020 南晓18卓工 邱依良
 */
public interface ReaderDao {

    void insertReader(Reader reader);

    void insertReaderBatch(List<Reader> readers);
    Reader getReaderByUsername(String username) ;
    void updateReader(Reader reader);

    void updateReadersBatch(List<Reader> readers);

    void deleteReaderByUsername(String username);

    List<Reader> fuzzyQueryAllReaders(@Param("name") String name, @Param("tel") String tel, @Param("ifViolate") Integer ifViolate);


}
//    private Integer id;
//    private String readerId;
//    private String name;
//    private String password;
//    private String tel;
//    private Integer ifViolate;