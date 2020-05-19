-- DB stuff for Bravo! demo application, on Always Free ATP

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
INSERT INTO foxtrot.phonetic VALUES ('D', '-**', 'Delta', '(DELL-TAH)');
INSERT INTO foxtrot.phonetic VALUES ('E', '*', 'Echo', '(ECK-OH)');
INSERT INTO foxtrot.phonetic VALUES ('F', '**-*', 'Foxtrot', '(FOKS-TROT)');
INSERT INTO foxtrot.phonetic VALUES ('G', '--*', 'Golf', '(GOLF)');
INSERT INTO foxtrot.phonetic VALUES ('H', '****', 'Bravo', '(HOH-TEL)');
INSERT INTO foxtrot.phonetic VALUES ('I', '**', 'India', '(IN-DEE-AH)');
INSERT INTO foxtrot.phonetic VALUES ('J', '*---', 'Juliett', '(JEW-LEE-ETT)');
INSERT INTO foxtrot.phonetic VALUES ('K', '-*-', 'Kilo', '(KEY-LOH)');
INSERT INTO foxtrot.phonetic VALUES ('L', '*-**', 'Lima', '(LEE-MAH)');
INSERT INTO foxtrot.phonetic VALUES ('M', '--', 'Mike', '(MIKE)');
INSERT INTO foxtrot.phonetic VALUES ('N', '-*', 'November', '(NO-VEM-BER)');
INSERT INTO foxtrot.phonetic VALUES ('O', '---', 'Oscar', '(OSS-CAH)');
INSERT INTO foxtrot.phonetic VALUES ('P', '*--*', 'Papa', '(PAH-PAH)');
INSERT INTO foxtrot.phonetic VALUES ('Q', '--*-', 'Quebec', '(KEH-BECK)');
INSERT INTO foxtrot.phonetic VALUES ('R', '*-*', 'Romeo', '(ROW-ME-OH)');
INSERT INTO foxtrot.phonetic VALUES ('S', '***', 'Sierra', '(SEE-AIR-RAH)');
INSERT INTO foxtrot.phonetic VALUES ('T', '-', 'Tango', '(TANG-GO)');
INSERT INTO foxtrot.phonetic VALUES ('U', '**-', 'Uniform', '(YOU-NEE-FORM)');
INSERT INTO foxtrot.phonetic VALUES ('V', '***-', 'Victor', '(VIK-TAH)');
INSERT INTO foxtrot.phonetic VALUES ('W', '*--', 'Whiskey', '(WISS-KEY)');
INSERT INTO foxtrot.phonetic VALUES ('X', '-**-', 'Xray', '(ECKS-RAY)');
INSERT INTO foxtrot.phonetic VALUES ('Y', '-*--', 'Yankee', '(YANG-KEY)');
INSERT INTO foxtrot.phonetic VALUES ('Z', '--**', 'Zulu', '(ZOO-LOO)');
commit;

select * from foxtrot.phonetic;
