package com.qyl.service;


import com.qyl.bean.Reader;
import com.qyl.dao.ReaderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.service
 * date: 2020-06-08 16:45
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Service
public class ReaderService {
    @Autowired
    private ReaderDao readerDao;

    public void insertReader(Reader reader) {
        readerDao.insertReader(reader);

    }

    public void insertReaderBatch(List<Reader> readers) {
        readerDao.insertReaderBatch(readers);
    }


    public void updateReader(Reader reader) {
        readerDao.updateReader(reader);
    }

    public void updateReadersBatch(List<Reader> readers) {
        readerDao.updateReadersBatch(readers);
    }

    public void deleteReaderByUsername(String username) {
        readerDao.deleteReaderByUsername(username);
    }

    public List<Reader> fuzzyQueryAllReaders(String name, String tel, Integer ifViolate) {
        return readerDao.fuzzyQueryAllReaders(name, tel, ifViolate);
    }

    public Reader getReaderByUsername(String username){
        return readerDao.getReaderByUsername(username);
    }
}