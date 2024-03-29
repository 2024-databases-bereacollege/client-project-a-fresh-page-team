# Remove objects from the database
psql -c "DROP table Foodbank;"
psql -c "DROP table Donor;"
psql -c "DROP table Donation;"
psql -c "DROP table Documentation;"
"""
#psql -c "DELETE FROM migratehistory;"
#rm -rf migrations
#rm -rf migrations.json

pem init

# Use peewee-migrate to create tables from Peewee models
pem add models.Donor
pem add models.Foodbank
pem add models.Messages
pem add models.Donation
pem add models.Documentation

pem watch
pem migrate

rm -rf migrations
rm -rf migrations.json
"""
# Load data back into database
< data.sql psql
