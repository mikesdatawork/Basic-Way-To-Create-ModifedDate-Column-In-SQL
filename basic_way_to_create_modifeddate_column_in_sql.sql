use [compliance];
set nocount on
 
create table [STANDARD_RULES_00]
(
    [lineid]    int identity(1,1)
,   [createdate]    datetime null
,   [statements]    varchar(max)
,   [modifieddate]  datetime null
,   [description]   varchar(max)
)
go
 
create trigger trig_post_insert
on [dbo].[STANDARD_RULES_00]
after insert
as
begin
    update [dbo].[STANDARD_RULES_00]
    set [createdate] = getdate()
    from dbo.[STANDARD_RULES_00] sr
    where exists (select 1 from inserted i where i.[lineid] = sr.[lineid]);
end
go
 
create trigger trig_post_update
on [dbo].[STANDARD_RULES_00]
after update
as
begin
    update [dbo].[standard_rules_00]
    set [modifieddate] = getdate()
    from dbo.[STANDARD_RULES_00] sr
    where exists (select 1 from inserted i where i.[lineid] = sr.[lineid]);
end
go
