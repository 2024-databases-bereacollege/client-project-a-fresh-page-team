CREATE TABLE "foodbank" (
  "FB_ID" integer PRIMARY KEY,
  username varchar(20) UNIQUE,
  name_of_org varchar(100),
  primary_contact_name varchar(100),
  phone_num varchar(50),
  address varchar(255),
  email varchar(100),
  city varchar(255), 
  state varchar(255),
  zip varchar(5),
  date_joined date
);


CREATE TABLE "donor"(
    "DO_ID" integer PRIMARY KEY,
    username varchar(20) UNIQUE, 
    name_of_org varchar(100),
    primary_contact_name varchar(100),
    phone_num varchar(50),
    address varchar(255),
    email varchar(100),
    city varchar(255), 
    state varchar(255),
    zip varchar(5),
    date_joined date,
    type_of_org varchar(255),
    subscribed varchar(4)
);

CREATE TABLE "donation"(
    "DN_ID" INTEGER PRIMARY KEY,
    "DO_ID" INTEGER,
    "FB_ID" INTEGER,
    FOREIGN KEY ("FB_ID") REFERENCES Foodbank("FB_ID"),
    FOREIGN KEY ("DO_ID") REFERENCES Donor("DO_ID"),
    type_of_donation varchar(255),
    quantity integer, --in pounds
    date_donated date 
);

CREATE TABLE "fb_donation_request"(
    "FB_REQ_ID" INTEGER PRIMARY KEY,
    "FB_ID" INTEGER,
    "DO_ID" INTEGER,
    FOREIGN KEY ("FB_ID") REFERENCES Foodbank("FB_ID"),
    item varchar(100),
    quantity integer,
    date_requested date
);

CREATE TABLE "do_donation_request"(
    "DO_REQ_ID" INTEGER PRIMARY KEY,
    "DO_ID" INTEGER,
    "FB_ID" INTEGER,
    FOREIGN KEY ("DO_ID") REFERENCES Donor("DO_ID"),
    item varchar(100),
    quantity INTEGER,
    date_requested date
    
);

CREATE TABLE "documentation"(
    "DOC_ID" INTEGER PRIMARY KEY,
    "FB_ID" INTEGER,
    "DO_ID" INTEGER,
    FOREIGN KEY ("FB_ID") REFERENCES Foodbank("FB_ID"),
    FOREIGN KEY ("DO_ID") REFERENCES Donor("DO_ID"),
    type_of_documentation varchar(100),
    date_obtained date,
    date_valid date
);
