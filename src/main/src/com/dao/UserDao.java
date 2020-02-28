package com.dao;

import java.util.HashMap;
import java.util.List;

import com.entity.User;

public interface UserDao {

    /**
     * 查询所有用户数据
     * @return
     */
    List<User> selectUserList();
    /**
     * 查询用户记录总数
     * @return
     */
    int selectCount();
    /**
     * 分页操作，调用findByPage limit分页方法
     * @param map
     * @return
     */
    List<User> findByPage(HashMap<String,Object> map);

}
