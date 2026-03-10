<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>장바구니</title>
                <style>
                    :root {
                        --t-purple: #5c25e6;
                        --t-red: #f43f5e;
                        --t-gray-100: #f5f5f7;
                        --t-gray-200: #e5e7eb;
                        --t-gray-700: #4b5563;
                        --t-gray-900: #111827;
                    }

                    body {
                        font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #fff;
                        color: var(--t-gray-900);
                    }

                    header {
                        padding: 20px 40px;
                        border-bottom: 1px solid var(--t-gray-200);
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .container {
                        max-width: 1000px;
                        margin: 40px auto;
                        padding: 0 20px;
                    }

                    h1 {
                        margin-bottom: 30px;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 30px;
                    }

                    th {
                        text-align: left;
                        padding: 15px;
                        border-bottom: 2px solid var(--t-gray-200);
                        color: var(--t-gray-700);
                    }

                    td {
                        padding: 20px 15px;
                        border-bottom: 1px solid var(--t-gray-100);
                    }

                    .product-info {
                        display: flex;
                        align-items: center;
                    }

                    .product-image {
                        width: 60px;
                        height: 60px;
                        background: var(--t-gray-100);
                        border-radius: 8px;
                        margin-right: 15px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .quantity-control {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }

                    .quantity-input {
                        width: 40px;
                        padding: 5px;
                        text-align: center;
                        border: 1px solid var(--t-gray-200);
                        border-radius: 4px;
                    }

                    .cart-summary {
                        background: var(--t-gray-100);
                        padding: 30px;
                        border-radius: 12px;
                        text-align: right;
                    }

                    .total-price {
                        font-size: 1.5em;
                        font-weight: 800;
                        color: var(--t-red);
                        margin-bottom: 20px;
                    }

                    .btn {
                        padding: 12px 24px;
                        border-radius: 8px;
                        font-weight: 700;
                        cursor: pointer;
                        border: none;
                        text-decoration: none;
                        display: inline-block;
                    }

                    .btn-primary {
                        background: var(--t-purple);
                        color: white;
                    }

                    .btn-outline {
                        background: white;
                        border: 1px solid var(--t-gray-200);
                        color: var(--t-gray-700);
                    }

                    .btn-remove {
                        color: var(--t-red);
                        background: none;
                        border: none;
                        cursor: pointer;
                        font-size: 0.9em;
                    }
                </style>
            </head>

            <body>
                <header>
                    <a href="<c:url value='/products'/>"
                        style="text-decoration: none; color: var(--t-purple); font-weight: 900; font-size: 1.5em;">Lab
                        Shop</a>
                </header>

                <div class="container">
                    <h1>장바구니</h1>

                    <c:choose>
                        <c:when test="${not empty cart.items}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>상품 정보</th>
                                        <th>수량</th>
                                        <th>가격</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${cart.items}">
                                        <tr>
                                            <td>
                                                <div class="product-info">
                                                    <div class="product-image">
                                                        <svg width="30" height="40" viewBox="0 0 120 150" fill="none">
                                                            <rect x="10" y="10" width="100" height="130" rx="8"
                                                                stroke="#333" stroke-width="4" />
                                                            <rect x="15" y="15" width="90" height="110" rx="4"
                                                                fill="#eee" />
                                                        </svg>
                                                    </div>
                                                    <div>
                                                        <div style="font-weight: 700;">${item.product.name}</div>
                                                        <div style="font-size: 0.8em; color: var(--t-gray-700);">
                                                            ${item.product.description}</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <form action="<c:url value='/cart/update'/>" method="post"
                                                    class="quantity-control">
                                                    <input type="hidden" name="id" value="${item.product.id}">
                                                    <input type="number" name="quantity" value="${item.quantity}"
                                                        min="1" class="quantity-input">
                                                    <button type="submit" class="btn btn-outline"
                                                        style="padding: 5px 10px; font-size: 0.8em;">변경</button>
                                                </form>
                                            </td>
                                            <td style="font-weight: 700;">
                                                <fmt:formatNumber value="${item.totalPrice}" type="currency"
                                                    currencySymbol="₩" />
                                            </td>
                                            <td>
                                                <form action="<c:url value='/cart/remove'/>" method="post">
                                                    <input type="hidden" name="id" value="${item.product.id}">
                                                    <button type="submit" class="btn-remove">삭제</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="cart-summary">
                                <div style="margin-bottom: 10px; color: var(--t-gray-700);">총 결제 금액</div>
                                <div class="total-price">
                                    <fmt:formatNumber value="${cart.totalAmount}" type="currency" currencySymbol="₩" />
                                </div>
                                <div style="display: flex; justify-content: flex-end; gap:10px;">
                                    <form action="<c:url value='/cart/clear'/>" method="post">
                                        <button type="submit" class="btn btn-outline">장바구니 비우기</button>
                                    </form>
                                    <a href="#" class="btn btn-primary">주문하기</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div
                                style="text-align: center; padding: 100px 0; border: 1px dashed var(--t-gray-200); border-radius: 12px;">
                                <p style="color: var(--t-gray-700); font-size: 1.2em; margin-bottom: 20px;">장바구니가 비어
                                    있습니다.</p>
                                <a href="<c:url value='/products'/>" class="btn btn-primary">쇼핑하러 가기</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </body>

            </html>