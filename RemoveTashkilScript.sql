-- The QuranDB Project
-- Author: Sami M
-- This script will update a field calledd ayahTextNoTashkil with text from the ayahText field (removes the tashkil signs)

-- us a "use yourDB" statement or replace the "yourDB" text in the script with your database name


declare @tmpAyah nvarchar(max)
declare @id int
declare c cursor for
  SELECT id,ayahText
  FROM [yourDB].[dbo].[Quran]
open c
fetch next from c into @id,@tmpAyah
   WHILE @@FETCH_STATUS = 0
	BEGIN
		-- This replaces all the tashkil signs that i know of - might need to be appended with more replaces in case i forgot some signs.
	   set @tmpAyah = replace(replace(replace(replace(replace(replace(replace(replace(Replace(CAST(@tmpAyah as nchar(1000)),NCHAR(1611),N''),NCHAR(1612),N''),NCHAR(1613), N''),NCHAR(1614), N''),NCHAR(1615), N''),NCHAR(1616),N''),NCHAR(1617),N''),NCHAR(1618),N''),NCHAR(1648),N'')
	   select @id,@tmpAyah
	   update [yourDB].[dbo].[Quran] set ayahTextNoTashkil = @tmpAyah where ID = @ID
	   fetch next from c into @id,@tmpAyah
	END
close c 
deallocate c	

GO