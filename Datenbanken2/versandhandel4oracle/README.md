# usage instructions (for Oracle XE 11g)

1. create new user
  1. create user <username> identified by <password>;
  2. set appropiate rights (e.g. using sqldeveloper)
2. create schema
  1. sqlplus $username/$password@xe @"/path/to/VersandHandel_schema.sql"
3. insert data into the database
  1. sqlplus $username/$password@xe @"/path/to/VersandHandel_dml.sql"