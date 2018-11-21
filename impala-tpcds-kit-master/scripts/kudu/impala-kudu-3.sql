create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- income_band
create table income_band (
  ib_income_band_sk int,
  ib_lower_bound int,
  ib_upper_bound int,
  primary key(ib_income_band_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into income_band
select
  ib_income_band_sk ,
  ib_lower_bound ,
  ib_upper_bound 
from  tpcds_10000_kudu_text.income_band
;

-- item
create table item (
  i_item_sk int,
  i_item_id string,
  i_rec_start_date string,
  i_rec_end_date string,
  i_item_desc string,
  i_current_price double,
  i_wholesale_cost double,
  i_brand_id int,
  i_brand string,
  i_class_id int,
  i_class string,
  i_category_id int,
  i_category string,
  i_manufact_id int,
  i_manufact string,
  i_size string,
  i_formulation string,
  i_color string,
  i_units string,
  i_container string,
  i_manager_id int,
  i_product_name string,
  primary key(i_item_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into item
select
  i_item_sk ,
  i_item_id ,
  i_rec_start_date ,
  i_rec_end_date ,
  i_item_desc ,
  i_current_price ,
  i_wholesale_cost ,
  i_brand_id ,
  i_brand ,
  i_class_id ,
  i_class ,
  i_category_id ,
  i_category ,
  i_manufact_id ,
  i_manufact ,
  i_size ,
  i_formulation ,
  i_color ,
  i_units ,
  i_container ,
  i_manager_id ,
  i_product_name  
from  tpcds_10000_kudu_text.item
;

-- promotion
create table promotion (
  p_promo_sk int,
  p_promo_id string,
  p_start_date_sk int,
  p_end_date_sk int,
  p_item_sk int,
  p_cost double,
  p_response_target int,
  p_promo_name string,
  p_channel_dmail string,
  p_channel_email string,
  p_channel_catalog string,
  p_channel_tv string,
  p_channel_radio string,
  p_channel_press string,
  p_channel_event string,
  p_channel_demo string,
  p_channel_details string,
  p_purpose string,
  p_discount_active string ,
  primary key(p_promo_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into promotion
select
  p_promo_sk ,
  p_promo_id ,
  p_start_date_sk ,
  p_end_date_sk ,
  p_item_sk ,
  p_cost ,
  p_response_target ,
  p_promo_name ,
  p_channel_dmail ,
  p_channel_email ,
  p_channel_catalog ,
  p_channel_tv ,
  p_channel_radio ,
  p_channel_press ,
  p_channel_event ,
  p_channel_demo ,
  p_channel_details ,
  p_purpose ,
  p_discount_active  
from  tpcds_10000_kudu_text.promotion
;

-- reason
create table reason (
  r_reason_sk int,
  r_reason_id string,
  r_reason_desc string ,
  primary key(r_reason_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into reason
select
  r_reason_sk ,
  r_reason_id ,
  r_reason_desc 
from  tpcds_10000_kudu_text.reason
;

-- ship_mode
create table ship_mode (
  sm_ship_mode_sk int,
  sm_ship_mode_id string,
  sm_type string,
  sm_code string,
  sm_carrier string,
  sm_contract string  ,
  primary key(sm_ship_mode_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into ship_mode
select
  sm_ship_mode_sk ,
  sm_ship_mode_id ,
  sm_type ,
  sm_code ,
  sm_carrier ,
  sm_contract  
from  tpcds_10000_kudu_text.ship_mode
;

-- store
create table store (
  s_store_sk int,
  s_store_id string,
  s_rec_start_date string,
  s_rec_end_date string,
  s_closed_date_sk int,
  s_store_name string,
  s_number_employees int,
  s_floor_space int,
  s_hours string,
  s_manager string,
  s_market_id int,
  s_geography_class string,
  s_market_desc string,
  s_market_manager string,
  s_division_id int,
  s_division_name string,
  s_company_id int,
  s_company_name string,
  s_street_number string,
  s_street_name string,
  s_street_type string,
  s_suite_number string,
  s_city string,
  s_county string,
  s_state string,
  s_zip string,
  s_country string,
  s_gmt_offset double,
  s_tax_precentage double  ,
  primary key(s_store_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into store
select
  s_store_sk ,
  s_store_id ,
  s_rec_start_date ,
  s_rec_end_date ,
  s_closed_date_sk ,
  s_store_name ,
  s_number_employees ,
  s_floor_space ,
  s_hours ,
  s_manager ,
  s_market_id ,
  s_geography_class ,
  s_market_desc ,
  s_market_manager ,
  s_division_id ,
  s_division_name ,
  s_company_id ,
  s_company_name ,
  s_street_number ,
  s_street_name ,
  s_street_type ,
  s_suite_number ,
  s_city ,
  s_county ,
  s_state ,
  s_zip ,
  s_country ,
  s_gmt_offset ,
  s_tax_precentage   
from  tpcds_10000_kudu_text.store
;



