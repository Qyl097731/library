package com.qyl.dao;

import com.qyl.bean.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.dao
 * date: 2020-06-12 12:10
 * copyright(c) 2020 南晓18卓工 邱依良
 */
public interface ManagerDao {
    void insertManager(Manager manager);

    List<Manager> fuzzyQueryAllManagers(@Param("name") String name,@Param("tel") String tel);

    void updateManager(Manager manager);

    Manager getManagerByUsername(String username) ;
    void deleteManagerByUsername(String username);
}
