<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>상품 상세 정보</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 40px;
                        background-color: #f4f4f4;
                    }

                    .container {
                        max-width: 600px;
                        margin: 0 auto;
                        background: white;
                        padding: 20px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        border-radius: 8px;
                    }

                    h1 {
                        color: #333;
                        text-align: center;
                    }

                    .product-info {
                        margin-bottom: 20px;
                    }

                    .label {
                        font-weight: bold;
                        color: #555;
                        display: inline-block;
                        width: 100px;
                    }

                    .price {
                        color: #28a745;
                        font-size: 1.2em;
                        font-weight: bold;
                    }

                    .back-link {
                        display: block;
                        margin-top: 20px;
                        text-align: center;
                        text-decoration: none;
                        color: #007bff;
                    }

                    .back-link:hover {
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body>

                <div class="container">
                    <h1>상품 상세 정보</h1>

                    <c:if test="${not empty product}">
                        <div class="product-info">
                            <p><span class="label">ID:</span> ${product.id}</p>
                            <p><span class="label">상품명:</span> ${product.name}</p>
                            <p><span class="label">가격:</span> <span class="price">
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                                </span></p>
                            <p><span class="label">설명:</span> ${product.description}</p>
                        </div>
                    </c:if>

                    <c:if test="${empty product}">
                        <p style="text-align: center; color: red;">상품을 찾을 수 없습니다.</p>
                    </c:if>

                    <a href="<c:url value='/products'/>" class="back-link">목록으로 돌아가기</a>
                </div>

            </body>

            </html>