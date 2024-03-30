# Remove objects from the database
psql -c 'DROP TABLE IF EXISTS "foodbank" CASCADE;'


psql -c 'DROP table IF EXISTS "donor" CASCADE;'
psql -c 'DROP table IF EXISTS "donation" CASCADE;'
psql -c 'DROP table IF EXISTS "documentation"CASCADE;'



# Create tables
< tables.sql psql

# Load data back into database
< data.sql psql
