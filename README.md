![MIKES DATA WORK GIT REPO](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_01.png "Mikes Data Work")        

# Basic Way To Create ModifedDate Column In SQL
**Post Date: January 19, 2018**        



## Contents    
- [About Process](##About-Process)  
- [SQL Logic](#SQL-Logic)  
- [Author](#Author)  
- [License](#License)       

## About-Process


![SQL Modified Date Column]( https://mikesdatawork.files.wordpress.com/2018/01/image0011.png "Create Modified Date Column")

<p>Here's a basic way to create the [ModifedDate] column for some of your tables. Often times whenever you create a table that will undergo various updates and modifications; you'll find yourself wanting to add the classic columns for [CreateDate] and [ModifedDate].
In this example; I have a basic table I'm calling [Standard_Rules_00] which is basically a place where I can store some of my custom build, or modification scripts.</p>   


## SQL-Logic
```SQL
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
```


[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Author

[![Gist](https://img.shields.io/badge/Gist-MikesDataWork-<COLOR>.svg)](https://gist.github.com/mikesdatawork)
[![Twitter](https://img.shields.io/badge/Twitter-MikesDataWork-<COLOR>.svg)](https://twitter.com/mikesdatawork)
[![Wordpress](https://img.shields.io/badge/Wordpress-MikesDataWork-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

    
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Mikes Data Work](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_02.png "Mikes Data Work")

