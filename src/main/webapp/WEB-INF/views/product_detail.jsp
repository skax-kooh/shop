<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>상품 상세 정보</title>
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
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 40px 20px;
                    }

                    .product-header {
                        margin-bottom: 30px;
                    }

                    .product-title {
                        font-size: 2em;
                        font-weight: 800;
                        margin-bottom: 10px;
                    }

                    .rating {
                        color: #ffb400;
                        font-size: 1.2em;
                        margin-bottom: 20px;
                    }

                    .layout-grid {
                        display: grid;
                        grid-template-columns: 1fr 400px;
                        gap: 60px;
                        align-items: start;
                    }

                    .product-visual {
                        background-color: var(--t-gray-100);
                        border-radius: 20px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        padding: 60px;
                    }

                    .sidebar {
                        position: sticky;
                        top: 40px;
                        border: 1px solid var(--t-gray-200);
                        border-radius: 16px;
                        padding: 30px;
                        background: white;
                        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                    }

                    .option-group {
                        margin-bottom: 30px;
                    }

                    .option-label {
                        font-weight: 700;
                        margin-bottom: 15px;
                        display: block;
                    }

                    .color-circles {
                        display: flex;
                        gap: 12px;
                    }

                    .color-circle {
                        width: 32px;
                        height: 32px;
                        border-radius: 50%;
                        border: 2px solid transparent;
                        cursor: pointer;
                        padding: 2px;
                        background-clip: content-box;
                    }

                    .color-circle.active {
                        border-color: var(--t-purple);
                    }

                    .capacity-boxes {
                        display: grid;
                        grid-template-columns: 1fr;
                        gap: 10px;
                    }

                    .capacity-box {
                        border: 1px solid var(--t-gray-200);
                        border-radius: 8px;
                        padding: 15px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        cursor: pointer;
                    }

                    .capacity-box.active {
                        border-color: var(--t-purple);
                        background-color: rgba(92, 37, 230, 0.05);
                        color: var(--t-purple);
                        font-weight: 700;
                    }

                    .price-summary {
                        border-top: 1px solid var(--t-gray-200);
                        margin-top: 30px;
                        padding-top: 20px;
                    }

                    .price-total {
                        display: flex;
                        justify-content: space-between;
                        align-items: baseline;
                        margin-bottom: 20px;
                    }

                    .price-value {
                        font-size: 1.8em;
                        font-weight: 800;
                        color: var(--t-gray-900);
                    }

                    .button-group {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 10px;
                    }

                    .btn {
                        padding: 16px;
                        border-radius: 8px;
                        font-weight: 700;
                        text-align: center;
                        cursor: pointer;
                        border: none;
                        font-size: 1em;
                        text-decoration: none;
                    }

                    .btn-outline {
                        background-color: white;
                        border: 1px solid var(--t-purple);
                        color: var(--t-purple);
                    }

                    .btn-primary {
                        background-color: var(--t-purple);
                        color: white;
                    }

                    .description-section {
                        margin-top: 60px;
                        border-top: 1px solid var(--t-gray-200);
                        padding-top: 40px;
                    }
                </style>
            </head>

            <body>

                <header>
                    <a href="<c:url value='/products'/>"
                        style="text-decoration: none; color: var(--t-purple); font-weight: 900; font-size: 1.5em;">Lab
                        Shop</a>
                    <div style="font-size: 0.9em; color: var(--t-gray-700);">Premium Store</div>
                </header>

                <div class="container">
                    <c:if test="${not empty product}">
                        <div class="product-header">
                            <h1 class="product-title">${product.name}</h1>
                            <div class="rating">★★★★★ <span
                                    style="color: var(--t-gray-700); font-size: 0.7em;">(4.9)</span></div>
                        </div>

                        <div class="layout-grid">
                            <div class="main-content">
                                <div class="product-visual">
                                    <svg width="300" height="400" viewBox="0 0 120 150" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <rect x="10" y="10" width="100" height="130" rx="8" stroke="#333"
                                            stroke-width="2" />
                                        <rect x="15" y="15" width="90" height="110" rx="4" fill="#eee" />
                                        <circle cx="60" cy="132" r="4" fill="#333" />
                                    </svg>
                                </div>
                                <div class="description-section">
                                    <h3 style="margin-bottom: 20px;">상품 설명</h3>
                                    <p style="line-height: 1.6; color: var(--t-gray-700);">${product.description}</p>
                                </div>
                            </div>

                            <div class="sidebar">
                                <div class="option-group">
                                    <span class="option-label">색상</span>
                                    <div class="color-circles">
                                        <div class="color-circle active" style="background-color: #333;"></div>
                                        <div class="color-circle" style="background-color: #ddd;"></div>
                                        <div class="color-circle" style="background-color: #f3e5ab;"></div>
                                    </div>
                                </div>

                                <div class="option-group">
                                    <span class="option-label">용량</span>
                                    <div class="capacity-boxes">
                                        <div class="capacity-box active">
                                            <span>128G</span>
                                            <span style="font-size: 0.9em;">+0원</span>
                                        </div>
                                        <div class="capacity-box">
                                            <span>256G</span>
                                            <span style="font-size: 0.9em;">+120,000원</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="price-summary">
                                    <div class="price-total">
                                        <span style="font-weight: 700;">출고가</span>
                                        <span class="price-value">
                                            <fmt:formatNumber value="${product.price}" type="currency"
                                                currencySymbol="₩" />
                                        </span>
                                    </div>
                                    <div class="button-group" style="grid-template-columns: 1fr;">
                                        <div class="btn btn-primary">다음</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                            // Color circle interaction
                            document.querySelectorAll('.color-circle').forEach(circle => {
                                circle.addEventListener('click', () => {
                                    document.querySelectorAll('.color-circle').forEach(c => c.classList.remove('active'));
                                    circle.classList.add('active');
                                });
                            });

                            // Capacity box interaction
                            document.querySelectorAll('.capacity-box').forEach(box => {
                                box.addEventListener('click', () => {
                                    document.querySelectorAll('.capacity-box').forEach(b => b.classList.remove('active'));
                                    box.classList.add('active');
                                });
                            });
                        </script>
                    </c:if>

                    <c:if test="${empty product}">
                        <div style="text-align: center; padding: 100px 0;">
                            <p style="color: var(--t-red); font-weight: 700; font-size: 1.2em;">상품을 찾을 수 없습니다.</p>
                            <a href="<c:url value='/products'/>" class="back-link"
                                style="color: var(--t-purple); display: block; margin-top: 20px;">목록으로 돌아가기</a>
                        </div>
                    </c:if>
                </div>

            </body>

            </html>