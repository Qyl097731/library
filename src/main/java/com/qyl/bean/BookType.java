package com.qyl.bean;

/**
 * projectName:  SSM
 * packageName: com.qyl.bean
 * date: 2020-06-09 16:59
 * copyright(c) 2020 南晓18卓工 邱依良
 */
public class BookType {
    private String typeName;


    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "BookType{" +
                " typeName='" + typeName + '\'' +
                '}';
    }
}