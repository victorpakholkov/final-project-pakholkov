-- tables
-- Table: INSTRUMENTS
CREATE TABLE IF NOT EXISTS INSTRUMENTS (
    instrument_id int PRIMARY KEY,
    instrument_type varchar(255) NOT NULL,
    price_per_day float NOT NULL,
    days_between_inspections int,
    last_inspection date
);
-- Table: CLIENTS
CREATE TABLE IF NOT EXISTS CLIENTS (
    client_id int PRIMARY KEY,
    client_name varchar(255),
    client_address varchar(255),
    phone_number varchar(255)
);
-- Table: RENT
CREATE TABLE IF NOT EXISTS RENT (
    client_id  int REFERENCES CLIENTS(client_id),
    instrument_id int REFERENCES INSTRUMENTS(instrument_id),
    date_of_beginning date NOT NULL DEFAULT CURRENT_DATE,
    stated_days int,
    is_returned boolean NOT NULL,
    is_overdue boolean,
    days_overdue int
);
-- Populate tables with test data
-- INSTRUMENTS
INSERT INTO INSTRUMENTS VALUES (123, 'Drum', 13.2, 3, '9/11/2024');
INSERT INTO INSTRUMENTS VALUES (153, 'Guitar', 19, 2, '9/9/2024');
INSERT INTO INSTRUMENTS VALUES (243, 'Piano', 200, 10, '9/10/2024');
INSERT INTO INSTRUMENTS VALUES (653, 'Drum', 14.2, 5, '9/11/2024');
INSERT INTO INSTRUMENTS VALUES (343, 'Guitar', 16.5, 3, '9/6/2024');
INSERT INTO INSTRUMENTS VALUES (555, 'Piano', 140.25, 4, '9/5/2024');
INSERT INTO INSTRUMENTS VALUES (777, 'Flute', 72, 14, '9/3/2024');
INSERT INTO INSTRUMENTS VALUES (999, 'Flute', 28.8, 7, '9/10/2024');
INSERT INTO INSTRUMENTS VALUES (155, 'Drum', 15.5, 5, '9/7/2024');
INSERT INTO INSTRUMENTS VALUES (23, 'Guitar', 17, 5, '9/11/2024');
INSERT INTO INSTRUMENTS VALUES (989, 'Guitar', 21.5, 4, '9/11/2024');
INSERT INTO INSTRUMENTS VALUES (988, 'Piano', 178, 12, '9/6/2024');
INSERT INTO INSTRUMENTS VALUES (986, 'Flute', 3.7, 8, '9/1/2024');
INSERT INTO INSTRUMENTS VALUES (5432, 'Drum', 13.2, 6, '9/4/2024');
INSERT INTO INSTRUMENTS VALUES (1452, 'Guitar', 18.2, 2, '9/3/2024');
INSERT INTO INSTRUMENTS VALUES (4, 'Guitar', 15, 3, '9/10/2024');
INSERT INTO INSTRUMENTS VALUES (1234, 'Flute', 8.1, 8, '9/1/2024');
INSERT INTO INSTRUMENTS VALUES (911, 'Piano', 165, 10, '9/11/2024');
INSERT INTO INSTRUMENTS VALUES (400, 'Drum', 22.4, 3, '9/12/2024');
-- CLIENTS
INSERT INTO CLIENTS VALUES (45631, 'Ivanov Ivan Ivanovich', 'St. Petersburg, ul. Stroiteley, d. 53, kv. 13', '+79111112222');
INSERT INTO CLIENTS VALUES (45632, 'Petrov Petr Petrovich', 'St. Petersburg, ul. Kopateley, d. 55, kv. 23', '+79111112223');
INSERT INTO CLIENTS VALUES (45633, 'Sidorov Sidor Sidorovich', 'St. Petersburg, ul. Plotnikov, d. 51, kv. 16', '+79111112224');
INSERT INTO CLIENTS VALUES (45634, 'Alexeev Alexey Alexeevich', 'St. Petersburg, ul. Malyarov, d. 22, kv. 22', '+79111112225');
INSERT INTO CLIENTS VALUES (45635, 'Alexandrov Alexandr Alexandrovich', 'St. Petersburg, ul. Zavhozov, d. 57, kv. 11', '+79111112226');
INSERT INTO CLIENTS VALUES (45636, 'Danilov Danil Danilovich', 'St. Petersburg, ul. Kameshcikov, d. 1, kv. 99', '+79111112227');
INSERT INTO CLIENTS VALUES (45637, 'Kirillov Kirill Kirillovich', 'St. Petersburg, ul. Plitochnikov, d. 123, kv. 132', '+79111112228');
-- RENT
INSERT INTO RENT VALUES (45633, 777, '8/21/2024', 3, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45631, 123, '8/23/2024', 1, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45635, 653, '8/23/2024', 5, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45633, 555, '8/25/2024', 7, TRUE, TRUE, 3);
INSERT INTO RENT VALUES (45635, 999, '8/26/2024', 2, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45637, 23, '8/26/2024', 1, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45632, 5432, '8/27/2024', 1, TRUE, FALSE, 2);
INSERT INTO RENT VALUES (45632, 1234, '8/27/2024', 1, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45636, 911, '8/28/2024', 4, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45631, 400, '8/29/2024', 5, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45633, 1452, '8/29/2024', 2, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45634, 1234, '9/1/2024', 1, TRUE, TRUE, 1);
INSERT INTO RENT VALUES (45635, 999, '9/3/2024', 1, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45636, 23, '9/3/2024', 3, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45637, 777, '9/4/2024', 4, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45631, 400, '9/5/2024', 2, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45632, 777, '9/7/2024', 1, TRUE, TRUE, 3);
INSERT INTO RENT VALUES (45633, 4, '9/8/2024', 1, TRUE, TRUE, 2);
INSERT INTO RENT VALUES (45634, 653, '9/9/2024', 6, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45635, 988, '9/10/2024', 5, TRUE, FALSE, 0);
INSERT INTO RENT VALUES (45636, 989, '9/5/2024', 6, FALSE, TRUE, 1);
INSERT INTO RENT VALUES (45637, 343, '9/12/2024', 5, FALSE, FALSE, 0);
INSERT INTO RENT VALUES (45631, 1234, '9/12/2024', 2, FALSE, FALSE, 0);
INSERT INTO RENT VALUES (45632, 653, '9/9/2024', 1, FALSE, TRUE, 3);
INSERT INTO RENT VALUES (45633, 777, '9/10/2024', 1, FALSE, TRUE, 2);
INSERT INTO RENT VALUES (45634, 400, '9/11/2024', 1, FALSE, FALSE, 0);
INSERT INTO RENT VALUES (45635, 153, '9/11/2024', 3, FALSE, FALSE, 0);
INSERT INTO RENT VALUES (45636, 400, '9/6/2024', 5, FALSE, TRUE, 1);
INSERT INTO RENT VALUES (45637, 123, '9/12/2024', 6, FALSE, FALSE, 0);
INSERT INTO RENT VALUES (45631, 555, '9/3/2024', 7, FALSE, TRUE, 2);

