-- https://www.postgresqltutorial.com/

CREATE TABLE foodbank (
    "FB_ID" integer PRIMARY KEY,
    username varchar(20) UNIQUE, 
    name_of_org varchar(100), 
    address varchar(255), 
    phone_num integer,
    primary_contact_name varchar(100),
    email varchar(100), 
    date_joined date
);

CREATE TABLE example (
    id serial PRIMARY KEY,
    username varchar(32) UNIQUE,
    description varchar(255) NOT NULL,
    fkey_other integer REFERENCES othertable(otherid), 
    isInt smallint NOT NULL DEFAULT(0),
    isBool boolean
);
