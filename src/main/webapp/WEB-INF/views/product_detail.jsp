<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>${product.name} - 상세 정보</title>
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
                    }

                    .price {
                        font-size: 1.5em;
                        color: #28a745;
                        font-weight: bold;
                        margin: 10px 0;
                    }

                    .description {
                        margin: 20px 0;
                        line-height: 1.6;
                        color: #555;
                    }

                    .btn {
                        display: inline-block;
                        padding: 10px 20px;
                        background-color: #007bff;
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                    }

                    .btn:hover {
                        background-color: #0056b3;
                    }
                </style>
            </head>

            <body>

                <div class="container">
                    <h1>${product.name}</h1>
                    <div class="price">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                    </div>
                    <div class="description">
                        ${product.description}
                    </div>

                    <a href="products" class="btn">목록으로 돌아가기</a>
                </div>

            </body>

            </html>