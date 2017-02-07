if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('mem_product') and o.name = 'fk_prod_mem')
alter table mem_product
   drop constraint fk_prod_mem
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('mem_product') and o.name = 'fk_mem_prod')
alter table mem_product
   drop constraint fk_mem_prod
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('mem_product_plan') and o.name = 'fk_mem_prod_reference_mem_prod')
alter table mem_product_plan
   drop constraint fk_mem_prod_reference_mem_prod
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('mem_product_standard') and o.name = 'fk_mem_prod_reference_product_')
alter table mem_product_standard
   drop constraint fk_mem_prod_reference_product_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('mem_product_standard') and o.name = 'fk_mem_prod_reference_mem_prod')
alter table mem_product_standard
   drop constraint fk_mem_prod_reference_mem_prod
go

if exists (select 1
            from  sysobjects
           where  id = object_id('mem_product')
            and   type = 'U')
   drop table mem_product
go

if exists (select 1
            from  sysobjects
           where  id = object_id('mem_product_plan')
            and   type = 'U')
   drop table mem_product_plan
go

if exists (select 1
            from  sysobjects
           where  id = object_id('mem_product_standard')
            and   type = 'U')
   drop table mem_product_standard
go

if exists (select 1
            from  sysobjects
           where  id = object_id('product_standard')
            and   type = 'U')
   drop table product_standard
go

if exists (select 1
            from  sysobjects
           where  id = object_id('product_unit')
            and   type = 'U')
   drop table product_unit
go

create rule r_status_flag as
      @column = upper(@column)
go

/*==============================================================*/
/* Table: mem_product                                           */
/*==============================================================*/
create table mem_product (
   member_code          varchar(30)          not null,
   product_code         varchar(30)          not null,
   grow_area            decimal(7,2)         null,
   product_unit         varchar(30)          null,
   store_quantity       integer              null,
   retail_price         money                null,
   wholesale_price      money                null,
   wholesale_condition  varbinary(100)       null,
   product_life         varchar(50)          null,
   capacity_per_day     varchar(50)          null,
   capacity_per_month   varchar(50)          null,
   advance_order_condition varchar(150)         null,
   distribution_channels vavrchar(150)        null,
   contact_telephone    varchar(30)          null,
   contact_email        varchar(50)          null,
   contact_other        varchar(50)          null,
   delivery_post        char(1)              null,
   delivery_bus         char(1)              null,
   delivery_train       char(1)              null,
   delivery_other       varchar(50)          null,
   product_detail       varchar(500)         null,
   x_status             char(1)              null,
   x_note               nvarchar(50)         null,
   x_log                nvarchar(500)        null,
   id                   binary(99)           not null,
   rowversion           timestamp            null,
   constraint pk_mem_product primary key (product_code, member_code)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('mem_product') and minor_id = 0)
begin 
   declare @currentuser sysname 
select @currentuser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @currentuser, 'table', 'mem_product' 
 
end 


select @currentuser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ผลผลิตรายบุคล', 
   'user', @currentuser, 'table', 'mem_product'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'member_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'member_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสสมาชิก',
   'user', @currentuser, 'table', 'mem_product', 'column', 'member_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสผลผลิต',
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grow_area')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'grow_area'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'พื้นที่เพาะปลูก / เลี้ยงสัตว์   ไร่.งาน เช่น 1.1 คือ 1ไร่ 1 งาน',
   'user', @currentuser, 'table', 'mem_product', 'column', 'grow_area'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_unit')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_unit'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'หน่วยนับผลิตภัณฑ์',
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_unit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'store_quantity')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'store_quantity'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'จำนวนในสต๊อก',
   'user', @currentuser, 'table', 'mem_product', 'column', 'store_quantity'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'retail_price')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'retail_price'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ราคาขายปลีก',
   'user', @currentuser, 'table', 'mem_product', 'column', 'retail_price'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'wholesale_price')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'wholesale_price'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ราคาขายส่ง',
   'user', @currentuser, 'table', 'mem_product', 'column', 'wholesale_price'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'wholesale_condition')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'wholesale_condition'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'เงื่อนไขสินค้าราคาส่ง',
   'user', @currentuser, 'table', 'mem_product', 'column', 'wholesale_condition'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_life')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_life'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ระยะเวลาในการเก็บรักษา',
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_life'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'capacity_per_day')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'capacity_per_day'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'กำลังการผลิตต่อวัน',
   'user', @currentuser, 'table', 'mem_product', 'column', 'capacity_per_day'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'capacity_per_month')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'capacity_per_month'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'กำลังการผลิตต่อเดือน',
   'user', @currentuser, 'table', 'mem_product', 'column', 'capacity_per_month'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'advance_order_condition')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'advance_order_condition'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'เงื่อนไขการสั่งล่วงหน้า',
   'user', @currentuser, 'table', 'mem_product', 'column', 'advance_order_condition'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'distribution_channels')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'distribution_channels'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ช่องทางในการจำหน่าย',
   'user', @currentuser, 'table', 'mem_product', 'column', 'distribution_channels'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_telephone')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_telephone'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ช่องทางการสั่งซื้อ (โทรศัพท์)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_telephone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_email')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_email'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ช่องทางการสั่งซื้อ (e-Mail)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_other')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_other'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ช่องทางการสั่งซื้อ (อื่นๆ)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'contact_other'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delivery_post')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_post'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ข้อมูลการขนส่ง (ไปรษณีย์)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_post'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delivery_bus')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_bus'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ข้อมูลการขนส่ง (รถทัวร์)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_bus'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delivery_train')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_train'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ข้อมูลการขนส่ง (รถไฟ)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_train'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delivery_other')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_other'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ข้อมูลการขนส่ง (อื่นๆ)',
   'user', @currentuser, 'table', 'mem_product', 'column', 'delivery_other'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_detail')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_detail'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รายละเอียดสินค้า',
   'user', @currentuser, 'table', 'mem_product', 'column', 'product_detail'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product', 'column', 'id'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'for web update',
   'user', @currentuser, 'table', 'mem_product', 'column', 'id'
go

/*==============================================================*/
/* Table: mem_product_plan                                      */
/*==============================================================*/
create table mem_product_plan (
   member_code          varchar(30)          not null,
   product_code         varchar(30)          not null,
   "launch date"        datetime             not null,
   launch_year          varchar(4)           not null,
   period_no            int                  not null,
   estimate_qty         integer              null,
   actual_qty           integer              null,
   x_status             char(1)              null,
   x_note               nvarchar(50)         null,
   x_log                nvarchar(500)        null,
   id                   binary(99)           not null,
   rowversion           timestamp            null,
   constraint pk_mem_product_plan primary key (product_code, member_code, "launch date")
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('mem_product_plan') and minor_id = 0)
begin 
   declare @currentuser sysname 
select @currentuser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @currentuser, 'table', 'mem_product_plan' 
 
end 


select @currentuser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ประมาณการผลผลิตออกสู่ตลาด', 
   'user', @currentuser, 'table', 'mem_product_plan'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'member_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'member_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสสมาชิก',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'member_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'product_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสผลผลิต',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'product_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'launch date')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'launch date'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'วันที่ประมาณการผลิตภัณฑ์ออกสู่ตลาด',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'launch date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'launch_year')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'launch_year'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ปีที่ประมาณการผลิตภัณฑ์ออกสู่ตลาด
   ',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'launch_year'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'period_no')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'period_no'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'งวดที่ (ประจำปี)',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'period_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'estimate_qty')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'estimate_qty'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'จำนวนประมาณการผลิตภัณฑ์ออกสู่ตลาด',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'estimate_qty'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'actual_qty')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'actual_qty'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'จำนวนที่ผลิดได้จริงของผลิตภัณฑ์ออกสู่ตลาด',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'actual_qty'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_plan')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'id'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'for web update',
   'user', @currentuser, 'table', 'mem_product_plan', 'column', 'id'
go

/*==============================================================*/
/* Table: mem_product_standard                                  */
/*==============================================================*/
create table mem_product_standard (
   member_code          varchar(30)          not null,
   product_code         varchar(30)          not null,
   standard_code        varchar(30)          not null,
   rec_no               int                  not null,
   ref_image            varchar(30)          null,
   x_status             char(1)              null,
   x_note               nvarchar(50)         null,
   x_log                nvarchar(500)        null,
   id                   binary(99)           not null,
   rowversion           timestamp            null,
   constraint pk_mem_product_standard primary key (product_code, member_code, standard_code)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('mem_product_standard') and minor_id = 0)
begin 
   declare @currentuser sysname 
select @currentuser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @currentuser, 'table', 'mem_product_standard' 
 
end 


select @currentuser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'มาตรฐานผลิตภัณฑ์รายบุคล', 
   'user', @currentuser, 'table', 'mem_product_standard'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'member_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'member_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสสมาชิก',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'member_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'product_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'product_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสผลผลิต',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'product_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'standard_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'standard_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสมาตรฐานผลิตภัณฑ์',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'standard_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'rec_no')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'rec_no'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ลำดับที่',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'rec_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ref_image')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'ref_image'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'อ้างอิงไฟล์รูปภาพมาตรฐานผลิภัณฑ์',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'ref_image'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('mem_product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'id'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'for web update',
   'user', @currentuser, 'table', 'mem_product_standard', 'column', 'id'
go

/*==============================================================*/
/* Table: product_standard                                      */
/*==============================================================*/
create table product_standard (
   standard_code        varchar(30)          not null,
   standard_desc_thai   varchar(100)         null,
   standard_desc_eng    varchar(100)         null,
   x_status             char(1)              null,
   x_note               nvarchar(50)         null,
   x_log                nvarchar(500)        null,
   id                   binary(99)           not null,
   rowversion           timestamp            null,
   constraint pk_product_standard primary key (standard_code)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('product_standard') and minor_id = 0)
begin 
   declare @currentuser sysname 
select @currentuser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @currentuser, 'table', 'product_standard' 
 
end 


select @currentuser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ข้อมูลมาตรฐานผลผลิต
   ', 
   'user', @currentuser, 'table', 'product_standard'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'standard_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสมาตรฐานผลิตภัณฑ์',
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'standard_desc_thai')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_desc_thai'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รายละเอียดมาตรฐานผลิตภัณฑ์',
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_desc_thai'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'standard_desc_eng')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_desc_eng'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รายละเอียดมาตรฐานผลิตภัณฑ์ (อังกฤษ)',
   'user', @currentuser, 'table', 'product_standard', 'column', 'standard_desc_eng'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_standard')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_standard', 'column', 'id'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'for web update',
   'user', @currentuser, 'table', 'product_standard', 'column', 'id'
go

/*==============================================================*/
/* Table: product_unit                                          */
/*==============================================================*/
create table product_unit (
   unit_code            varchar(3)           not null,
   unit_desc_thai       varchar(30)          not null,
   unit_desc_eng        varchar(30)          null,
   x_status             char(1)              null,
   x_note               nvarchar(50)         null,
   x_log                nvarchar(500)        null,
   id                   binary(99)           not null,
   rowversion           timestamp            null,
   constraint pk_product_unit primary key (unit_code)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('product_unit') and minor_id = 0)
begin 
   declare @currentuser sysname 
select @currentuser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @currentuser, 'table', 'product_unit' 
 
end 


select @currentuser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ข้อมูลหน่วยนับผลผลิต
   ', 
   'user', @currentuser, 'table', 'product_unit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_unit')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'unit_code')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_code'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รหัสหน่วยนับ',
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_unit')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'unit_desc_thai')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_desc_thai'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รายละเอียดหน่วยนับ',
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_desc_thai'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_unit')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'unit_desc_eng')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_desc_eng'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'รายละเอียดหน่วยนับ (อังกฤษ)',
   'user', @currentuser, 'table', 'product_unit', 'column', 'unit_desc_eng'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('product_unit')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @currentuser sysname
select @currentuser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @currentuser, 'table', 'product_unit', 'column', 'id'

end


select @currentuser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'for web update',
   'user', @currentuser, 'table', 'product_unit', 'column', 'id'
go

alter table mem_product
   add constraint fk_prod_mem foreign key (product_code)
      references product (product_code)
go

alter table mem_product
   add constraint fk_mem_prod foreign key (member_code)
      references member (member_code)
go

alter table mem_product_plan
   add constraint fk_mem_prod_reference_mem_prod foreign key (product_code, member_code)
      references mem_product (product_code, member_code)
go

alter table mem_product_standard
   add constraint fk_mem_prod_reference_product_ foreign key (standard_code)
      references product_standard (standard_code)
go

alter table mem_product_standard
   add constraint fk_mem_prod_reference_mem_prod foreign key (product_code, member_code)
      references mem_product (product_code, member_code)
go
