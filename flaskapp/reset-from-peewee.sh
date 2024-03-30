# Remove objects from the database
psql -c 'DROP table "Foodbank";'
psql -c "DROP table Donor;"
psql -c "DROP table Donation;"
psql -c "DROP table Documentation;"
"""
#psql -c "DELETE FROM migratehistory;"
#rm -rf migrations
#rm -rf migrations.json

pem init

# Use peewee-migrate to create tables from Peewee models
pem add models.donor
pem add models.foodbank
pem add models.donation
pem add models.documentation

pem watch
pem migrate

rm -rf migrations
rm -rf migrations.json
"""
# Load data back into database
< data.sql psql
