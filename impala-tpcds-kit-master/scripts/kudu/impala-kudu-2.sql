--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- customer

create table customer (
  c_customer_sk int,
  c_customer_id string,
  c_current_cdemo_sk int,
  c_current_hdemo_sk int,
  c_current_addr_sk int,
  c_first_shipto_date_sk int,
  c_first_sales_date_sk int,
  c_salutation string,
  c_first_name string,
  c_last_name string,
  c_preferred_cust_flag string,
  c_birth_day int,
  c_birth_month int,
  c_birth_year int,
  c_birth_country string,
  c_login string,
  c_email_address string,
  c_last_review_date string,
  PRIMARY KEY(c_customer_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;


insert into  customer
select
  c_customer_sk ,
  c_customer_id ,
  c_current_cdemo_sk ,
  c_current_hdemo_sk ,
  c_current_addr_sk ,
  c_first_shipto_date_sk ,
  c_first_sales_date_sk ,
  c_salutation ,
  c_first_name ,
  c_last_name ,
  c_preferred_cust_flag ,
  c_birth_day ,
  c_birth_month ,
  c_birth_year ,
  c_birth_country ,
  c_login ,
  c_email_address ,
  c_last_review_date 
from tpcds_10000_kudu_text.customer
;

-- customer_address
create table customer_address (
  ca_address_sk int,
  ca_address_id string,
  ca_street_number string,
  ca_street_name string,
  ca_street_type string,
  ca_suite_number string,
  ca_city string,
  ca_county string,
  ca_state string,
  ca_zip string,
  ca_country string,
  ca_gmt_offset double,
  ca_location_type string,
  PRIMARY KEY(ca_address_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into customer_address
select
  ca_address_sk ,
  ca_address_id ,
  ca_street_number ,
  ca_street_name ,
  ca_street_type ,
  ca_suite_number ,
  ca_city ,
  ca_county ,
  ca_state ,
  ca_zip ,
  ca_country ,
  ca_gmt_offset ,
  ca_location_type 
from  tpcds_10000_kudu_text.customer_address
;



-- customer_demographics
create table customer_demographics (
  cd_demo_sk int,
  cd_gender string,
  cd_marital_status string,
  cd_education_status string,
  cd_purchase_estimate int,
  cd_credit_rating string,
  cd_dep_count int,
  cd_dep_employed_count int,
  cd_dep_college_count int,
  PRIMARY KEY(cd_demo_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into customer_demographics
select
  cd_demo_sk,
  cd_gender,
  cd_marital_status ,
  cd_education_status ,
  cd_purchase_estimate ,
  cd_credit_rating,
  cd_dep_count ,
  cd_dep_employed_count ,
  cd_dep_college_count 
from tpcds_10000_kudu_text.customer_demographics
;
--date_dim
create  table date_dim (
  d_date_sk int,
  d_date_id string,
  d_date string,
  d_month_seq int,
  d_week_seq int,
  d_quarter_seq int,
  d_year int,
  d_dow int,
  d_moy int,
  d_dom int,
  d_qoy int,
  d_fy_year int,
  d_fy_quarter_seq int,
  d_fy_week_seq int,
  d_day_name string,
  d_quarter_name string,
  d_holiday string,
  d_weekend string,
  d_following_holiday string,
  d_first_dom int,
  d_last_dom int,
  d_same_day_ly int,
  d_same_day_lq int,
  d_current_day string,
  d_current_week string,
  d_current_month string,
  d_current_quarter string,
  d_current_year string,
  PRIMARY KEY(d_date_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;

insert into  date_dim
select 
  d_date_sk ,
  d_date_id ,
  d_date ,
  d_month_seq ,
  d_week_seq ,
  d_quarter_seq ,
  d_year ,
  d_dow ,
  d_moy ,
  d_dom ,
  d_qoy ,
  d_fy_year ,
  d_fy_quarter_seq ,
  d_fy_week_seq ,
  d_day_name ,
  d_quarter_name ,
  d_holiday ,
  d_weekend ,
  d_following_holiday ,
  d_first_dom ,
  d_last_dom ,
  d_same_day_ly ,
  d_same_day_lq ,
  d_current_day ,
  d_current_week ,
  d_current_month ,
  d_current_quarter ,
  d_current_year 
from tpcds_10000_kudu_text.date_dim;

-- household_demographics
create table household_demographics (
  hd_demo_sk int,
  hd_income_band_sk int,
  hd_buy_potential string,
  hd_dep_count int,
  hd_vehicle_count int,
  PRIMARY KEY(hd_demo_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into household_demographics 
select 
  hd_demo_sk ,
  hd_income_band_sk ,
  hd_buy_potential ,
  hd_dep_count ,
  hd_vehicle_count 
from tpcds_10000_kudu_text.household_demographics;
