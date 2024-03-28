from peewee import *

# Database Configuration
################################
mydb = PostgresqlDatabase("postgres",host="db",user="postgres",password="postgres")

class baseModel(Model):
    class Meta:
        database = mydb

# Class Definitions
# https://docs.peewee-orm.com/en/latest/peewee/models.html
        """
class OtherTable (baseModel):
    otherid = PrimaryKeyField()
    data = CharField(null=False)

class Example (baseModel):
    username = CharField(32,unique=True)
    description = CharField(255)
    other = ForeignKeyField(OtherTable)
    isInt = BooleanField(default=0)
    isBool = BooleanField()

"""

class Foodbank(baseModel):
    FB_ID = PrimaryKeyField()
    username = CharField(20, unique = True)
    name_of_org = CharField(100)
    address = CharField(255, unique = True)
    primary_contact_name = CharField(100)
    phone = CharField(10)
    email = CharField(100)
    date_joined = DateField() #check the correct US format for date
    
class Donor (baseModel):
    DO_ID = PrimaryKeyField()
    username = CharField(20, unique = True)
    name_of_org = CharField(100)
    type_of_donor = CharField(100) #adding options as org or individual type_of_donor in sql list
    subscribed = BooleanField(default= False) # default False means the subscription is free
    address = CharField(255, unique = True)
    primary_contact_name = CharField(100)
    phone = CharField(10)
    email = CharField(100)
    date_joined = DateField()



class Messages(baseModel):
    MSG_ID = PrimaryKeyField()
    username_sender = CharField(20, unique = True)
    username_receiver = CharField(20, unique = True)
    content = CharField(255)
    time_stamp = DateTimeField() #check if datatype is correct




class Donation(baseModel):
    DN_ID = PrimaryKeyField()
    DO_ID = ForeignKeyField(Donor)
    FB_ID = ForeignKeyField(Foodbank)
    type_of_donation = CharField(255)
    Quantity = IntegerField #check how to quantify donations


class Documentation(baseModel):
    DOC_ID = PrimaryKeyField()
    FB_ID = ForeignKeyField(Foodbank,null = True) # check ic its correct way to make optional
    DO_ID = ForeignKeyField(Donor, null = True) #check constraint: FB_ID NOT NULL or DO_ID not NULL
    #check ORG_ID 
    type_of_documentation = CharField(255)
    date_obtained = DateField #check format
    date_valid = DateField #check format










    

    


