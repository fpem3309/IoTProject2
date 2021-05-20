DROP TABLE ms_member CASCADE CONSTRAINTS;
DROP SEQUENCE msm_no_seq;
CREATE TABLE ms_member (
 msm_no number NOT NULL,
 msm_id varchar2(50) NOT NULL,
 msm_password varchar2(50) NOT NULL,
 msm_name varchar2(50) NOT NULL,
 msm_phone varchar2(14) NULL,
 msm_email varchar2(50) NULL,
 msm_level_no number(2) NOT NULL,
 msm_point number NULL,
 msm_car varchar2(50) null,
 msm_denied number(2) NOT NULL,
 CONSTRAINT  msm_no_pk  PRIMARY KEY ( msm_no )
);
CREATE SEQUENCE msm_no_seq START WITH 1;

insert into ms_member values(msm_no_seq.nextval, 'admin', '1234', 'administrator', '010-111-2222', 'admin@admin.com', 1, 1000, '1A1111', 1);
 
DROP TABLE ms_notice_board CASCADE CONSTRAINTS;
DROP SEQUENCE msnb_no_seq;
CREATE TABLE ms_notice_board (
 msnb_no number NOT NULL,
 msnb_subject varchar2(200) NOT NULL,
 msnb_content varchar2(4000) NOT NULL,
 msm_no number NOT NULL,
 msnb_date date NOT NULL,
 msnb_hit number null,
 CONSTRAINT  msnb_no_pk  PRIMARY KEY ( msnb_no ),
 CONSTRAINT  msm_no_mnb_fk  FOREIGN KEY ( msm_no ) REFERENCES ms_member( msm_no )
);
CREATE SEQUENCE msnb_no_seq START WITH 1;

DROP TABLE ms_parking CASCADE CONSTRAINTS;
DROP SEQUENCE msp_no_seq;
CREATE TABLE ms_parking (
 msp_no number NOT NULL,
 msm_no number not null,
 msp_location varchar2(200) not null,
 msp_num number(10) not null,
 msp_type number(2) NOT NULL,
 msp_date date noT NULL,
 CONSTRAINT  msp_no_pk  PRIMARY KEY ( msp_no ),
 CONSTRAINT  msm_no_mp_fk  FOREIGN KEY ( msm_no ) REFERENCES ms_member( msm_no )
);
CREATE SEQUENCE msp_no_seq START WITH 1;

DROP TABLE ms_reserv_price CASCADE CONSTRAINTS;
DROP SEQUENCE msrp_no_seq;
CREATE TABLE ms_reserv_price (
 msrp_no number NOT NULL,
 msp_no number NOT NULL,
 msrp_type number(2) NOT NULL,
 msrp_price number noT NULL,
 msm_no number noT NULL,
 msrp_date date noT NULL,
 CONSTRAINT  msrp_no_pk  PRIMARY KEY ( msrp_no ),
 CONSTRAINT  msp_no_mrp_fk  FOREIGN KEY ( msp_no ) REFERENCES ms_parking( msp_no ),
 CONSTRAINT  msm_no_mrp_fk  FOREIGN KEY ( msm_no ) REFERENCES ms_member( msm_no )
);
CREATE SEQUENCE msrp_no_seq START WITH 1;

DROP TABLE ms_reserv CASCADE CONSTRAINTS;
DROP SEQUENCE msr_no_seq;
CREATE TABLE ms_reserv (
 msr_no number NOT NULL,
 msp_no number NOT NULL,
 msr_num number(50) NOT NULL,
 msr_date date NOT NULL,
 msr_price number(10) NOT NULL,
 msm_no number NOT NULL,
 msr_status number(2) NOT NULL,
 msr_reserv number(2) NOT NULL,
 msr_usedate date null,
 msr_usedate2 date null,
 msr_use number(2) null,
 CONSTRAINT  msr_no_pk  PRIMARY KEY ( msr_no ),
 CONSTRAINT  msp_no_mr_fk  FOREIGN KEY ( msp_no ) REFERENCES ms_parking( msp_no ),
 CONSTRAINT  msm_no_mr_fk  FOREIGN KEY ( msm_no ) REFERENCES ms_member( msm_no )
);
CREATE SEQUENCE msr_no_seq START WITH 1;