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
    phone_num = CharField(100)
    address = CharField(255, unique = True)
    email = CharField(100)
    date_joined = DateField() 
    city = CharField()
    state = CharField()
    zip = CharField()  

class donor (baseModel):
    DO_ID = PrimaryKeyField()
    username = CharField(20, unique = True)
    name_of_org = CharField(100)
    type_of_org = CharField(100) 
    subscribed = BooleanField(default= False) 
    address = CharField(255, unique = True)
    primary_contact_name = CharField(100)
    phone_num = CharField(100)
    email = CharField(100)
    date_joined = DateField()
    city = CharField()
    state = CharField()
    zip = CharField()

class donation(baseModel):
    DN_ID = PrimaryKeyField()
    DO_ID = ForeignKeyField(donor, column_name='DO_ID')
    FB_ID = ForeignKeyField(foodbank, column_name='FB_ID')
    type_of_donation = CharField(255)
    quantity = IntegerField() # in pounds - check with Dr.Page if detailed breakdown of donations are needed, f so, we will create a different table to track quantity
    date_donated = DateField()

class fb_donation_request(baseModel):
    FB_REQ_ID = AutoField()
    FB_ID = ForeignKeyField(foodbank,column_name='FB_ID')
    DO_ID = ForeignKeyField(donor,column_name='DO_ID')
    username = CharField(225)
    name_of_org = CharField(100)
    item = CharField(100)
    quantity = IntegerField()
    date_requested = DateField()
    status = CharField(255, default = 'pending') #

class do_donation_request(baseModel):
    DO_REQ_ID = PrimaryKeyField()
    DO_ID = ForeignKeyField(donor,column_name='DO_ID')
    FB_ID = ForeignKeyField(foodbank,column_name='FB_ID')
    username = CharField(225)
    name_of_org = CharField(100)
    item = CharField(100)
    quantity = IntegerField()
    date_requested = DateField()
    status = CharField(255, default = 'pending')

class documentation(baseModel):
    DOC_ID = PrimaryKeyField()
    DO_ID = ForeignKeyField(donor, null = True, column_name='DO_ID') 
    FB_ID = ForeignKeyField(foodbank,null = True, column_name='FB_ID') 
    type_of_documentation = CharField(255)
    date_obtained = DateField() 
    expiration_date = DateField() 


  











    

    


