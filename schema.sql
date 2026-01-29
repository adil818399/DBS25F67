CREATE VIEW available_rooms AS
SELECT room_number FROM rooms WHERE is_available = TRUE;

CREATE VIEW occupied_rooms AS
SELECT room_number FROM rooms WHERE is_available = FALSE;

CREATE VIEW guest_bookings AS
SELECT g.name, r.reservation_id
FROM guests g JOIN reservations r ON g.guest_id = r.guest_id;

CREATE VIEW total_revenue AS
SELECT SUM(total_amount) AS revenue FROM invoices;

CREATE VIEW service_usage AS
SELECT s.service_name, COUNT(*) usage_count
FROM reservation_services rs JOIN services s
ON rs.service_id = s.service_id
GROUP BY s.service_name;


DELIMITER //
CREATE PROCEDURE book_room(
    IN g_id INT,
    IN r_id INT,
    IN cin DATE,
    IN cout DATE
)
BEGIN
    START TRANSACTION;
    INSERT INTO reservations (guest_id, room_id, check_in, check_out, status)
    VALUES (g_id, r_id, cin, cout, 'Booked');

    UPDATE rooms SET is_available = FALSE WHERE room_id = r_id;
    COMMIT;
END //
DELIMITER ;





CREATE TRIGGER reservation_audit
AFTER INSERT ON reservations
FOR EACH ROW
INSERT INTO audit_trail (table_name, action)
VALUES ('reservations','INSERT');

CREATE TRIGGER room_status_log
AFTER UPDATE ON rooms
FOR EACH ROW
INSERT INTO logs (message)
VALUES ('Room availability updated');



DELIMITER //

CREATE PROCEDURE checkout_room(IN res_id INT)
BEGIN
    UPDATE reservations
    SET status = 'CheckedOut'
    WHERE reservation_id = res_id;
END //

DELIMITER ;







DELIMITER //

CREATE PROCEDURE generateview_staff_listrolenamephonesp_book_roomsp_generate_invoicesp_checkout_guest_invoice(
    IN res_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    INSERT INTO invoices (reservation_id, total_amount, invoice_date)
    VALUES (res_id, amount, CURDATE());
END //

DELIMITER ;
