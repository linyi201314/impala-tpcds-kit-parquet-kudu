--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

create table web_sales (
  ws_item_sk int,
  ws_order_number bigint,
  ws_sold_date_sk int,
  ws_sold_time_sk int,
  ws_ship_date_sk int,
  ws_bill_customer_sk int,
  ws_bill_cdemo_sk int,
  ws_bill_hdemo_sk int,
  ws_bill_addr_sk int,
  ws_ship_customer_sk int,
  ws_ship_cdemo_sk int,
  ws_ship_hdemo_sk int,
  ws_ship_addr_sk int,
  ws_web_page_sk int,
  ws_web_site_sk int,
  ws_ship_mode_sk int,
  ws_warehouse_sk int,
  ws_promo_sk int,
  ws_quantity int,
  ws_wholesale_cost double,
  ws_list_price double,
  ws_sales_price double,
  ws_ext_discount_amt double,
  ws_ext_sales_price double,
  ws_ext_wholesale_cost double,
  ws_ext_list_price double,
  ws_ext_tax double,
  ws_coupon_amt double,
  ws_ext_ship_cost double,
  ws_net_paid double,
  ws_net_paid_inc_tax double,
  ws_net_paid_inc_ship double,
  ws_net_paid_inc_ship_tax double,
  ws_net_profit double,
  primary key(ws_item_sk,ws_order_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;

insert into  web_sales
select 
  ws_item_sk ,
  ws_order_number ,
  ws_sold_date_sk ,
  ws_sold_time_sk ,
  ws_ship_date_sk ,
  ws_bill_customer_sk ,
  ws_bill_cdemo_sk ,
  ws_bill_hdemo_sk ,
  ws_bill_addr_sk ,
  ws_ship_customer_sk ,
  ws_ship_cdemo_sk ,
  ws_ship_hdemo_sk ,
  ws_ship_addr_sk ,
  ws_web_page_sk ,
  ws_web_site_sk ,
  ws_ship_mode_sk ,
  ws_warehouse_sk ,
  ws_promo_sk ,
  ws_quantity ,
  ws_wholesale_cost ,
  ws_list_price ,
  ws_sales_price ,
  ws_ext_discount_amt ,
  ws_ext_sales_price ,
  ws_ext_wholesale_cost ,
  ws_ext_list_price ,
  ws_ext_tax ,
  ws_coupon_amt ,
  ws_ext_ship_cost ,
  ws_net_paid ,
  ws_net_paid_inc_tax ,
  ws_net_paid_inc_ship ,
  ws_net_paid_inc_ship_tax ,
  ws_net_profit 
from tpcds_10000_kudu_text.web_sales;

