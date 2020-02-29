<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主页</title>
    <style type="text/css">
        td{text-align: center;}
        .td2{text-align: right;}
        .table1{
            border:1px solid #ddd;
            width:900px;
        }
        thead{
            background-color:lightblue;
        }
    </style>
</head>
<body>
欢迎你：${currentUser}
<br>
<%-- 当前用户：${pageScope.currentUser}<!-- (只能在同一个页面中使用) --> <br>
当前用户：${requestScope.currentUser}-${roleName} 有重定向数据就访问不到<br>
当前用户：${sessionScope.currentUser}-${roleName} 可以使用<br> --%>
<hr>
<%--<a href="add"> 添加用户</a><br>--%>
<c:if test="${empty requestScope.pagemsg}">
    没有任何用户信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table border="1" cellpadding="10" cellspacing="0" class="table1">
        <thead>
        <tr>
            <td>编号</td>
            <td>用户名</td>
            <td>密码</td>
            <td>邮件</td>
            <td>联系电话</td>
            <td>职位</td>

        </tr>
        </thead>
        <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <tr>
                <th>${u.id }</th>
                <th>${u.username }</th>
                <th>${u.password }</th>
                <th>${u.email }</th>
                <th>${u.phone }</th>
                <th>${u.rolename }</th>
                  </tr>
        </c:forEach>
    </table>
</c:if>

<table  border="0" cellspacing="0" cellpadding="0"  width="900px">
    <tr>
        <td class="td2">
            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>&nbsp;&nbsp;
            <span>总记录数：${requestScope.pagemsg.totalCount }&nbsp;&nbsp;每页显示:${requestScope.pagemsg.pageSize}</span>&nbsp;&nbsp;
            <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/main?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/main?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>&nbsp;&nbsp;
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/main?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/main?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>


        </td>
    </tr>

    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/main?currentPage=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${requestScope.pagemsg.currPage ==1}">
                <c:forEach begin="${requestScope.pagemsg.pageStart}" end="${requestScope.pagemsg.pageEnd}" step="1" var="i">
                    <c:if test="${requestScope.pagemsg.currPage == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pagemsg.currPage != i}">
                        <a href="${pageContext.request.contextPath}/main?currentPage=${i}">${i}</a>
                    </c:if>
                </c:forEach>
                <a href="${pageContext.request.contextPath}/main?currentPage=${requestScope.pagemsg.currPage+1}">下一页</a>
            </c:if>

            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.pagemsg.currPage > 1 && requestScope.pagemsg.currPage < requestScope.pagemsg.totalPage}">
                <a href="${pageContext.request.contextPath}/main?currentPage=${requestScope.pagemsg.currPage-1}">上一页</a>
                <c:forEach begin="${requestScope.pagemsg.pageStart}" end="${requestScope.pagemsg.pageEnd}" step="1" var="i">
                    <c:if test="${requestScope.pagemsg.currPage == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pagemsg.currPage != i}">
                        <a href="${pageContext.request.contextPath}/main?currentPage=${i}">${i}</a>
                    </c:if>
                </c:forEach>
                <a href="${pageContext.request.contextPath}/main?currentPage=${requestScope.pagemsg.currPage+1}">下一页</a>
            </c:if>

            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${requestScope.pagemsg.currPage == requestScope.pagemsg.totalPage}">
                <a href="${pageContext.request.contextPath}/main?currentPage=${requestScope.pagemsg.currPage-1}">上一页</a>
                <c:forEach begin="${requestScope.pagemsg.pageStart}" end="${requestScope.pagemsg.pageEnd}" step="1" var="i">
                    <c:if test="${requestScope.pagemsg.currPage == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pagemsg.currPage != i}">
                        <a href="${pageContext.request.contextPath}/main?currentPage=${i}">${i}</a>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <%--<a href="${pageContext.request.contextPath}/main?currentPage=${requestScope.pageBean.totalPage}">尾页</a>--%>
            <a href="${pageContext.request.contextPath }/main?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
        </td>
    </tr>
</table>
</body>
</html>