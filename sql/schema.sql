-- ============================================================
-- Shop Database Schema (DDL)
-- Target: Amazon RDS for MySQL 8.x
-- Charset: utf8mb4 (emoji & 다국어 지원)
-- ============================================================

-- 데이터베이스 생성 (RDS에서 이미 생성한 경우 생략 가능)
CREATE DATABASE IF NOT EXISTS shopdb
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

USE shopdb;

-- ============================================================
-- 1. 카테고리 테이블
-- ============================================================
CREATE TABLE category (
    category_id   BIGINT       NOT NULL AUTO_INCREMENT,
    name          VARCHAR(100) NOT NULL COMMENT '카테고리명',
    description   VARCHAR(500) NULL     COMMENT '카테고리 설명',
    display_order INT          NOT NULL DEFAULT 0 COMMENT '표시 순서',
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='상품 카테고리';

-- ============================================================
-- 2. 상품 테이블
--    기존 Product 모델: id, name, price, description
--    DB 전환 시 카테고리, 이미지URL, 재고 등 확장
-- ============================================================
CREATE TABLE product (
    product_id    BIGINT         NOT NULL AUTO_INCREMENT,
    category_id   BIGINT         NULL     COMMENT '카테고리 FK',
    name          VARCHAR(200)   NOT NULL COMMENT '상품명',
    price         DECIMAL(12,0)  NOT NULL COMMENT '판매가 (원)',
    description   VARCHAR(2000)  NULL     COMMENT '상품 설명',
    image_url     VARCHAR(500)   NULL     COMMENT '상품 이미지 URL',
    stock         INT            NOT NULL DEFAULT 0  COMMENT '재고 수량',
    is_active     TINYINT(1)     NOT NULL DEFAULT 1  COMMENT '판매 여부 (1=판매중, 0=판매중지)',
    created_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id),
    INDEX idx_product_category (category_id),
    INDEX idx_product_active   (is_active),
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id) REFERENCES category (category_id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='상품 정보';

-- ============================================================
-- 3. 회원 테이블
--    향후 로그인/주문 기능 확장 대비
-- ============================================================
CREATE TABLE member (
    member_id     BIGINT       NOT NULL AUTO_INCREMENT,
    email         VARCHAR(255) NOT NULL COMMENT '이메일 (로그인 ID)',
    password      VARCHAR(255) NOT NULL COMMENT '비밀번호 (해시)',
    name          VARCHAR(100) NOT NULL COMMENT '회원명',
    phone         VARCHAR(20)  NULL     COMMENT '전화번호',
    address       VARCHAR(500) NULL     COMMENT '기본 배송지',
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id),
    UNIQUE INDEX uk_member_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='회원 정보';

-- ============================================================
-- 4. 주문 테이블
-- ============================================================
CREATE TABLE orders (
    order_id      BIGINT        NOT NULL AUTO_INCREMENT,
    member_id     BIGINT        NULL     COMMENT '주문 회원 FK (비회원 주문 시 NULL)',
    order_no      VARCHAR(30)   NOT NULL COMMENT '주문번호 (표시용)',
    total_amount  DECIMAL(15,0) NOT NULL COMMENT '총 결제금액',
    status        VARCHAR(20)   NOT NULL DEFAULT 'ORDERED' COMMENT '주문상태 (ORDERED/PAID/SHIPPED/DELIVERED/CANCELLED)',
    receiver_name VARCHAR(100)  NULL     COMMENT '수령인 이름',
    receiver_phone VARCHAR(20)  NULL     COMMENT '수령인 전화번호',
    shipping_addr VARCHAR(500)  NULL     COMMENT '배송 주소',
    ordered_at    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id),
    UNIQUE INDEX uk_order_no (order_no),
    INDEX idx_order_member (member_id),
    INDEX idx_order_status (status),
    CONSTRAINT fk_order_member
        FOREIGN KEY (member_id) REFERENCES member (member_id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='주문 정보';

-- ============================================================
-- 5. 주문 상세 테이블 (주문-상품 N:M)
-- ============================================================
CREATE TABLE order_item (
    order_item_id BIGINT        NOT NULL AUTO_INCREMENT,
    order_id      BIGINT        NOT NULL COMMENT '주문 FK',
    product_id    BIGINT        NOT NULL COMMENT '상품 FK',
    quantity      INT           NOT NULL COMMENT '주문 수량',
    unit_price    DECIMAL(12,0) NOT NULL COMMENT '주문 시 단가',
    created_at    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_item_id),
    INDEX idx_oi_order   (order_id),
    INDEX idx_oi_product (product_id),
    CONSTRAINT fk_oi_order
        FOREIGN KEY (order_id) REFERENCES orders (order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_oi_product
        FOREIGN KEY (product_id) REFERENCES product (product_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='주문 상세 항목';
