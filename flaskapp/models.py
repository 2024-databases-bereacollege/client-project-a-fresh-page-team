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

class foodbank(baseModel):
    FB_ID = PrimaryKeyField()
    username = CharField(20, unique = True)
    name_of_org = CharField(100)
    primary_contact_name = CharField(100)
    phone_num = CharField(10)
    address = CharField(255, unique = True)
    email = CharField(100)
    date_joined = DateField() 
    
class donor (baseModel):
    DO_ID = PrimaryKeyField()
    username = CharField(20, unique = True)
    name_of_org = CharField(100)
    type_of_donor = CharField(100) 
    subscribed = BooleanField(default= False) 
    address = CharField(255, unique = True)
    primary_contact_name = CharField(100)
    phone_num = CharField(10)
    email = CharField(100)
    date_joined = DateField()
    
    class Meta:
        constraints = [Check('type_of_donor in ("individual", "organization")')]



class donation(baseModel):
    DN_ID = PrimaryKeyField()
    DO_ID = ForeignKeyField(Donor)
    FB_ID = ForeignKeyField(Foodbank)
    type_of_donation = CharField(255)
    Quantity = IntegerField # in pounds - check with Dr.Page if detailed breakdown of donations are needed, f so, we will create a different table to track quantity
    date_donated = DateField()

class documentation(baseModel):
    DOC_ID = PrimaryKeyField()
    FB_ID = ForeignKeyField(Foodbank,null = True) 
    DO_ID = ForeignKeyField(Donor, null = True) 
    type_of_documentation = CharField(255)
    date_obtained = DateField() 
    date_valid = DateField() 










    

    


