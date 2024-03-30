*MESSAGES removed since we were not sure on how to implement it

DONOR (DO_ID, username, name of organization, type of organization, subscription type, primary contact name, address, email, phone number, date joined)
FOODBANK (FB_ID, username, name of organization, address, primary contact name, phone number, email, date joined)
DOCUMENTATION (DOC_ID, FB_ID, DO_ID, type of documentation, date obtained, date valid)
DONATION(DN_ID, DO_ID, FB_ID, type of donation, quantity)

Normalization:
1NF (First Normal Form):
No attributes contain atomic values, no repeating groups or arrays.
2NF (Second Normal Form):
No partial dependencies exist.
Attributes in our Databases do not depend on one another. 
3NF (Third Normal Form):
No transitive dependencies exist.
Attributes like Primary Contact Name, Address, Email, and Phone Number are dependent only on the primary key, DO_ID, not on any other non-key attributes.
We were a little confused on the subscription type since we were wondering if it was dependent on the type of organization. However, after meeting with Dr. Page, we have confirmed that the organization will not automatically be subscribed like we assumed, meaning the subscription type is not dependent on the type of organization.

Google doc link:
https://docs.google.com/document/d/16FdxbIUlBRLW5k0eaUvShGkb_OhKmZ9CID2kBQkk2r8/edit?usp=sharing