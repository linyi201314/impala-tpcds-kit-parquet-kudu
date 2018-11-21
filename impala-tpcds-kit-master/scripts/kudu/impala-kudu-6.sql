create schema if not exists tpcds_10000_kudu;
use tpcds_10000_kudu;

-- inventory
create table inventory (
  inv_date_sk int,
  inv_item_sk int,
  inv_warehouse_sk int,
  inv_quantity_on_hand int,
  primary key(inv_date_sk,inv_item_sk,inv_warehouse_sk)
)
PARTITION BY HASH PARTITIONS 16
stored as kudu
;
insert into inventory
select
  inv_date_sk ,
  inv_item_sk ,
  inv_warehouse_sk ,
  inv_quantity_on_hand 
from  tpcds_10000_kudu_text.inventory
;

