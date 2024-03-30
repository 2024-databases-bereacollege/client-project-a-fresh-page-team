-- https://www.programiz.com/sql/insert-into

-- Add SQL inserts here
INSERT INTO "foodbank" ("FB_ID", username, name_of_org, primary_contact_name, phone_num, address, email, date_joined)
VALUES 
    (84134, 'fb_user84134', 'Dictum Limited', 'Gavin Olsen', '(805) 811-5218', '1721 Nascetur Av.', 'curabitur.sed@google.edu', '2024-04-13'),
    (44204, 'fb_user44204', 'Nunc PC', 'Omar Compton', '(495) 487-2527', 'P.O. Box 394, 9121 Adipiscing Rd.', 'tristique.senectus@outlook.couk', '2025-03-23'),
    (14789, 'fb_user14789', 'Libero Est LLP', 'Ciara Hopper', '(305) 451-8544', '8525 Praesent Road', 'rutrum@icloud.com', '2023-10-31'),
    (90226, 'fb_user90226', 'Arcu Incorporated', 'Savannah Brennan', '1-975-967-4234', '891-8625 Eleifend Street', 'sed.libero.proin@aol.edu', '2023-11-30'),
    (95899, 'fb_user95899', 'Lacus Ut Ltd', 'Eaton Cote', '(628) 573-3280', '851-4808 Viverra. Avenue', 'nulla.integer@yahoo.couk', '2023-07-30'),
    (49917, 'fb_user49917', 'Nullam Suscipit Est Company', 'Preston Melton', '(691) 589-7369', '478-8401 Lorem, Rd.', 'nec@google.org', '2023-12-24'),
    (60551, 'fb_user60551', 'Eu Eleifend Corporation', 'Sonia Petty', '(777) 451-0807', '685-5050 Etiam Ave', 'nec.metus@google.couk', '2023-08-18'),
    (71474, 'fb_user71474', 'Ligula Tortor Limited', 'Pandora Landry', '1-921-357-7113', '945-2142 Mauris Av.', 'sapien.cursus@hotmail.edu', '2024-09-30'),
    (58335, 'fb_user58335', 'Molestie Tortor PC', 'Valentine Figueroa', '1-446-684-2218', 'P.O. Box 650, 4463 Feugiat Road', 'ornare.facilisis@protonmail.edu', '2023-09-25'),
    (85300, 'fb_user85300', 'Est Mollis Industries', 'Kaitlin Serrano', '(528) 516-5768', '594-8395 Est St.', 'nonummy.ultricies@outlook.net', '2023-11-24');



INSERT INTO "donor" ("DO_ID", username, name_of_org, primary_contact_name, phone_num, address, email, date_joined, type_of_org, subscribed)
VALUES
    (55214, 'jesse_lopez', 'Turpis Ltd', 'Jesse Lopez', '1-510-766-9562', 'P.O. Box 966, 174 Nec, St.', 'eu.turpis@hotmail.net', '2023-05-02', 'Individual', 'Yes'),
    (36580, 'angelica_barnes', 'Mollis Nec LLC', 'Angelica Barnes', '1-644-561-3419', 'Ap #897-4039 Diam. Rd.', 'donec.sollicitudin@outlook.ca', '2024-02-24', 'Individual', 'No'),
    (93180, 'naida_cash', 'Gravida PC', 'Naida Cash', '(284) 430-8637', '176-7009 Et, Road', 'elit.erat@yahoo.couk', '2023-04-26', 'Individual', 'Yes'),
    (44241, 'boris_hines', 'Magna Suspendisse Associates', 'Boris Hines', '1-684-837-5382', 'Ap #680-6297 Ac Av.', 'donec.tincidunt@google.net', '2023-05-19', 'Organisation', 'No'),
    (79989, 'hedy_frye', 'Dictum Placerat PC', 'Hedy Frye', '1-251-352-9093', '219-3578 Erat. Ave', 'donec.elementum@outlook.com', '2024-05-26', 'Individual', 'Yes'),
    (60159, 'hiram_reid', 'Tellus Sem LLC', 'Hiram Reid', '(232) 837-8646', 'P.O. Box 370, 9694 Purus, Ave', 'velit.eget@yahoo.ca', '2024-06-02', 'Organisation', 'No'),
    (63353, 'elton_melendez', 'Ipsum Porta Elit PC', 'Elton Melendez', '1-187-127-8675', 'P.O. Box 477, 1799 Hendrerit Rd.', 'gravida@aol.couk', '2024-06-19', 'Organisation', 'No'),
    (85314, 'dai_merrill', 'Ac Mi PC', 'Dai Merrill', '1-586-475-8805', '828-5700 Turpis. Ave', 'vitae@protonmail.couk', '2024-06-19', 'Individual', 'No'),
    (52309, 'aspen_weaver', 'Hendrerit Consectetuer Cursus PC', 'Aspen Weaver', '(466) 332-1228', '859-2853 Nec, Rd.', 'cras.dolor@protonmail.net', '2023-06-13', 'Organisation', 'No'),
    (35740, 'lael_skinner', 'Metus Aliquam Limited', 'Lael Skinner', '1-658-111-7564', 'Ap #401-251 Mauris Street', 'molestie.dapibus@google.ca', '2024-04-13', 'Individual', 'No');

"""
INSERT INTO "documentation" ("DOC_ID","DO_ID","FB_ID",type_of_documentation,date_obtained,date_valid)
VALUES
  (32128,93567,10532,'Finances','2029-05-08','2023-06-23'),
  (69644,93506,59752,'Licenses','2027-06-21','2024-07-08'),
  (25464,40142,31557,'Quality Assurance','2033-07-13','2024-09-18'),
  (70638,79448,66172,'Licenses','2026-04-30','2023-11-24'),
  (56902,89960,83019,'Quality Assurance','2027-04-14','2023-06-17'),
  (13906,72242,73987,'Licenses','2033-06-19','2024-02-20'),
  (65680,47333,78752,'Finances','2025-10-11','2023-09-14'),
  (11174,47390,81576,'Licenses','2029-01-08','2024-08-14'),
  (66381,36938,31099,'Quality Assurance','2028-04-24','2023-10-23'),
  (28244,72077,16114,'Finances','2024-09-02','2025-01-07'),
  (28244,72077,16114,"Finances","2024-09-02","2025-01-07"); 

INSERT INTO "donation" ("DN_ID","DO_ID","FB_ID",type_of_donation,quantity,date_donated)
VALUES
  (37828,13326,18607,'pies',3,'2023-12-23'),
  (31474,90074,85306,'sandwiches',0,'2023-07-03'),
  (30178,25764,66510,'pies',3,'2023-10-04'),
  (16415,34774,73871,'pasta',10,'2024-08-26'),
  (80595,24074,17219,'sandwiches',5,'2023-11-11'),
  (27209,64688,72851,'soups',9,'2023-10-12'),
  (33177,61045,74769,'noodles',6,'2024-12-08'),
  (87051,82473,10066,'noodles',6,'2023-09-11'),
  (48349,22255,10111,'pies',9,'2023-12-14'),
  (15100,66685,47658,'sandwiches',8,'2024-08-04');
"""