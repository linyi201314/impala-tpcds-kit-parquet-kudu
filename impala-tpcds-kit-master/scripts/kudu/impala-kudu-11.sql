--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)
create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

create table store_sales (
  ss_item_sk int,
  ss_ticket_number bigint,
  ss_sold_date_sk int,
  ss_sold_time_sk int,
  ss_customer_sk int,
  ss_cdemo_sk int,
  ss_hdemo_sk int,
  ss_addr_sk int,
  ss_store_sk int,
  ss_promo_sk int,
  ss_quantity int,
  ss_wholesale_cost double,
  ss_list_price double,
  ss_sales_price double,
  ss_ext_discount_amt double,
  ss_ext_sales_price double,
  ss_ext_wholesale_cost double,
  ss_ext_list_price double,
  ss_ext_tax double,
  ss_coupon_amt double,
  ss_net_paid double,
  ss_net_paid_inc_tax double,
  ss_net_profit double , 
  primary key(ss_item_sk,ss_ticket_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into  store_sales
select 
  ss_item_sk ,
  ss_ticket_number ,
  ss_sold_date_sk ,
  ss_sold_time_sk ,
  ss_customer_sk ,
  ss_cdemo_sk ,
  ss_hdemo_sk ,
  ss_addr_sk,
  ss_store_sk ,
  ss_promo_sk ,
  ss_quantity ,
  ss_wholesale_cost ,
  ss_list_price ,
  ss_sales_price ,
  ss_ext_discount_amt ,
  ss_ext_sales_price ,
  ss_ext_wholesale_cost ,
  ss_ext_list_price ,
  ss_ext_tax ,
  ss_coupon_amt ,
  ss_net_paid ,
  ss_net_paid_inc_tax ,
  ss_net_profit  
from tpcds_10000_kudu_text.store_sales
;
