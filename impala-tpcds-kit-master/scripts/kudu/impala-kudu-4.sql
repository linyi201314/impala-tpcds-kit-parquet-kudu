--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- time_dim
create table time_dim (
  t_time_sk int,
  t_time_id string,
  t_time int,
  t_hour int,
  t_minute int,
  t_second int,
  t_am_pm string,
  t_shift string,
  t_sub_shift string,
  t_meal_time string,
  PRIMARY KEY(t_time_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into time_dim
select
  t_time_sk ,
  t_time_id ,
  t_time ,
  t_hour ,
  t_minute ,
  t_second ,
  t_am_pm ,
  t_shift ,
  t_sub_shift ,
  t_meal_time 
from  tpcds_10000_kudu_text.time_dim
;

-- warehouse
create table warehouse (
  w_warehouse_sk int,
  w_warehouse_id string,
  w_warehouse_name string,
  w_warehouse_sq_ft int,
  w_street_number string,
  w_street_name string,
  w_street_type string,
  w_suite_number string,
  w_city string,
  w_county string,
  w_state string,
  w_zip string,
  w_country string,
  w_gmt_offset double,
  PRIMARY KEY(w_warehouse_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into warehouse
select
  w_warehouse_sk ,
  w_warehouse_id ,
  w_warehouse_name ,
  w_warehouse_sq_ft ,
  w_street_number ,
  w_street_name ,
  w_street_type ,
  w_suite_number ,
  w_city ,
  w_county ,
  w_state ,
  w_zip ,
  w_country ,
  w_gmt_offset 
from tpcds_10000_kudu_text.warehouse
;
--web_page
create table web_page (
  wp_web_page_sk int,
  wp_web_page_id string,
  wp_rec_start_date string,
  wp_rec_end_date string,
  wp_creation_date_sk int,
  wp_access_date_sk int,
  wp_autogen_flag string,
  wp_customer_sk int,
  wp_url string,
  wp_type string,
  wp_char_count int,
  wp_link_count int,
  wp_image_count int,
  wp_max_ad_count int,
  PRIMARY KEY(wp_web_page_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;

insert into  web_page
select 
  wp_web_page_sk ,
  wp_web_page_id ,
  wp_rec_start_date ,
  wp_rec_end_date ,
  wp_creation_date_sk ,
  wp_access_date_sk ,
  wp_autogen_flag ,
  wp_customer_sk ,
  wp_url ,
  wp_type ,
  wp_char_count ,
  wp_link_count ,
  wp_image_count ,
  wp_max_ad_count 
from tpcds_10000_kudu_text.web_page;

