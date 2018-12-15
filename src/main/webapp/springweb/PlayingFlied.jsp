<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Андрей
  Date: 08.12.2018
  Time: 01:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://code.jquery.com/jquery-2.0.3.js"></script>
    <title>MyGame</title>
</head>

<body>
<form action="/game" method="post">
    <input type="hidden" name="line" value="${line}">
    <input type="hidden" name="column" value="${column}">
    <input type="hidden" name="resultGame" value=${resultGame}>
    <c:forEach items="${history}" var="item">
        <input type="hidden" name="historyKey" value=${item.key}>
        <input type="hidden" name="historyValue" value=${item.value}>
    </c:forEach>
    <c:forEach items="${result}" var="item">
        <input type="hidden" name="resultKey" value=${item.key}>
        <input type="hidden" name="resultValue" value=${item.value}>
    </c:forEach>
    <table>
        <c:forEach items="${result}" var="item">
            <c:if test="${(item.key-1)%line==0&&(item.key-1!=0)}">
                <tr>
                </tr>
            </c:if>
            <td>
                <input type="submit" name="name" onclick=value=${item.key} value="${item.value}">
            </td>
        </c:forEach>
    </table>
</form>
<table>
    <c:forEach items="${history}" var="hist">

            <tr>
            <c:forEach items="${result}" var="res">

                    <c:if test="${hist.value==res.key}">
                        <td>
                            ход ${hist.key+1}:    ${hist.value } :  ${ res.value}
                                <%--${hist}--%>
                        </td>
                    </c:if>
            </c:forEach>
            </tr>

    </c:forEach>
</table>
${error}
</body>
</html>
