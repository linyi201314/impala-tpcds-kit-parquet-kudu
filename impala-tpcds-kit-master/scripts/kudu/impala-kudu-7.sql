--
-- modify this file to contain the correct:
-- * schema name (currently tpcds_10000_text)
-- * location path (currently /tmp/tpc-ds/sf10000)

create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- store_returns
create table store_returns (
  sr_item_sk int,
  sr_ticket_number bigint,
  sr_returned_date_sk int,
  sr_return_time_sk int,
  sr_customer_sk int,
  sr_cdemo_sk int,
  sr_hdemo_sk int,
  sr_addr_sk int,
  sr_store_sk int,
  sr_reason_sk int,
  sr_return_quantity int,
  sr_return_amt double,
  sr_return_tax double,
  sr_return_amt_inc_tax double,
  sr_fee double,
  sr_return_ship_cost double,
  sr_refunded_cash double,
  sr_reversed_charge double,
  sr_store_credit double,
  sr_net_loss double,
  primary key(sr_item_sk,sr_ticket_number)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into  store_returns
select 
  sr_item_sk ,
  sr_ticket_number ,
  sr_returned_date_sk ,
  sr_return_time_sk ,
  sr_customer_sk ,
  sr_cdemo_sk ,
  sr_hdemo_sk ,
  sr_addr_sk ,
  sr_store_sk ,
  sr_reason_sk ,
  sr_return_quantity ,
  sr_return_amt ,
  sr_return_tax ,
  sr_return_amt_inc_tax ,
  sr_fee ,
  sr_return_ship_cost ,
  sr_refunded_cash ,
  sr_reversed_charge ,
  sr_store_credit ,
  sr_net_loss 
from tpcds_10000_kudu_text.store_returns
;

