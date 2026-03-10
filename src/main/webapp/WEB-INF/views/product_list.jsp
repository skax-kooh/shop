<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>상품 목록</title>
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
                        font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #fff;
                        color: var(--t-gray-900);
                    }

                    header {
                        padding: 20px 40px;
                        border-bottom: 1px solid var(--t-gray-200);
                        text-align: center;
                    }

                    .nav-tabs {
                        display: flex;
                        justify-content: center;
                        gap: 30px;
                        margin-top: 20px;
                        border-bottom: 1px solid var(--t-gray-200);
                    }

                    .nav-tab {
                        padding: 10px 0;
                        font-weight: 600;
                        color: var(--t-gray-700);
                        cursor: pointer;
                        border-bottom: 2px solid transparent;
                    }

                    .nav-tab.active {
                        color: var(--t-gray-900);
                        border-bottom: 2px solid var(--t-gray-900);
                    }

                    .container {
                        max-width: 1200px;
                        margin: 40px auto;
                        padding: 0 20px;
                    }

                    .product-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                        gap: 30px;
                    }

                    .product-card {
                        border-radius: 12px;
                        overflow: hidden;
                        transition: transform 0.2s;
                        padding-bottom: 20px;
                    }

                    .product-card:hover {
                        transform: translateY(-5px);
                    }

                    .image-placeholder {
                        width: 100%;
                        aspect-ratio: 1/1;
                        background-color: var(--t-gray-100);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        border-radius: 12px;
                        margin-bottom: 20px;
                    }

                    .image-placeholder img {
                        max-width: 80%;
                        max-height: 80%;
                    }

                    .product-info {
                        padding: 0 10px;
                    }

                    .product-name {
                        font-size: 1.1em;
                        font-weight: 700;
                        margin-bottom: 8px;
                        color: var(--t-gray-900);
                        text-decoration: none;
                    }

                    .product-name a {
                        color: inherit;
                        text-decoration: none;
                    }

                    .product-name a:hover {
                        text-decoration: underline;
                    }

                    .specs {
                        font-size: 0.85em;
                        color: var(--t-gray-700);
                        margin-bottom: 12px;
                    }

                    .color-swatches {
                        display: flex;
                        gap: 6px;
                        margin-bottom: 15px;
                    }

                    .swatch {
                        width: 12px;
                        height: 12px;
                        border-radius: 50%;
                        border: 1px solid var(--t-gray-200);
                    }

                    .price-monthly {
                        font-size: 1.2em;
                        font-weight: 800;
                        color: var(--t-red);
                        margin-bottom: 4px;
                    }

                    .price-total {
                        font-size: 0.85em;
                        color: var(--t-gray-700);
                    }

                    .badge-arrival {
                        display: inline-block;
                        background-color: var(--t-red);
                        color: white;
                        font-size: 0.7em;
                        padding: 2px 6px;
                        border-radius: 4px;
                        margin-top: 10px;
                        font-weight: 700;
                    }
                </style>
            </head>

            <body>

                <header>
                    <div
                        style="display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; width: 100%;">
                        <h1 style="color: var(--t-purple); font-weight: 900; font-size: 2em; margin: 0;">Lab Shop</h1>
                        <a href="<c:url value='/cart'/>"
                            style="text-decoration: none; color: var(--t-gray-900); font-weight: 600;">
                            장바구니 <span
                                style="background: var(--t-red); color: white; padding: 2px 8px; border-radius: 10px; font-size: 0.8em;">${sessionScope.cart
                                != null ? sessionScope.cart.totalQuantity : 0}</span>
                        </a>
                    </div>
                </header>

                <div class="container">
                    <div class="product-grid">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <a href="<c:url value='/product/detail?id=${product.id}'/>">
                                    <div class="image-placeholder">
                                        <!-- Mock image representation -->
                                        <svg width="120" height="150" viewBox="0 0 120 150" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <rect x="10" y="10" width="100" height="130" rx="8" stroke="#333"
                                                stroke-width="4" />
                                            <rect x="15" y="15" width="90" height="110" rx="4" fill="#eee" />
                                            <circle cx="60" cy="132" r="4" fill="#333" />
                                        </svg>
                                    </div>
                                </a>
                                <div class="product-info">
                                    <h3 class="product-name">
                                        <a href="<c:url value='/product/detail?id=${product.id}'/>">${product.name}</a>
                                    </h3>
                                    <p class="specs">128G | 256G | 512G</p>
                                    <div class="color-swatches">
                                        <div class="swatch" style="background-color: #333;"></div>
                                        <div class="swatch" style="background-color: #ddd;"></div>
                                        <div class="swatch" style="background-color: #f3e5ab;"></div>
                                    </div>
                                    <div class="price-monthly">
                                        <fmt:formatNumber value="${product.price / 24}" pattern="#,###" /> <span
                                            style="font-size: 0.6em; font-weight: normal; color: var(--t-gray-700);">원/월</span>
                                    </div>
                                    <div class="price-total">
                                        출고가
                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩" />
                                    </div>
                                    <div class="badge-arrival">#바로도착</div>
                                    <div style="margin-top: 15px;">
                                        <form action="<c:url value='/cart/add'/>" method="post">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit"
                                                style="width: 100%; padding: 10px; background: var(--t-purple); color: white; border: none; border-radius: 8px; font-weight: 700; cursor: pointer;">
                                                장바구니 담기
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </body>

            </html>