# P1 - A Fresh Page: Creating a Data Model

## Data Sources:
1. Meeting notes from our Meeting
2. Document shared by the client (We are still waiting for the document to be shared)


# Revised Entities & Descriptions:
1. Food banks: The food bank relation has an internal ID (denoted as FB_ID) which acts as the primary key for the relation. foodBankUsername is a unique username chosen by the food bank that they use to log in to the dashboard. This relation is connected to the Donation relation and Documentation relation, both of which have FB_ID as one of the attributes. 

2. Donor: A donor is an individual, a corporation, a community garden, a school, or a church that makes a donation to the food bank. The donor relation has an internal ID (denoted as DN_ID) which acts as the primary key for the relation. donorUsername is a unique username chosen by the donor that they use to log in to the dashboard. This relation is connected to the Donation relation which has DN_ID as one of its attributes. This foreign relation helps track the donor who made the donation. 

3. Donation: Donation is what was donated by an organization to a food bank. Donation relation also has an internal ID that tracks donations from a particular distributor or donor to a particular food bank. Donation relation requires internal IDs of both the donor and the food bank (foreign keys used as a composite key). It is created whenever a donor/distributor makes a donation. Its attributes are the Type of Donation (food, toys, etc.), Quantity of Donation (lbs or number), and Expiration Date.

4. Documentation: Documentation is a particular registration or food certification document of a food bank or a donor  Documentation relation that uses the official registration or certificate number as its primary key. It has the internal IDs of Food bank and Donor as foreign keys to track which organization a particular document belongs to.

5. Message: Message refers to the messages between donors and food banks to facilitate the donation. The content, sender, receiver, and time stamps of the messages are stored for documentation purposes.


# Revised Business Rules:
1. A donor may optionally make many donations.
2. A donation is made by one and only one donor.
3. A food bank may optionally receive many donations.
4. A donation is received by one and only one food bank.
5. A donor may optionally provide many documents.
6. A document is provided by one and only one donor.
7. A food bank must provide one or many documents.
8. A document is provided by one and only one food bank.
9. A donor may optionally send many messages.
10. A message is sent by one and only one donor.
11. A donor may optionally receive many messages.
12. A message is received by one and only one donor.
13. A food bank may optionally send many messages.
14. A message is sent by one and only one food bank.
15. A food bank may optionally receive many messages.
16. A message is received by one and only one food bank.

![ERD Afreshpage](!Revised_ERD_M1.png)
[Google Doc for revised Milestone 1 and 2](https://docs.google.com/document/d/14JDE1mvGcXmmlmXxE5GFxppWWMzUcaM1512_ShI-OKQ/edit?usp=sharing)

