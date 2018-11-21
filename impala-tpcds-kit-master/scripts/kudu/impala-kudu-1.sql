--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- call_center

create table call_center (
  cc_call_center_sk int,
  cc_call_center_id string,
  cc_rec_start_date string,
  cc_rec_end_date string,
  cc_closed_date_sk int,
  cc_open_date_sk int,
  cc_name string,
  cc_class string,
  cc_employees int,
  cc_sq_ft int,
  cc_hours string,
  cc_manager string,
  cc_mkt_id int,
  cc_mkt_class string,
  cc_mkt_desc string,
  cc_market_manager string,
  cc_division int,
  cc_division_name string,
  cc_company int,
  cc_company_name string,
  cc_street_number string,
  cc_street_name string,
  cc_street_type string,
  cc_suite_number string,
  cc_city string,
  cc_county string,
  cc_state string,
  cc_zip string,
  cc_country string,
  cc_gmt_offset double,
  cc_tax_percentage double,
  PRIMARY KEY(cc_call_center_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;


insert into  call_center 
select
  cc_call_center_sk,
  cc_call_center_id,
  cc_rec_start_date,
  cc_rec_end_date,
  cc_closed_date_sk,
  cc_open_date_sk,
  cc_name,
  cc_class,
  cc_employees,
  cc_sq_ft,
  cc_hours,
  cc_manager,
  cc_mkt_id,
  cc_mkt_class,
  cc_mkt_desc,
  cc_market_manager,
  cc_division,
  cc_division_name,
  cc_company,
  cc_company_name,
  cc_street_number,
  cc_street_name,
  cc_street_type,
  cc_suite_number,
  cc_city,
  cc_county,
  cc_state,
  cc_zip,
  cc_country,
  cc_gmt_offset,
  cc_tax_percentage
from tpcds_10000_kudu_text.call_center
;

-- catalog_page
create table catalog_page (
  cp_catalog_page_sk int,
  cp_catalog_page_id string,
  cp_start_date_sk int,
  cp_end_date_sk int,
  cp_department string,
  cp_catalog_number int,
  cp_catalog_page_number int,
  cp_description string,
  cp_type string,
  PRIMARY KEY(cp_catalog_page_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into catalog_page
select
  cp_catalog_page_sk ,
  cp_catalog_page_id ,
  cp_start_date_sk ,
  cp_end_date_sk ,
  cp_department ,
  cp_catalog_number ,
  cp_catalog_page_number,
  cp_description ,
  cp_type
from  tpcds_10000_kudu_text.catalog_page
;
