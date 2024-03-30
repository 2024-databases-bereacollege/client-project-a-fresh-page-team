CREATE TABLE "Foodbank" (
  "FB_ID" integer PRIMARY KEY,
  username varchar(20) UNIQUE,
  name_of_org varchar(100),
  primary_contact_name varchar(100),
  phone_num varchar(50),
  address varchar(255),
  email varchar(100), 
  date_joined date
);
"""
CREATE TABLE "Donor"(
    "DO_ID" integer PRIMARY KEY,
    username varchar(20) UNIQUE, 
    name_of_org varchar(100), 
    type_of_org varchar (100) CHECK (type_of_org IN ('individual', 'organization')),
    subscribed boolean DEFAULT False,
    address varchar(255), 
    phone_num varchar(50),
    primary_contact_name varchar(100),
    email varchar(100), 
    date_joined date
);

CREATE TABLE "Donation"(
    "DN_ID" INTEGER PRIMARY KEY,
    "FB_ID" INTEGER,
    "DO_ID" INTEGER,
    FOREIGN KEY ("FB_ID") REFERENCES Foodbank("FB_ID"),
    FOREIGN KEY ("DO_ID") REFERENCES Donor("DO_ID"),
    type_of_donation varchar(255),
    quantity integer, --in pounds
    date_donated date 
);

CREATE TABLE "Documentation"(
    "DOC_ID" INTEGER PRIMARY KEY,
    FB_ID INTEGER,
    DO_ID INTEGER,
    FOREIGN KEY (FB_ID) REFERENCES Foodbank(FB_ID),
    FOREIGN KEY (DO_ID) REFERENCES Donor(DO_ID),
    type_of_documentation varchar(100),
    date_obtained date,
    date_valid date
);
"""