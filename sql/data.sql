-- ============================================================
-- Shop Database Sample Data (DML)
-- Target: Amazon RDS for MySQL 8.x
-- ============================================================

USE shopdb;

-- ============================================================
-- 1. 카테고리 데이터
-- ============================================================
INSERT INTO category (category_id, name, description, display_order) VALUES
(1, '노트북',       '고성능 노트북 및 랩탑',           1),
(2, '스마트폰',     '최신 스마트폰 및 모바일 기기',     2),
(3, '태블릿',       '태블릿 PC 및 액세서리',           3),
(4, '주변기기',     '키보드, 마우스, 모니터 등',        4),
(5, '오디오',       '이어폰, 헤드폰, 스피커',          5),
(6, '웨어러블',     '스마트워치, 밴드',                6);

-- ============================================================
-- 2. 상품 데이터
--    기존 in-memory 3개 상품 + 추가 상품으로 확장
--    ※ product_id 1~3은 기존 데이터와 호환
-- ============================================================
INSERT INTO product (product_id, category_id, name, price, description, image_url, stock, is_active) VALUES
-- 기존 상품 (ProductRepository 호환)
(1,  1, 'MacBook Pro 14인치',         2500000, 'Apple M3 Pro 칩, 18GB 통합 메모리, 512GB SSD, 14.2인치 Liquid Retina XDR 디스플레이',           NULL, 25, 1),
(2,  2, 'Galaxy S24 Ultra',           1550000, 'AI 기반 스마트폰, Snapdragon 8 Gen 3, 12GB RAM, 512GB, 6.8인치 Dynamic AMOLED 2X',              NULL, 40, 1),
(3,  4, '기계식 키보드 K8 Pro',         150000, 'Keychron K8 Pro, 핫스왑 가능, RGB 백라이트, 무선/유선 겸용, 갈축',                                NULL, 100, 1),

-- 노트북 카테고리
(4,  1, 'MacBook Air 15인치',         1900000, 'Apple M3 칩, 8GB 통합 메모리, 256GB SSD, 15.3인치 Liquid Retina 디스플레이',                     NULL, 30, 1),
(5,  1, 'LG gram 17',                1850000, 'Intel Core Ultra 7, 16GB RAM, 512GB SSD, 17인치 WQXGA IPS, 1350g 초경량',                       NULL, 15, 1),
(6,  1, 'Galaxy Book4 Pro',          1750000, 'Intel Core Ultra 7, 16GB RAM, 512GB SSD, 16인치 Dynamic AMOLED 2X, Galaxy AI',                  NULL, 20, 1),

-- 스마트폰 카테고리
(7,  2, 'iPhone 15 Pro Max',         1900000, 'A17 Pro 칩, 256GB, 6.7인치 Super Retina XDR, 티타늄 디자인, USB-C',                              NULL, 35, 1),
(8,  2, 'Galaxy Z Fold5',            2100000, '7.6인치 메인 디스플레이, Snapdragon 8 Gen 2, 12GB RAM, 512GB, 접이식',                            NULL, 10, 1),
(9,  2, 'Galaxy Z Flip5',            1350000, '6.7인치 메인 디스플레이, 3.4인치 커버, Snapdragon 8 Gen 2, 256GB',                                NULL, 20, 1),

-- 태블릿 카테고리
(10, 3, 'iPad Pro 12.9인치',          1729000, 'M2 칩, 256GB, Liquid Retina XDR 디스플레이, Face ID, Thunderbolt',                               NULL, 18, 1),
(11, 3, 'Galaxy Tab S9 Ultra',       1599000, '14.6인치 Dynamic AMOLED 2X, Snapdragon 8 Gen 2, 12GB RAM, 256GB, S Pen 포함',                   NULL, 12, 1),
(12, 3, 'iPad Air',                   929000, 'M1 칩, 64GB, 10.9인치 Liquid Retina 디스플레이, Touch ID',                                       NULL, 50, 1),

-- 주변기기 카테고리
(13, 4, 'MX Master 3S 마우스',         129000, 'Logitech 플래그십 무선 마우스, 8K DPI, MagSpeed 스크롤, USB-C 충전',                              NULL, 80, 1),
(14, 4, 'LG 울트라파인 27인치 모니터',    550000, '27UN880, 4K UHD IPS, HDR10, USB-C 원 케이블, Ergo 스탠드',                                       NULL, 15, 1),
(15, 4, 'Samsung 34인치 커브드 모니터',   650000, 'S34C500, WQHD VA 패널, 1000R 커브, 100Hz, USB-C 65W 충전',                                     NULL, 10, 1),

-- 오디오 카테고리
(16, 5, 'AirPods Pro 2세대',           359000, 'Apple H2 칩, 적응형 오디오, USB-C, 액티브 노이즈 캔슬링, 6시간 배터리',                            NULL, 60, 1),
(17, 5, 'Galaxy Buds2 Pro',           239000, '삼성 하이파이 무선 이어버드, 24bit Hi-Fi 360 오디오, ANC, IPX7 방수',                               NULL, 45, 1),
(18, 5, 'Sony WH-1000XM5',           429000, '업계 최고 수준 노이즈 캔슬링 헤드폰, 30시간 배터리, 멀티포인트 연결',                                 NULL, 25, 1),

-- 웨어러블 카테고리
(19, 6, 'Apple Watch Ultra 2',        1249000, '49mm 티타늄 케이스, GPS + Cellular, 수심 40m 방수, 최대 72시간 배터리',                            NULL, 8, 1),
(20, 6, 'Galaxy Watch6 Classic',       499000, '47mm, 회전 베젤, Wear OS, 심전도/혈압 측정, 사파이어 크리스탈',                                     NULL, 30, 1);

-- ============================================================
-- 3. 회원 데이터 (테스트용)
-- ============================================================
INSERT INTO member (member_id, email, password, name, phone, address) VALUES
(1, 'hong@example.com',   SHA2('password123', 256), '홍길동', '010-1234-5678', '서울시 강남구 테헤란로 123'),
(2, 'kim@example.com',    SHA2('password456', 256), '김영희', '010-9876-5432', '서울시 서초구 반포대로 45'),
(3, 'lee@example.com',    SHA2('test1234',    256), '이철수', '010-5555-6666', '경기도 성남시 분당구 판교로 256'),
(4, 'park@example.com',   SHA2('secure789',   256), '박지민', '010-7777-8888', '부산시 해운대구 센텀중앙로 90'),
(5, 'choi@example.com',   SHA2('mypass000',   256), '최수현', '010-3333-4444', '대구시 수성구 달구벌대로 567');

-- ============================================================
-- 4. 주문 데이터 (테스트용)
-- ============================================================
INSERT INTO orders (order_id, member_id, order_no, total_amount, status, receiver_name, receiver_phone, shipping_addr, ordered_at) VALUES
(1, 1, 'ORD-20260501-0001', 2650000, 'DELIVERED',  '홍길동', '010-1234-5678', '서울시 강남구 테헤란로 123',     '2026-05-01 10:30:00'),
(2, 1, 'ORD-20260503-0002', 1550000, 'SHIPPED',    '홍길동', '010-1234-5678', '서울시 강남구 테헤란로 123',     '2026-05-03 14:20:00'),
(3, 2, 'ORD-20260504-0003', 2259000, 'PAID',       '김영희', '010-9876-5432', '서울시 서초구 반포대로 45',      '2026-05-04 09:15:00'),
(4, 3, 'ORD-20260505-0004', 1900000, 'ORDERED',    '이철수', '010-5555-6666', '경기도 성남시 분당구 판교로 256', '2026-05-05 16:45:00'),
(5, 2, 'ORD-20260506-0005',  579000, 'CANCELLED',  '김영희', '010-9876-5432', '서울시 서초구 반포대로 45',      '2026-05-06 11:00:00');

-- ============================================================
-- 5. 주문 상세 데이터
-- ============================================================
INSERT INTO order_item (order_item_id, order_id, product_id, quantity, unit_price) VALUES
-- 주문1: MacBook Pro + 키보드
(1, 1, 1, 1, 2500000),
(2, 1, 3, 1,  150000),

-- 주문2: Galaxy S24 Ultra
(3, 2, 2, 1, 1550000),

-- 주문3: iPad Pro + Sony 헤드폰 + Galaxy Watch6 (조합 주문)
(4, 3, 10, 1, 1729000),
(5, 3, 20, 1,  499000),
-- (소계 오차 조정: 주문의 total_amount 참조 — 할인/쿠폰 시나리오 등은 추후 확장)

-- 주문4: MacBook Air 15인치
(6, 4, 4, 1, 1900000),

-- 주문5 (취소): AirPods + MX Master 마우스 → 취소됨
(7, 5, 16, 1,  359000),
(8, 5, 13, 1,  129000);

-- ============================================================
-- 유용한 확인 쿼리
-- ============================================================

-- 카테고리별 상품 수 확인
-- SELECT c.name AS category, COUNT(p.product_id) AS product_count
-- FROM category c
-- LEFT JOIN product p ON c.category_id = p.category_id
-- GROUP BY c.category_id, c.name
-- ORDER BY c.display_order;

-- 전체 상품 목록 (카테고리 포함)
-- SELECT p.product_id, c.name AS category, p.name, p.price, p.stock, p.is_active
-- FROM product p
-- LEFT JOIN category c ON p.category_id = c.category_id
-- ORDER BY p.product_id;

-- 회원별 주문 요약
-- SELECT m.name, COUNT(o.order_id) AS order_count, SUM(o.total_amount) AS total_spent
-- FROM member m
-- LEFT JOIN orders o ON m.member_id = o.member_id
-- GROUP BY m.member_id, m.name;
