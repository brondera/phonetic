-- DB stuff for phonetic app, on Always Free ATP

-- Create db user foxtrot --
CREATE USER foxtrot IDENTIFIED BY "TOP_SECRET";

grant create session to Foxtrot; --user can log in

grant create table to Foxtrot; -- user can create tables

SELECT default_tablespace FROM dba_users WHERE username = 'FOXTROT'; --DEFAULT tablespace for foxtrot is data

alter user foxtrot quota unlimited on data; --allow user to store data in tables

grant create view, create procedure, create sequence to foxtrot;

-- Now create app user charlie --
grant create session to charlie identified by "TOP_SECRET";

-- TODO: Update profiles to prevent pwd expiry --
-- ORA-01031: insufficient privileges - impossible on atp?

--switch user
ALTER session SET current_schema = foxtrot

-- create table
CREATE TABLE foxtrot.phonetic
(
character varchar(255),
morsecode varchar(255),
telephony varchar(255),
phonic varchar(255)
);

-- Add some data
-- TODO: Figure out how to get the rest in there without too much manual labour:
-- https://upload.wikimedia.org/wikipedia/commons/e/e0/FAA_Phonetic_and_Morse_Chart2.svg
INSERT INTO foxtrot.phonetic VALUES ('A', '*-', 'Alfa', '(AL-FAH)');
INSERT INTO foxtrot.phonetic VALUES ('B', '-***', 'Bravo', '(BRAH-VOH)');
INSERT INTO foxtrot.phonetic VALUES ('C', '-*-*', 'Charlie', '(CHAR-LEE)');
commit;

select * from foxtrot.phonetic;
