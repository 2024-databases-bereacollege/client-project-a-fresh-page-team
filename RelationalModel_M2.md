## Relational Data Model and Project Schema for Milestone 2

# Entities and Description

1. Food banks: The food bank relation has an internal ID (denoted as FB_ID) which acts as the primary key for the relation. foodBankUsername is a unique username chosen by the food bank that they use to log in to the dashboard. This relation is connected to the Donation relation and Documentation relation, both of which have FB_ID as one of the attributes. 

2. Donor: A donor is an individual, a corporation, a community garden, a school, or a church that makes a donation to the food bank. The donor relation has an internal ID (denoted as DN_ID) which acts as the primary key for the relation. donorUsername is a unique username chosen by the donor that they use to log in to the dashboard. This relation is connected to the Donation relation which has DN_ID as one of its attributes. This foreign relation helps track the donor who made the donation. 

3. Donation: Donation is what was donated by an organization to a food bank. Donation relation also has an internal ID that tracks donations from a particular distributor or donor to a particular food bank. Donation relation requires internal IDs of both the donor and the food bank (foreign keys used as a composite key). It is created whenever a donor/distributor makes a donation. Its attributes are the Type of Donation (food, toys, etc.), Quantity of Donation (lbs or number), and Expiration Date.

4. Documentation: Documentation is a particular registration or food certification document of a food bank or a donor  Documentation relation that uses the official registration or certificate number as its primary key. It has the internal IDs of Foodbank and Donor as foreign keys to track which organization a particular document belongs to.

5. Message: Message refers to the messages between donors and food banks to facilitate the donation. The content, sender, receiver, and time stamps of the messages are stored for documentation purposes.

# Reflection

The decisions we made while creating the ERD were deciding which entities will be represented in the diagram and how they will be related to each other. We referred to the ERD diagram to make sure that the entities, and attributes, are consistent. Although we felt confident in our decisions, we came to the realization that we did not need as many entities as we thought, in fact, we could condense distributors and donors in one and make our ERD more efficient. The decision to further condense distributor and donor was also primarily influenced by Dr. Jone’s feedback was later supported by Brian. We understand that Conceptual models are particularly useful to clearly see how different entities influenced others and give a visual means to represent the relationship between them. 

Furthermore, looking back at our P1 E-R- model allowed us to ponder whether or not we should have a Message entity. We discussed if it could be an attribute, but later realized that for efficiency purposes, we should have it as an entity. Once we established it was an entity, we developed the relationships and the attributes inside the Message entity itself. We strongly believe that having this addition makes our ERD diagram more efficient. Moreover, we changed names around so they are clearer than before, we did so because it was part of our feedback. 

In addition, we also edited our schema, and added all the new attributes and entities that we discussed during our meeting and the recommendations made by our professors. The schema is also clearly visible.  
In the future, we will keep checking our feedback and making our diagrams and schemas better according to the information gathered each time. 

# Domain Definition Table 

# Food Bank and Donors (A lot of overlap, hence merged together)

FB_ID - only for Food Banks
Data Type: INT
This is an internally created ID to uniquely identify Food Banks

DO_ID - only for Donors 
Data Type: INT
This is an internally created ID to uniquely identify Donors

Name of Org
Data Type: VARCHAR 
This attribute stores the name of the organization

Subscription Type - Only for Donors
Data Type: CHAR
Subscription types can either be free or paid. Donors who are corporations and want tax benefits will need to buy a subscription and donors who are individuals, schools, and community gardens, i.e., do not need tax benefits will have a free subscription.

Type of Organisation
Data Type: VARCHAR
The type of organization for donors can be corporations, schools, community gardens, churches, etc. 

Username
Data Type: VARCHAR
This is a unique name chosen by the users in the web application when they create their account 

Email
Data Type: VARCHAR
Email of the donor or foodbank

Joining Date
Data Type: DATE
The date on which the person or organization created an account 

Primary Contact Name
Data Type: CHAR
Name of the person who should be contacted regarding a particular organization (either food bank or donor)

Address
Data Type: VARCHAR
Full address of the person or the organization making or receiving the donation

Phone number
Data Type: INT
Phone number of the person or the organization making or receiving the donation

# Message

MSG_ID
Data Type: INT
This is the internally created ID to uniquely identify messages

Content 
Data Type: TEXT, IMAGE
This is what the message says

TimeStamp
Data Type: TIMESTAMP
This is the time the message was sent and when it was received

username_Sender
Data Type: VARCHAR
The username of the person or the organization that sent the message

username_Receiver
Data Type: VARCHAR
The username of the person or the organization that received the message

# Documentation


Type of Documentation
Data Type:  CHAR
This describes what the documentation is, such as tax write-offs, confirmation of donation, proof of organization, certifications, etc.

Date Obtained
Data Type: DATE
This is the date the document was obtained by the donor/organization.

Date Valid
Data Type: DATE
This describes the date the documentation is valid (from date to date)

DOC_ID
Data Type: INT
This is the internally crew created ID to uniquely identify a document


# Donation

Quantity
Data Type: INT
This describes how much food or clothes were donated (in lbs or numbers)

Type of Donation
Data Type: CHAR
This describes if the donation was food, clothes, or anything else


![Relational Model : Project Schema](!Relational Data modeling.png)
[Google Doc for Revised Milestone 1 & 2](https://docs.google.com/document/d/14JDE1mvGcXmmlmXxE5GFxppWWMzUcaM1512_ShI-OKQ/edit?usp=sharing)