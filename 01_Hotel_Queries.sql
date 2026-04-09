//Question 1 Last booked room
SELECT user_id,room_no
FROM bookings
WHERE booking_date = (SELECT MAX(booking_date) FROM bookings b2 WHERE b2.user_id = bookings.user_id);

//Question 2 total bookings per room 
SELECT b.booking_id, SUM(bc.item_quantity * i.item_rate) As total_bill
FROM bookings b,booking_commercials bc, items i
WHERE b.booking_id = bc.booking_id AND bc.item_id = i.item_id AND MONTH(b.booking_date) = 11
AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;

//Question 3 (bILL > 1000)
SELECT bill_id, SUM(item_quantity * item_rate) AS total
FROM booking_commercials bc, items i
WHERE bc.item_id = i.item_id
AND MONTH(bill_date) = 10
GROUP BY bill_id
HAVING total > 1000;

//Q4 Most ordered 
SELECT item_id, SUM(item_quantity) AS total
FROM booking_commercials
GROUP BY item_id
ORDER BY total DESC
LIMIT 1;

//Q5 2nd highest bill 
SELECT bill_id, SUM(item_quantity * item_rate) AS total
FROM booking_commercials bc, items i
WHERE bc.item_id = i.item_id
GROUP BY bill_id
ORDER BY total DESC
LIMIT 1 OFFSET 1;