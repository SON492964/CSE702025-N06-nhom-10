-- Tạo database nếu chưa có
CREATE DATABASE IF NOT EXISTS coffeeshop;
USE coffeeshop;

-- Bảng danh mục sản phẩm (Cà phê, Trà, Bánh...)
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Bảng sản phẩm
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Bảng khách hàng liên hệ
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng thông tin khách đặt hàng (giả lập)
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT
);

-- Bảng đơn hàng
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Chi tiết đơn hàng
CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Dữ liệu mẫu: danh mục
INSERT INTO categories (name) VALUES
('Cà phê'), ('Trà'), ('Bánh ngọt');

-- Dữ liệu mẫu: sản phẩm
INSERT INTO products (name, price, category_id) VALUES
('Cà phê đen', 25000, 1),
('Latte', 35000, 1),
('Trà đào cam sả', 30000, 2),
('Matcha sữa đá', 35000, 2),
('Bánh quy yến mạch', 20000, 3);

-- Dữ liệu mẫu: liên hệ
INSERT INTO contacts (name, email, message) VALUES
('Nguyễn Văn A', 'a@example.com', 'Cà phê của shop rất ngon!');

-- Dữ liệu mẫu: khách hàng & đơn hàng
INSERT INTO customers (full_name, email, phone, address) VALUES
('Trần Hữu Sơn', 'son@example.com', '0909123456', 'HCM');

INSERT INTO orders (customer_id, total_price) VALUES
(1, 55000);

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1);
