package com.service;

import java.util.List;

import com.entity.PageBean;
import com.entity.User;

/**
 * User类业务层接口
 */
public interface UserService {


    List<User> selectUserList();

    int selectCount();


    PageBean<User> findByPage(int currentPage);

}
