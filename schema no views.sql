CREATE DATABASE hotel_management_db;

USE hotel_management_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Admin','Staff') NOT NULL
);


CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);


CREATE TABLE room_types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE,
    price_per_night DECIMAL(10,2) CHECK (price_per_night > 0)
);


CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number INT UNIQUE,
    type_id INT,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (type_id) REFERENCES room_types(type_id)
);


CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    status ENUM('Booked','CheckedIn','CheckedOut'),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    CHECK (check_out > check_in)
);


CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    total_amount DECIMAL(10,2),
    invoice_date DATE,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);


CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_method ENUM('Cash','Card','Online'),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);


CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    price DECIMAL(10,2)
);


CREATE TABLE reservation_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    service_id INT,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);


CREATE TABLE logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE audit_trail (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    action VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE hotel_info (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT
);


CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    comments TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);


CREATE TABLE maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    issue TEXT,
    status ENUM('Pending','Resolved'),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

