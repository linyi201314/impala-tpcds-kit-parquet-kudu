--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- web_returns
create table web_returns (
  wr_item_sk int,
  wr_order_number bigint,
  wr_returned_date_sk int,
  wr_returned_time_sk int,
  wr_refunded_customer_sk int,
  wr_refunded_cdemo_sk int,
  wr_refunded_hdemo_sk int,
  wr_refunded_addr_sk int,
  wr_returning_customer_sk int,
  wr_returning_cdemo_sk int,
  wr_returning_hdemo_sk int,
  wr_returning_addr_sk int,
  wr_web_page_sk int,
  wr_reason_sk int,
  wr_return_quantity int,
  wr_return_amt double,
  wr_return_tax double,
  wr_return_amt_inc_tax double,
  wr_fee double,
  wr_return_ship_cost double,
  wr_refunded_cash double,
  wr_reversed_charge double,
  wr_account_credit double,
  wr_net_loss double,
  primary key(wr_item_sk,wr_order_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into  web_returns
select 
  wr_item_sk ,
  wr_order_number ,
  wr_returned_date_sk ,
  wr_returned_time_sk ,
  wr_refunded_customer_sk ,
  wr_refunded_cdemo_sk ,
  wr_refunded_hdemo_sk ,
  wr_refunded_addr_sk ,
  wr_returning_customer_sk ,
  wr_returning_cdemo_sk ,
  wr_returning_hdemo_sk ,
  wr_returning_addr_sk ,
  wr_web_page_sk ,
  wr_reason_sk ,
  wr_return_quantity ,
  wr_return_amt ,
  wr_return_tax ,
  wr_return_amt_inc_tax ,
  wr_fee ,
  wr_return_ship_cost ,
  wr_refunded_cash ,
  wr_reversed_charge ,
  wr_account_credit ,
  wr_net_loss 
from tpcds_10000_kudu_text.web_returns
;

