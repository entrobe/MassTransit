--ctrl-shift-m  in sql to replace the sql template params
USE [master]
GO
CREATE LOGIN [App-SubscriptionManager] WITH PASSWORD=N'Replace Me', DEFAULT_DATABASE=[<database_name, sysname, test>], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [<database_name, sysname, test>]
GO
CREATE USER [<user_name, sysname, App-SubscriptionManager>] FOR LOGIN [<sql_login_name, sysname, App-SubscriptionManager>]
GO
USE [<database_name, sysname, test>]
GO
EXEC sp_addrolemember N'db_datawriter', N'<user_name, sysname, App-SubscriptionManager>'
GO
USE [<database_name, sysname, test>]
GO
EXEC sp_addrolemember N'db_datareader', N'<user_name, sysname, App-SubscriptionManager>'
GO

