package com.qyl.bean;

/**
 * projectName:  com.elTest
 * packageName: com.qyl.book
 * date: 2020-06-01 14:55
 * copyright(c) 2020 南晓18卓工 邱依良
 */


public class Book {

    private Integer id;
    private String bookName;
    private Integer stock;              //存量
    private String author;
    private String bookEncrypt;            //图书编码
    private String pubName;
    private String typeName;                  //书的分类
    private Integer ifBorrow;
    private Integer total;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total  = total;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBookEncrypt() {
        return bookEncrypt;
    }

    public void setBookEncrypt(String bookEncrypt) {
        this.bookEncrypt = bookEncrypt;
    }

    public String getPubName() {
        return pubName;
    }

    public void setPubName(String pubName) {
        this.pubName = pubName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getIfBorrow() {
        return ifBorrow;
    }

    public void setIfBorrow(Integer ifBorrow) {
        this.ifBorrow = ifBorrow;
    }



    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookName='" + bookName + '\'' +
                ", stock=" + stock +
                ", author='" + author + '\'' +
                ", bookEncrypt='" + bookEncrypt + '\'' +
                ", pubName='" + pubName + '\'' +
                ", typeName='" + typeName + '\'' +
                ", ifBorrow=" + ifBorrow +
                '}';
    }
}