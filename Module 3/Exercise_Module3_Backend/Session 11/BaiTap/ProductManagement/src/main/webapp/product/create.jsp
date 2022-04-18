<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 3/27/2022
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
    <style>
        .message{
            color: red;
        }
    </style>
</head>
<body>
    <h1>Create new Product</h1>
    <p>
        <c:if test="${requestScope['message'] != null}">
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/products">Back to Products List</a>
    </p>
    <form method="post">
        <fieldset>
            <legend>Product information</legend>
            <table>
                <tr>
                    <td>ID: </td>
                    <td><input type="text" name="id" id="id"></td>
                </tr>
                <tr>
                    <td>Name Product: </td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" id="price"></td>
                </tr>
                <tr>
                    <td>Description: </td>
                    <td><input type="text" name="description" id="description"></td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td><input type="text" name="country" id="country"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create product"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>