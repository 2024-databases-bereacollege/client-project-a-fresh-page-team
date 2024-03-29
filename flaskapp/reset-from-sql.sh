# Remove objects from the database
psql -c "DROP table IF EXISTS Foodbank;"
psql -c "DROP table IF EXISTS Donor;"
psql -c "DROP table IF EXISTS Donation;"
psql -c "DROP table IF EXISTS Documentation;"



# Create tables
< tables.sql psql

# Load data back into database
< data.sql psql
