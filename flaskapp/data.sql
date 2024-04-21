-- https://www.programiz.com/sql/insert-into

-- Add SQL inserts here
INSERT INTO "foodbank" ("username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined")
VALUES 
    ('fb_user84134', 'Dictum Limited', 'Gavin Olsen', '(805) 811-5218', '1721 Nascetur Av.', 'curabitur.sed@google.edu', 'New York', 'NY', '10001', '2024-04-13'),
    ('fb_user44204', 'Nunc PC', 'Omar Compton', '(495) 487-2527', 'P.O. Box 394, 9121 Adipiscing Rd.', 'tristique.senectus@outlook.couk', 'Los Angeles', 'CA', '90001', '2025-03-23'),
    ('fb_user14789', 'Libero Est LLP', 'Ciara Hopper', '(305) 451-8544', '8525 Praesent Road', 'rutrum@icloud.com', 'Chicago', 'IL', '60601', '2023-10-31'),
    ('fb_user90226', 'Arcu Incorporated', 'Savannah Brennan', '1-975-967-4234', '891-8625 Eleifend Street', 'sed.libero.proin@aol.edu', 'Houston', 'TX', '77001', '2023-11-30'),
    ('fb_user95899', 'Lacus Ut Ltd', 'Eaton Cote', '(628) 573-3280', '851-4808 Viverra. Avenue', 'nulla.integer@yahoo.couk', 'Phoenix', 'AZ', '85001', '2023-07-30'),
    ('fb_user49917', 'Nullam Suscipit Est Company', 'Preston Melton', '(691) 589-7369', '478-8401 Lorem, Rd.', 'nec@google.org', 'Philadelphia', 'PA', '19019', '2023-12-24'),
    ('fb_user60551', 'Eu Eleifend Corporation', 'Sonia Petty', '(777) 451-0807', '685-5050 Etiam Ave', 'nec.metus@google.couk', 'San Antonio', 'TX', '78201', '2023-08-18'),
    ('fb_user71474', 'Ligula Tortor Limited', 'Pandora Landry', '1-921-357-7113', '945-2142 Mauris Av.', 'sapien.cursus@hotmail.edu', 'San Diego', 'CA', '92101', '2024-09-30'),
    ('fb_user58335', 'Molestie Tortor PC', 'Valentine Figueroa', '1-446-684-2218', 'P.O. Box 650, 4463 Feugiat Road', 'ornare.facilisis@protonmail.edu', 'Dallas', 'TX', '75201', '2023-09-25'),
    ('fb_user85300', 'Est Mollis Industries', 'Kaitlin Serrano', '(528) 516-5768', '594-8395 Est St.', 'nonummy.ultricies@outlook.net', 'San Jose', 'CA', '95101', '2023-11-24');

-- Insert data into "donor" table
INSERT INTO "donor" ("username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined", "type_of_org", "subscribed")
VALUES
    ('jesse_lopez', 'Turpis Ltd', 'Jesse Lopez', '(805) 811-5218', 'P.O. Box 966 174 Nec St.', 'eu.turpis@hotmail.net', 'New York', 'NY', '10001', '2023-05-02', 'Individual', 'Yes'),
    ('angelica_barnes', 'angelica_barnes', 'Angelica Barnes', '(495) 487-2527', 'Ap #897-4039 Diam. Rd.', 'donec.sollicitudin@outlook.ca', 'Los Angeles', 'CA', '90001', '2024-02-24', 'Individual', 'No'),
    ('naida_cash', 'Gravida PC', 'Naida Cash', '(284) 430-8637', '176-7009 Et, Road', 'elit.erat@yahoo.co.uk', 'Chicago', 'IL', '60601', '2023-04-26', 'Individual', 'Yes'),
    ('boris_hines', 'Magna Suspendisse Associates', 'Boris Hines', '(628) 573-3280', 'Ap #680-6297 Ac Av.', 'donec.tincidunt@google.net', 'Houston', 'TX', '77001', '2023-05-19', 'Organisation', 'No'),
    ('hedy_frye', 'Dictum Placerat PC', 'Hedy Frye', '(691) 589-7369', '478-8401 Lorem, Rd.', 'nec@google.org', 'Philadelphia', 'PA', '19019', '2023-12-24', 'Individual', 'No'),
    ('hiram_reid', 'Tellus Sem LLC', 'Hiram Reid', '(232) 837-8646', 'P.O. Box 370, 9694 Purus, Ave', 'velit.eget@yahoo.ca', 'Philadelphia', 'PA', '19019', '2024-06-02', 'Organisation', 'No'),
    ('elton_melendez', 'Ipsum Porta Elit PC', 'Elton Melendez', '(187) 127-8675', 'P.O. Box 477, 1799 Hendrerit Rd.', 'gravida@aol.co.uk', 'San Antonio', 'TX', '78201', '2024-06-19', 'Organisation', 'No'),
    ('dai_merrill', 'Ac Mi PC', 'Dai Merrill', '(586) 475-8805', '828-5700 Turpis. Ave', 'vitae@protonmail.co.uk', 'San Diego', 'CA', '92101', '2024-06-19', 'Individual', 'No'),
    ('aspen_weaver', 'Hendrerit Consectetuer Cursus PC', 'Aspen Weaver', '(466) 332-1228', '859-2853 Nec, Rd.', 'cras.dolor@protonmail.net', 'Dallas', 'TX', '75201', '2023-06-13', 'Organisation', 'No'),
    ('lael_skinner', 'Metus Aliquam Limited', 'Lael Skinner', '(658) 111-7564', 'Ap #401-251 Mauris Street', 'molestie.dapibus@google.ca', 'San Jose', 'CA', '95101', '2024-04-13', 'Individual', 'No');


-- Insert data into "documentation" table

-- Insert data into "donation" table
INSERT INTO "donation" ("type_of_donation", "quantity", "date_donated")
VALUES
    ('pies', 3, '2023-12-23'),
    ('sandwiches', 0, '2023-07-03'),
    ('pies', 3, '2023-10-04'),
    ('pasta', 10, '2024-08-26'),
    ('sandwiches', 5, '2023-11-11'),
    ('soups', 9, '2023-10-12'),
    ('noodles', 6, '2024-12-08'),
    ('noodles', 6, '2023-09-11'),
    ('pies', 9, '2023-12-14'),
    ('sandwiches', 8, '2024-08-04'); 

-- Insert data into "fb_donation_request" table
INSERT INTO "fb_donation_request" ("username","name_of_org", "item", "quantity","status", "date_requested")
VALUES
    ('Dictum Limited','fb_user84134','shoes', 3, 'pending', '2021-12-01'),
    ('Libero Est LLP','fb_user14789','apples', 50, 'pending', '2022-11-01');

-- Insert data into "do_donation_request" table
INSERT INTO "do_donation_request" ("name_of_org","username", "item", "quantity", "status", "date_requested")
VALUES
    ('Turpis Ltd','jesse_lopez','hats', 5, 'pending', '2023-11-26'),
    ('Turpis Ltd','jesse_lopez','oranges', 9, 'pending', '2024-02-01');

INSERT INTO "documentation" ("type_of_documentation", "date_obtained", "expiration_date")
VALUES
    ('Finances', '2029-05-08', '2023-06-23'),
    ('Licenses', '2027-06-21', '2024-07-08'),
    ('Quality Assurance', '2033-07-13', '2024-09-18'), -- Changed FB_ID to match foodbank FB_ID
    ('Licenses', '2026-04-30', '2023-11-24'), -- Changed FB_ID to match foodbank FB_ID
    ('Quality Assurance', '2027-04-14', '2023-06-17'),
    ('Licenses', '2033-06-19', '2024-02-20'),
    ('Finances', '2025-10-11', '2023-09-14'), -- Changed FB_ID to match foodbank FB_ID
    ('Licenses', '2029-01-08', '2024-08-14'),
    ('Quality Assurance', '2028-04-24', '2023-10-23'),
    ('Finances', '2024-09-02', '2025-01-07'), -- Changed FB_ID to match foodbank FB_ID
    ('Quality Assurance', '2028-04-24', '2023-10-23');

    

