CREATE DATABASE movietickets
GO

USE movietickets
GO

CREATE TABLE SEATS
(
  seat_id VARCHAR(10) NOT NULL,
  seat_name VARCHAR(50) NOT NULL,
  noofseats INT NOT NULL,
  PRIMARY KEY (seat_id)
);

insert into seats values('S1','A1',6);
insert into seats values('S2','A2',7); 

CREATE TABLE MOVIE
(
  m_name VARCHAR(100) NOT NULL,
  actors VARCHAR(100) NOT NULL,
  director VARCHAR(100) NOT NULL,
  release_date DATE NOT NULL,
  m_id VARCHAR(50) NOT NULL,
  PRIMARY KEY (m_id)
);

insert into movie values('interstellar','cooper','christopher','2014-9-5','M1'); 
insert into movie values('bahubali','prabhas','rajamouli','2019-4-5','M2');


CREATE TABLE SHOW
(
  st_time TIME NOT NULL,
  end_time TIME NOT NULL,
  show_id VARCHAR(50) NOT NULL,
  language VARCHAR(50) NOT NULL,
  m_id VARCHAR(50) NOT NULL,
  PRIMARY KEY (show_id),
  FOREIGN KEY (m_id) REFERENCES MOVIE (m_id)
);

insert into show values('11:30','23:20','SH1','english','M1'); 
insert into show values('12:30','21:30','SH2','telugu','M2');

CREATE TABLE THEATRE
(
  tid VARCHAR(50) NOT NULL,
  tname VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL,
  PRIMARY KEY (tid)
);

insert into theatre values('T1','imax','tempe'); 
insert into theatre values('T2','inox','pheonix');

CREATE TABLE DISCOUNT
(
  offer_id VARCHAR(50) NOT NULL,
  m_name VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (offer_id)
);

insert into discount values('O1','bahubali',5); 
insert into discount values('O2','interstellar',2);

CREATE TABLE CUSTOMER
(
  cid VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(10) NOT NULL,
  email_id VARCHAR(50) NOT NULL,
  firstname VARCHAR(100) NOT NULL,
  middlename VARCHAR(100),
  lastname VARCHAR(100) NOT NULL,
  phone_no VARCHAR(20) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  dob DATE NOT NULL,
  address VARCHAR(500) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zipcode VARCHAR(50) NOT NULL,
  country_of_origin VARCHAR(100) NOT NULL,
  member_organization VARCHAR(100),
  PRIMARY KEY (cid)
);

insert into customer values('C1','kas','Lasppe1190','kas11@gmail.com','kash','','paru','4704707846','male','11-28-1996','12 uni tempe','tempe','az','85281','india',''); 
insert into customer values('C2','pujitha','Lasrrr1190','puj11@gmail.com','pujitha','','leo','4703678846','female','09-18-1996','11 avenue tempe','tempe','az','85681','india','');


CREATE TABLE BOOKING
(
  bookingdate DATE NOT NULL,
  ticket_no VARCHAR(50) NOT NULL,
  cid VARCHAR(100) NOT NULL,
  PRIMARY KEY (ticket_no),
  FOREIGN KEY (cid) REFERENCES CUSTOMER (cid)
);

insert into booking values('4-6-2015','TICK1','C1'); 
insert into booking values('5-6-2019','TICK2','C2');


CREATE TABLE TICKETS
(
  show_id VARCHAR(50) NOT NULL,
  show_date DATE NOT NULL,
  seat_no VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  tid VARCHAR(50) NOT NULL,
  hall_no INT NOT NULL,
  offer_id VARCHAR(50) NOT NULL,
  ticket_no VARCHAR(50) NOT NULL,
  FOREIGN KEY (show_id) REFERENCES SHOW (show_id),
  FOREIGN KEY (offer_id) REFERENCES DISCOUNT (offer_id),
  FOREIGN KEY (tid) REFERENCES THEATRE(tid),
  FOREIGN KEY (ticket_no) REFERENCES BOOKING (ticket_no)
);

insert into tickets values('SH1','3-4-2015','A1',15,'T1',2,'O1','TICK1'); 
insert into tickets values('SH2','5-6-2015','A2',14,'T2',3,'O2','TICK2');


CREATE TABLE HAS
(
  tid VARCHAR(50) NOT NULL,
  seat_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (tid, seat_id),
  FOREIGN KEY (tid) REFERENCES THEATRE (tid),
  FOREIGN KEY (seat_id) REFERENCES SEATS (seat_id)
);

insert into has values('T1','S1'); 
insert into has values('T2','S2');