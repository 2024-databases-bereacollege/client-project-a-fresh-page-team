
/* Documents: 
 1. Submit documents - (HIGH) - CREATE - works */
INSERT INTO "documentation" ("DOC_ID", "DO_ID", "FB_ID", "type_of_documentation", "date_obtained", "date_valid")
VALUES
    (32567, 55214, NULL, 'Registration', '2025-09-09', '2023-04-21'); 

--2.View the details of a document - (HIGH) - READ - works

SELECT "DOC_ID", "DO_ID", "FB_ID", type_of_documentation, date_obtained, date_valid 
FROM documentation;


-- 3. View donation received history - (HIGH) - READ 

SELECT "DN_ID", donor.name_of_org AS donor_name_of_org, foodbank.name_of_org AS foodbank_name_of_org, type_of_donation, quantity, date_donated 
FROM donation
JOIN donor ON donor."DO_ID" = donation."DO_ID"
JOIN foodbank ON foodbank."FB_ID" = donation."FB_ID"
WHERE foodbank."FB_ID" = '18607';


--4. View details of a donation - (HIGH) - READ 
SELECT "DN_ID", donor.name_of_org, foodbank.name_of_org, type_of_donation, quantity, date_donated FROM donation
JOIN donor on donor."DO_ID" = donation."DO_ID"
JOIN foodbank on foodbank."FB_ID" = donation."FB_ID"
WHERE donation."DN_ID" = '37828 ';


--5.Sign up to the website (HIGH) - CREATE (username, ID etc.) - works
--Donor: 
INSERT INTO donor ("DO_ID", "username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined", "type_of_org", "subscribed")
VALUES
    (52389, 'Karina_Lumaru', 'Karina_Lumaru', 'Karina_Lumaru', '1-510-778-2257', '190 Ferri St 1234.', 'k_lumaru@gmail.com', 'Berea', 'KY', '40404', '2023-07-09', 'Individual', 'Yes');


--Foodbank:
INSERT INTO foodbank ("FB_ID", "username", "name_of_org", "primary_contact_name", "phone_num", "address", "email", "city", "state", "zip", "date_joined")
VALUES 
    (84890, 'fb_user84890', 'Creative Limited', 'Anna Luis', '(805) 855-8902', '1721 Oliver Av.', 'lame.email@google.org',  'Berea', 'KY', '40404', '2024-03-23');



-- 6.View details of donors (phone number, email, name, date last donated) - (HIGH) - READ 

SELECT phone_num, primary_contact_name, address, email, date_joined FROM donor; 


--7. Search for donors in the area (city, zip code, state) - (HIGH) - READ
SELECT  city, state, zip, name_of_org, primary_contact_name, phone_num, address, email FROM donor ORDER BY city;


--8. Request donations by filling out a form (HIGH) - CREATE

INSERT INTO fb_donation_request ("FB_REQ_ID", "DO_ID", "FB_ID", "item", "quantity", "status", "date_requested") 
VALUES (12121, 93180, 71474, 'shirt', 10, 'pending', '2024-01-28');


--9. View donation requests made by donors (HIGH) - READ

SELECT donor.name_of_org AS donor_org , foodbank.name_of_org AS foodbank_org , do_donation_request.item, do_donation_request.quantity, do_donation_request.date_requested 
FROM do_donation_request
JOIN donor ON do_donation_request."DO_ID" = donor."DO_ID"
JOIN foodbank ON do_donation_request."FB_ID"= foodbank."FB_ID";


--10.View details of expected donation (HIGH) - READ

SELECT donor.name_of_org AS donor_org, foodbank.name_of_org AS foodbank_org , do_donation_request.item, do_donation_request.quantity, do_donation_request.date_requested 
FROM do_donation_request
JOIN donor ON do_donation_request."DO_ID" = donor."DO_ID"
JOIN foodbank ON do_donation_request."FB_ID" = foodbank."FB_ID";


--11. View personal Information of a specific donor - (HIGH) - READ WORKS 

SELECT name_of_org, type_of_org, primary_contact_name, subscribed, city, state, zip
FROM donor
WHERE name_of_org = 'Mollis Nec LLC';


--12. Edit personal information - (HIGH) - UPDATE

--Donor:
UPDATE donor 
SET address = '2576 Blackberry Ridge Blvd', 
    phone_num = '865-990-8786', 
    primary_contact_name = 'Pedro Luis', 
    email = 'pedro@gmail,com', 
    name_of_org = 'The Life of Pedro', 
    type_of_org = 'Individual',  
    city = 'Houston', 
    state = 'TX', 
    zip = '90001'
WHERE "DO_ID" = '36580'; 


--Foodbank:
UPDATE donor 
SET address = '2576 Blackberry Ridge Blvd', 
    phone_num = '865-990-8786', 
    primary_contact_name = 'Pedro Luis', 
    email = 'pedro@gmail,com', 
    name_of_org = 'The Life of Pedro', 
    type_of_org = 'Individual',  
    city = 'Houston', 
    state = 'TX', 
    zip = '90001'
WHERE "DO_ID" = '36580';  


--13. Search for the details of a document - (HIGH) - READ
SELECT "DOC_ID", "FB_ID", "DO_ID", type_of_documentation,date_obtained, date_valid
FROM Documentation; 

--14. Search for food banks in the area - (HIGH) - READ ( fliter by state, city and zip code)

--Filter by State
SELECT name_of_org, phone_num, primary_contact_name, email
FROM foodbank
WHERE state = 'TX';

--Filter by City - works
SELECT name_of_org, phone_num, primary_contact_name, email
FROM foodbank
WHERE city= 'Houston';

--Filter by Zip Code - works
SELECT name_of_org, phone_num, primary_contact_name, email
FROM foodbank
WHERE zip = '77001';

--15.View details of food banks - (HIGH)- READ - works
SELECT "FB_ID", username, name_of_org, address, phone_num, primary_contact_name, email, date_joined 
FROM foodbank; 

16. Request to donate by filling out a form (HIGH) - CREATE - works
INSERT INTO do_donation_request ("DO_REQ_ID", "DO_ID", "FB_ID", "item", "quantity", "status", "date_requested") 
VALUES (12121, 93180, 71474, 'shirt', 10, 'pending', '2024-01-28');

17.Accept/decline to make a donation (food banks can ask donors who have donated before to donate again) - (HIGH) - UPDATE ( depends on the response of donor) - works

If accepted:
UPDATE fb_donation_request
SET status = 'accepted'
WHERE "FB_REQ_ID" = 00000;

If declined:
UPDATE fb_donation_request
SET status = 'declined'
WHERE "FB_REQ_ID" = 00000;


--18.View donation requests from food banks- (HIGH) - READ (Requests from food banks) - works
SELECT foodbank.name_of_org, donor.name_of_org, fb_donation_request.item, fb_donation_request.quantity, fb_donation_request.date_requested, fb_donation_request.status 
FROM fb_donation_request
INNER JOIN foodbank ON fb_donation_request."FB_ID" = foodbank."FB_ID"
INNER JOIN donor ON fb_donation_request."DO_ID" = donor."DO_ID";

--19.View details of a donation requested by a food bank - (HIGH) - READ (A request from a food bank) - works
SELECT foodbank.name_of_org, donor.name_of_org, fb_donation_request.item, fb_donation_request.quantity, fb_donation_request.date_requested
FROM fb_donation_request
JOIN foodbank ON fb_donation_request."FB_ID" = foodbank."FB_ID"
JOIN donor ON fb_donation_request."DO_ID" = donor."DO_ID"
WHERE foodbank.name_of_org = 'Dictum Limited';

--20. View personal information of a specific food bank - (HIGH) - READ - works
SELECT name_of_org, primary_contact_name, city, state, zip
FROM foodbank
WHERE name_of_org = 'Nunc PC';
























