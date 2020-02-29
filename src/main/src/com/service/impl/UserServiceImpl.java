package com.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.PageBean;
import com.entity.User;
import com.service.UserService;

/**
 * User类业务层实现类
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public List<User> selectUserList() {

        return userDao.selectUserList();
    }

    @Override
    public int selectCount() {
        return userDao.selectCount();
    }


    @Override
    public PageBean<User> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<User> pageBean = new PageBean<User>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=1;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = userDao.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        //显示5页，这里自己可以设置，想显示几页就自己通过下面算法修改
        int start = 1;
        int end = 5;
        //显示页数的算法

        if(num <=5){
            //总页数都小于5，那么end就为总页数的值了。
            end = num.intValue();
        }else {
            //总页数大于5，那么就要根据当前是第几页，来判断start和end为多少了，
            start = currentPage - 2;
            end = currentPage + 2;

            if (start < 0) {
                //比如当前页是第1页，或者第2页，那么就不如和这个规则，
                start = 1;
                end = 5;
            }
            if (end > num.intValue()) {
                //比如当前页是倒数第2页或者最后一页，也同样不符合上面这个规则
                end = num.intValue();
                start = end - 4;
            }
        }

        pageBean.setPageStart(start);
        pageBean.setPageEnd(end);

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<User> lists = userDao.findByPage(map);
        pageBean.setLists(lists);

        System.out.println("start: " + start + ", end: " + end);


        return pageBean;
    }

}
