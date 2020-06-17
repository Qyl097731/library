package com.qyl.service;

import com.qyl.bean.Manager;
import com.qyl.bean.Reader;
import com.qyl.dao.ManagerDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * projectName:  SSM
 * packageName: com.qyl.service
 * date: 2020-06-12 12:06
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Service
public class ManagerService {
    @Autowired
    ManagerDao managerDao;


    public void insertManager(Manager manager) {
        managerDao.insertManager(manager);
    }

    public List<Manager> fuzzyQueryAllManagers(@Param("name") String name, @Param("tel") String tel) {
        return managerDao.fuzzyQueryAllManagers(name,tel);
    }

    public void updateManager(Manager manager) {
        managerDao.updateManager(manager);
    }


    public Manager getManagerByUsername(String username) {
        return managerDao.getManagerByUsername(username);
    }

    public void deleteManagerByUsername(String username) {
        managerDao.deleteManagerByUsername(username);
    }
}