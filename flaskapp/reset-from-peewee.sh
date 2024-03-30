#!/bin/bash

# Remove objects from the database
psql -c 'DROP TABLE IF EXISTS foodbank CASCADE;'
psql -c 'DROP TABLE IF EXISTS donor CASCADE;'
psql -c 'DROP TABLE IF EXISTS donation CASCADE;'
psql -c 'DROP TABLE IF EXISTS documentation CASCADE;'

psql -c 'DELETE FROM migratehistory;'

rm -rf migrations
rm -rf migrations.json

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

# Load data back into the database (if needed)
< data.sql psql
