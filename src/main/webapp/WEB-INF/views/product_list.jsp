<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>상품 목록</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 40px;
                        background-color: #f4f4f4;
                    }

                    h1 {
                        color: #333;
                        text-align: center;
                    }

                    table {
                        width: 80%;
                        margin: 20px auto;
                        border-collapse: collapse;
                        background: white;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    }

                    th,
                    td {
                        padding: 12px;
                        border: 1px solid #ddd;
                        text-align: left;
                    }

                    th {
                        background-color: #007bff;
                        color: white;
                    }

                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }

                    tr:hover {
                        background-color: #f1f1f1;
                    }

                    .price {
                        text-align: right;
                        font-weight: bold;
                        color: #28a745;
                    }
                </style>
            </head>

            <body>

                <h1>상품 목록</h1>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>설명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>
                                    <a href="product?id=${product.id}">${product.name}</a>
                                </td>
                                <td class="price">
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                                </td>
                                <td>${product.description}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </body>

            </html>