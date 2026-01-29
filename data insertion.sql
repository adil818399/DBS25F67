INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'Admin'),
('staff1', 'staff123', 'Staff');


INSERT INTO employees (name, phone, user_id) VALUES
('Ali Hassan', '03001234567', 1),
('Sara Khan', '03111234567', 2);



INSERT INTO guests (name, phone, email) VALUES
('Ahmed Raza', '03211234567', 'ahmed@gmail.com'),
('Usman Ali', '03331234567', 'usman@gmail.com'),
('Fatima Noor', '03451234567', 'fatima@gmail.com');



INSERT INTO room_types (type_name, price_per_night) VALUES
('Single', 100),
('Double', 180),
('Suite', 300);



INSERT INTO invoices VALUES
(NULL, 1, 200, '2026-01-12');


INSERT INTO payments VALUES
(NULL, 1, 'Card', 200, '2026-01-12');


INSERT INTO services VALUES
(NULL, 'Laundry', 20),
(NULL, 'Room Service', 50),
(NULL, 'Airport Pickup', 100);



INSERT INTO reservation_services VALUES
(NULL, 1, 1),
(NULL, 1, 2);



INSERT INTO logs (message, log_time) VALUES
('User admin logged in', '2026-01-10 09:00:00'),
('Room 101 booked', '2026-01-10 09:15:00'),
('Guest checked out from Room 101', '2026-01-12 12:00:00');



INSERT INTO audit_trail (table_name, action, action_time) VALUES
('reservations', 'INSERT', '2026-01-10 09:15:00'),
('payments', 'INSERT', '2026-01-12 11:35:00'),
('rooms', 'UPDATE', '2026-01-12 12:01:00');



INSERT INTO hotel_info VALUES
(1, 'Pearl Continental', 'Lahore, Pakistan');
INSERT INTO feedback (guest_id, comments, rating) VALUES
(1, 'Very good service and clean rooms', 5),
(2, 'Room was comfortable', 4);


INSERT INTO maintenance (room_id, issue, status) VALUES
(2, 'Air conditioner not working', 'Pending'),
(4, 'Bathroom water leakage', 'Resolved');
