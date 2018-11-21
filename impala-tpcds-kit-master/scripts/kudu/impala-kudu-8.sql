--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- catalog_returns
create table catalog_returns (
  cr_item_sk int,
  cr_order_number bigint,
  cr_returned_date_sk int,
  cr_returned_time_sk int,
  cr_refunded_customer_sk int,
  cr_refunded_cdemo_sk int,
  cr_refunded_hdemo_sk int,
  cr_refunded_addr_sk int,
  cr_returning_customer_sk int,
  cr_returning_cdemo_sk int,
  cr_returning_hdemo_sk int,
  cr_returning_addr_sk int,
  cr_call_center_sk int,
  cr_catalog_page_sk int,
  cr_ship_mode_sk int,
  cr_warehouse_sk int,
  cr_reason_sk int,
  cr_return_quantity int,
  cr_return_amount double,
  cr_return_tax double,
  cr_return_amt_inc_tax double,
  cr_fee double,
  cr_return_ship_cost double,
  cr_refunded_cash double,
  cr_reversed_charge double,
  cr_store_credit double,
  cr_net_loss double,
  PRIMARY KEY(cr_item_sk,cr_order_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into  catalog_returns 
select 
  cr_item_sk ,
  cr_order_number ,
  cr_returned_date_sk ,
  cr_returned_time_sk ,
  cr_refunded_customer_sk ,
  cr_refunded_cdemo_sk ,
  cr_refunded_hdemo_sk ,
  cr_refunded_addr_sk ,
  cr_returning_customer_sk ,
  cr_returning_cdemo_sk ,
  cr_returning_hdemo_sk ,
  cr_returning_addr_sk ,
  cr_call_center_sk ,
  cr_catalog_page_sk ,
  cr_ship_mode_sk ,
  cr_warehouse_sk ,
  cr_reason_sk ,
  cr_return_quantity ,
  cr_return_amount ,
  cr_return_tax ,
  cr_return_amt_inc_tax ,
  cr_fee ,
  cr_return_ship_cost ,
  cr_refunded_cash ,
  cr_reversed_charge ,
  cr_store_credit ,
  cr_net_loss 
from tpcds_10000_kudu_text.catalog_returns
;

create  table catalog_sales (
  cs_item_sk int,
  cs_order_number bigint,
  cs_sold_date_sk int,
  cs_sold_time_sk int,
  cs_ship_date_sk int,
  cs_bill_customer_sk int,
  cs_bill_cdemo_sk int,
  cs_bill_hdemo_sk int,
  cs_bill_addr_sk int,
  cs_ship_customer_sk int,
  cs_ship_cdemo_sk int,
  cs_ship_hdemo_sk int,
  cs_ship_addr_sk int,
  cs_call_center_sk int,
  cs_catalog_page_sk int,
  cs_ship_mode_sk int,
  cs_warehouse_sk int,
  cs_promo_sk int,
  cs_quantity int,
  cs_wholesale_cost double,
  cs_list_price double,
  cs_sales_price double,
  cs_ext_discount_amt double,
  cs_ext_sales_price double,
  cs_ext_wholesale_cost double,
  cs_ext_list_price double,
  cs_ext_tax double,
  cs_coupon_amt double,
  cs_ext_ship_cost double,
  cs_net_paid double,
  cs_net_paid_inc_tax double,
  cs_net_paid_inc_ship double,
  cs_net_paid_inc_ship_tax double,
  cs_net_profit double,
  PRIMARY KEY(cs_item_sk,cs_order_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;

insert into  catalog_sales 
select 
  cs_item_sk ,
  cs_order_number ,
  cs_sold_date_sk ,
  cs_sold_time_sk ,
  cs_ship_date_sk ,
  cs_bill_customer_sk ,
  cs_bill_cdemo_sk ,
  cs_bill_hdemo_sk ,
  cs_bill_addr_sk ,
  cs_ship_customer_sk ,
  cs_ship_cdemo_sk ,
  cs_ship_hdemo_sk ,
  cs_ship_addr_sk ,
  cs_call_center_sk ,
  cs_catalog_page_sk ,
  cs_ship_mode_sk ,
  cs_warehouse_sk ,
  cs_promo_sk ,
  cs_quantity ,
  cs_wholesale_cost ,
  cs_list_price ,
  cs_sales_price ,
  cs_ext_discount_amt ,
  cs_ext_sales_price ,
  cs_ext_wholesale_cost ,
  cs_ext_list_price ,
  cs_ext_tax ,
  cs_coupon_amt ,
  cs_ext_ship_cost ,
  cs_net_paid ,
  cs_net_paid_inc_tax ,
  cs_net_paid_inc_ship ,
  cs_net_paid_inc_ship_tax ,
  cs_net_profit 
from tpcds_10000_kudu_text.catalog_sales;

