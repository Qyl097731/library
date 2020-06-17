package com.qyl.bean;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;

/**
 * projectName:  SSM
 * packageName: com.qyl.bean
 * date: 2020-06-08 09:06
 * copyright(c) 2020 南晓18卓工 邱依良
 */


public class Borrow {
    private Integer id;
    private Integer bookId;
    private String username;
    private String borrowTime;
    private String backTime;

    public Borrow( Integer bookId, String username, String borrowTime, String backTime) {
        this.bookId = bookId;
        this.username = username;
        this.borrowTime = borrowTime;
        this.backTime = backTime;
    }

    public Borrow() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }


    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getBackTime() {
        return backTime;
    }

    public void setBackTime(String backTime) {
        this.backTime = backTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                ", bookId=" + bookId +
                ", username='" + username + '\'' +
                ", borrowTime=" + borrowTime +
                ", backTime=" + backTime +
                '}';
    }
}