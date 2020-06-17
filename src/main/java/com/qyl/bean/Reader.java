package com.qyl.bean;

/**
 * projectName:  SSM
 * packageName: com.qyl.bean
 * date: 2020-06-08 16:33
 * copyright(c) 2020 南晓18卓工 邱依良
 */

public class Reader {
    private String username;
    private String name;
    private String password;
    private String tel;
    private Integer ifViolate;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getIfViolate() {
        return ifViolate;
    }

    public void setIfViolate(Integer ifViolate) {
        this.ifViolate = ifViolate;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", ifViolate=" + ifViolate +
                '}';
    }
}