########################################
# ISTM 6202 Project
# Table creation scripts
########################################


CREATE TABLE CLASS
(
  ClassID        int       NOT NULL AUTO_INCREMENT,
  ClassType      char(25)  NOT NULL ,
  ClassDateTime datetime  NOT NULL ,
  FaculID        int       NOT NULL , 
  CID            int       NOT NULL , 
  PRIMARY KEY (ClassID)
) ENGINE=INNODB;


CREATE TABLE CLASSADR
( 
  ClassID  int  NOT NULL ,
  BuildID  int  NOT NULL ,
  PRIMARY KEY (ClassID, BuildID)
) ENGINE=INNODB;


CREATE TABLE BUILDING
( 
  BuildID      int        NOT NULL AUTO_INCREMENT,
  BuildName    char(100)  NULL ,
  BuildStreet  char(50)   NOT NULL ,
  BuildCity    char(50)   NOT NULL ,
  BuildState   char(5)    NOT NULL ,
  Buildzip     char(10)   NOT NULL ,
PRIMARY KEY (BuildID)
) ENGINE=INNODB;


CREATE TABLE ROOM
(
  RoomID      int      NOT NULL AUTO_INCREMENT,
  RoomNumber  char(5)  NOT NULL ,
  BuildID     int      NOT NULL ,
  PRIMARY KEY (RoomID)
) ENGINE=INNODB;


 CREATE TABLE DEPARTADR
( 
  DepID    int  NOT NULL ,
  BuildID  int  NOT NULL ,
  PRIMARY KEY (DepID, BuildID)
) ENGINE=INNODB;


CREATE TABLE DEPARTMENT
(
  DepID      int       NOT NULL AUTO_INCREMENT,
  DepSchool  char(75)  NOT NULL ,
  DepHead    char(60)  NOT NULL ,
  DepPhone   int       NOT NULL , 
  PRIMARY KEY (DepID)
) ENGINE=INNODB;


CREATE TABLE FACULTY
(
  FaculID      int      NOT NULL AUTO_INCREMENT,
  FaculStatus  char(1)  NOT NULL ,
  PerID        int      NOT NULL , 
  DepID        int      NOT NULL , 
  PRIMARY KEY (FaculID)
) ENGINE=INNODB;


CREATE TABLE FACULTYADR
(
  BuildID  int  NOT NULL ,
  FaculID  int  NOT NULL ,
  PRIMARY KEY (BuildID, FaculID)
) ENGINE=INNODB;


CREATE TABLE COURSE
(
  CID        int       NOT NULL AUTO_INCREMENT ,
  CName      char(25)  NOT NULL ,
  CCreditNo  char(25)  NOT NULL ,
  CRequired  char(25)  NOT NULL ,
  DepID      char(25)  NOT NULL ,
  PRIMARY KEY (CID)
) ENGINE=INNODB;


CREATE TABLE SEMESTROFFERED
(
  Semestr  int  NOT NULL AUTO_INCREMENT ,
  CID      int  NOT NULL,
  PRIMARY KEY (Semestr,CID)
) ENGINE=INNODB;


CREATE TABLE SCHOOL
(
  SchlID   int       NOT NULL AUTO_INCREMENT ,
  SchName  char(80)  NOT NULL ,
  SchDean  char(50)  NOT NULL ,
  PRIMARY KEY (SchlID)
) ENGINE=INNODB;


CREATE TABLE SCHOOLADR
(
  SchlID   int  NOT NULL ,
  BuildID  int  NOT NULL ,
  PRIMARY KEY (SchlID, BuildID)
) ENGINE=INNODB;


CREATE TABLE SCHPHONE
(
  SchlID       int  NOT NULL ,
  PhoneNumber  int  NOT NULL ,
  PRIMARY KEY (SchlID, PhoneNumber)
) ENGINE=INNODB;


CREATE TABLE PEREMAIL
( 
  Email  char(100)  NOT NULL ,
  PerID  int        NOT NULL ,
  PRIMARY KEY (Email)
) ENGINE=INNODB;


CREATE TABLE PERPHONE
( 
  PhoneNumber  int  NOT NULL ,
  PerID        int  NOT NULL ,
  PRIMARY KEY (PhoneNumber)
) ENGINE=INNODB;


CREATE TABLE CONTPHONE
( 
  PhoneNumber  int  NOT NULL ,
  ContID       int  NOT NULL ,
  PRIMARY KEY (ContID)
) ENGINE=INNODB;


CREATE TABLE EMERCONTACT
( 
  ContID         int       NOT NULL ,
  ContLastName   char(50)  NOT NULL ,
  ContFirstName  char(25)  NOT NULL ,
  PerID          int       NOT NULL ,
  PRIMARY KEY (ContID)
) ENGINE=INNODB;


CREATE TABLE PERSON
( 
  PerID	         int       NOT NULL AUTO_INCREMENT,
  PerSSN         int       NOT NULL ,
  PerLastName    char(50)  NOT NULL ,
  PerFirstName   char(25)  NOT NULL ,
  PCAStreet	 char(25)  NOT NULL ,
  PCABuildingNo	 int       NULL ,
  PCAApartOfNo   int       NULL ,
  PCACity        char(30)  NOT NULL ,
  PCAState       char(30)  NOT NULL ,
  PCAZip         char(10)   NOT NULL ,
  Street         char(25)  NOT NULL ,
  BuildingNo     int       NOT NULL ,
  AparOfficeNo   int       NULL ,
  City           char(30)  NOT NULL ,
  State          char(30)  NOT NULL ,
  Zip            char(10)  NOT NULL ,
  PRIMARY KEY (StudentID)
) ENGINE=INNODB;


CREATE TABLE STUDENT
( 
  StudentID       int       NOT NULL AUTO_INCREMENT,
  StudAdvisor     char(50)  NOT NULL ,
  StudActStartDt  datetime  NOT NULL ,
  StudActEndDt    datetime  NOT NULL ,
  StudActiveFlag  char      NOT NULL ,
  PerID           int       NOT NULL ,
  SchID           int       NOT NULL ,
  PRIMARY KEY (StudentID)
) ENGINE=INNODB;


CREATE TABLE STDCONTPHONE
( 
  ClassID    int  NOT NULL ,
  StudentID  int  NOT NULL ,
  PRIMARY KEY (ClassID, StudentID)
) ENGINE=INNODB;


CREATE TABLE SUBSCRIBE
( 
  StudentID  int  NOT NULL ,
  MajID      int  NOT NULL ,
  PRIMARY KEY (StudentID, MajID)
) ENGINE=INNODB;


#####################
# Define foreign keys
#####################
ALTER TABLE CLASS ADD CONSTRAINT fk_CLASS_FACULTY FOREIGN KEY (FaculID) REFERENCES FACULTY (FaculID);
ALTER TABLE CLASS ADD CONSTRAINT fk_CLASS_COURSE FOREIGN KEY (CID) REFERENCES COURSE (CID);

ALTER TABLE CLASSADR ADD CONSTRAINT fk_CLASSADR_CLASS FOREIGN KEY (ClassID) REFERENCES CLASS (ClassID);
ALTER TABLE CLASSADR ADD CONSTRAINT fk_CLASSADR_BUILDING FOREIGN KEY (BuildID) REFERENCES BUILDING (BuildID);

ALTER TABLE FACULTYADR ADD CONSTRAINT fk_FACULTYADR_BUILDING FOREIGN KEY (BuildID) REFERENCES BUILDING (BuildID);
ALTER TABLE FACULTYADR ADD CONSTRAINT fk_FACULTYADR_FACULTY FOREIGN KEY (FaculID) REFERENCES FACULTY (FaculID);

ALTER TABLE DEPARTADR ADD CONSTRAINT fk_DEPARTADR_BUILDING FOREIGN KEY (BuildID) REFERENCES BUILDING (BuildID);
ALTER TABLE DEPARTADR ADD CONSTRAINT fk_DEPARTADR_DEPARTMENT FOREIGN KEY (DepID) REFERENCES DEPARTMENT (DepID);

ALTER TABLE DEPARTMENT ADD CONSTRAINT fk_DEPARTMENT_SCHOOL FOREIGN KEY (SchID) REFERENCES SCHOOL (SchlID);

ALTER TABLE COURSE ADD CONSTRAINT fk_COURSE_DEPARTMENT FOREIGN KEY (DepID) REFERENCES DEPARTMENT (DepID);
ALTER TABLE COURSE ADD CONSTRAINT fk_COURSE_SEMESTROFFERED FOREIGN KEY (CID) REFERENCES COURSE (CID);

ALTER TABLE SCHOOLADR ADD CONSTRAINT fk_SCHOOLADR_SCHOOL FOREIGN KEY (SchID) REFERENCES SCHOOL (SchID);
ALTER TABLE SCHOOLADR ADD CONSTRAINT fk_SCHOOLADR_BUILDING FOREIGN KEY (BuildID) REFERENCES BUILDING (BuildID);
 
ALTER TABLE SCHPHONE ADD CONSTRAINT fk_SCHPHONE_SCHOOL FOREIGN KEY (SchlID) REFERENCES SCHOOL (SchlID);

ALTER TABLE PEREMAIL ADD CONSTRAINT fk_PEREMAIL_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (PerID);

ALTER TABLE PERPHONE ADD CONSTRAINT fk_PERPHONE_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (PerID);

ALTER TABLE CONTPHONE ADD CONSTRAINT fk_CONTPHONE_EMERCONTACT FOREIGN KEY (ContID) REFERENCES PERSON (ContID);

ALTER TABLE EMERCONTACT ADD CONSTRAINT fk_EMERCONTACT_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (PerID);

ALTER TABLE STUDENT ADD CONSTRAINT fk_STUDENT_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (DepID);
ALTER TABLE STUDENT ADD CONSTRAINT fk_STUDENT_SCHOOL FOREIGN KEY (CID) REFERENCES COURSE (CID);

ALTER TABLE REGISTERS ADD CONSTRAINT fk_REGISTERS_CLASS FOREIGN KEY (ClassID) REFERENCES CLASS (ClassID);
ALTER TABLE REGISTERS ADD CONSTRAINT fk_REGISTERS_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (PerID);

ALTER TABLE SUBSCRIBE ADD CONSTRAINT fk_SUBSCRIBE_PERSON FOREIGN KEY (PerID) REFERENCES PERSON (PerID);
ALTER TABLE SUBSCRIBE ADD CONSTRAINT fk_SUBSCRIBE_MAJOR FOREIGN KEY (MajID) REFERENCES MAJOR (MajID);