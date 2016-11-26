<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products page</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
</br>
</br>

<h1>Product List</h1>
<c:if test="${!empty listProducts}">
    <table class="tg">
        <tr>
            <td width="80">ID</td>
            <td width="120">Title</td>
            <td width="120">Manufacturer</td>
            <td width="60">Vendor code</td>
            <td width="60">Price</td>
            <td width="60">Edit</td>
            <td width="60">Delete</td>
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.title}</td>
                <td>${product.manufacturer}</td>
                <td>${product.articul}</td>
                <td>${product.price/100}${product.price%100}</td>
                <td><a href="<c:url value='/edit/${product.id}'/>">">Edit</a></td>
                <td><a href="<c:url value='/remove/${product.id}'/>">">Delete</a></td>
                <td></td>


            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add a Product</h1>

<c:url var="addAction" value="/products/add"/>
    <form:form action="${addAction}" commandName="product">
        <table>
            <c:if test="${!empty product.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="manufacturer">
                        <spring:message text="Manufacturer"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="manufacturer"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="articul">
                        <spring:message text="Vendor code"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="articul"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="price">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="price"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty product.title}">
                        <input type="submit"
                               value="<spring:message text="Edit Product"/>"/>
                    </c:if>
                    <c:if test="${empty product.title}">
                        <input type="submit"
                               value="<spring:message text="Add Product"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>