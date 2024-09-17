-- Имена клиентов вместе с описанием инструментов, которые они брали на прокат, и даты заказов
SELECT client_name, instrument_type, date_of_beginning FROM RENT JOIN CLIENTS ON RENT.client_id = CLIENTS.client_id JOIN INSTRUMENTS ON RENT.instrument_id = INSTRUMENTS.instrument_id ORDER BY date_of_beginning DESC;
-- Инструменты, которые пора проверить
SELECT instrument_id, instrument_type, last_inspection FROM INSTRUMENTS WHERE last_inspection + days_between_inspections <= CURRENT_DATE;
-- Все отданные барабаны
SELECT INSTRUMENTS.instrument_id, instrument_type FROM INSTRUMENTS JOIN RENT ON INSTRUMENTS.instrument_id = RENT.instrument_id WHERE is_returned = False AND INSTRUMENTS.instrument_type='Drum';
-- Все инструменты с дневной стоимостью проката между 10 и 20
SELECT instrument_id, instrument_type, price_per_day FROM INSTRUMENTS WHERE price_per_day BETWEEN 10 AND 20;
-- Вся информация об инструментах, которые когда-либо брали на прокат
SELECT * FROM INSTRUMENTS EXCEPT (SELECT INSTRUMENTS.* FROM INSTRUMENTS LEFT JOIN RENT ON INSTRUMENTS.instrument_id = RENT.instrument_id WHERE RENT.instrument_id IS NULL);
-- Вся информация о клиентах, которые ещё не вернули инструменты
SELECT CLIENTS.client_id, client_name, client_address, phone_number FROM CLIENTS JOIN RENT ON CLIENTS.client_id = RENT.client_id WHERE RENT.is_returned = False GROUP BY CLIENTS.client_id, client_name, client_address, phone_number;
--  Не отданные в прокат инструменты
SELECT INSTRUMENTS.instrument_id, INSTRUMENTS.instrument_type FROM RENT JOIN INSTRUMENTS ON RENT.instrument_id = INSTRUMENTS.instrument_id JOIN (SELECT instrument_id, MAX(date_of_beginning) AS max_date FROM RENT GROUP BY instrument_id) AS r2 on INSTRUMENTS.instrument_id = r2.instrument_id WHERE RENT.is_returned = False UNION (SELECT instrument_id, instrument_type FROM INSTRUMENTS EXCEPT (SELECT INSTRUMENTS.instrument_id, INSTRUMENTS.instrument_type FROM INSTRUMENTS JOIN RENT ON INSTRUMENTS.instrument_id = RENT.instrument_id));
-- Сумма заказов для каждого клиента
SELECT CLIENTS.client_id, CLIENTS.client_name, SUM(RENT.stated_days * INSTRUMENTS.price_per_day) + SUM(RENT.days_overdue::int * INSTRUMENTS.price_per_day) AS total_orders FROM RENT JOIN INSTRUMENTS ON RENT.instrument_id = INSTRUMENTS.instrument_id JOIN CLIENTS ON CLIENTS.client_id = RENT.client_id GROUP BY CLIENTS.client_id, CLIENTS.client_name;
-- Средняя выручка по каждому инструменту
SELECT INSTRUMENTS.instrument_id, INSTRUMENTS.instrument_type, (SUM(RENT.stated_days * INSTRUMENTS.price_per_day) + SUM(RENT.days_overdue::int * INSTRUMENTS.price_per_day))/(COUNT(RENT.client_id)) AS average_returns FROM INSTRUMENTS JOIN RENT ON INSTRUMENTS.instrument_id = RENT.instrument_id GROUP BY INSTRUMENTS.instrument_id, INSTRUMENTS.instrument_type;
-- Сколько раз каждый инструмент брали на прокат
SELECT COALESCE(RENT.instrument_id, INSTRUMENTS.instrument_id) AS instrument_id, INSTRUMENTS.instrument_type, COUNT(RENT.instrument_id) AS times_rented FROM INSTRUMENTS LEFT JOIN RENT ON INSTRUMENTS.instrument_id = RENT.instrument_id GROUP BY INSTRUMENTS.instrument_id, RENT.instrument_id, INSTRUMENTS.instrument_type;
