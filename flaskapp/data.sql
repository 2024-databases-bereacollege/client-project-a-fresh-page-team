-- https://www.programiz.com/sql/insert-into

-- Add SQL inserts here
INSERT INTO "foodbank" ("FB_ID","username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined")
VALUES 
    (84134, 'fb_user84134', 'Dictum Limited', 'Gavin Olsen', '(805) 811-5218', '1721 Nascetur Av.', 'curabitur.sed@google.edu', 'New York', 'NY', '10001', '2024-04-13'),
    (44204, 'fb_user44204', 'Nunc PC', 'Omar Compton', '(495) 487-2527', 'P.O. Box 394, 9121 Adipiscing Rd.', 'tristique.senectus@outlook.couk', 'Los Angeles', 'CA', '90001', '2025-03-23'),
    (14789, 'fb_user14789', 'Libero Est LLP', 'Ciara Hopper', '(305) 451-8544', '8525 Praesent Road', 'rutrum@icloud.com', 'Chicago', 'IL', '60601', '2023-10-31'),
    (90226, 'fb_user90226', 'Arcu Incorporated', 'Savannah Brennan', '1-975-967-4234', '891-8625 Eleifend Street', 'sed.libero.proin@aol.edu', 'Houston', 'TX', '77001', '2023-11-30'),
    (95899, 'fb_user95899', 'Lacus Ut Ltd', 'Eaton Cote', '(628) 573-3280', '851-4808 Viverra. Avenue', 'nulla.integer@yahoo.couk', 'Phoenix', 'AZ', '85001', '2023-07-30'),
    (49917, 'fb_user49917', 'Nullam Suscipit Est Company', 'Preston Melton', '(691) 589-7369', '478-8401 Lorem, Rd.', 'nec@google.org', 'Philadelphia', 'PA', '19019', '2023-12-24'),
    (60551, 'fb_user60551', 'Eu Eleifend Corporation', 'Sonia Petty', '(777) 451-0807', '685-5050 Etiam Ave', 'nec.metus@google.couk', 'San Antonio', 'TX', '78201', '2023-08-18'),
    (71474, 'fb_user71474', 'Ligula Tortor Limited', 'Pandora Landry', '1-921-357-7113', '945-2142 Mauris Av.', 'sapien.cursus@hotmail.edu', 'San Diego', 'CA', '92101', '2024-09-30'),
    (31557, 'fb_user58335', 'Molestie Tortor PC', 'Valentine Figueroa', '1-446-684-2218', 'P.O. Box 650, 4463 Feugiat Road', 'ornare.facilisis@protonmail.edu', 'Dallas', 'TX', '75201', '2023-09-25'),
    (18607, 'fb_user85300', 'Est Mollis Industries', 'Kaitlin Serrano', '(528) 516-5768', '594-8395 Est St.', 'nonummy.ultricies@outlook.net', 'San Jose', 'CA', '95101', '2023-11-24');
-- Insert data into "donor" table
INSERT INTO "donor" ("DO_ID","username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined", "type_of_org", "subscribed")
VALUES
    (55214, 'jesse_lopez', 'Turpis Ltd', 'Jesse Lopez', '1-510-766-9562', 'P.O. Box 966 174 Nec St.', 'eu.turpis@hotmail.net', 'New York', 'NY', '10001', '2023-05-02', 'Individual', 'Yes'),
    (36580, 'angelica_barnes', 'angelica_barnes', 'Angelica Barnes', '1-644-561-3419', 'Ap #897-4039 Diam. Rd.', 'donec.sollicitudin@outlook.ca', 'Los Angeles', 'CA', '90001', '2024-02-24', 'Individual', 'No'),
    (93180, 'naida_cash', 'Gravida PC', 'Naida Cash', '(284) 430-8637', '176-7009 Et, Road', 'elit.erat@yahoo.co.uk', 'Chicago', 'IL', '60601', '2023-04-26', 'Individual', 'Yes'),
    (44241, 'boris_hines', 'Magna Suspendisse Associates', 'Boris Hines', '1-684-837-5382', 'Ap #680-6297 Ac Av.', 'donec.tincidunt@google.net', 'Houston', 'TX', '77001', '2023-05-19', 'Organisation', 'No'),
    (79989, 'hedy_frye', 'Dictum Placerat PC', 'Hedy Frye', '1-251-352-9093', '219-3578 Erat. Ave', 'donec.elementum@outlook.com', 'Phoenix', 'AZ', '85001', '2024-05-26', 'Individual', 'Yes'),
    (60159, 'hiram_reid', 'Tellus Sem LLC', 'Hiram Reid', '(232) 837-8646', 'P.O. Box 370, 9694 Purus, Ave', 'velit.eget@yahoo.ca', 'Philadelphia', 'PA', '19019', '2024-06-02', 'Organisation', 'No'),
    (63353, 'elton_melendez', 'Ipsum Porta Elit PC', 'Elton Melendez', '1-187-127-8675', 'P.O. Box 477, 1799 Hendrerit Rd.', 'gravida@aol.co.uk', 'San Antonio', 'TX', '78201', '2024-06-19', 'Organisation', 'No'),
    (85314, 'dai_merrill', 'Ac Mi PC', 'Dai Merrill', '1-586-475-8805', '828-5700 Turpis. Ave', 'vitae@protonmail.co.uk', 'San Diego', 'CA', '92101', '2024-06-19', 'Individual', 'No'),
    (52309, 'aspen_weaver', 'Hendrerit Consectetuer Cursus PC', 'Aspen Weaver', '(466) 332-1228', '859-2853 Nec, Rd.', 'cras.dolor@protonmail.net', 'Dallas', 'TX', '75201', '2023-06-13', 'Organisation', 'No'),
    (35740, 'lael_skinner', 'Metus Aliquam Limited', 'Lael Skinner', '1-658-111-7564', 'Ap #401-251 Mauris Street', 'molestie.dapibus@google.ca', 'San Jose', 'CA', '95101', '2024-04-13', 'Individual', 'No');

-- Insert data into "documentation" table

-- Insert data into "donation" table
-- Insert data into "donation" table
INSERT INTO "donation" ("DN_ID", "DO_ID", "FB_ID", "type_of_donation", "quantity", "date_donated")
VALUES
    (10001, 55214, 90226, 'pies', 3, '2023-12-23'),
    (10002, 44241, 49917, 'sandwiches', 5, '2023-07-03'),
    (10003, 44241, 71474, 'pies', 8, '2023-10-04'),
    (10004, 79989, 31557, 'pasta', 12, '2024-08-26'),
    (10005, 60159, 18607, 'sandwiches', 15, '2023-11-11'),
    (10006, 63353, 14789, 'soups', 20, '2023-10-12'),
    (10007, 85314, 60551, 'noodles', 25, '2024-12-08'),
    (10008, 79989, 95899, 'noodles', 30, '2023-09-11'),
    (10009, 44241, 18607, 'pies', 10, '2023-12-14'),
    (10010, 52309, 18607, 'sandwiches', 18, '2024-08-04');

-- Insert data into "fb_donation_request" table
INSERT INTO "fb_donation_request" ("FB_ID", "DO_ID", "fbusername", "dousername", "name_of_org", "item", "quantity", "status", "date_requested")
VALUES
    (84134, 55214, 'fb_user84134','jesse_lopez', 'Dictum Limited', 'shoes', 3, 'pending', '2021-12-01'),
    (14789, 55214, 'fb_user14789','jesse_lopez', 'Libero Est LLP', 'apples', 50, 'pending', '2022-11-01');

-- Insert data into "do_donation_request" table
INSERT INTO "do_donation_request" ("DO_ID", "FB_ID", "name_of_org", "dusnm", "fusnm", "item", "quantity", "status", "date_requested")
VALUES
    (55214, 84134, 'Turpis Ltd', 'jesse_lopez','fb_user84134', 'hats', 5, 'pending', '2023-11-26'),
    (55214, 84134, 'Turpis Ltd', 'jesse_lopez','fb_user84134', 'oranges', 9, 'pending', '2024-02-01');

INSERT INTO "documentation" ("DOC_ID", "DO_ID", "FB_ID", "type_of_documentation", "date_obtained", "expiration_date")
VALUES
    (32128, 55214, null, 'Finances', '2029-05-08', '2023-06-23'),
    (69644, null, 44204, 'Licenses', '2027-06-21', '2024-07-08'),
    (25464, 79989, null, 'Quality Assurance', '2033-07-13', '2024-09-18'), -- Changed FB_ID to match foodbank FB_ID
    (70638, null, 31557, 'Licenses', '2026-04-30', '2023-11-24'), -- Changed FB_ID to match foodbank FB_ID
    (56902, 93180, null, 'Quality Assurance', '2027-04-14', '2023-06-17'),
    (13906, null, 60551, 'Licenses', '2033-06-19', '2024-02-20'),
    (65680, 85314, null, 'Finances', '2025-10-11', '2023-09-14'), -- Changed FB_ID to match foodbank FB_ID
    (11174, null, 18607, 'Licenses', '2029-01-08', '2024-08-14'),
    (66381, 52309, null, 'Quality Assurance', '2028-04-24', '2023-10-23'),
    (28244, null, 90226, 'Finances', '2024-09-02', '2025-01-07'), -- Changed FB_ID to match foodbank FB_ID
    (66388, 55214, null, 'Quality Assurance', '2028-04-24', '2023-10-23');