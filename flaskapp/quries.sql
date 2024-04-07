--Documents:
--1. Submit documents - (HIGH) - CREATE
INSERT INTO "documentation" ("DOC_ID", "DO_ID", "FB_ID", "type_of_documentation", "date_obtained", "date_valid")
VALUES
    (32567, 55378, NULL, ‘Registration’, '2025-09-09', '2023-04-21')

--2.View the details of a document - (HIGH) - READ 

SELECT “DOC_ID”, “DO_ID”, “FB_ID”, type_of_documentation, date_obtained, date_valid 
FROM documentation;











