# Remove objects from the database
psql -c "DROP table IF EXISTS foodbank;"
#psql -c "DROP table IF EXISTS othertable;"

# Create tables
< tables.sql psql

# Load data back into database
< data.sql psql
