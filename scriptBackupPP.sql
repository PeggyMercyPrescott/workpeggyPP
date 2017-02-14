USE [master]
GO
/****** Object:  Database [PalangPanyaDB]    Script Date: 2/14/2017 3:38:45 PM ******/
CREATE DATABASE [PalangPanyaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PalangPanyaDB', FILENAME = N'C:\Users\peggy_000\AppData\Local\Microsoft\VisualStudio\SSDT\PalangPanyaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PalangPanyaDB_log', FILENAME = N'C:\Users\peggy_000\AppData\Local\Microsoft\VisualStudio\SSDT\PalangPanyaDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PalangPanyaDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PalangPanyaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PalangPanyaDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [PalangPanyaDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [PalangPanyaDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [PalangPanyaDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [PalangPanyaDB] SET ARITHABORT ON 
GO
ALTER DATABASE [PalangPanyaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PalangPanyaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [PalangPanyaDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [PalangPanyaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [PalangPanyaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PalangPanyaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PalangPanyaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PalangPanyaDB] SET  MULTI_USER 
GO
ALTER DATABASE [PalangPanyaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PalangPanyaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PalangPanyaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PalangPanyaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PalangPanyaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PalangPanyaDB] SET QUERY_STORE = OFF
GO
USE [PalangPanyaDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PalangPanyaDB]
GO
/****** Object:  Table [dbo].[album]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album](
	[album_code] [varchar](30) NOT NULL,
	[album_name] [nvarchar](100) NOT NULL,
	[album_desc] [nvarchar](200) NULL,
	[album_type] [char](1) NULL,
	[created_by] [varchar](30) NOT NULL,
	[album_date] [datetime] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_album] PRIMARY KEY CLUSTERED 
(
	[album_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course_grade]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_grade](
	[cgrade_code] [char](1) NOT NULL,
	[cgrade_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_course_grade] PRIMARY KEY CLUSTERED 
(
	[cgrade_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course_group]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_group](
	[cgroup_code] [varchar](30) NOT NULL,
	[cgroup_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_course_group] PRIMARY KEY CLUSTERED 
(
	[cgroup_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course_instructor]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_instructor](
	[instructor_code] [varchar](30) NOT NULL,
	[course_code] [varchar](30) NOT NULL,
	[confirm_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[instructor_cost] [money] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_course_instructor] PRIMARY KEY CLUSTERED 
(
	[instructor_code] ASC,
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course_train_place]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_train_place](
	[place_code] [varchar](30) NOT NULL,
	[course_code] [varchar](30) NOT NULL,
	[confirm_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[place_cost] [money] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_course_train_place] PRIMARY KEY CLUSTERED 
(
	[place_code] ASC,
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course_type]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_type](
	[cgroup_code] [varchar](30) NOT NULL,
	[ctype_code] [varchar](30) NOT NULL,
	[ctype_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_course_type] PRIMARY KEY CLUSTERED 
(
	[ctype_code] ASC,
	[cgroup_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_config]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_config](
	[client_code] [varchar](30) NOT NULL,
	[system] [nvarchar](50) NOT NULL,
	[module] [nvarchar](50) NOT NULL,
	[cnfig_item] [nvarchar](50) NOT NULL,
	[text_value] [nvarchar](500) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_config] PRIMARY KEY CLUSTERED 
(
	[client_code] ASC,
	[system] ASC,
	[module] ASC,
	[cnfig_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_country]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_country](
	[country_code] [int] NOT NULL,
	[country_desc] [nvarchar](100) NOT NULL,
	[area_part] [varchar](30) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_country] PRIMARY KEY CLUSTERED 
(
	[country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_district]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_district](
	[country_code] [int] NOT NULL,
	[province_code] [char](8) NOT NULL,
	[district_code] [char](8) NOT NULL,
	[dist_desc] [nvarchar](100) NOT NULL,
	[area_part] [varchar](30) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_district] PRIMARY KEY CLUSTERED 
(
	[district_code] ASC,
	[province_code] ASC,
	[country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_list_zip]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_list_zip](
	[province_code] [char](8) NOT NULL,
	[country_code] [int] NOT NULL,
	[district_code] [char](8) NOT NULL,
	[subdistrict_code] [char](8) NOT NULL,
	[zip_code] [char](5) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_list_zip] PRIMARY KEY CLUSTERED 
(
	[province_code] ASC,
	[country_code] ASC,
	[district_code] ASC,
	[subdistrict_code] ASC,
	[zip_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_province]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_province](
	[country_code] [int] NOT NULL,
	[province_code] [char](8) NOT NULL,
	[pro_desc] [nvarchar](100) NOT NULL,
	[area_part] [varchar](30) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_province] PRIMARY KEY CLUSTERED 
(
	[province_code] ASC,
	[country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ini_subdistrict]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ini_subdistrict](
	[country_code] [int] NOT NULL,
	[province_code] [char](8) NOT NULL,
	[district_code] [char](8) NOT NULL,
	[subdistrict_code] [char](8) NOT NULL,
	[dist_desc] [nvarchar](100) NOT NULL,
	[area_part] [varchar](30) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_ini_subdistrict] PRIMARY KEY CLUSTERED 
(
	[province_code] ASC,
	[country_code] ASC,
	[district_code] ASC,
	[subdistrict_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[instructor]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[instructor_code] [varchar](30) NOT NULL,
	[instructor_desc] [nvarchar](100) NOT NULL,
	[confirm_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[contactor] [nvarchar](100) NULL,
	[contactor_detail] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_instructor] PRIMARY KEY CLUSTERED 
(
	[instructor_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_education]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_education](
	[member_code] [varchar](30) NOT NULL,
	[rec_no] [int] NOT NULL,
	[degree] [nvarchar](100) NOT NULL,
	[colledge_name] [nvarchar](500) NULL,
	[faculty] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_education] PRIMARY KEY CLUSTERED 
(
	[rec_no] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_group]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_group](
	[mem_group_code] [char](3) NOT NULL,
	[mem_group_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_group] PRIMARY KEY CLUSTERED 
(
	[mem_group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_health]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_health](
	[member_code] [varchar](30) NOT NULL,
	[medical_history] [nvarchar](500) NULL,
	[blood_group] [char](1) NULL,
	[hobby] [nvarchar](500) NULL,
	[restrict_food] [nvarchar](500) NULL,
	[special_food] [nvarchar](500) NULL,
	[special_skill] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_health] PRIMARY KEY CLUSTERED 
(
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_level]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_level](
	[mlevel_code] [varchar](30) NOT NULL,
	[mlevel_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_level] PRIMARY KEY CLUSTERED 
(
	[mlevel_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_product]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_product](
	[member_code] [varchar](30) NOT NULL,
	[product_code] [varchar](30) NOT NULL,
	[grow_area] [decimal](7, 2) NULL,
	[rec_no] [int] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_product] PRIMARY KEY CLUSTERED 
(
	[product_code] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_reward]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_reward](
	[member_code] [varchar](30) NOT NULL,
	[rec_no] [int] NOT NULL,
	[reward_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_reward] PRIMARY KEY CLUSTERED 
(
	[rec_no] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_site_visit]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_site_visit](
	[member_code] [varchar](30) NOT NULL,
	[rec_no] [int] NOT NULL,
	[site_visit_desc] [nvarchar](500) NOT NULL,
	[country_code] [int] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_site_visit] PRIMARY KEY CLUSTERED 
(
	[rec_no] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_social]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_social](
	[member_code] [varchar](30) NOT NULL,
	[rec_no] [int] NOT NULL,
	[social_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_social] PRIMARY KEY CLUSTERED 
(
	[rec_no] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_status]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_status](
	[mstatus_code] [char](3) NOT NULL,
	[mstatus_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_status] PRIMARY KEY CLUSTERED 
(
	[mstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_testcenter]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_testcenter](
	[mem_testcenter_code] [varchar](30) NOT NULL,
	[mem_testcenter_desc] [nvarchar](100) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_testcenter_code] PRIMARY KEY CLUSTERED 
(
	[mem_testcenter_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_train_record]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_train_record](
	[course_code] [varchar](30) NOT NULL,
	[member_code] [varchar](30) NOT NULL,
	[course_grade] [char](1) NULL,
	[course_desc] [nvarchar](100) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_mem_train_record] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_type]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_type](
	[mem_group_code] [char](3) NOT NULL,
	[mem_type_code] [char](3) NOT NULL,
	[mem_type_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_type] PRIMARY KEY CLUSTERED 
(
	[mem_type_code] ASC,
	[mem_group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mem_worklist]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mem_worklist](
	[rec_no] [int] NOT NULL,
	[member_code] [varchar](30) NOT NULL,
	[company_name_th] [nvarchar](100) NULL,
	[company_name_eng] [nvarchar](100) NULL,
	[position_name_th] [nvarchar](100) NULL,
	[position_name_eng] [nvarchar](100) NULL,
	[work_year] [varchar](9) NULL,
	[office_address] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_mem_worklist] PRIMARY KEY CLUSTERED 
(
	[rec_no] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[member]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[member_code] [varchar](30) NOT NULL,
	[mem_username] [varchar](50) NULL,
	[mem_password] [varchar](40) NULL,
	[mem_role_id] [uniqueidentifier] NULL,
	[title] [nvarchar](100) NULL,
	[fname] [nvarchar](100) NULL,
	[lname] [nvarchar](100) NULL,
	[occupation] [nvarchar](100) NULL,
	[sex] [char](1) NULL,
	[nationality] [nvarchar](30) NULL,
	[mem_photo] [varchar](30) NULL,
	[income] [char](1) NULL,
	[cid_card] [varchar](30) NULL,
	[cid_card_pic] [varchar](30) NULL,
	[birthdate] [datetime] NULL,
	[current_age] [smallint] NULL,
	[religion] [nvarchar](30) NULL,
	[place_name] [nvarchar](50) NULL,
	[marry_status] [char](1) NULL,
	[h_no] [nvarchar](20) NULL,
	[lot_no] [nvarchar](20) NULL,
	[village] [nvarchar](50) NULL,
	[building] [nvarchar](50) NULL,
	[floor] [nvarchar](20) NULL,
	[room] [nvarchar](20) NULL,
	[lane] [nvarchar](50) NULL,
	[street] [nvarchar](50) NULL,
	[subdistrict_code] [char](8) NULL,
	[district_code] [char](8) NULL,
	[province_code] [char](8) NULL,
	[country_code] [int] NULL,
	[zip_code] [char](5) NULL,
	[mstatus_code] [char](3) NULL,
	[mem_type_code] [char](3) NULL,
	[mem_group_code] [char](3) NULL,
	[mlevel_code] [varchar](30) NULL,
	[zone] [nvarchar](30) NULL,
	[latitude] [decimal](9, 6) NULL,
	[longitude] [decimal](9, 6) NULL,
	[texta_address] [nvarchar](200) NULL,
	[textb_address] [nvarchar](200) NULL,
	[textc_address] [nvarchar](200) NULL,
	[mail_address] [nvarchar](600) NULL,
	[tel] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[facebook] [nvarchar](500) NULL,
	[line] [nvarchar](500) NULL,
	[email] [nvarchar](100) NULL,
	[parent_code] [varchar](30) NULL,
	[mem_testcenter_code] [varchar](30) NULL,
	[register_date] [datetime] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
	[mlevel_change_date] [datetime] NULL,
 CONSTRAINT [pk_member] PRIMARY KEY CLUSTERED 
(
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pic_image]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pic_image](
	[image_code] [varchar](30) NOT NULL,
	[image_name] [nvarchar](50) NULL,
	[image_desc] [nvarchar](200) NULL,
	[ref_doc_type] [varchar](30) NULL,
	[ref_doc_code] [varchar](30) NULL,
	[image_file] [text] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
 CONSTRAINT [pk_pic_image] PRIMARY KEY CLUSTERED 
(
	[image_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_code] [varchar](30) NOT NULL,
	[product_type_code] [varchar](30) NOT NULL,
	[product_group_code] [varchar](30) NOT NULL,
	[product_desc] [nvarchar](100) NOT NULL,
	[rec_no] [int] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[product_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_group]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_group](
	[product_group_code] [varchar](30) NOT NULL,
	[product_group_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_product_group] PRIMARY KEY CLUSTERED 
(
	[product_group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_type]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[product_group_code] [varchar](30) NOT NULL,
	[product_type_code] [varchar](30) NOT NULL,
	[product_type_desc] [nvarchar](100) NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [pk_product_type] PRIMARY KEY CLUSTERED 
(
	[product_type_code] ASC,
	[product_group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[project_code] [varchar](30) NOT NULL,
	[project_desc] [nvarchar](100) NOT NULL,
	[project_date] [datetime] NULL,
	[project_approve_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[budget] [money] NULL,
	[project_manager] [nvarchar](100) NULL,
	[target_member_join] [int] NULL,
	[active_member_join] [int] NULL,
	[passed_member] [int] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project] PRIMARY KEY CLUSTERED 
(
	[project_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project_course]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_course](
	[course_code] [varchar](30) NOT NULL,
	[project_code] [varchar](30) NULL,
	[ctype_code] [varchar](30) NULL,
	[cgroup_code] [varchar](30) NULL,
	[course_desc] [nvarchar](100) NOT NULL,
	[course_date] [datetime] NULL,
	[course_approve_date] [datetime] NULL,
	[course_begin] [datetime] NULL,
	[course_end] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[budget] [money] NULL,
	[charge_head] [money] NULL,
	[support_head] [money] NULL,
	[project_manager] [nvarchar](100) NULL,
	[target_member_join] [int] NULL,
	[active_member_join] [int] NULL,
	[passed_member] [int] NULL,
	[passed_score] [int] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project_course] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project_course_register]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_course_register](
	[course_code] [varchar](30) NOT NULL,
	[member_code] [varchar](30) NOT NULL,
	[course_grade] [int] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project_course_register] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project_daily_checklist]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_daily_checklist](
	[course_code] [varchar](30) NOT NULL,
	[member_code] [varchar](30) NOT NULL,
	[course_date] [datetime] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project_daily_checklist] PRIMARY KEY CLUSTERED 
(
	[course_date] ASC,
	[course_code] ASC,
	[member_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project_sponsor]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_sponsor](
	[spon_code] [varchar](30) NOT NULL,
	[spon_desc] [nvarchar](100) NOT NULL,
	[confirm_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[contactor] [nvarchar](100) NULL,
	[contactor_detail] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project_sponsor] PRIMARY KEY CLUSTERED 
(
	[spon_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project_supporter]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_supporter](
	[project_code] [varchar](30) NOT NULL,
	[spon_code] [varchar](30) NOT NULL,
	[ref_doc] [varchar](30) NULL,
	[support_budget] [money] NULL,
	[contactor] [nvarchar](100) NULL,
	[contactor_detail] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_project_supporter] PRIMARY KEY CLUSTERED 
(
	[spon_code] ASC,
	[project_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityMemberRoles]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityMemberRoles](
	[MemberId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[EditedBy] [uniqueidentifier] NOT NULL,
	[EditedDate] [datetime] NOT NULL,
	[LoggedInDate] [datetime] NULL,
	[LoggedOutDate] [datetime] NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
 CONSTRAINT [PK_SecurityMemberRoles] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityMenus]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityMenus](
	[MenuId] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[HaveChild] [int] NOT NULL,
	[IsRightAlign] [int] NOT NULL,
	[MenuName] [nvarchar](100) NULL,
	[MenuDisplay] [nvarchar](200) NULL,
	[MenuController] [varchar](100) NULL,
	[MenuAction] [varchar](100) NULL,
	[MenuUrl] [varchar](200) NULL,
 CONSTRAINT [PK_SecurityMenus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityRoleMenus]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityRoleMenus](
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [int] NOT NULL,
	[EditedBy] [uniqueidentifier] NOT NULL,
	[EditedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SecurityRoleMenus] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityRoles]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityRoles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[EditedBy] [uniqueidentifier] NOT NULL,
	[EditedDate] [datetime] NOT NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
 CONSTRAINT [PK_SecurityRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[train_place]    Script Date: 2/14/2017 3:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[train_place](
	[place_code] [varchar](30) NOT NULL,
	[place_desc] [nvarchar](100) NOT NULL,
	[confirm_date] [datetime] NULL,
	[ref_doc] [varchar](30) NULL,
	[contactor] [nvarchar](100) NULL,
	[contactor_detail] [nvarchar](500) NULL,
	[x_status] [char](1) NULL,
	[x_note] [nvarchar](50) NULL,
	[x_log] [nvarchar](500) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_train_place] PRIMARY KEY CLUSTERED 
(
	[place_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[course_grade] ([cgrade_code], [cgrade_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'A', N'Good', N'Y', NULL, NULL, N'7fec7ef8-79de-4991-b0be-f138f0863971')
INSERT [dbo].[course_grade] ([cgrade_code], [cgrade_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'B', N'Pass', N'Y', NULL, NULL, N'25330b65-e904-4823-afc7-1d74d2b91d12')
INSERT [dbo].[course_grade] ([cgrade_code], [cgrade_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'F', N'Fail', N'Y', NULL, NULL, N'6475c8bf-7628-4d7c-b714-74b31d7f9837')
INSERT [dbo].[ini_country] ([country_code], [country_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'ไทย', NULL, NULL, NULL, NULL, N'865c24b0-0b06-4b4a-a9cf-aeb6053a456e')
INSERT [dbo].[ini_country] ([country_code], [country_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (84, N'เวียดนาม', NULL, NULL, NULL, NULL, N'746e95e2-abc3-4d39-99e7-61e319524b1d')
INSERT [dbo].[ini_country] ([country_code], [country_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (856, N'ลาว', NULL, NULL, NULL, NULL, N'fbc45ae4-8134-4f58-a6b1-de8967d6a3b7')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'เขตพระนคร', NULL, NULL, NULL, NULL, N'3938f103-6547-4547-adba-616879575752')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'เขตดุสิต', NULL, NULL, NULL, NULL, N'83bedf53-17a3-4f0d-b78a-e38c915ab86a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'เขตหนองจอก', NULL, NULL, NULL, NULL, N'19c13ec7-c965-4750-8a2e-46194b1e4182')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'เขตบางรัก', NULL, NULL, NULL, NULL, N'67b46c84-8c0d-4bb1-bae6-ce595dc19e26')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'เขตบางเขน', NULL, NULL, NULL, NULL, N'8aecbf45-31db-4556-aba2-b4ad12de7895')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'เขตบางกะปิ', NULL, NULL, NULL, NULL, N'4538bb55-d1ac-4be0-8536-446e31d94994')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10070000', N'เขตปทุมวัน', NULL, NULL, NULL, NULL, N'34c7ceb6-90c2-423a-be01-6f11a055afb4')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'เขตป้อมปราบศัตรูพ่าย', NULL, NULL, NULL, NULL, N'c8120cac-6af4-47a9-935b-d1d579c9d18a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'เขตพระโขนง', NULL, NULL, NULL, NULL, N'a6d87f3e-d36b-45f6-a41a-a572b35c84d1')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'เขตมีนบุรี', NULL, NULL, NULL, NULL, N'5c55d337-73b3-435c-a57c-8e43141ee412')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'เขตลาดกระบัง', NULL, NULL, NULL, NULL, N'cf16a012-a7d5-49b7-ad61-80a214688d55')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'เขตยานนาวา', NULL, NULL, NULL, NULL, N'2a768290-d969-47f4-a949-11b14aa8c16b')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10130000', N'เขตสัมพันธวงศ์', NULL, NULL, NULL, NULL, N'67a679bb-db9c-4d07-a4a4-f66315ed40d5')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'เขตพญาไท', NULL, NULL, NULL, NULL, N'4dad52bd-f3bc-4a18-89c2-3a9314f4fc04')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'เขตธนบุรี', NULL, NULL, NULL, NULL, N'18b785fe-1b3c-4d32-b732-2ef44cee5d6c')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10160000', N'เขตบางกอกใหญ่', NULL, NULL, NULL, NULL, N'ed3e6dd0-dce5-4b7a-a0da-5e66ae9920ca')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10170000', N'เขตห้วยขวาง', NULL, NULL, NULL, NULL, N'242adbca-373c-45e8-8a06-9494e5cf37aa')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10180000', N'เขตคลองสาน', NULL, NULL, NULL, NULL, N'f6fae9a8-d65b-46c7-91cd-680fc6525eca')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'เขตตลิ่งชัน', NULL, NULL, NULL, NULL, N'c6adf78c-7479-4386-86b7-ae03eb5aeb6e')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'เขตบางกอกน้อย', NULL, NULL, NULL, NULL, N'c6ac9922-3266-49a8-9350-45ec025ba165')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'เขตบางขุนเทียน', NULL, NULL, NULL, NULL, N'169671dd-e28e-4f30-8540-a3afaf1939b2')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'เขตภาษีเจริญ', NULL, NULL, NULL, NULL, N'ba846ac3-7613-4530-958c-7d32bd444014')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10230000', N'เขตหนองแขม', NULL, NULL, NULL, NULL, N'cc36b79c-b72d-46db-8f08-814078356b22')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10240000', N'เขตราษฎร์บูรณะ', NULL, NULL, NULL, NULL, N'06477633-4ff3-4dad-a5c1-4161d817999a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10250000', N'เขตบางพลัด', NULL, NULL, NULL, NULL, N'b2078e91-5d19-4f7a-b3c3-d37b520e5518')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10260000', N'เขตดินแดง', NULL, NULL, NULL, NULL, N'638ea6b5-05a1-4c57-9fa1-43805cc7634d')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'เขตบึงกุ่ม', NULL, NULL, NULL, NULL, N'ac2e2cd3-b110-4180-91fa-ff5f381635aa')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10280000', N'เขตสาทร', NULL, NULL, NULL, NULL, N'c917c7a3-4a2d-4419-afb0-ca3833511fd7')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10290000', N'เขตบางซื่อ', NULL, NULL, NULL, NULL, N'06d73d26-fc10-4d2f-9f1a-402d5ee7cc86')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'เขตจตุจักร', NULL, NULL, NULL, NULL, N'97137a23-25b9-4557-a80b-acc3be8b8a34')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10310000', N'เขตบางคอแหลม', NULL, NULL, NULL, NULL, N'092a7f5e-a413-4d34-bd4e-42526fec7de7')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10320000', N'เขตประเวศ', NULL, NULL, NULL, NULL, N'eecb739b-d30b-4cfe-9422-f35d72fe0931')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'เขตคลองเตย', NULL, NULL, NULL, NULL, N'82bb4500-218f-4089-9248-00e6d8ef1dc7')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10340000', N'เขตสวนหลวง', NULL, NULL, NULL, NULL, N'6a57f048-5a14-473d-9cc4-b64b8095b1ad')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10350000', N'เขตจอมทอง', NULL, NULL, NULL, NULL, N'81e22ca3-70f2-434b-8eaa-ce484246e9c5')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'เขตดอนเมือง', NULL, NULL, NULL, NULL, N'e87dd632-07ec-4230-a495-c7f575d60660')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10370000', N'เขตราชเทวี', NULL, NULL, NULL, NULL, N'7d547fd4-b06a-4245-92df-7d816cc2d023')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10380000', N'เขตลาดพร้าว', NULL, NULL, NULL, NULL, N'5fa50fed-3cdc-4b5f-95cb-5b40d2507585')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10390000', N'เขตวัฒนา', NULL, NULL, NULL, NULL, N'2f8521f1-cf3a-4917-8a61-ba41e3588f8f')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10400000', N'เขตบางแค', NULL, NULL, NULL, NULL, N'13800a4e-a182-455e-b16b-61cf17580b86')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10410000', N'เขตหลักสี่', NULL, NULL, NULL, NULL, N'9d221d4c-793a-4bf0-a0a0-8913a6a1f7ad')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10420000', N'เขตสายไหม', NULL, NULL, NULL, NULL, N'c118127b-0884-4fde-82f0-a1275a79771d')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10430000', N'เขตคันนายาว', NULL, NULL, NULL, NULL, N'73ed38f6-f8be-407a-be9a-35ff3595a117')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10440000', N'เขตสะพานสูง', NULL, NULL, NULL, NULL, N'8308a2e2-3804-4f6f-84dc-c78a9e052b3a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10450000', N'เขตวังทองหลาง', NULL, NULL, NULL, NULL, N'2701aa8d-a840-48d3-a897-401f63dd27bc')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'เขตคลองสามวา', NULL, NULL, NULL, NULL, N'f54d897c-54a9-4014-8560-f125550614ed')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10470000', N'เขตบางนา', NULL, NULL, NULL, NULL, N'bc3d7c46-9ac4-405f-ac58-ba671cb68b6e')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10480000', N'เขตทวีวัฒนา', NULL, NULL, NULL, NULL, N'd3876a01-39b4-47b2-97e1-87242361e84a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10490000', N'เขตทุ่งครุ', NULL, NULL, NULL, NULL, N'ba50c3c0-f6a7-480f-b3f9-f7d1586a1895')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10500000', N'เขตบางบอน', NULL, NULL, NULL, NULL, N'b0d8cbc5-3bc5-431f-99d0-e64421352eb6')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10810000', N'บ้านทะวาย', NULL, NULL, NULL, NULL, N'd5711984-f0f1-491c-b606-032d4a706ba0')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10990000', N'สำนักทะเบียนกลาง', NULL, NULL, NULL, NULL, N'10baa2d7-0601-4cbf-a222-18ae46b0a6f0')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'เมืองชลบุรี', NULL, NULL, NULL, NULL, N'6fa9197a-9f70-4d94-bab8-1748fbfb40b2')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'บ้านบึง', NULL, NULL, NULL, NULL, N'fa382898-af51-4526-b294-af00a6a38959')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'หนองใหญ่', NULL, NULL, NULL, NULL, N'eab08007-705f-4d33-bff3-1aa68a3d2896')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'บางละมุง', NULL, NULL, NULL, NULL, N'28ae31bd-af82-47b4-b060-aba5027fc0b0')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'พานทอง', NULL, NULL, NULL, NULL, N'1bbbf19b-1ef1-433d-99a6-8a27dd6bafc9')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'พนัสนิคม', NULL, NULL, NULL, NULL, N'0b4ad235-1ec1-4878-8038-08cd738bd35e')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'ศรีราชา', NULL, NULL, NULL, NULL, N'a3c0ebf2-0449-4c20-9ca5-23e995ab8ba2')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20080000', N'เกาะสีชัง', NULL, NULL, NULL, NULL, N'd84d6669-fc2e-45a6-97af-a66d1a9a212c')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'สัตหีบ', NULL, NULL, NULL, NULL, N'ac6bb9fb-4735-4d9b-bf0f-04f843fed04a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'บ่อทอง', NULL, NULL, NULL, NULL, N'690e561f-adf5-49fc-922b-c99ff2c383b2')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20110000', N'เกาะจันทร์', NULL, NULL, NULL, NULL, N'd31d93a7-e9d7-4cc8-9531-07d950717b96')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20510000', N'สัตหีบ (สาขาตำบลบางเสร่)', NULL, NULL, NULL, NULL, N'7465eae3-dfe6-4efd-95ee-da4c7964f041')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20720000', N'ท้องถิ่นเทศบาลเมืองหนองปรือ', NULL, NULL, NULL, NULL, N'3ddb7f32-f387-4218-894e-a1bc2215584a')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20930000', N'เทศบาลตำบลแหลมฉบัง', NULL, NULL, NULL, NULL, N'35945be7-22e4-45bd-af3b-72a17d6b34f9')
INSERT [dbo].[ini_district] ([country_code], [province_code], [district_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20990000', N'เทศบาลเมืองชลบุรี', NULL, NULL, NULL, NULL, N'e8e52f08-7371-48b2-831d-c3646a8e9e67')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010100', N'10200', NULL, NULL, NULL, N'fda36882-a069-47b8-a8bc-6729e98dd039')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010200', N'10200', NULL, NULL, NULL, N'97599848-9d02-4d06-a6c9-6cb6f05dc08a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010300', N'10200', NULL, NULL, NULL, N'bba89da6-4cf8-400d-b869-4d9d3fa2b5b3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010400', N'10200', NULL, NULL, NULL, N'0def512f-3caf-4a69-8989-250abac4aad3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010500', N'10200', NULL, NULL, NULL, N'20c2eee0-4696-4c6f-93eb-bb800feb3889')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010600', N'10200', NULL, NULL, NULL, N'317501c8-0ab6-47f8-873d-50380dbe88ad')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010700', N'10200', NULL, NULL, NULL, N'768c53b8-81dc-428d-95cf-7aaad587657a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010800', N'10200', NULL, NULL, NULL, N'6312062f-d9df-44a1-a36b-3715cf781334')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10010900', N'10200', NULL, NULL, NULL, N'c2f6de44-2ca3-4a1f-a33f-44d0756f9072')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10011000', N'10200', NULL, NULL, NULL, N'be05ead6-6217-40bb-977c-a903067f0780')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10011100', N'10200', NULL, NULL, NULL, N'93023c31-5be2-41d0-aeb6-a2cb9a52af69')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10010000', N'10011200', N'10200', NULL, NULL, NULL, N'4d6d01b7-1d4b-499d-b441-76f45e5c0d83')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10020000', N'10020100', N'10300', NULL, NULL, NULL, N'7585c305-60cb-44cd-9144-03da3240ec69')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10020000', N'10020200', N'10300', NULL, NULL, NULL, N'cd10df63-bdd7-4842-8d51-b7ef951e0796')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10020000', N'10020300', N'10300', NULL, NULL, NULL, N'70143d8c-2c17-4aeb-a731-12273ec0e369')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10020000', N'10020400', N'10300', NULL, NULL, NULL, N'02517bef-acbb-4544-b4e7-8d24b2a52e66')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10020000', N'10020600', N'10300', NULL, NULL, NULL, N'01362eec-b5da-41e2-b81a-e86733d92012')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030100', N'10530', NULL, NULL, NULL, N'e2c37bf9-1cb1-4fc1-923a-9292d9cee4a1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030200', N'10530', NULL, NULL, NULL, N'24f8a4df-44ce-44d8-b682-ea349c3ec5fb')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030300', N'10530', NULL, NULL, NULL, N'1e0b1b44-1561-4729-944c-fc4586fc4b68')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030400', N'10530', NULL, NULL, NULL, N'ecc153c9-49af-4f33-8341-1c235409f68d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030500', N'10530', NULL, NULL, NULL, N'9ae84e23-03b9-4b73-a2ee-d667966ee3a9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030600', N'10530', NULL, NULL, NULL, N'2920983b-c7e8-4360-add4-758f73a6b98e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030700', N'10530', NULL, NULL, NULL, N'4514b474-6c2c-4ef7-b3b4-d3312a58c7f9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10030000', N'10030800', N'10530', NULL, NULL, NULL, N'd1369fc0-30c2-4ea1-8c95-46e4fb805e9e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10040000', N'10040100', N'10500', NULL, NULL, NULL, N'92a3d59c-3507-4435-a369-540baa431665')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10040000', N'10040200', N'10500', NULL, NULL, NULL, N'ce37858b-c5f4-425a-bcef-4b3dda4f83d1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10040000', N'10040300', N'10500', NULL, NULL, NULL, N'3876a4df-f344-4288-a20c-df8aa0638d36')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10040000', N'10040400', N'10500', NULL, NULL, NULL, N'b58ac8ae-7532-4ead-9d56-6614e8c53074')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10040000', N'10040500', N'10500', NULL, NULL, NULL, N'4d7284e5-bd75-4a52-8808-67460cee3d10')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10050000', N'10050200', N'10220', NULL, NULL, NULL, N'd2989a79-73df-4ea3-acf9-46fc2168115d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10050000', N'10050800', N'10220', NULL, NULL, NULL, N'0f136a0b-9b19-40fd-9ade-4439bd0da324')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10060000', N'10060100', N'10240', NULL, NULL, NULL, N'595ed710-5bf0-46c9-8255-4034c16d7561')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10060000', N'10060800', N'10240', NULL, NULL, NULL, N'1d7e00b7-f993-412c-9597-b7fd70951716')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10070000', N'10070100', N'10330', NULL, NULL, NULL, N'4ee66ed4-7d53-4b2c-a54e-83b8ddab4ba9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10070000', N'10070200', N'10330', NULL, NULL, NULL, N'96e58ca7-2485-4ba4-8cf7-b1198553edb9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10070000', N'10070300', N'10330', NULL, NULL, NULL, N'ef492eff-4303-4770-9fb1-2900878650ac')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10070000', N'10070400', N'10330', NULL, NULL, NULL, N'2ed0a1e8-650d-4c0c-b7e9-6f921310487e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10080000', N'10080100', N'10100', NULL, NULL, NULL, N'd4d4e54d-3815-4756-b197-1e604274cab0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10080000', N'10080200', N'10100', NULL, NULL, NULL, N'fbca0aa6-5a06-4952-a137-525ce0302317')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10080000', N'10080300', N'10100', NULL, NULL, NULL, N'2d3a47c4-7176-40c4-b27e-3858e7c46ac0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10080000', N'10080400', N'10100', NULL, NULL, NULL, N'81b46fc6-92b7-423c-a3f5-297dd1752d29')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10080000', N'10080500', N'10100', NULL, NULL, NULL, N'ae64595e-9d9f-4306-8cff-b6db69891b14')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10090000', N'10090500', N'10260', NULL, NULL, NULL, N'7108658c-aa82-40bc-bcc4-439813e9524a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10100000', N'10100100', N'10510', NULL, NULL, NULL, N'6644eb95-cb30-4d13-b87d-d781efecd002')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10100000', N'10100200', N'10510', NULL, NULL, NULL, N'02aaa9da-8867-4a58-b7f6-63a0a41e8bbf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110100', N'10520', NULL, NULL, NULL, N'fa959771-23c3-4b72-8853-5ec31addd7ea')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110200', N'10520', NULL, NULL, NULL, N'd0a3c503-7013-4a8c-b431-626dd96fe1cd')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110300', N'10520', NULL, NULL, NULL, N'2520fea7-4241-4d50-92d7-b4ae7f9a0f2a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110400', N'10520', NULL, NULL, NULL, N'0b5c5ab6-9956-4700-a635-1fa7ad80dd02')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110500', N'10520', NULL, NULL, NULL, N'e52f9c9a-6f01-4e9e-aad1-b350e8ee768c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10110000', N'10110600', N'10520', NULL, NULL, NULL, N'041df77e-5988-4fae-8244-cb67c9cc7823')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10120000', N'10120300', N'10120', NULL, NULL, NULL, N'59d29618-b81f-4d01-b224-e87008a2baa6')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10120000', N'10120400', N'10120', NULL, NULL, NULL, N'aaed6a2b-229c-4629-8952-2983f5e48c29')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10130000', N'10130100', N'10100', NULL, NULL, NULL, N'45d95f2b-1233-4a30-9a1c-bee00b6ce1a3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10130000', N'10130200', N'10100', NULL, NULL, NULL, N'49a93b6a-1818-4d8f-a7d6-13a26d11cd58')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10130000', N'10130300', N'10100', NULL, NULL, NULL, N'5ba1d3ae-31b3-4ec6-8bd7-a75c1bd0defd')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10140000', N'10140100', N'10400', NULL, NULL, NULL, N'b385b7c2-1406-405d-ab6c-07b9794e94a5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150100', N'10600', NULL, NULL, NULL, N'6ad5891b-b090-4241-9cfc-87bec0eb14b0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150200', N'10600', NULL, NULL, NULL, N'1ff2f3f9-cd9a-4ebf-95a3-487598fb0633')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150300', N'10600', NULL, NULL, NULL, N'2b586604-77eb-45b8-a82d-a4464bdbb89e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150400', N'10600', NULL, NULL, NULL, N'136f5b49-fedb-4f29-9bb7-8e7f6688757b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150500', N'10600', NULL, NULL, NULL, N'44a9d4f2-cc18-491c-a8dd-92f33a5a5e4a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150600', N'10600', NULL, NULL, NULL, N'33cbdf22-76ca-4e5d-9183-ae0327ad4244')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10150000', N'10150700', N'10600', NULL, NULL, NULL, N'0750d4b3-7199-438a-956a-3c38892a8dd5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10160000', N'10160100', N'10600', NULL, NULL, NULL, N'cce22ca3-0d2b-4710-b3c3-059aff1edb51')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10160000', N'10160200', N'10600', NULL, NULL, NULL, N'c591fffa-6d2c-48c4-a6a8-f0959034ebe1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10170000', N'10170100', N'10310', NULL, NULL, NULL, N'a44f3dac-9519-469c-84f2-56e5ef4c196a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10170000', N'10170200', N'10310', NULL, NULL, NULL, N'0533cb52-f6c6-42fb-9be3-6ea1c4352807')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10170000', N'10170400', N'10310', NULL, NULL, NULL, N'48170f84-a885-4157-943b-ceccc1c9286f')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10180000', N'10180100', N'10600', NULL, NULL, NULL, N'6ec211ef-3bdb-4058-96d8-f624abf5b09a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10180000', N'10180200', N'10600', NULL, NULL, NULL, N'f50aba69-e4a3-4cc3-b1a1-76c861ab593e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10180000', N'10180300', N'10600', NULL, NULL, NULL, N'71c7f7de-09ed-434b-9c22-7858621b1cb0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10180000', N'10180400', N'10600', NULL, NULL, NULL, N'e368e6a7-7890-4d1a-bc78-dab23d113fd3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190100', N'10170', NULL, NULL, NULL, N'36e62c67-08ea-42c2-928b-0d3f4633f06c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190200', N'10170', NULL, NULL, NULL, N'42922975-23e4-4a81-a676-340b6dae710c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190300', N'10170', NULL, NULL, NULL, N'cecc7692-24e2-40da-b645-382b63a7b849')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190400', N'10170', NULL, NULL, NULL, N'271b1173-f6ec-4fd4-9e15-1999a1d67690')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190500', N'10170', NULL, NULL, NULL, N'ab250095-082f-484b-a5a7-f31a1f16accf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10190000', N'10190700', N'10170', NULL, NULL, NULL, N'1809d300-1111-4e14-8163-cdee4eeb66ec')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10200000', N'10200400', N'10700', NULL, NULL, NULL, N'b3b34c46-7e65-4bde-8be0-c9b1b676c8a2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10200000', N'10200500', N'10700', NULL, NULL, NULL, N'1d5b9ae1-b43a-430c-82be-3abce6e0026c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10200000', N'10200600', N'10700', NULL, NULL, NULL, N'018306b9-735f-4492-8412-ff257ca299d0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10200000', N'10200700', N'10700', NULL, NULL, NULL, N'b4d1c184-e3d9-4745-82f3-633ebcabf303')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10200000', N'10200900', N'10700', NULL, NULL, NULL, N'a3cbb894-e66a-400b-948d-9d635c1e9c7b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10210000', N'10210500', N'10150', NULL, NULL, NULL, N'6009f9ba-2e59-4b25-a840-24db2c302260')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10210000', N'10210700', N'10150', NULL, NULL, NULL, N'08c74b53-c85e-438e-971b-e7392a1ae88a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220100', N'10160', NULL, NULL, NULL, N'0cc20f2d-a749-48a0-8825-515c0262ab1a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220200', N'10160', NULL, NULL, NULL, N'32639485-a71d-453f-8595-42877f591cde')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220600', N'10160', NULL, NULL, NULL, N'0c646592-5046-47a7-b8fd-0b260e46d3f3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220700', N'10160', NULL, NULL, NULL, N'ec57fc6f-f32c-4dfd-b056-8815f78d4fbf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220800', N'10160', NULL, NULL, NULL, N'4ba4e42d-46cf-4ba0-8046-8f69149fc28a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10220900', N'10160', NULL, NULL, NULL, N'5889cd6b-83bb-4f0d-903a-601e6ded1473')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10220000', N'10221000', N'10160', NULL, NULL, NULL, N'a60687e4-779b-457f-83ed-fd51ee9962d7')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10230000', N'10230200', N'10160', NULL, NULL, NULL, N'c1511359-a679-4f9b-ae4e-89fd649f8dd5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10230000', N'10230300', N'10160', NULL, NULL, NULL, N'0bf2124c-f4d8-4f93-b93d-804efff1c272')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10240000', N'10240100', N'10140', NULL, NULL, NULL, N'3986986e-8a3c-4196-8dea-c9dde29a7df9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10240000', N'10240200', N'10140', NULL, NULL, NULL, N'bb8d7e7a-acfc-4996-9b65-44e85b882156')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10250000', N'10250100', N'10700', NULL, NULL, NULL, N'af00fd7e-719f-4dfa-a6e6-0d87d4d54d8c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10250000', N'10250200', N'10700', NULL, NULL, NULL, N'4cd7bc22-09fd-4387-877a-ddbe615357f1')
GO
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10250000', N'10250300', N'10700', NULL, NULL, NULL, N'6d04c091-913e-40e6-8f42-138b15541e03')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10250000', N'10250400', N'10700', NULL, NULL, NULL, N'381c250d-414a-402c-ad4f-fa84ccc6ee60')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10260000', N'10260100', N'10400', NULL, NULL, NULL, N'1646f13f-3390-4634-bb7b-c238dd00a1b3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10270000', N'10270100', N'10240', NULL, NULL, NULL, N'5e612412-dbad-429c-9be2-ddb77648566b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10280000', N'10280100', N'10120', NULL, NULL, NULL, N'637a0ab8-23c0-4eed-b16f-aa1b74577a04')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10280000', N'10280200', N'10120', NULL, NULL, NULL, N'399019cb-766e-47f8-9fc7-eacaa1f9c4f5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10280000', N'10280300', N'10120', NULL, NULL, NULL, N'da12b857-d7f0-4e54-98dc-feca83ee94d0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10290000', N'10290100', N'10800', NULL, NULL, NULL, N'd5191645-92c8-41f3-83cd-f072bf43eba9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10300000', N'10300100', N'10900', NULL, NULL, NULL, N'7cfcf4d5-76f4-4ddd-8224-d2f8153c009f')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10300000', N'10300200', N'10900', NULL, NULL, NULL, N'385dc102-09e6-46e3-94e8-8ee1d6d2b651')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10300000', N'10300300', N'10900', NULL, NULL, NULL, N'6cad6a6a-4cc1-4c46-850b-24fe86d14c9d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10300000', N'10300400', N'10900', NULL, NULL, NULL, N'aedb0ac8-aa7c-4aa1-8e8c-a13de8f99542')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10300000', N'10300500', N'10900', NULL, NULL, NULL, N'f090bcb7-8963-4db1-8c93-0436da118975')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10310000', N'10310100', N'10120', NULL, NULL, NULL, N'3b4c9eec-ee90-479a-a8b6-0f8eee9fa101')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10310000', N'10310200', N'10120', NULL, NULL, NULL, N'682444c8-4ade-48f4-a71d-edfccb236988')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10310000', N'10310300', N'10120', NULL, NULL, NULL, N'6efd0d5e-de64-4aa1-8f2f-d04c1bd1a551')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10320000', N'10320100', N'10250', NULL, NULL, NULL, N'6d24aaa2-d59d-47e9-809f-2e76ae3e4124')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10320000', N'10320200', N'10250', NULL, NULL, NULL, N'71e4d5dd-87aa-4fe7-b2fc-9f97d5234cc9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10320000', N'10320300', N'10250', NULL, NULL, NULL, N'f353b2f7-2aa3-43f3-adb4-f8305986bbac')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10330000', N'10330100', N'10110', NULL, NULL, NULL, N'e6c5e1be-61d4-415d-ad33-b4d05953b264')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10330000', N'10330200', N'10110', NULL, NULL, NULL, N'd06a492a-ab98-4559-bd40-d08fd2b8ecc3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10330000', N'10330300', N'10110', NULL, NULL, NULL, N'253f739d-030c-4200-a1de-d0d0e1ab7f59')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10340000', N'10340100', N'10250', NULL, NULL, NULL, N'4d613be2-56bb-485e-844c-8f662e4746cd')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10350000', N'10350100', N'10150', NULL, NULL, NULL, N'994d4ff8-5af1-42a7-a02b-af7d4d31b7ab')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10350000', N'10350200', N'10150', NULL, NULL, NULL, N'76571b90-ca4c-4228-94c6-f5a12948f9a3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10350000', N'10350300', N'10150', NULL, NULL, NULL, N'df89ed4c-602f-4ad9-85e3-0ffdf2b74a39')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10350000', N'10350400', N'10150', NULL, NULL, NULL, N'c993c267-6620-4fc9-92a7-a55c1c317603')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10360000', N'10360200', N'10210', NULL, NULL, NULL, N'6ece4181-29d0-4e1a-a36b-d245089bd1d5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10370000', N'10370100', N'10400', NULL, NULL, NULL, N'2c174ca5-cf07-4406-bcc5-f450f9799396')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10370000', N'10370200', N'10400', NULL, NULL, NULL, N'7f2d61e7-6904-4e9d-a5c8-f16d30e59a67')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10370000', N'10370300', N'10400', NULL, NULL, NULL, N'905f2cb2-0716-431d-bdcd-f9f7bbcfc020')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10370000', N'10370400', N'10400', NULL, NULL, NULL, N'173379e7-cba3-4737-953b-99fc8ebd2a01')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10380000', N'10380100', N'10230', NULL, NULL, NULL, N'24189688-7b4a-43c4-98cc-0c2adf70fda4')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10380000', N'10380200', N'10230', NULL, NULL, NULL, N'704cecda-8b2b-4ed8-a434-a00d009d32a2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10390000', N'10390100', N'10110', NULL, NULL, NULL, N'f0716285-7e4a-4d54-96e4-0c6cdba719e7')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10390000', N'10390200', N'10110', NULL, NULL, NULL, N'666bfca7-c995-42d2-91cc-055c7fef3cc5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10390000', N'10390300', N'10110', NULL, NULL, NULL, N'cc5e818e-7b88-46b7-9c9c-12eabfa291c8')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10400000', N'10400100', N'10160', NULL, NULL, NULL, N'497f417d-2a25-4c07-b2ec-77c74827888e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10400000', N'10400200', N'10160', NULL, NULL, NULL, N'08d3a513-20ba-4a54-aa84-ab630d944366')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10400000', N'10400300', N'10160', NULL, NULL, NULL, N'f49aa4bc-2054-4b50-8580-9babad321e1c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10400000', N'10400400', N'10160', NULL, NULL, NULL, N'c2227bcd-cad8-4b29-bf93-78f288b1f1e2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10410000', N'10410100', N'10210', NULL, NULL, NULL, N'6939951c-cddf-4de0-abed-8005628b9ff5')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10410000', N'10410200', N'10210', NULL, NULL, NULL, N'a22ac18f-f3b1-4e3c-8492-8b57decf23e1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10420000', N'10420100', N'10220', NULL, NULL, NULL, N'466da3e1-e678-48d7-8202-ded3852a4b85')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10420000', N'10420200', N'10220', NULL, NULL, NULL, N'994faccc-40af-4b33-897a-ea8e6458235e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10420000', N'10420300', N'10220', NULL, NULL, NULL, N'17a21688-3934-4ff5-bcc3-310e170519c0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10430000', N'10430100', N'10230', NULL, NULL, NULL, N'96f3cac1-8965-4803-bce8-34cad4090ae6')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10440000', N'10440100', N'10240', NULL, NULL, NULL, N'f582a5bf-2442-47aa-ad16-43d3524f2221')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10450000', N'10450100', N'10310', NULL, NULL, NULL, N'89dc6750-3639-454a-8980-d2e58d01596e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10460000', N'10460100', N'10510', NULL, NULL, NULL, N'a2f4a875-5b2f-4f78-8161-9d33cbd33509')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10460000', N'10460200', N'10510', NULL, NULL, NULL, N'f05cdc27-942b-46d9-b8c0-7c7afea9fc07')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10460000', N'10460300', N'10510', NULL, NULL, NULL, N'6aec33f4-fda6-4cfa-a9ca-ea810293920c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10460000', N'10460400', N'10510', NULL, NULL, NULL, N'7fa099da-d799-497f-ac2b-557176eb5cc1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10460000', N'10460500', N'10510', NULL, NULL, NULL, N'68b36393-29a6-48ab-8fbc-dd0be31952f9')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10470000', N'10470100', N'10260', NULL, NULL, NULL, N'11443b3c-ff0e-4649-8ab9-0072e4513436')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10480000', N'10480100', N'10170', NULL, NULL, NULL, N'78ef93d1-fdd3-4843-aa6f-0a745460f20b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10480000', N'10480200', N'10170', NULL, NULL, NULL, N'a23f6851-e43b-4575-8dee-9bf4214f2a08')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10490000', N'10490100', N'10140', NULL, NULL, NULL, N'0ea70586-246c-4c63-9f44-e366d64a15b7')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10490000', N'10490200', N'10140', NULL, NULL, NULL, N'b1c700df-a8de-4def-b545-7f78946be2c0')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'10000000', 66, N'10500000', N'10500100', N'10150', NULL, NULL, NULL, N'dbaad8d6-7a63-4a2a-9cc5-ed5dbd4d7d1e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010100', N'20000', NULL, NULL, NULL, N'217a093f-1fce-47d0-890b-03e19e566d9c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010200', N'20000', NULL, NULL, NULL, N'd08b0022-cb82-4c4d-8cf9-33ee876589ca')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010300', N'20000', NULL, NULL, NULL, N'84492a86-7dd0-4aa3-8f35-5e028d13e76a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010400', N'20130', NULL, NULL, NULL, N'bf67825a-da1a-4d67-bee8-c444e2345cc2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010500', N'20000', NULL, NULL, NULL, N'0ed6241f-279e-4725-943c-da03af175d8a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010600', N'20000', NULL, NULL, NULL, N'a4157e66-0102-4242-8ba5-ff40daf816a6')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010700', N'20000', NULL, NULL, NULL, N'cbff2d30-953e-4ba7-8223-d37803eb0106')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010800', N'20000', NULL, NULL, NULL, N'b549df93-66dd-4d8e-ada4-7bc9317d2d0f')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20010900', N'20000', NULL, NULL, NULL, N'91d5c74d-07d4-419e-81fc-cc3554e49f91')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011000', N'20000', NULL, NULL, NULL, N'78fd668f-7df7-433b-911c-5a47aeabfd55')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011100', N'20000', NULL, NULL, NULL, N'9065eef7-b4a2-46be-bf21-73f1edfdace4')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011200', N'20000', NULL, NULL, NULL, N'2ab85429-e15b-4c30-b6b0-ac80b5a494e8')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011300', N'20130', NULL, NULL, NULL, N'601fe83b-3b01-4e44-8f3c-2ba32a5d5ef1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011400', N'20130', NULL, NULL, NULL, N'f039c94b-5b55-4e9c-9188-4e4577dadf99')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011500', N'20130', NULL, NULL, NULL, N'143f172c-db8f-416d-92f4-aae53f21384f')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011600', N'20130', NULL, NULL, NULL, N'47df1ea1-20a2-4c6e-9385-9a84f763b1ce')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011700', N'20000', NULL, NULL, NULL, N'd8aed433-d631-41a5-9efb-60944c1b1b4d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20010000', N'20011800', N'20000', NULL, NULL, NULL, N'fcb38eed-abaa-4917-bf42-562d319d0f76')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020100', N'20170', NULL, NULL, NULL, N'cd0993b1-e845-4c5c-aa38-e1a3ad12be45')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020200', N'20220', NULL, NULL, NULL, N'6846ebb6-a216-4a30-8aa2-9b5df92cf1bf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020300', N'20170', NULL, NULL, NULL, N'63972466-1f49-435f-92cf-1d969e0dfcf2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020400', N'20170', NULL, NULL, NULL, N'c75e698d-417b-4f4c-8f5d-29e4d76d864d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020500', N'20170', NULL, NULL, NULL, N'd37960dd-be14-4878-bb7d-566674e7a521')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020600', N'20170', NULL, NULL, NULL, N'd6aadc85-6592-4844-900b-d49441f7fd93')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020700', N'20220', NULL, NULL, NULL, N'78ea8deb-636e-470a-b607-1123684fa1fd')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20020000', N'20020800', N'20220', NULL, NULL, NULL, N'a41a1e86-0eba-4073-95f8-613d1af3572e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20030000', N'20030100', N'20190', NULL, NULL, NULL, N'd794a232-cd47-497d-8f58-610a4f530286')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20030000', N'20030200', N'20190', NULL, NULL, NULL, N'2d8d52f3-3bc5-4d3c-b53c-a88ffdd3d3ca')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20030000', N'20030300', N'20190', NULL, NULL, NULL, N'3def4118-e5c4-42f5-8b96-4b1208de96d7')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20030000', N'20030400', N'20190', NULL, NULL, NULL, N'bca7ff1a-3cdc-4458-9d4d-04b70f3a3601')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20030000', N'20030500', N'20190', NULL, NULL, NULL, N'e6c70feb-ffb3-4d66-9319-74d9a4f2b2a6')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040100', N'20150', NULL, NULL, NULL, N'58182a88-3b24-4093-9752-531788901aac')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040200', N'20150', NULL, NULL, NULL, N'253818a0-8968-45c3-8631-9ef10244d250')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040300', N'20150', NULL, NULL, NULL, N'5dde762d-4157-49c6-b6d8-887136d105ac')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040400', N'20150', NULL, NULL, NULL, N'aef0bde6-0255-4d12-9792-7c471e14dabb')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040500', N'20150', NULL, NULL, NULL, N'2a8e370a-9d45-45f3-aea9-6e0aa788deff')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040600', N'20150', NULL, NULL, NULL, N'd69ade21-e33a-4185-bf1f-cab7f2c2bc7c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040700', N'20150', NULL, NULL, NULL, N'c9841ca5-8c5d-4702-af0d-ba6f00f36661')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20040000', N'20040800', N'20150', NULL, NULL, NULL, N'bacabae3-d89f-4148-8042-a27a79599c45')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050100', N'20160', NULL, NULL, NULL, N'fc305a3b-794c-42b8-9e20-7c1250939725')
GO
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050200', N'20160', NULL, NULL, NULL, N'20aecb93-74e1-4088-bc38-3dddd024de1f')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050300', N'20160', NULL, NULL, NULL, N'5e5642fd-50c3-4496-b7ae-2c1af320ba29')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050400', N'20160', NULL, NULL, NULL, N'ec8bbf10-c4b5-4ec6-8e21-04c54ba2617e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050500', N'20160', NULL, NULL, NULL, N'1e96a2ae-06c2-438f-9589-f69b4c46e43c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050600', N'20160', NULL, NULL, NULL, N'74215658-8a6d-4493-8c1e-3de8ad5fdbee')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050700', N'20160', NULL, NULL, NULL, N'b9a68db3-fe1b-4f5c-b378-07e5dcbe2596')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050800', N'20160', NULL, NULL, NULL, N'a399e790-6076-4217-9750-c1b93400c4cb')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20050900', N'20160', NULL, NULL, NULL, N'52e219fc-a81f-433b-ac8b-af8ba961deb8')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20051000', N'20160', NULL, NULL, NULL, N'c2b282f6-e01d-4e74-94c1-44500274e111')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20050000', N'20051100', N'20160', NULL, NULL, NULL, N'd5f65d6e-797c-4e40-bdc5-18ddd1e0b6ad')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060100', N'20140', NULL, NULL, NULL, N'fd344fdb-633c-47a3-82b0-6544284172ca')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060200', N'20140', NULL, NULL, NULL, N'f3ed5258-b839-4673-9c25-d083fec8dfc6')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060300', N'20140', NULL, NULL, NULL, N'e5f4d464-1ff1-48a4-9608-999a5ec3b86e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060400', N'20140', NULL, NULL, NULL, N'ba0fef76-109c-466d-9163-3b9771db8395')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060500', N'20240', NULL, NULL, NULL, N'61720797-6fbf-4558-935c-2c944b27637b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060600', N'20140', NULL, NULL, NULL, N'8b6fcd9c-9fcf-4245-bf88-b109292d951b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060700', N'20140', NULL, NULL, NULL, N'9f890b6a-13a5-4954-9e91-c53529c77a43')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060800', N'20140', NULL, NULL, NULL, N'f7693438-e20f-4a8f-852f-942c7073cd72')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20060900', N'20140', NULL, NULL, NULL, N'e395de89-d0b4-4711-9ffb-32e46e8d51db')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061000', N'20140', NULL, NULL, NULL, N'fea57378-0eb7-492f-ab01-3516df7b5faf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061100', N'20140', NULL, NULL, NULL, N'b914d53f-d487-4d06-a9fc-e004ebe3e005')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061300', N'20140', NULL, NULL, NULL, N'26d16f7c-0562-4cc3-8844-777f0c33c92a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061400', N'20140', NULL, NULL, NULL, N'855efaa5-d6df-484c-a80d-f1e69e0beee1')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061500', N'20140', NULL, NULL, NULL, N'99c455ae-3765-4ebf-877d-f5a0eee58edd')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061600', N'20140', NULL, NULL, NULL, N'9ff99b61-5962-42c8-9734-1d18b41d9936')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061700', N'20240', NULL, NULL, NULL, N'022be3ae-9fb5-4bcb-8220-0f03b70f4696')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20061800', N'20140', NULL, NULL, NULL, N'60abca8a-90bc-409c-b4ec-bf7b3233a223')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20062000', N'20140', NULL, NULL, NULL, N'e783d5ce-eb7c-4717-aac3-f0da2cfd0d4c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20062100', N'20140', NULL, NULL, NULL, N'22d8173c-cb59-4b6b-a4a1-af0376911319')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20060000', N'20062200', N'20140', NULL, NULL, NULL, N'57efe03c-9689-4cb8-b4db-3456dce39183')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070100', N'20110', NULL, NULL, NULL, N'49c9f3cd-2bab-42e4-81fe-5b1a0f19b46d')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070200', N'20110', NULL, NULL, NULL, N'8ff14f5b-2736-458d-bf68-2c1f05a6ab3b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070300', N'20230', NULL, NULL, NULL, N'24c917ca-8f3d-41a7-b60c-abc26dca1503')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070400', N'20230', NULL, NULL, NULL, N'e29ea69b-4707-4e29-9c8e-f2566a171a4a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070500', N'20230', NULL, NULL, NULL, N'2bf307f9-b080-4bb5-8404-d225aca0c4f2')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070600', N'20110', NULL, NULL, NULL, N'23e6831a-6070-4a84-a277-bf543c1a853a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070700', N'20110', NULL, NULL, NULL, N'450487df-b344-4da4-9400-a31f2abddaaf')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20070000', N'20070800', N'20230', NULL, NULL, NULL, N'93aadd45-1e30-40af-9286-ffd728cf32ae')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20080000', N'20080100', N'20120', NULL, NULL, NULL, N'ae09da4b-4f10-4e61-8d58-f1432b76c14e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20090000', N'20090100', N'20180', NULL, NULL, NULL, N'9e7e67b9-10b4-4030-834e-6a67dfe7a980')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20090000', N'20090200', N'20250', NULL, NULL, NULL, N'12075084-b45c-4bc6-ba09-d7e84564f93a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20090000', N'20090300', N'20180', NULL, NULL, NULL, N'e0827230-149a-466a-9b08-2cc49b35522b')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20090000', N'20090400', N'20250', NULL, NULL, NULL, N'e05667e9-88e8-4de8-87fe-2b2e4bf7912c')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20090000', N'20090500', N'20180', NULL, NULL, NULL, N'd95fa214-bd09-4fb1-a71f-c79a17dd4c6a')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100100', N'20270', NULL, NULL, NULL, N'63042288-d09d-4b41-915d-91963e6b0ca7')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100200', N'20270', NULL, NULL, NULL, N'59e36e94-020d-4a96-87f4-276731f46981')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100300', N'20270', NULL, NULL, NULL, N'f0129481-1808-4002-89f2-ad8146d8cc38')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100400', N'20270', NULL, NULL, NULL, N'adf61866-8a4a-43fc-bc3c-195553447b7e')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100500', N'20270', NULL, NULL, NULL, N'2124a02d-c26d-42b9-a56d-7cb8b8446a73')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20100000', N'20100600', N'20270', NULL, NULL, NULL, N'9a8a061e-7801-4545-b06b-5781269518ce')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20110000', N'20110100', N'20240', NULL, NULL, NULL, N'94681408-d0b6-4eec-af59-e6d3c4a73cb3')
INSERT [dbo].[ini_list_zip] ([province_code], [country_code], [district_code], [subdistrict_code], [zip_code], [x_status], [x_note], [x_log], [id]) VALUES (N'20000000', 66, N'20110000', N'20110200', N'20240', NULL, NULL, NULL, N'd38b8d5c-9a44-425f-96a1-4f3156ec393e')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'0       ', N'', NULL, NULL, NULL, NULL, N'c927967c-c507-4603-b919-08078038f65d')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'กรุงเทพมหานคร', NULL, NULL, NULL, NULL, N'67e7dc9e-5dde-41d0-b755-b8dfdd5a19b5')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'11000000', N'สมุทรปราการ', NULL, NULL, NULL, NULL, N'9d05e13b-6aa4-4a14-ae9f-3c1845bb1fd1')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'12000000', N'นนทบุรี', NULL, NULL, NULL, NULL, N'd2b46d3a-e3c8-4d26-a160-43ae0b0e221e')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'13000000', N'ปทุมธานี', NULL, NULL, NULL, NULL, N'1b973958-81f5-47e1-af31-1f77ac79872a')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'14000000', N'พระนครศรีอยุธยา', NULL, NULL, NULL, NULL, N'55c7d8f8-5b82-4d98-b02c-1e91d998b616')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'15000000', N'อ่างทอง', NULL, NULL, NULL, NULL, N'e473b158-d51d-459f-a5f2-47ea329c2259')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'16000000', N'ลพบุรี', NULL, NULL, NULL, NULL, N'b081857b-595f-45d0-aff7-8f7d8d1e9640')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'17000000', N'สิงห์บุรี', NULL, NULL, NULL, NULL, N'4fbdb5f1-6745-4e62-a70d-abc124f72d08')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'18000000', N'ชัยนาท', NULL, NULL, NULL, NULL, N'2fd64232-61b9-47d7-acd0-72526c05ed42')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'19000000', N'สระบุรี', NULL, NULL, NULL, NULL, N'8c181490-d29c-422a-ab01-2549269b604c')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'ชลบุรี', NULL, NULL, NULL, NULL, N'1757db93-287a-45a1-a4dc-80198048e1fa')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'21000000', N'ระยอง', NULL, NULL, NULL, NULL, N'776f2eae-f0fe-463c-84d1-6a07872d2c45')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'22000000', N'จันทบุรี', NULL, NULL, NULL, NULL, N'53bb937c-ef3e-41a2-b11c-1b9a3a1920a1')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'23000000', N'ตราด', NULL, NULL, NULL, NULL, N'3e367836-0534-41cc-8c68-bfc6000dfe14')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'24000000', N'ฉะเชิงเทรา', NULL, NULL, NULL, NULL, N'2dc76182-02c0-4b3a-bd95-5084180d3f33')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'25000000', N'ปราจีนบุรี', NULL, NULL, NULL, NULL, N'512f88b5-4865-40b4-b5df-7e387826cc26')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'26000000', N'นครนายก', NULL, NULL, NULL, NULL, N'48198adb-a850-40b6-a43f-3463e2818e3a')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'27000000', N'สระแก้ว', NULL, NULL, NULL, NULL, N'7d3f1b65-fe16-4395-ba48-108d05efc8c6')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'30000000', N'นครราชสีมา', NULL, NULL, NULL, NULL, N'023c99ea-7b33-41ae-b064-ec8eb25e5341')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'31000000', N'บุรีรัมย์', NULL, NULL, NULL, NULL, N'4d44456f-acd6-49dd-b892-59deb4ab5d45')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'32000000', N'สุรินทร์', NULL, NULL, NULL, NULL, N'0e8c9f35-5fce-4a8a-8195-ac6341bbfe99')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'33000000', N'ศรีสะเกษ', NULL, NULL, NULL, NULL, N'0fb5c577-fcc4-4ac1-bf80-6fb7ad644698')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'34000000', N'อุบลราชธานี', NULL, NULL, NULL, NULL, N'6f2b1209-53d6-49c9-b214-b50c304b1350')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'35000000', N'ยโสธร', NULL, NULL, NULL, NULL, N'63cd7139-1a2c-4b33-8f90-a3c3882d4a71')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'36000000', N'ชัยภูมิ', NULL, NULL, NULL, NULL, N'831a751d-b295-4da8-b02f-92bca34b4b0c')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'37000000', N'อำนาจเจริญ', NULL, NULL, NULL, NULL, N'fa0b0dfc-a848-4897-b451-76638364d282')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'38000000', N'บึงกาฬ', NULL, NULL, NULL, NULL, N'f0020c55-b64b-4ea8-8260-613601786d19')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'39000000', N'หนองบัวลำภู', NULL, NULL, NULL, NULL, N'd8d65f7e-0b32-44a8-b37a-c056e3a0bf0e')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'40000000', N'ขอนแก่น', NULL, NULL, NULL, NULL, N'437a1b7d-5f8a-4248-9738-8ee10f7502f6')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'41000000', N'อุดรธานี', NULL, NULL, NULL, NULL, N'804d75a2-98fe-4629-92dc-c1221aaf653d')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'42000000', N'เลย', NULL, NULL, NULL, NULL, N'df5d3d0e-b6f6-4274-89f1-ececfce523a0')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'43000000', N'หนองคาย', NULL, NULL, NULL, NULL, N'32d8708f-bc02-450d-ae8b-71f8387b4468')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'44000000', N'มหาสารคาม', NULL, NULL, NULL, NULL, N'2827dec8-dbab-4cfc-854f-2b8813ba7f67')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'45000000', N'ร้อยเอ็ด', NULL, NULL, NULL, NULL, N'28697a1d-f2f1-4eb0-9b2b-f87789aa91de')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'46000000', N'กาฬสินธุ์', NULL, NULL, NULL, NULL, N'a61b908c-02b3-431d-a9d0-e58f0bfc765c')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'47000000', N'สกลนคร', NULL, NULL, NULL, NULL, N'f3f87e45-67d9-42b5-9e9a-700eeb046ce1')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'48000000', N'นครพนม', NULL, NULL, NULL, NULL, N'dc99c130-e384-49a0-8f6a-8f32ac7d0e2c')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'49000000', N'มุกดาหาร', NULL, NULL, NULL, NULL, N'047a85ed-09a6-4846-b410-4d2bad698d9a')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'50000000', N'เชียงใหม่', NULL, NULL, NULL, NULL, N'ff21de33-17a7-48f5-8c24-44ab6fdfd91c')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'51000000', N'ลำพูน', NULL, NULL, NULL, NULL, N'4acda8fe-ff5b-47ac-8fc3-e05216d424e8')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'52000000', N'ลำปาง', NULL, NULL, NULL, NULL, N'c7b16d22-f371-46b6-9e5f-d8f981571864')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'53000000', N'อุตรดิตถ์', NULL, NULL, NULL, NULL, N'7a0abace-03d3-475d-a1a5-becc412b7381')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'54000000', N'แพร่', NULL, NULL, NULL, NULL, N'a921a6e5-a4f2-42e9-8a10-d03eb9a4a4a5')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'55000000', N'น่าน', NULL, NULL, NULL, NULL, N'd468a54e-8046-4cba-b575-24f2648947cf')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'56000000', N'พะเยา', NULL, NULL, NULL, NULL, N'65f2efe3-a396-4c3f-b512-674a1626a7ca')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'57000000', N'เชียงราย', NULL, NULL, NULL, NULL, N'be9b5414-3543-48a8-887a-5a84123d6f7a')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'58000000', N'แม่ฮ่องสอน', NULL, NULL, NULL, NULL, N'7c8b824a-81aa-48ea-aa31-5ef6aad2c572')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'60000000', N'นครสวรรค์', NULL, NULL, NULL, NULL, N'137dea1f-d50c-4b8e-b199-8ca75a3af1e3')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'61000000', N'อุทัยธานี', NULL, NULL, NULL, NULL, N'166feaa8-f7cf-4674-b729-c485b1d66e3e')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'62000000', N'กำแพงเพชร', NULL, NULL, NULL, NULL, N'18007c89-d6f7-415e-b112-e880f480122e')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'63000000', N'ตาก', NULL, NULL, NULL, NULL, N'5342a2b2-cf17-4688-b26f-b0d5026f9165')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'64000000', N'สุโขทัย', NULL, NULL, NULL, NULL, N'2caeccf8-bffe-4dcd-b7e6-edcb1c03b3c7')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'65000000', N'พิษณุโลก', NULL, NULL, NULL, NULL, N'f8a98d08-a68e-4b45-8c67-50d9deef169f')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'66000000', N'พิจิตร', NULL, NULL, NULL, NULL, N'07ae869d-534f-4611-a1ab-69598ff5c723')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'67000000', N'เพชรบูรณ์', NULL, NULL, NULL, NULL, N'eb9cc6d1-b0a0-42e5-b6bc-f83168c41022')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'70000000', N'ราชบุรี', NULL, NULL, NULL, NULL, N'0046b681-6ba0-4487-9d7b-0877bc8ed015')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'71000000', N'กาญจนบุรี', NULL, NULL, NULL, NULL, N'94fc95ff-11ac-4ba8-aa1b-1eff8b568704')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'72000000', N'สุพรรณบุรี', NULL, NULL, NULL, NULL, N'4a525d55-2022-42ce-8eb6-9665e53448d1')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'73000000', N'นครปฐม', NULL, NULL, NULL, NULL, N'd7d1ccbb-b2a3-4801-b8f2-dbdb6b807a24')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'74000000', N'สมุทรสาคร', NULL, NULL, NULL, NULL, N'ff4022f4-53ee-4433-9a6b-0bf939aeddd9')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'75000000', N'สมุทรสงคราม', NULL, NULL, NULL, NULL, N'99487e7e-1bbf-4e18-9500-5c281605c121')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'76000000', N'เพชรบุรี', NULL, NULL, NULL, NULL, N'62108e84-2946-4888-a5a2-c0f6d0cb46ab')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'77000000', N'ประจวบคีรีขันธ์', NULL, NULL, NULL, NULL, N'f324e9a4-e4ea-403e-a28e-5f27892fc755')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'80000000', N'นครศรีธรรมราช', NULL, NULL, NULL, NULL, N'd089a292-f553-43d7-866e-20e490ca47f3')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'81000000', N'กระบี่', NULL, NULL, NULL, NULL, N'9e8d1ef4-408a-4e93-ac4c-c863b26a385a')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'82000000', N'พังงา', NULL, NULL, NULL, NULL, N'bd1c60da-bc62-41d9-9dbd-4aca1623b1bc')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'83000000', N'ภูเก็ต', NULL, NULL, NULL, NULL, N'8e53077a-9398-41be-ab57-5ea81c2fd6fe')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'84000000', N'สุราษฎร์ธานี', NULL, NULL, NULL, NULL, N'4f3b77ff-8cdf-49ee-9e55-78c69e0e36d1')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'85000000', N'ระนอง', NULL, NULL, NULL, NULL, N'e7c63615-d3fc-405a-a0fb-41a1cb552bcc')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'86000000', N'ชุมพร', NULL, NULL, NULL, NULL, N'a196a316-4e82-453d-a9dc-4c2e8062ef57')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'90000000', N'สงขลา', NULL, NULL, NULL, NULL, N'c583b6a8-4701-4765-b6af-bd72d54a4e9b')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'91000000', N'สตูล', NULL, NULL, NULL, NULL, N'09e0f58b-43ec-4ae1-af9f-76025b270fde')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'92000000', N'ตรัง', NULL, NULL, NULL, NULL, N'8a96d4b1-29a9-496c-bd6b-c52ed1e0d76d')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'93000000', N'พัทลุง', NULL, NULL, NULL, NULL, N'8559a4cb-dd36-4920-ab5e-6449a448a154')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'94000000', N'ปัตตานี', NULL, NULL, NULL, NULL, N'5155fd1a-f4c6-44c0-8b7d-20c8757361f0')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'95000000', N'ยะลา', NULL, NULL, NULL, NULL, N'bfbcaead-88e1-4269-9bd4-3601ea673830')
INSERT [dbo].[ini_province] ([country_code], [province_code], [pro_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'96000000', N'นราธิวาส', NULL, NULL, NULL, NULL, N'e38e5bf3-9692-4cee-8d5e-9a8f813ec673')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010100', N'พระบรมมหาราชวัง', NULL, NULL, NULL, NULL, N'be72b733-dfcf-4252-bf6e-a72e8a556f84')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010200', N'วังบูรพาภิรมย์', NULL, NULL, NULL, NULL, N'dbe4cfd6-e23a-4ab0-9ff3-3aedfcb5efc9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010300', N'วัดราชบพิธ', NULL, NULL, NULL, NULL, N'7b39664c-03c1-450a-a73e-5e93370689fe')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010400', N'สำราญราษฎร์', NULL, NULL, NULL, NULL, N'eff6464c-20e5-4889-b05a-e86b57014cee')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010500', N'ศาลเจ้าพ่อเสือ', NULL, NULL, NULL, NULL, N'1ec97034-1160-4fa8-81ac-4e4a39fc2f15')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010600', N'เสาชิงช้า', NULL, NULL, NULL, NULL, N'3ab1269f-85ca-4e31-bd84-4f3985aa4206')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010700', N'บวรนิเวศ', NULL, NULL, NULL, NULL, N'db213cb8-824c-4472-9d54-076588383d9c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010800', N'ตลาดยอด', NULL, NULL, NULL, NULL, N'a615f1ec-0fa5-4c18-948a-7ae92ccebd38')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10010900', N'ชนะสงคราม', NULL, NULL, NULL, NULL, N'ad44367d-cf77-418e-b763-7a736e51324f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10011000', N'บ้านพานถม', NULL, NULL, NULL, NULL, N'7e3e371e-8a29-4fc8-a628-91710827960a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10011100', N'บางขุนพรหม', NULL, NULL, NULL, NULL, N'72b9adae-91cd-4b63-abb1-29e34600b9af')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10010000', N'10011200', N'วัดสามพระยา', NULL, NULL, NULL, NULL, N'1f406e80-3778-4d2b-b850-01779d8900da')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020100', N'ดุสิต', NULL, NULL, NULL, NULL, N'1e54bd2f-57ab-4871-a803-7c1f09f6601c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020200', N'วชิรพยาบาล', NULL, NULL, NULL, NULL, N'5829bb5e-05b1-499d-a51e-59df76667f1d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020300', N'สวนจิตรลดา', NULL, NULL, NULL, NULL, N'780b4dfe-3c7f-451b-ae9a-f2cfaf3b9e13')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020400', N'สี่แยกมหานาค', NULL, NULL, NULL, NULL, N'5d512130-8ebb-474c-b792-cff3adbb5fe5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020500', N'บางซื่อ', NULL, NULL, NULL, NULL, N'2bbe31a5-6e06-4448-a510-243c1a576974')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10020600', N'ถนนนครไชยศรี', NULL, NULL, NULL, NULL, N'08d534e4-f492-4933-8d16-501169611aea')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10020000', N'10029900', N'สามเสนใน', NULL, NULL, NULL, NULL, N'55ffa94a-b70f-48e6-b68d-6fbc62fd4827')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030100', N'กระทุ่มราย', NULL, NULL, NULL, NULL, N'a0de427f-9390-4f04-b0e7-439617627aaf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030200', N'หนองจอก', NULL, NULL, NULL, NULL, N'f05226f8-ff35-435c-9831-cdb6010167bd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030300', N'คลองสิบ', NULL, NULL, NULL, NULL, N'ef1572b4-11e3-4d5f-8a0d-21c68bbe54fb')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030400', N'คลองสิบสอง', NULL, NULL, NULL, NULL, N'09a02cca-c10a-4d22-a6c2-29f2e5883746')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030500', N'โคกแฝด', NULL, NULL, NULL, NULL, N'2d8ac7e4-9eeb-4ea8-8cda-ee5d4d40b401')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030600', N'คู้ฝั่งเหนือ', NULL, NULL, NULL, NULL, N'fc728dd4-ef17-4d8d-a49b-aae07b07ce3c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030700', N'ลำผักชี', NULL, NULL, NULL, NULL, N'1ea9296b-e774-43b9-9e66-f75c78ba92a6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10030000', N'10030800', N'ลำต้อยติ่ง', NULL, NULL, NULL, NULL, N'4ef82099-b6e8-40fb-856c-8027b097d918')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'10040100', N'มหาพฤฒาราม', NULL, NULL, NULL, NULL, N'609c5c62-013c-4a25-b8c6-6d631991f092')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'10040200', N'สีลม', NULL, NULL, NULL, NULL, N'02ee0121-da10-454e-9f3d-b1384ef87745')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'10040300', N'สุริยวงศ์', NULL, NULL, NULL, NULL, N'd104134c-e7a0-4e12-9e5b-a1c68273eebc')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'10040400', N'บางรัก', NULL, NULL, NULL, NULL, N'db451748-c21e-46e2-9683-3229122dd032')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10040000', N'10040500', N'สี่พระยา', NULL, NULL, NULL, NULL, N'd45a9eee-83fb-49d8-979e-3ba08f2656db')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050100', N'ลาดยาว', NULL, NULL, NULL, NULL, N'd11e695c-956a-4fac-bed5-908c51b300c6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050200', N'อนุสาวรีย์', NULL, NULL, NULL, NULL, N'83458943-9571-4bbf-81e6-2e45152a3ca5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050300', N'คลองถนน', NULL, NULL, NULL, NULL, N'f37ea67e-2411-4a50-95d6-6bf20983557c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050400', N'ตลาดบางเขน', NULL, NULL, NULL, NULL, N'87d2a627-d606-4ea4-bed2-cf0355dca749')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050500', N'สีกัน', NULL, NULL, NULL, NULL, N'0049a391-7b2e-4af4-877f-3cec5446b58a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050600', N'สายไหม', NULL, NULL, NULL, NULL, N'44cb027c-ee7e-444e-8e9c-3506a1ee5892')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050700', N'ทุ่งสองห้อง', NULL, NULL, NULL, NULL, N'20e98d1d-159a-471b-b77d-d8da2f4bbf94')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050800', N'ท่าแร้ง', NULL, NULL, NULL, NULL, N'314427a9-a5b5-48f2-b446-1052d08ad9f5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10050900', N'ออเงิน', NULL, NULL, NULL, NULL, N'39708fea-55f4-4f5c-b690-d81660d85ec1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10050000', N'10059900', N'บางเขน', NULL, NULL, NULL, NULL, N'fcb0e175-0f0d-4d6c-a0ae-612a6e685fd6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060100', N'คลองจั่น', NULL, NULL, NULL, NULL, N'84b737ec-1271-4bab-88b1-55740c32f685')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060200', N'วังทองหลาง', NULL, NULL, NULL, NULL, N'42b0fde6-d609-43a9-a9dd-5b73e59edf0b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060300', N'ลาดพร้าว', NULL, NULL, NULL, NULL, N'3cdb61f9-57c6-4e78-891f-63a109ad174c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060400', N'คลองกุ่ม', NULL, NULL, NULL, NULL, N'ca9db264-a4d1-45d5-9ebe-01f7a04af35f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060500', N'สะพานสูง', NULL, NULL, NULL, NULL, N'1201bc81-1ad4-4aac-b1e7-6bffd16b39f3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060600', N'คันนายาว', NULL, NULL, NULL, NULL, N'54957358-5730-4f1a-90aa-0a7156334c6e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060700', N'จรเข้บัว', NULL, NULL, NULL, NULL, N'78e70c5b-298b-474a-a8f3-fc9b3257bc70')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10060000', N'10060800', N'หัวหมาก', NULL, NULL, NULL, NULL, N'7647e630-7794-4741-98c1-70d415e0aef7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10070000', N'10070100', N'รองเมือง', NULL, NULL, NULL, NULL, N'ce55042e-faf0-40e2-bdb0-f1c856bc5781')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10070000', N'10070200', N'วังใหม่', NULL, NULL, NULL, NULL, N'a7e82b11-1c18-49aa-b011-c6f72be15de7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10070000', N'10070300', N'ปทุมวัน', NULL, NULL, NULL, NULL, N'e3e3c809-fe1d-4ab4-bc80-77776b702de9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10070000', N'10070400', N'ลุมพินี', NULL, NULL, NULL, NULL, N'79334cf0-cb66-4ebb-9c71-249f24536f34')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10080100', N'ป้อมปราบ', NULL, NULL, NULL, NULL, N'e66788ba-1034-4298-b055-f2522d82e410')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10080200', N'วัดเทพศิรินทร์', NULL, NULL, NULL, NULL, N'cda71f65-69dc-4617-8fcf-83fb0677609f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10080300', N'คลองมหานาค', NULL, NULL, NULL, NULL, N'8cc4b8b0-0803-4ae1-b81b-4b90ed77fe0f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10080400', N'บ้านบาตร', NULL, NULL, NULL, NULL, N'b0fbad7a-899c-4c3e-964b-290e582513ac')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10080500', N'วัดโสมนัส', NULL, NULL, NULL, NULL, N'fea647dd-961d-4e9e-adfb-fa87c0e52a12')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10080000', N'10089900', N'นางเลิ้ง', NULL, NULL, NULL, NULL, N'45410b51-9994-437a-916a-8efd86c672f1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090100', N'คลองเตย', NULL, NULL, NULL, NULL, N'3ba76e75-63d8-4650-abab-b3589134912b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090200', N'คลองตัน', NULL, NULL, NULL, NULL, N'535f25ce-3f33-4eef-84f8-5e590acff2a3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090300', N'พระโขนง', NULL, NULL, NULL, NULL, N'463da31d-0111-4b7a-b724-9429adca74e7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090400', N'บางนา', NULL, NULL, NULL, NULL, N'8cff98f6-b4be-4d18-a42f-77cd49bd0ab5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090500', N'บางจาก', NULL, NULL, NULL, NULL, N'6ab03d01-5749-4b7e-ae91-cc18687c8084')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090600', N'สวนหลวง', NULL, NULL, NULL, NULL, N'4fb5bc5a-e69b-4929-b04d-b7745f208b47')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090700', N'หนองบอน', NULL, NULL, NULL, NULL, N'22f18678-6687-4dd6-afa0-107371d51336')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090800', N'ประเวศ', NULL, NULL, NULL, NULL, N'8740b1e5-7bba-4bc8-8838-a177579c07d5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10090900', N'ดอกไม้', NULL, NULL, NULL, NULL, N'673befbb-47a1-454e-8aa8-119bc957bf3c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10099700', N'พระโขนง', NULL, NULL, NULL, NULL, N'c2add7c4-4ac0-4802-aaa3-eb66e5fca65a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10099800', N'คลองตัน', NULL, NULL, NULL, NULL, N'6d56ca05-4332-4e51-94aa-a18db69a8717')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10090000', N'10099900', N'คลองเตย', NULL, NULL, NULL, NULL, N'92ad6452-5e13-4626-9f89-a949b89c85b9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100100', N'มีนบุรี', NULL, NULL, NULL, NULL, N'9583eee0-7f0a-45f4-83b9-fc8408c8f11c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100200', N'แสนแสบ', NULL, NULL, NULL, NULL, N'5a3ba453-abf3-419c-868f-728650ab899d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100300', N'บางชัน', NULL, NULL, NULL, NULL, N'f282db8d-a3db-4878-b15f-9411786b3c18')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100400', N'ทรายกองดิน', NULL, NULL, NULL, NULL, N'119115cd-50b1-4908-a688-64693b0fc785')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100500', N'ทรายกองดินใต้', NULL, NULL, NULL, NULL, N'550d0592-c255-4099-8ec0-a3571881d11f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100600', N'สามวาตะวันออก', NULL, NULL, NULL, NULL, N'b15dc3c8-7d89-4894-af6a-d889ad520e7b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10100000', N'10100700', N'สามวาตะวันตก', NULL, NULL, NULL, NULL, N'2d6beb9a-faa0-41b9-800c-9869a0984385')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110100', N'ลาดกระบัง', NULL, NULL, NULL, NULL, N'43c789b7-006e-4e91-89b2-24fe716d8945')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110200', N'คลองสองต้นนุ่น', NULL, NULL, NULL, NULL, N'50613fad-2994-483a-894d-c767b6d0f2bf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110300', N'คลองสามประเวศ', NULL, NULL, NULL, NULL, N'65a42688-b875-4733-95e8-f41a4e560bda')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110400', N'ลำปลาทิว', NULL, NULL, NULL, NULL, N'3e03bc9f-4c49-400f-8b58-7989ad5b9d40')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110500', N'ทับยาว', NULL, NULL, NULL, NULL, N'9e83cfca-cd8f-4ddd-a664-f30277eeecaa')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10110000', N'10110600', N'ขุมทอง', NULL, NULL, NULL, NULL, N'9ab12640-e372-4b51-839d-b510bab22d8e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120100', N'ทุ่งวัดดอน', NULL, NULL, NULL, NULL, N'3750b261-b58e-4315-89f0-659fb298a200')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120200', N'ยานนาวา', NULL, NULL, NULL, NULL, N'086ebfbd-4f40-463c-b3bf-31c3be83b11f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120300', N'ช่องนนทรี', NULL, NULL, NULL, NULL, N'f1484d16-8cd0-4118-ba69-c4c29851a835')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120400', N'บางโพงพาง', NULL, NULL, NULL, NULL, N'1444fbdb-d35f-480a-86c0-9b3b8677bb88')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120500', N'วัดพระยาไกร', NULL, NULL, NULL, NULL, N'2f933395-5d2b-48c4-980c-b592519a0f23')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120600', N'บางโคล่', NULL, NULL, NULL, NULL, N'a71e1e17-039b-4345-9d06-5b6d228aedbf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120700', N'บางคอแหลม', NULL, NULL, NULL, NULL, N'dac19ac2-45be-4550-a410-66d22f3823f2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10120800', N'ทุ่งมหาเมฆ', NULL, NULL, NULL, NULL, N'761edabc-1146-4e1c-bc19-5016836de61e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10129800', N'บางโคล่', NULL, NULL, NULL, NULL, N'1609fe54-a7f7-4c60-bfe1-9a6108df9ee2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10120000', N'10129900', N'บางคอแหลม', NULL, NULL, NULL, NULL, N'892102c0-5422-47c8-b3d0-b71eb88235d2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10130000', N'10130100', N'จักรวรรดิ', NULL, NULL, NULL, NULL, N'b4d2b9de-984c-4409-a02e-842e5364c8ce')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10130000', N'10130200', N'สัมพันธวงศ์', NULL, NULL, NULL, NULL, N'7e5df87a-c270-4269-be21-d5f82c75ecc2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10130000', N'10130300', N'ตลาดน้อย', NULL, NULL, NULL, NULL, N'22d07f29-d8e3-4787-abcc-86f967d7afe3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10140100', N'สามเสนใน', NULL, NULL, NULL, NULL, N'374375be-f53c-4662-8a51-1699a7647e67')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10140200', N'ถนนเพชรบุรี', NULL, NULL, NULL, NULL, N'ea8b17cf-fb5f-4c92-aa4b-52bcc1d2e3aa')
GO
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10140300', N'ทุ่งพญาไท', NULL, NULL, NULL, NULL, N'cce76f26-d451-4e41-864f-443772a5a6a8')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10140400', N'มักกะสัน', NULL, NULL, NULL, NULL, N'7152debb-b555-4c58-bbe0-dd2ba09c29e3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10140500', N'ถนนพญาไท', NULL, NULL, NULL, NULL, N'fcf6b83d-270c-4d7a-aa49-8a2b870658c4')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10140000', N'10149900', N'ทุ่งพญาไท', NULL, NULL, NULL, NULL, N'6deb0b3d-092c-49cb-9cba-ca9f8997bcbd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150100', N'วัดกัลยาณ์', NULL, NULL, NULL, NULL, N'f935398f-2309-4e5b-a91c-7ea8a191a7d9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150200', N'หิรัญรูจี', NULL, NULL, NULL, NULL, N'469195e6-e189-4521-9c22-bd15a3836dd4')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150300', N'บางยี่เรือ', NULL, NULL, NULL, NULL, N'ac310c09-ef68-4f55-9e42-e7feb3a058f6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150400', N'บุคคโล', NULL, NULL, NULL, NULL, N'fa072c50-c08c-464b-83b5-4d34e63f924c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150500', N'ตลาดพลู', NULL, NULL, NULL, NULL, N'b6829927-f4df-4ba9-89cb-2e2a23a92ef1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150600', N'ดาวคะนอง', NULL, NULL, NULL, NULL, N'c8a4fcfe-b551-48be-9650-750d482099ca')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10150700', N'สำเหร่', NULL, NULL, NULL, NULL, N'178a708c-fb92-491b-a261-bfb09f3cb747')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10150000', N'10159900', N'คลองสาน', NULL, NULL, NULL, NULL, N'a857fb4a-06d4-435f-8151-16ba901e1926')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10160000', N'10160100', N'วัดอรุณ', NULL, NULL, NULL, NULL, N'c481a1c9-c2a7-4742-ae99-96651dee434e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10160000', N'10160200', N'วัดท่าพระ', NULL, NULL, NULL, NULL, N'50f9e97f-83df-4656-bee8-2daeb8d96071')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10170000', N'10170100', N'ห้วยขวาง', NULL, NULL, NULL, NULL, N'3b0f104f-3548-4934-8dbe-c79576d2ecbd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10170000', N'10170200', N'บางกะปิ', NULL, NULL, NULL, NULL, N'b472a531-86d3-4e38-b5ed-dcd7d996334f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10170000', N'10170300', N'ดินแดง', NULL, NULL, NULL, NULL, N'3ec86ced-e27b-4f8c-a221-375e4b81d9a5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10170000', N'10170400', N'สามเสนนอก', NULL, NULL, NULL, NULL, N'e8263d9a-d997-460e-8ff6-619c8e62a692')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10180000', N'10180100', N'สมเด็จเจ้าพระยา', NULL, NULL, NULL, NULL, N'7529a6eb-a85b-42bd-a4dd-e2714653f856')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10180000', N'10180200', N'คลองสาน', NULL, NULL, NULL, NULL, N'66c81698-23c5-4689-acf8-1874eba8397c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10180000', N'10180300', N'บางลำภูล่าง', NULL, NULL, NULL, NULL, N'd2c72089-8a23-46bb-b5ca-0fd1efe4dd34')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10180000', N'10180400', N'คลองต้นไทร', NULL, NULL, NULL, NULL, N'403e2852-0a04-46e9-b0cf-2800d0fb9e41')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190100', N'คลองชักพระ', NULL, NULL, NULL, NULL, N'8a519322-fc81-4dc9-a4ae-ad187e3494da')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190200', N'ตลิ่งชัน', NULL, NULL, NULL, NULL, N'e608d148-b02d-40d2-83d2-6a299624a56c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190300', N'ฉิมพลี', NULL, NULL, NULL, NULL, N'da55f746-ba0a-4555-811e-f96f2ba99ed7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190400', N'บางพรม', NULL, NULL, NULL, NULL, N'754f263e-f2c6-4d10-ad69-da7b11b9f7cc')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190500', N'บางระมาด', NULL, NULL, NULL, NULL, N'9c39ae82-7cb4-451b-8aae-ffa740c5743b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190600', N'ทวีวัฒนา', NULL, NULL, NULL, NULL, N'f6ba8e72-b287-4d89-b4ee-133f81191e30')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190700', N'บางเชือกหนัง', NULL, NULL, NULL, NULL, N'2c26408d-c0c9-4b05-9ac1-1935c4c29956')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10190000', N'10190800', N'ศาลาธรรมสพน์', NULL, NULL, NULL, NULL, N'b79e2a7e-2ce7-43ed-a173-9fae9de03f4b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200100', N'บางพลัด', NULL, NULL, NULL, NULL, N'9512d60f-642b-4565-9c91-04489768979f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200200', N'บางบำหรุ', NULL, NULL, NULL, NULL, N'f08050b1-298b-45d4-ab83-4bfdf8011171')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200300', N'บางอ้อ', NULL, NULL, NULL, NULL, N'6fd4d55d-aa78-4d0a-9654-d69b235da6ee')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200400', N'ศิริราช', NULL, NULL, NULL, NULL, N'6cdd8698-0e68-4102-972d-661c2a5136b6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200500', N'บ้านช่างหล่อ', NULL, NULL, NULL, NULL, N'627fd1b4-8671-4fda-b10b-3648397cb560')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200600', N'บางขุนนนท์', NULL, NULL, NULL, NULL, N'adb93a0d-ac50-43dd-9d3f-fb133b7abecf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200700', N'บางขุนศรี', NULL, NULL, NULL, NULL, N'11560f4f-bc6e-48ad-a586-9bad0bc6e4c6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200800', N'บางยี่ขัน', NULL, NULL, NULL, NULL, N'7116a558-d87e-4dbc-bb94-2a36f2619ff6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10200900', N'อรุณอมรินทร์', NULL, NULL, NULL, NULL, N'e406eb09-9f10-4894-a387-17c8e0b4dc80')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10209700', N'บางยี่ขัน', NULL, NULL, NULL, NULL, N'4a65cab4-792c-485b-b70d-25c1d8ba8fa3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10209800', N'บางบำหรุ', NULL, NULL, NULL, NULL, N'f210cef2-cf8a-4537-bfd5-ebf6eb605525')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10200000', N'10209900', N'บางอ้อ', NULL, NULL, NULL, NULL, N'd9b30bac-4537-444b-b069-443bc4395d70')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210100', N'บางค้อ', NULL, NULL, NULL, NULL, N'4dfa7013-49d4-4d2c-ac0b-a5d850b365c3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210200', N'จอมทอง', NULL, NULL, NULL, NULL, N'965d4a83-dab2-4101-81a4-028b7a00d43c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210300', N'บางขุนเทียน', NULL, NULL, NULL, NULL, N'c78110e7-fa20-4ef3-a346-95a7e2b8b6a5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210400', N'บางบอน', NULL, NULL, NULL, NULL, N'd0a387ea-945a-4ee5-b6ff-ce6300512188')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210500', N'ท่าข้าม', NULL, NULL, NULL, NULL, N'00760e60-d70c-4aa3-adfe-bdd6199ab9fa')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210600', N'บางมด', NULL, NULL, NULL, NULL, N'3ea54959-abd1-4275-94d6-e0a104de7d68')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10210000', N'10210700', N'แสมดำ', NULL, NULL, NULL, NULL, N'b3935463-3a89-4fdf-8bb5-90b054a4032b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220100', N'บางหว้า', NULL, NULL, NULL, NULL, N'9620b75a-dff1-4d8a-a0f5-0eb344db73d3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220200', N'บางด้วน', NULL, NULL, NULL, NULL, N'8fb62e62-75f8-4005-b2c1-b13577cada50')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220300', N'บางแค', NULL, NULL, NULL, NULL, N'3b78dccd-f791-492e-966c-68438ae320ec')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220400', N'บางแคเหนือ', NULL, NULL, NULL, NULL, N'45716a0f-abc6-44ae-8a20-c83ca55ac1d6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220500', N'บางไผ่', NULL, NULL, NULL, NULL, N'69495e73-a308-4b5b-b32b-8b065c111726')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220600', N'บางจาก', NULL, NULL, NULL, NULL, N'2e6d6aa2-2cf9-4951-8629-23d671fbdff2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220700', N'บางแวก', NULL, NULL, NULL, NULL, N'5d461aa0-364d-4320-aa2f-10a233818d9e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220800', N'คลองขวาง', NULL, NULL, NULL, NULL, N'1638ad6b-81d6-4888-91db-cbf138e63254')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10220900', N'ปากคลองภาษีเจริญ', NULL, NULL, NULL, NULL, N'fd2956af-828d-496a-850a-72242b9d8c8d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10220000', N'10221000', N'คูหาสวรรค์', NULL, NULL, NULL, NULL, N'1248463d-98b6-4965-ab5c-dc5ddb4496ee')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10230000', N'10230100', N'หลักสอง', NULL, NULL, NULL, NULL, N'f9b5f6a4-6a97-4799-a2bf-fbe4cde399fd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10230000', N'10230200', N'หนองแขม', NULL, NULL, NULL, NULL, N'4a59da65-e262-4199-a948-d3d0c41c8c7d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10230000', N'10230300', N'หนองค้างพลู', NULL, NULL, NULL, NULL, N'9f349f27-931c-4f94-bf3d-a2e24b350af0')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10240000', N'10240100', N'ราษฎร์บูรณะ', NULL, NULL, NULL, NULL, N'1c0bc7d5-8037-4e86-8d6e-d8a309618c28')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10240000', N'10240200', N'บางปะกอก', NULL, NULL, NULL, NULL, N'082cdf51-d974-4c49-8db0-8767c91def89')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10240000', N'10240300', N'บางมด', NULL, NULL, NULL, NULL, N'16e7393e-8b1c-4cf3-8666-89c7299dce85')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10240000', N'10240400', N'ทุ่งครุ', NULL, NULL, NULL, NULL, N'ca25dc3b-7a6c-4252-9848-d71991770340')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10250000', N'10250100', N'บางพลัด', NULL, NULL, NULL, NULL, N'31d94798-8260-4c72-9e5d-59d3996d437b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10250000', N'10250200', N'บางอ้อ', NULL, NULL, NULL, NULL, N'42da0dc3-48a9-4b05-8125-68905b7fdc40')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10250000', N'10250300', N'บางบำหรุ', NULL, NULL, NULL, NULL, N'f487b798-f175-44f2-830f-796ee6779818')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10250000', N'10250400', N'บางยี่ขัน', NULL, NULL, NULL, NULL, N'd772ad38-d74f-4443-bd13-4028b229dc39')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10260000', N'10260100', N'ดินแดง', NULL, NULL, NULL, NULL, N'64541d83-7902-4f29-8a70-1188b4a91a86')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'10270100', N'คลองกุ่ม', NULL, NULL, NULL, NULL, N'8ccba2b4-8531-4622-8596-4d16cd0e2c08')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'10270200', N'สะพานสูง', NULL, NULL, NULL, NULL, N'ca232f97-a20a-496f-adaf-713e8562c0d0')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'10270300', N'คันนายาว', NULL, NULL, NULL, NULL, N'44ee94e0-1a2a-4ec7-a2d1-c2eea47b9b0b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'10270400', N'นวมินทร์', NULL, NULL, NULL, NULL, N'a4c952cd-6b35-4793-8cb4-d6b57f06d04d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10270000', N'10270500', N'นวลจันทร์', NULL, NULL, NULL, NULL, N'cd6756e0-4f41-47ff-95af-6f924ac4bfc2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10280000', N'10280100', N'ทุ่งวัดดอน', NULL, NULL, NULL, NULL, N'810d3166-af8b-47a4-94c2-e4bdcfb40753')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10280000', N'10280200', N'ยานนาวา', NULL, NULL, NULL, NULL, N'70632ec8-16b7-4ad1-b9d0-5622c4f3612d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10280000', N'10280300', N'ทุ่งมหาเมฆ', NULL, NULL, NULL, NULL, N'8056e3f2-3475-494a-b74b-6422e5bd3d2b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10290000', N'10290100', N'บางซื่อ', NULL, NULL, NULL, NULL, N'49038070-0d0d-4a80-af20-ca9b2260a012')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10290000', N'10290200', N'วงศ์สว่าง', NULL, NULL, NULL, NULL, N'aef35f4d-985a-493f-b843-7b6ded0e1952')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'10300100', N'ลาดยาว', NULL, NULL, NULL, NULL, N'128f3e73-cf27-4f87-b38d-702500d2eae9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'10300200', N'เสนานิคม', NULL, NULL, NULL, NULL, N'd3ee3f09-fc6f-492c-9da3-9fbbf34c55bc')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'10300300', N'จันทรเกษม', NULL, NULL, NULL, NULL, N'a75dee32-28a7-40a7-af52-cbd2beacc04f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'10300400', N'จอมพล', NULL, NULL, NULL, NULL, N'3cf9321c-97bf-4c48-9ba3-e0b1333f8a28')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10300000', N'10300500', N'จตุจักร', NULL, NULL, NULL, NULL, N'cacc9886-abfc-4437-890d-86aeca7fd3de')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10310000', N'10310100', N'บางคอแหลม', NULL, NULL, NULL, NULL, N'6f89533f-938c-400d-8b11-85606a760807')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10310000', N'10310200', N'วัดพระยาไกร', NULL, NULL, NULL, NULL, N'bd389034-3b58-48da-ae9b-76418a316e70')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10310000', N'10310300', N'บางโคล่', NULL, NULL, NULL, NULL, N'a88a7d40-de95-4f5a-8a26-dd82b5de37b2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10320000', N'10320100', N'ประเวศ', NULL, NULL, NULL, NULL, N'd476de4e-4174-4f61-a693-41d7154ca168')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10320000', N'10320200', N'หนองบอน', NULL, NULL, NULL, NULL, N'7e5d2725-4ae1-48fa-abce-6adf0611b099')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10320000', N'10320300', N'ดอกไม้', NULL, NULL, NULL, NULL, N'1a3e346f-8dd7-4557-9b8e-b8f56aa27d97')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10320000', N'10320400', N'สวนหลวง', NULL, NULL, NULL, NULL, N'9847d2f1-ddf9-45a0-ad46-006ac2036ac4')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330100', N'คลองเตย', NULL, NULL, NULL, NULL, N'6d07568e-0164-4795-bbb2-e82593c39ddd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330200', N'คลองตัน', NULL, NULL, NULL, NULL, N'8aa0479e-e0eb-4e53-8776-f86798b4d690')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330300', N'พระโขนง', NULL, NULL, NULL, NULL, N'b66181a7-6d4f-4d8a-882f-af172396e6cd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330400', N'คลองเตยเหนือ', NULL, NULL, NULL, NULL, N'80ace740-93df-499c-81e3-254c261c6072')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330500', N'คลองตันเหนือ', NULL, NULL, NULL, NULL, N'71d070de-21f5-4f5a-9aba-f2e8afa83320')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10330000', N'10330600', N'พระโขนงเหนือ', NULL, NULL, NULL, NULL, N'3f116b81-c936-4f89-a3b9-3cab842ba9b1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10340000', N'10340100', N'สวนหลวง', NULL, NULL, NULL, NULL, N'd7a11033-4bab-4fae-9a0c-dd3edf7f8201')
GO
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10350000', N'10350100', N'บางขุนเทียน', NULL, NULL, NULL, NULL, N'cbe60aa4-d6a1-45c7-83f4-30ab97aade6e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10350000', N'10350200', N'บางค้อ', NULL, NULL, NULL, NULL, N'4b74ed71-eff2-4733-9fb2-271fd6c97661')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10350000', N'10350300', N'บางมด', NULL, NULL, NULL, NULL, N'4bb0a2a8-29a9-4728-bc07-65f45a7d0d29')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10350000', N'10350400', N'จอมทอง', NULL, NULL, NULL, NULL, N'e9904e46-f0ca-4056-9928-ddeeaaf76801')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'10360100', N'ตลาดบางเขน', NULL, NULL, NULL, NULL, N'7f4becb4-e29b-444d-9e8c-50a9148a76c0')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'10360200', N'สีกัน', NULL, NULL, NULL, NULL, N'ef3f573c-5409-4193-b31d-b5e44aa1f168')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'10360300', N'ทุ่งสองห้อง', NULL, NULL, NULL, NULL, N'9659250e-3b41-47b5-833c-cc9907d671fd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'10360400', N'ดอนเมือง', NULL, NULL, NULL, NULL, N'0e0f7490-69c2-45bf-85d4-54e1646244fe')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10360000', N'10360500', N'สนามบิน', NULL, NULL, NULL, NULL, N'e9b3e4ff-950a-4352-8f0c-e67e7ec0aef7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10370000', N'10370100', N'ทุ่งพญาไท', NULL, NULL, NULL, NULL, N'ac7fdcb6-c0e8-4594-a439-296d071323fd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10370000', N'10370200', N'ถนนพญาไท', NULL, NULL, NULL, NULL, N'2ff050be-47f4-4192-90ac-98e282bceec5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10370000', N'10370300', N'ถนนเพชรบุรี', NULL, NULL, NULL, NULL, N'5ea61cae-1903-4234-9cac-7f86221e0dcd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10370000', N'10370400', N'มักกะสัน', NULL, NULL, NULL, NULL, N'3c42bb17-34af-410b-afbf-06a003e4b968')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10380000', N'10380100', N'ลาดพร้าว', NULL, NULL, NULL, NULL, N'9414e6e9-6d7c-4d6e-bf73-8192455ce0d1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10380000', N'10380200', N'จรเข้บัว', NULL, NULL, NULL, NULL, N'63644318-a724-4b6b-87a5-905f6686c6b1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10390000', N'10390100', N'คลองเตยเหนือ', NULL, NULL, NULL, NULL, N'a0adee28-840d-4c82-8a08-96b04c46957b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10390000', N'10390200', N'คลองตันเหนือ', NULL, NULL, NULL, NULL, N'19f4b1d7-ba35-4e39-b6b0-664accacef4c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10390000', N'10390300', N'พระโขนงเหนือ', NULL, NULL, NULL, NULL, N'43e33355-b4ac-4c44-be45-d138de322036')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10400000', N'10400100', N'บางแค', NULL, NULL, NULL, NULL, N'4bc60686-135a-44c1-80d1-e88c2130a8a6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10400000', N'10400200', N'บางแคเหนือ', NULL, NULL, NULL, NULL, N'1df8cc44-2e7b-4b1c-80b9-c30af38f3f32')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10400000', N'10400300', N'บางไผ่', NULL, NULL, NULL, NULL, N'9ca78a83-f4fe-4240-b8b3-e9e39e445088')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10400000', N'10400400', N'หลักสอง', NULL, NULL, NULL, NULL, N'9e7b2e1f-dd14-4eb3-a6ff-260aff60879c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10410000', N'10410100', N'ทุ่งสองห้อง', NULL, NULL, NULL, NULL, N'341db4fb-7121-40ca-b669-06c8aeb58da4')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10410000', N'10410200', N'ตลาดบางเขน', NULL, NULL, NULL, NULL, N'a009f0b2-55e5-4e89-94c7-6c86faa91be3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10420000', N'10420100', N'สายไหม', NULL, NULL, NULL, NULL, N'a33ed598-8ec4-4173-a3d7-1ada2b8b86ac')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10420000', N'10420200', N'ออเงิน', NULL, NULL, NULL, NULL, N'9a61776b-b90d-4d23-93bf-396005ec5db2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10420000', N'10420300', N'คลองถนน', NULL, NULL, NULL, NULL, N'a70c3566-c5f5-401d-acd2-8b6d5dce9022')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10430000', N'10430100', N'คันนายาว', NULL, NULL, NULL, NULL, N'6e8995be-b834-4dde-bf23-12988f8298ae')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10430000', N'10430200', N'รามอินทรา', NULL, NULL, NULL, NULL, N'8f1471ff-165f-466c-828a-069532aa8d85')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10440000', N'10440100', N'สะพานสูง', NULL, NULL, NULL, NULL, N'aa1ef5d4-d9cd-4c8b-b332-35a889460148')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10450000', N'10450100', N'วังทองหลาง', NULL, NULL, NULL, NULL, N'19b19ead-6718-47c0-ac97-01ea9e0a6f02')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10450000', N'10450200', N'สะพานสอง', NULL, NULL, NULL, NULL, N'f7465a61-823b-4c23-a2a9-80f497113384')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10450000', N'10450300', N'คลองเจ้าคุณสิงห์', NULL, NULL, NULL, NULL, N'c66c6769-2874-491c-a306-dff80bb87a52')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10450000', N'10450400', N'พลับพลา', NULL, NULL, NULL, NULL, N'095a109a-2e4f-4067-b5b3-622239257b34')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'10460100', N'สามวาตะวันตก', NULL, NULL, NULL, NULL, N'8b0df979-e426-47ef-a2ee-be1e6172709f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'10460200', N'สามวาตะวันออก', NULL, NULL, NULL, NULL, N'9eab90fe-f462-4671-aae8-c2f55cd709e5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'10460300', N'บางชัน', NULL, NULL, NULL, NULL, N'e71482b7-b289-4346-9d1c-425ccbbf5f0f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'10460400', N'ทรายกองดิน', NULL, NULL, NULL, NULL, N'03d80a73-7223-49db-afce-796b037945b1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10460000', N'10460500', N'ทรายกองดินใต้', NULL, NULL, NULL, NULL, N'a475cb83-9f36-44c4-afa3-9cf34075bc92')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10470000', N'10470100', N'บางนา', NULL, NULL, NULL, NULL, N'4a1d3345-26b2-466c-8979-53ed81794fc7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10480000', N'10480100', N'ทวีวัฒนา', NULL, NULL, NULL, NULL, N'8e5a30f6-9a88-4702-82b6-ad50755f3101')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10480000', N'10480200', N'ศาลาธรรมสพน์', NULL, NULL, NULL, NULL, N'9143295a-8aef-47f2-b33c-2fc1b4f4a383')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10490000', N'10490100', N'บางมด', NULL, NULL, NULL, NULL, N'77ba81ff-ebbc-4a15-bd01-48214dfa45a2')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10490000', N'10490200', N'ทุ่งครุ', NULL, NULL, NULL, NULL, N'dacf9ebf-4863-40fb-8fce-7b68df94e37a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'10000000', N'10500000', N'10500100', N'บางบอน', NULL, NULL, NULL, NULL, N'4022a42a-1c22-44f4-bc44-b623da2fe34f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010100', N'บางปลาสร้อย', NULL, NULL, NULL, NULL, N'6cedfa5e-2356-4119-bd94-3c03230d6c37')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010200', N'มะขามหย่ง', NULL, NULL, NULL, NULL, N'83976aae-71e5-4c58-9e61-613abb1797df')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010300', N'บ้านโขด', NULL, NULL, NULL, NULL, N'5fcf6757-fda3-4b79-ab9b-7dbf12b8c2ff')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010400', N'แสนสุข', NULL, NULL, NULL, NULL, N'31c5c64a-a35f-47e6-95a7-1a4fd8d21498')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010500', N'บ้านสวน', NULL, NULL, NULL, NULL, N'6b19c866-b98d-4bdc-9d31-b25fde117247')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010600', N'หนองรี', NULL, NULL, NULL, NULL, N'581c3e10-2fd2-4a8e-885a-c28c3190dec8')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010700', N'นาป่า', NULL, NULL, NULL, NULL, N'5fa5c444-5950-4a8b-8e50-440bb214f22c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010800', N'หนองข้างคอก', NULL, NULL, NULL, NULL, N'd3b5f03d-9be2-4ea2-9387-bc6188bb4c0c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20010900', N'ดอนหัวฬ่อ', NULL, NULL, NULL, NULL, N'ffd5431f-cc94-4e9a-ab8e-f0948270ef9d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011000', N'หนองไม้แดง', NULL, NULL, NULL, NULL, N'145f70bd-e165-4e2d-9217-c7fd6d3608e3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011100', N'บางทราย', NULL, NULL, NULL, NULL, N'e1af8bbb-3b81-460d-a92b-e887ff3fea72')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011200', N'คลองตำหรุ', NULL, NULL, NULL, NULL, N'16905065-d89f-4f60-844f-e6a06650dc4e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011300', N'เหมือง', NULL, NULL, NULL, NULL, N'd95701f2-e0eb-43ee-a3dc-de03dff95197')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011400', N'บ้านปึก', NULL, NULL, NULL, NULL, N'411e49a2-a287-4216-a801-81ea3130aa69')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011500', N'ห้วยกะปิ', NULL, NULL, NULL, NULL, N'92586511-8874-4a97-8295-322dd7cf5763')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011600', N'เสม็ด', NULL, NULL, NULL, NULL, N'6e10b48d-2259-483c-b37f-bcc378f72215')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011700', N'อ่างศิลา', NULL, NULL, NULL, NULL, N'3c0eebf6-c43d-4323-8c64-238495a1024e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20011800', N'สำนักบก', NULL, NULL, NULL, NULL, N'36236514-d566-449b-a97f-0dd4f101ac08')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20010000', N'20019900', N'เทศบาลเมืองชลบุรี', NULL, NULL, NULL, NULL, N'126bcbc2-019d-4866-ab3d-892fd35224dd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020100', N'บ้านบึง', NULL, NULL, NULL, NULL, N'39e8ed99-65fe-475f-baa8-399b7f294fc6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020200', N'คลองกิ่ว', NULL, NULL, NULL, NULL, N'fbcf4631-c1c6-4e70-bd5e-b1707a7cdaa1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020300', N'มาบไผ่', NULL, NULL, NULL, NULL, N'ba4fcb38-5741-4436-a4a3-fae8e13d9b22')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020400', N'หนองซ้ำซาก', NULL, NULL, NULL, NULL, N'8c0dfd0c-7681-4f1f-8154-f3e4c23bfe23')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020500', N'หนองบอนแดง', NULL, NULL, NULL, NULL, N'0d52589c-ee84-4365-84cc-d00783792ffd')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020600', N'หนองชาก', NULL, NULL, NULL, NULL, N'913d678e-a0e2-4db9-9cda-6bc669d0319c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020700', N'หนองอิรุณ', NULL, NULL, NULL, NULL, N'3855f2ba-553a-4e65-97cf-51ce4661cd08')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20020800', N'หนองไผ่แก้ว', NULL, NULL, NULL, NULL, N'2acadb8d-d486-4988-8d18-3d24992e3ab8')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20029700', N'หนองเสือช้าง', NULL, NULL, NULL, NULL, N'ba5254a9-5512-409a-b592-fc315b0b667d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20029800', N'คลองพลู', NULL, NULL, NULL, NULL, N'fb356da4-5958-499c-a61b-f14f172ec1e5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20020000', N'20029900', N'หนองใหญ่', NULL, NULL, NULL, NULL, N'72fb7522-083f-48aa-b5d6-d3b27431c90e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'20030100', N'หนองใหญ่', NULL, NULL, NULL, NULL, N'7f6ce280-caf1-4652-973b-c474bdcaa2e6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'20030200', N'คลองพลู', NULL, NULL, NULL, NULL, N'b9734a3f-4497-4e5e-b20a-09a4415ce063')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'20030300', N'หนองเสือช้าง', NULL, NULL, NULL, NULL, N'b09fbbb7-21e2-4777-a881-cb64e749a2e6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'20030400', N'ห้างสูง', NULL, NULL, NULL, NULL, N'87eae684-4235-4f8b-a82e-fa23fe985f07')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20030000', N'20030500', N'เขาซก', NULL, NULL, NULL, NULL, N'5a6f249e-e818-414c-a1ca-d8aa6c6f0688')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040100', N'บางละมุง', NULL, NULL, NULL, NULL, N'0d7afdcb-286d-4141-b5e5-f93909083665')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040200', N'หนองปรือ', NULL, NULL, NULL, NULL, N'a6057830-6b1f-4df1-8f10-c6f773ce738e')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040300', N'หนองปลาไหล', NULL, NULL, NULL, NULL, N'44a1bb51-67ed-4e07-8c8f-4b8c5dfcdadf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040400', N'โป่ง', NULL, NULL, NULL, NULL, N'13a1c83b-dcdf-456b-afc5-4eb9e7a1ba7b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040500', N'เขาไม้แก้ว', NULL, NULL, NULL, NULL, N'800e57ea-f0ea-4b12-ae05-04cb5eba9be7')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040600', N'ห้วยใหญ่', NULL, NULL, NULL, NULL, N'a94a04d8-a721-4f8c-8fff-20872561ba48')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040700', N'ตะเคียนเตี้ย', NULL, NULL, NULL, NULL, N'ccad592e-119b-4cfc-b267-c84f6897ae5f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20040000', N'20040800', N'นาเกลือ', NULL, NULL, NULL, NULL, N'099fcb37-8f4f-4754-86d1-b415c51a3e14')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050100', N'พานทอง', NULL, NULL, NULL, NULL, N'f154a9a3-a8d2-4f68-b6b1-f5613e885e28')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050200', N'หนองตำลึง', NULL, NULL, NULL, NULL, N'1e36ce30-aac3-4f20-bf5d-2814ce434f05')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050300', N'มาบโป่ง', NULL, NULL, NULL, NULL, N'a92a3ccb-303f-4469-9441-a23859d80f01')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050400', N'หนองกะขะ', NULL, NULL, NULL, NULL, N'a7bde071-1547-40fa-8876-bf012bfcffec')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050500', N'หนองหงษ์', NULL, NULL, NULL, NULL, N'33b63ecc-63f5-49eb-a125-b57340e3e531')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050600', N'โคกขี้หนอน', NULL, NULL, NULL, NULL, N'20648d97-811a-4492-ae52-dea3830c22e6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050700', N'บ้านเก่า', NULL, NULL, NULL, NULL, N'149c370b-5c71-43b0-88b7-c34869b2040a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050800', N'หน้าประดู่', NULL, NULL, NULL, NULL, N'7eac47e1-449d-4065-af0b-8d59f733e861')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20050900', N'บางนาง', NULL, NULL, NULL, NULL, N'0c464d22-09e1-4f5e-8e3e-fb7eaa32561b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20051000', N'เกาะลอย', NULL, NULL, NULL, NULL, N'8850784a-7bd2-4024-a998-c4c061c28c1b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20050000', N'20051100', N'บางหัก', NULL, NULL, NULL, NULL, N'b684acbf-df7b-4b3f-bd7b-477965350b55')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060100', N'พนัสนิคม', NULL, NULL, NULL, NULL, N'54faf48f-85db-471f-bee2-7e7e9d686109')
GO
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060200', N'หน้าพระธาตุ', NULL, NULL, NULL, NULL, N'e4f29373-46ff-4d69-9e47-875edd56a6ca')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060300', N'วัดหลวง', NULL, NULL, NULL, NULL, N'de00e434-3e57-4915-86ce-05f3fc3b9d69')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060400', N'บ้านเซิด', NULL, NULL, NULL, NULL, N'c8f3c624-5661-4385-9564-9906b248d828')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060500', N'นาเริก', NULL, NULL, NULL, NULL, N'e3b0b8d9-e735-48a1-b7f9-dcf82358d1f5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060600', N'หมอนนาง', NULL, NULL, NULL, NULL, N'b8d7ad5d-1782-4830-b8c8-3daf2c90ec3c')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060700', N'สระสี่เหลี่ยม', NULL, NULL, NULL, NULL, N'aef3d2bc-8b70-4a89-b60b-5288c943e1f6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060800', N'วัดโบสถ์', NULL, NULL, NULL, NULL, N'b44dfcfb-f61c-4ba8-9b3e-fc70a4da4372')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20060900', N'กุฎโง้ง', NULL, NULL, NULL, NULL, N'41c972b7-25c5-43bc-a105-9a70c731ea90')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061000', N'หัวถนน', NULL, NULL, NULL, NULL, N'a719910f-ceb5-421b-9cca-8bc984d690b4')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061100', N'ท่าข้าม', NULL, NULL, NULL, NULL, N'1b830768-d5b0-42a5-8f88-dc679c825000')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061200', N'ท่าบุญมี', NULL, NULL, NULL, NULL, N'091b6d85-fb21-46c7-aa32-d3fec83377b3')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061300', N'หนองปรือ', NULL, NULL, NULL, NULL, N'c2d407cd-bd99-4b5e-92d1-1cfe5e0215bc')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061400', N'หนองขยาด', NULL, NULL, NULL, NULL, N'ba852a78-af1d-4f08-88ad-f61a4578af66')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061500', N'ทุ่งขวาง', NULL, NULL, NULL, NULL, N'a36d65f8-5af9-4d8e-986b-e7e674b22a11')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061600', N'หนองเหียง', NULL, NULL, NULL, NULL, N'6f46867b-539e-4369-9a8f-b0b41fd3c92a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061700', N'นาวังหิน', NULL, NULL, NULL, NULL, N'4799b405-42b7-483f-b871-c43894741c5a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061800', N'บ้านช้าง', NULL, NULL, NULL, NULL, N'5dbf02c4-7a1f-420a-93d9-66334fa85557')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20061900', N'เกาะจันทร์', NULL, NULL, NULL, NULL, N'9ba9b307-62b3-4040-b04d-4018fc815d00')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20062000', N'โคกเพลาะ', NULL, NULL, NULL, NULL, N'963ba2c6-184e-4849-83de-5253c76e207b')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20062100', N'ไร่หลักทอง', NULL, NULL, NULL, NULL, N'ca6233fc-6117-4ba6-86af-62be18982ef5')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20062200', N'นามะตูม', NULL, NULL, NULL, NULL, N'c6b52316-24be-4496-9206-f286ec63a572')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20062300', N'บ้านเซิด', NULL, NULL, NULL, NULL, N'dc423e83-ec53-44eb-8971-fc2751e5ea4d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20069600', N'พูนพัฒนาทรัพย์', NULL, NULL, NULL, NULL, N'b32f32bf-73c6-4762-95ad-8016a3d7637f')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20069700', N'บ่อกวางทอง', NULL, NULL, NULL, NULL, N'173c3947-3e8b-4457-8388-b9c4d485d215')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20069800', N'วัดสุวรรณ', NULL, NULL, NULL, NULL, N'5b805e68-29cc-4892-9d4b-4277e4253ba0')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20060000', N'20069900', N'บ่อทอง', NULL, NULL, NULL, NULL, N'32c8b44f-00f5-4608-9905-74797f44c982')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070100', N'ศรีราชา', NULL, NULL, NULL, NULL, N'fc871800-9a47-4472-963d-abe17c2b74cf')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070200', N'สุรศักดิ์', NULL, NULL, NULL, NULL, N'52dcdcd9-4f1c-419d-9230-97d0f4772368')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070300', N'ทุ่งสุขลา', NULL, NULL, NULL, NULL, N'2729cda7-833a-4aa0-b195-74836d2f1fe6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070400', N'บึง', NULL, NULL, NULL, NULL, N'a4abf730-7e4f-4802-bd66-4044400ec915')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070500', N'หนองขาม', NULL, NULL, NULL, NULL, N'd496f193-0c2c-4035-91a1-fdc4a928cae6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070600', N'เขาคันทรง', NULL, NULL, NULL, NULL, N'4bcbbdba-5caa-44f3-9f02-f935557d5488')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070700', N'บางพระ', NULL, NULL, NULL, NULL, N'bda6e64a-a482-4411-b09b-c761d1361563')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20070800', N'บ่อวิน', NULL, NULL, NULL, NULL, N'405439be-d638-4ae1-a9ef-91b6d2782f5d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20070000', N'20079900', N'ท่าเทววงษ์', NULL, NULL, NULL, NULL, N'b1300b36-78ac-4181-b1c8-45eacfab0377')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20080000', N'20080100', N'ท่าเทววงษ์', NULL, NULL, NULL, NULL, N'504fae03-e9ba-49d9-bc3a-ec8997f015f6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'20090100', N'สัตหีบ', NULL, NULL, NULL, NULL, N'16085fec-cf76-4902-b1e1-0454fc14ff13')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'20090200', N'นาจอมเทียน', NULL, NULL, NULL, NULL, N'02c3f9d4-3811-428b-82cd-8c008ae64ba6')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'20090300', N'พลูตาหลวง', NULL, NULL, NULL, NULL, N'2985d2de-5b17-4212-90b5-c9c33107426d')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'20090400', N'บางเสร่', NULL, NULL, NULL, NULL, N'4a48093c-67b7-4d48-b787-d2219d586b04')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20090000', N'20090500', N'แสมสาร', NULL, NULL, NULL, NULL, N'e534026f-043f-4b29-b3a9-88a7f9524a07')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100100', N'บ่อทอง', NULL, NULL, NULL, NULL, N'3af8797c-1a41-4884-a7b7-6c0e4b08ea51')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100200', N'วัดสุวรรณ', NULL, NULL, NULL, NULL, N'1439f92d-7bc2-4062-9c82-d8ecba69f827')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100300', N'บ่อกวางทอง', NULL, NULL, NULL, NULL, N'ad69b137-3b12-4691-8da3-e71f98be7ab1')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100400', N'ธาตุทอง', NULL, NULL, NULL, NULL, N'4894c3c0-197e-4071-a7a6-403ce8b09d79')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100500', N'เกษตรสุวรรณ', NULL, NULL, NULL, NULL, N'5c024442-d2eb-404d-8e7e-d7e549f7d806')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20100000', N'20100600', N'พลวงทอง', NULL, NULL, NULL, NULL, N'de934ef1-5b62-4449-8dbf-f42972fb050a')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20110000', N'20110100', N'เกาะจันทร์', NULL, NULL, NULL, NULL, N'24af23d7-2ec2-4f90-972a-ad1a29e2f6e0')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20110000', N'20110200', N'ท่าบุญมี', NULL, NULL, NULL, NULL, N'1ab98c20-23a4-43e3-9f32-8c406ec3fea9')
INSERT [dbo].[ini_subdistrict] ([country_code], [province_code], [district_code], [subdistrict_code], [dist_desc], [area_part], [x_status], [x_note], [x_log], [id]) VALUES (66, N'20000000', N'20720000', N'20720100', N'หนองปรือ', NULL, NULL, NULL, NULL, N'e1582684-48f4-4f3d-ab58-3b75d1714b23')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'2222222222232', 1, N'''330''', NULL, NULL, N'Y', NULL, NULL, N'0935be13-4490-4f18-a197-707017ea70a8')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'3333334455555', 1, N'340', NULL, NULL, N'Y', NULL, NULL, N'85c08a29-396e-49e0-9526-3df66e426b1c')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', 1, N'ปริญญาตรี', N'มหาวิทยาลัยสงขลานครินทร์', N'เศรษศาสตร์', N'Y', NULL, NULL, N'4d47432f-9315-494b-8365-e43538d24afb')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'5555555555555', 1, N'220', NULL, NULL, N'Y', NULL, NULL, N'9ca08f4f-aa9f-46e3-9c27-d6a2dae03da5')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'3333334455555', 2, N'310', N'', N'', N'Y', NULL, NULL, N'9f38b7c0-e663-4252-9b23-89793749885d')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', 2, N'มัธยม', N'', N'ศิลป์- คำนวณ                        ', N'Y', NULL, NULL, N'2b10c577-31aa-41cd-ba7a-68227cf77b22')
INSERT [dbo].[mem_education] ([member_code], [rec_no], [degree], [colledge_name], [faculty], [x_status], [x_note], [x_log], [id]) VALUES (N'5555555555555', 2, N'320', N'', N'', N'Y', NULL, NULL, N'c03c6cee-783e-442a-a2ba-8cdc45c2f644')
INSERT [dbo].[mem_group] ([mem_group_code], [mem_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'0  ', N'', N'Y', NULL, NULL, N'af549d9b-3408-42d6-9c55-a852839fb497')
INSERT [dbo].[mem_group] ([mem_group_code], [mem_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1  ', N'ผู้นำพลังปัญญา', N'Y', NULL, NULL, N'5d012928-0f41-4545-874a-197c95242f72')
INSERT [dbo].[mem_group] ([mem_group_code], [mem_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2  ', N'สมาชิกเครือข่าย', N'Y', NULL, NULL, N'7df0b28f-abe4-46d8-96d0-330c92da0bec')
INSERT [dbo].[mem_health] ([member_code], [medical_history], [blood_group], [hobby], [restrict_food], [special_food], [special_skill], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'ไม่มี', N'O', N'กีฬา (วอลเล่ย์บอล  บาลเก็ตบอล  กรีฑา  เปตอง)', N'อาหารทะเล', NULL, N'ด้านศิลปะ งานฝีมือด้านเครื่องปั้นดินเผา', N'Y', NULL, NULL, N'7f6d8d0d-b390-424b-ba6d-21277ffd0aaa')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'0', N'', N'Y', NULL, NULL, N'88bf6048-e142-4be6-a94d-3059cfece3e9')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1001', N'ระดับ 1 กรุงเทพมหานคร', N'Y', NULL, NULL, N'381d57ad-78ae-45e8-85a0-ed6b16bd46cc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1002', N'ระดับ 2 กรุงเทพมหานคร', N'Y', NULL, NULL, N'558a8ff4-4cda-4064-b967-f5d0f6329365')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1003', N'ระดับ 3 กรุงเทพมหานคร', N'Y', NULL, NULL, N'fcca350b-c9ea-4f85-8995-997f0d327b19')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1101', N'ระดับ 1 สมุทรปราการ', N'Y', NULL, NULL, N'cabb1734-42a8-44fc-a328-f0af11cbc0bc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1102', N'ระดับ 2 สมุทรปราการ', N'Y', NULL, NULL, N'ceede265-afc3-4bd6-8afb-03e6a6787cc3')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1103', N'ระดับ 3 สมุทรปราการ', N'Y', NULL, NULL, N'5cdc0f3c-c0b8-4b4b-acad-b310098e8759')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1201', N'ระดับ 1 นนทบุรี', N'Y', NULL, NULL, N'e3f61449-c84d-4f2e-9f70-626942555811')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1202', N'ระดับ 2 นนทบุรี', N'Y', NULL, NULL, N'a9a74b51-0f78-449a-adc4-32dfe112a94c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1203', N'ระดับ 3 นนทบุรี', N'Y', NULL, NULL, N'f81c076f-a10d-43f2-9806-344f10a4ca1b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1301', N'ระดับ 1 ปทุมธานี', N'Y', NULL, NULL, N'b3459cbe-5ce8-48b1-ad9b-8622173cc370')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1302', N'ระดับ 2 ปทุมธานี', N'Y', NULL, NULL, N'c9c81b50-81f0-4635-a331-cfac88d0f7fd')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1303', N'ระดับ 3 ปทุมธานี', N'Y', NULL, NULL, N'67899b1a-a284-4ad4-8bd2-4c35a7cdf641')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1401', N'ระดับ 1 พระนครศรีอยุธยา', N'Y', NULL, NULL, N'9d1f0ac0-033e-4c69-8582-c948510c3cc8')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1402', N'ระดับ 2 พระนครศรีอยุธยา', N'Y', NULL, NULL, N'f64d7ce2-71b9-44d5-9f1e-3c7dd47ab235')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1403', N'ระดับ 3 พระนครศรีอยุธยา', N'Y', NULL, NULL, N'1cfcf412-2592-4389-8f60-e9930c593186')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1501', N'ระดับ 1 อ่างทอง', N'Y', NULL, NULL, N'f7a47b22-93df-4547-8b1d-5c99fcde7ea6')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1502', N'ระดับ 2 อ่างทอง', N'Y', NULL, NULL, N'a4d95100-6152-427c-9522-c126f09f6dea')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1503', N'ระดับ 3 อ่างทอง', N'Y', NULL, NULL, N'946ef738-e2ba-457a-88bd-50c27b1f8107')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1601', N'ระดับ 1 ลพบุรี', N'Y', NULL, NULL, N'38e5047a-c1fa-4e53-95bf-3341e3ffad45')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1602', N'ระดับ 2 ลพบุรี', N'Y', NULL, NULL, N'65e9983f-2e6f-433c-9a01-f04da376bf3d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1603', N'ระดับ 3 ลพบุรี', N'Y', NULL, NULL, N'673378f8-858a-4cfa-9504-620b9b50b33b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1701', N'ระดับ 1 สิงห์บุรี', N'Y', NULL, NULL, N'b9ee4993-abaa-4d3d-97dd-deb6bff66418')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1702', N'ระดับ 2 สิงห์บุรี', N'Y', NULL, NULL, N'77957c92-2c25-4da0-a0c1-5b4c958f6818')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1703', N'ระดับ 3 สิงห์บุรี', N'Y', NULL, NULL, N'407d97f9-9a9c-4806-8674-0f46fb6b385c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1801', N'ระดับ 1 ชัยนาท', N'Y', NULL, NULL, N'9c53f7d4-06a7-45c9-8edd-f5a93c74bb14')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1802', N'ระดับ 2 ชัยนาท', N'Y', NULL, NULL, N'341f920f-851a-44f3-990c-f26774ae2092')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1803', N'ระดับ 3 ชัยนาท', N'Y', NULL, NULL, N'60a93f0f-46d3-468d-a84a-11bbede0121d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1901', N'ระดับ 1 สระบุรี', N'Y', NULL, NULL, N'90aadd34-6e18-407f-a93b-bdb9bc2471fa')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1902', N'ระดับ 2 สระบุรี', N'Y', NULL, NULL, N'abda5e16-25ce-460e-9282-6fae444ed160')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1903', N'ระดับ 3 สระบุรี', N'Y', NULL, NULL, N'f18b5bdf-24b5-4a61-930c-afe6d7860c42')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2001', N'ระดับ 1 ชลบุรี', N'Y', NULL, NULL, N'31e003f6-60f4-4cd4-9f59-313349bd5532')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2002', N'ระดับ 2 ชลบุรี', N'Y', NULL, NULL, N'59a9ce56-423d-4d51-8ec3-d0cc45324299')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2003', N'ระดับ 3 ชลบุรี', N'Y', NULL, NULL, N'504f7d1c-3302-49b6-a32d-05069d69d90b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2101', N'ระดับ 1 ระยอง', N'Y', NULL, NULL, N'b00392b8-1145-4f08-bfd0-15c52200281f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2102', N'ระดับ 2 ระยอง', N'Y', NULL, NULL, N'dcc36688-8883-471b-8d74-d2d7b32a8c5f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2103', N'ระดับ 3 ระยอง', N'Y', NULL, NULL, N'167f48b5-d2bf-43e0-ac74-5b329bbf9071')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2201', N'ระดับ 1 จันทบุรี', N'Y', NULL, NULL, N'01960ae5-f5d9-4521-91da-f33b4aa11702')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2202', N'ระดับ 2 จันทบุรี', N'Y', NULL, NULL, N'9e3e1df3-04fa-4566-a30f-a1602b74a7df')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2203', N'ระดับ 3 จันทบุรี', N'Y', NULL, NULL, N'39f21e8f-ab7c-4d75-85e2-ecfc011d054e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2301', N'ระดับ 1 ตราด', N'Y', NULL, NULL, N'272b9eb7-df4e-4a38-afc7-d994f8ed1b62')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2302', N'ระดับ 2 ตราด', N'Y', NULL, NULL, N'65f75faf-e9c0-45c0-96ec-d97cd87ddbda')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2303', N'ระดับ 3 ตราด', N'Y', NULL, NULL, N'769c93b6-284f-457f-9efe-625db198e264')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2401', N'ระดับ 1 ฉะเชิงเทรา', N'Y', NULL, NULL, N'ceca0482-42f2-4e13-a3b2-9ef17847f69f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2402', N'ระดับ 2 ฉะเชิงเทรา', N'Y', NULL, NULL, N'be53eddf-82c3-4cc2-9406-ae88a1c2c4a1')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2403', N'ระดับ 3 ฉะเชิงเทรา', N'Y', NULL, NULL, N'3327b119-1891-457d-a5f6-1e33b32ea5d3')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2501', N'ระดับ 1 ปราจีนบุรี', N'Y', NULL, NULL, N'91e23a91-b7b9-4296-8fb3-641a07d0d0b9')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2502', N'ระดับ 2 ปราจีนบุรี', N'Y', NULL, NULL, N'1c93dc88-3308-487f-8b59-ce0993c5d7ed')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2503', N'ระดับ 3 ปราจีนบุรี', N'Y', NULL, NULL, N'093fc2b9-a503-44a0-8288-20525d44cc1b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2601', N'ระดับ 1 นครนายก', N'Y', NULL, NULL, N'626932a0-6ac2-43bf-a1c6-8f1ddba1f412')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2602', N'ระดับ 2 นครนายก', N'Y', NULL, NULL, N'a6a73eae-4bc6-4f10-86c2-b5869f4e7345')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2603', N'ระดับ 3 นครนายก', N'Y', NULL, NULL, N'6e7c8ba1-e0f6-4d94-baed-e3befa08f22a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2701', N'ระดับ 1 สระแก้ว', N'Y', NULL, NULL, N'6c06bffc-8c25-4096-9d20-0f1d60bbeba1')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2702', N'ระดับ 2 สระแก้ว', N'Y', NULL, NULL, N'0fb67a94-8fd9-4e03-b046-5cd5df3edc01')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2703', N'ระดับ 3 สระแก้ว', N'Y', NULL, NULL, N'610d0690-8d04-4eba-9b6f-679d1180ef44')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3001', N'ระดับ 1 นครราชสีมา', N'Y', NULL, NULL, N'e93b79b5-4ec0-40d6-b3da-97759740124a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3002', N'ระดับ 2 นครราชสีมา', N'Y', NULL, NULL, N'288ac562-6d38-4dfa-a7e0-377397d329c5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3003', N'ระดับ 3 นครราชสีมา', N'Y', NULL, NULL, N'423a4eb1-fd6b-49b0-9f46-337fcc0c267f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3101', N'ระดับ 1 บุรีรัมย์', N'Y', NULL, NULL, N'9eb30fdd-3881-441e-aa2e-961087b75b37')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3102', N'ระดับ 2 บุรีรัมย์', N'Y', NULL, NULL, N'0273b7d8-e743-4e42-93e1-868cb0edb934')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3103', N'ระดับ 3 บุรีรัมย์', N'Y', NULL, NULL, N'e3dfadf1-7eb4-4f50-8274-63504742f6b4')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3201', N'ระดับ 1 สุรินทร์', N'Y', NULL, NULL, N'9058d051-832b-4612-a2bb-d9b394b61a36')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3202', N'ระดับ 2 สุรินทร์', N'Y', NULL, NULL, N'3e66f609-e1f5-4b2e-9038-5e35a9ce27b3')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3203', N'ระดับ 3 สุรินทร์', N'Y', NULL, NULL, N'b2013367-173b-45de-b32e-adcd885a9def')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3301', N'ระดับ 1 ศรีสะเกษ', N'Y', NULL, NULL, N'45f1ad6c-d864-45c3-9047-f4d82e83a623')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3302', N'ระดับ 2 ศรีสะเกษ', N'Y', NULL, NULL, N'368c8b56-8972-4495-97dd-cba688bfca22')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3303', N'ระดับ 3 ศรีสะเกษ', N'Y', NULL, NULL, N'4aad10f0-9198-439e-b256-b31541f723f5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3401', N'ระดับ 1 อุบลราชธานี', N'Y', NULL, NULL, N'2058d83d-e217-42c8-bf35-3a0d8e86ef5f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3402', N'ระดับ 2 อุบลราชธานี', N'Y', NULL, NULL, N'5c0f9456-7f0e-413b-afb7-cf5860894148')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3403', N'ระดับ 3 อุบลราชธานี', N'Y', NULL, NULL, N'e3867646-68bb-4dc1-8bfe-7d4aa7a85a80')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3501', N'ระดับ 1 ยโสธร', N'Y', NULL, NULL, N'8be761f9-b93d-49bd-9eb3-29b73f242357')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3502', N'ระดับ 2 ยโสธร', N'Y', NULL, NULL, N'3446d62b-2e45-414f-9112-0b7a29a6c75d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3503', N'ระดับ 3 ยโสธร', N'Y', NULL, NULL, N'66508693-36d8-49de-9e7c-0ac27d381a0c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3601', N'ระดับ 1 ชัยภูมิ', N'Y', NULL, NULL, N'b2f33e20-8ac7-4833-a9e1-f9fca6e57a91')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3602', N'ระดับ 2 ชัยภูมิ', N'Y', NULL, NULL, N'78dfc2d3-2aae-40ae-bf55-4df38968ddf5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3603', N'ระดับ 3 ชัยภูมิ', N'Y', NULL, NULL, N'c296c75f-c3ba-40ec-a5e2-121a6304e7c2')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3701', N'ระดับ 1 อำนาจเจริญ', N'Y', NULL, NULL, N'1f04e4c2-7244-4f6d-ad11-93ac66d1cc73')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3702', N'ระดับ 2 อำนาจเจริญ', N'Y', NULL, NULL, N'248c016d-4d6d-4cea-84d9-d6c05f300384')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3703', N'ระดับ 3 อำนาจเจริญ', N'Y', NULL, NULL, N'ed063093-361d-4384-b8ba-32d575828979')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3901', N'ระดับ 1 หนองบัวลำภู', N'Y', NULL, NULL, N'e590ede8-9b62-4d83-b0e7-3c15e416dca5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3902', N'ระดับ 2 หนองบัวลำภู', N'Y', NULL, NULL, N'0cfb72a0-bc13-4d4e-9eb6-a240aa5aac8b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3903', N'ระดับ 3 หนองบัวลำภู', N'Y', NULL, NULL, N'3803f35a-5855-43f5-8f46-5ba77fae483f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4001', N'ระดับ 1 ขอนแก่น', N'Y', NULL, NULL, N'2e24b31d-5380-4ef2-9f58-ca5e37f06f77')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4002', N'ระดับ 2 ขอนแก่น', N'Y', NULL, NULL, N'ce2e8267-232e-4bb5-aae8-693a708160db')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4003', N'ระดับ 3 ขอนแก่น', N'Y', NULL, NULL, N'afe938a7-50c6-4b3a-9a57-6881c0d8530c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4101', N'ระดับ 1 อุดรธานี', N'Y', NULL, NULL, N'123ed30f-04de-447e-9447-7a1467e55e1e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4102', N'ระดับ 2 อุดรธานี', N'Y', NULL, NULL, N'1c65abe7-fe45-42f3-9a3f-d49a9dee215f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4103', N'ระดับ 3 อุดรธานี', N'Y', NULL, NULL, N'eca3f693-9fb6-41dd-a461-29328d48d334')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4201', N'ระดับ 1 เลย', N'Y', NULL, NULL, N'96cd877e-092a-4e89-b4ee-8045de02666f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4202', N'ระดับ 2 เลย', N'Y', NULL, NULL, N'106e9a45-5df0-4dd5-bfb9-18b4398c1495')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4203', N'ระดับ 3 เลย', N'Y', NULL, NULL, N'710bc488-8365-49ce-86f0-b38757911f49')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4301', N'ระดับ 1 หนองคาย', N'Y', NULL, NULL, N'941aacd5-c5c7-4fc9-a148-ab6e40d3d68a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4302', N'ระดับ 2 หนองคาย', N'Y', NULL, NULL, N'd1377c8d-311a-4147-bbfe-10cf22951e83')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4303', N'ระดับ 3 หนองคาย', N'Y', NULL, NULL, N'de5079a1-010b-44b8-9f21-03a3ddd911ce')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4401', N'ระดับ 1 มหาสารคาม', N'Y', NULL, NULL, N'94008a65-6ecc-4dd2-80ea-24e19019ac3c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4402', N'ระดับ 2 มหาสารคาม', N'Y', NULL, NULL, N'22379656-b6fb-401e-93b8-4e17b676b5b8')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4403', N'ระดับ 3 มหาสารคาม', N'Y', NULL, NULL, N'e03d612f-4052-44b2-9d16-d5d1ed5fe9d0')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4501', N'ระดับ 1 ร้อยเอ็ด', N'Y', NULL, NULL, N'98ba15ae-23a6-44d6-8511-3955b9a82ef2')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4502', N'ระดับ 2 ร้อยเอ็ด', N'Y', NULL, NULL, N'96366ea1-93fe-4b36-ad14-874e4a39f2e6')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4503', N'ระดับ 3 ร้อยเอ็ด', N'Y', NULL, NULL, N'53dd2e8f-77ed-4938-9853-19db3468b458')
GO
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4601', N'ระดับ 1 กาฬสินธุ์', N'Y', NULL, NULL, N'aaf53c39-d46f-4acc-b395-91d0ce8185e9')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4602', N'ระดับ 2 กาฬสินธุ์', N'Y', NULL, NULL, N'884ba36e-ff59-4f7a-9004-dabe1339ae38')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4603', N'ระดับ 3 กาฬสินธุ์', N'Y', NULL, NULL, N'37694458-8d88-4d03-b7cd-605071462eff')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4701', N'ระดับ 1 สกลนคร', N'Y', NULL, NULL, N'189e6542-d245-408c-a390-301bf47aa5a1')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4702', N'ระดับ 2 สกลนคร', N'Y', NULL, NULL, N'178aa627-0dce-4c31-be1c-34fcb6a7e054')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4703', N'ระดับ 3 สกลนคร', N'Y', NULL, NULL, N'e998b56b-a9da-4767-bc35-8f5013caeeab')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4801', N'ระดับ 1 นครพนม', N'Y', NULL, NULL, N'480eb7cf-a3da-4852-b06a-34ac41972803')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4802', N'ระดับ 2 นครพนม', N'Y', NULL, NULL, N'06c24f20-77d8-4100-b006-f716d04f28bd')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4803', N'ระดับ 3 นครพนม', N'Y', NULL, NULL, N'f438fbef-0232-4c86-9a94-a1451767d857')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4901', N'ระดับ 1 มุกดาหาร', N'Y', NULL, NULL, N'f69505d5-ad5b-4a79-8882-3d3ed5c757f9')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4902', N'ระดับ 2 มุกดาหาร', N'Y', NULL, NULL, N'f8b9b220-387c-4237-a3bb-4ea24a4bf5b7')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4903', N'ระดับ 3 มุกดาหาร', N'Y', NULL, NULL, N'844170a1-0da2-4f57-93f6-066a1b88805c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5001', N'ระดับ 1 เชียงใหม่', N'Y', NULL, NULL, N'0573eded-fb62-4513-8cc7-ad16282d5362')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5002', N'ระดับ 2 เชียงใหม่', N'Y', NULL, NULL, N'a760075d-5819-4b74-81fa-589639771cc8')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5003', N'ระดับ 3 เชียงใหม่', N'Y', NULL, NULL, N'629184ad-3589-40f4-a33a-1b366337bfbb')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5101', N'ระดับ 1 ลำพูน', N'Y', NULL, NULL, N'58eda363-f061-4a4c-8eb2-7a24be58e80d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5102', N'ระดับ 2 ลำพูน', N'Y', NULL, NULL, N'5c9b02aa-d664-416d-82bd-78e6199ef2a4')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5103', N'ระดับ 3 ลำพูน', N'Y', NULL, NULL, N'2d6c4f76-8476-48bb-86c4-f3e429f185fb')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5201', N'ระดับ 1 ลำปาง', N'Y', NULL, NULL, N'39d0364f-cac2-4a01-9a51-a2c858e9891e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5202', N'ระดับ 2 ลำปาง', N'Y', NULL, NULL, N'f1a7f019-fcd1-45a0-83c2-339d0b13939a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5203', N'ระดับ 3 ลำปาง', N'Y', NULL, NULL, N'eb54af70-f367-4c0f-9840-5c7d161bcf81')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5301', N'ระดับ 1 อุตรดิตถ์', N'Y', NULL, NULL, N'07030d96-f15e-453f-ae5b-0a52c3d79a49')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5302', N'ระดับ 2 อุตรดิตถ์', N'Y', NULL, NULL, N'ced44822-7cd6-4f62-867c-b22c7341da46')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5303', N'ระดับ 3 อุตรดิตถ์', N'Y', NULL, NULL, N'42071eca-fa06-486c-b142-b02aae19af68')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5401', N'ระดับ 1 แพร่', N'Y', NULL, NULL, N'88ab5cd1-2ae4-4ad4-980e-c330f61d553d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5402', N'ระดับ 2 แพร่', N'Y', NULL, NULL, N'9e23d4b9-d64e-4546-aab2-01ad6f2cda63')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5403', N'ระดับ 3 แพร่', N'Y', NULL, NULL, N'235dde52-d10f-4dc5-9121-649d81bd8ee1')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5501', N'ระดับ 1 น่าน', N'Y', NULL, NULL, N'92434f92-5f7a-43c7-8322-cbb3a8d80ff0')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5502', N'ระดับ 2 น่าน', N'Y', NULL, NULL, N'56cd113a-e73d-46a6-845b-28b66efb7852')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5503', N'ระดับ 3 น่าน', N'Y', NULL, NULL, N'81bf1fd8-b82c-48da-b3f6-d3e96768dcec')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5601', N'ระดับ 1 พะเยา', N'Y', NULL, NULL, N'2e908c8c-38c1-4236-bfbf-0bdcc8745e1c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5602', N'ระดับ 2 พะเยา', N'Y', NULL, NULL, N'12af4f00-8c96-4492-8c9d-807037ae5f81')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5603', N'ระดับ 3 พะเยา', N'Y', NULL, NULL, N'ec8c62c7-3b9e-4ccf-86a3-44c79c2b1ea0')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5701', N'ระดับ 1 เชียงราย', N'Y', NULL, NULL, N'992ca953-51ca-471c-a84c-6dd3a26f3a48')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5702', N'ระดับ 2 เชียงราย', N'Y', NULL, NULL, N'40eb7eb0-3650-486c-9345-b644ffbc2738')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5703', N'ระดับ 3 เชียงราย', N'Y', NULL, NULL, N'010c76f4-2062-45cb-abf5-ce1109625cae')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5801', N'ระดับ 1 แม่ฮ่องสอน', N'Y', NULL, NULL, N'1ee588d0-22a6-441c-8ef9-0ad0e3adc1db')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5802', N'ระดับ 2 แม่ฮ่องสอน', N'Y', NULL, NULL, N'44811708-8c64-49e9-866b-ba325f9f536b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5803', N'ระดับ 3 แม่ฮ่องสอน', N'Y', NULL, NULL, N'99321e62-a174-4ea6-86e1-482b6825b726')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6001', N'ระดับ 1 นครสวรรค์', N'Y', NULL, NULL, N'2ab91316-e151-4170-bda3-9381e7ee117d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6002', N'ระดับ 2 นครสวรรค์', N'Y', NULL, NULL, N'2fcb8c69-1755-4f5f-8df8-4a7627a3513c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6003', N'ระดับ 3 นครสวรรค์', N'Y', NULL, NULL, N'db012024-52a8-40fa-abd6-16114eefe5dc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6101', N'ระดับ 1 อุทัยธานี', N'Y', NULL, NULL, N'bb88e008-ef38-485e-94da-0b9c021d7e73')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6102', N'ระดับ 2 อุทัยธานี', N'Y', NULL, NULL, N'c4147ddd-a72b-461c-a56f-abd4318d4b46')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6103', N'ระดับ 3 อุทัยธานี', N'Y', NULL, NULL, N'661da40f-3197-4740-b44c-d1f657373fe0')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6201', N'ระดับ 1 กำแพงเพชร', N'Y', NULL, NULL, N'fe8d2cfe-93ff-40ad-8e6c-e0d75642dadc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6202', N'ระดับ 2 กำแพงเพชร', N'Y', NULL, NULL, N'ad33fed3-65fb-4235-8da5-8a8c522a0b3c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6203', N'ระดับ 3 กำแพงเพชร', N'Y', NULL, NULL, N'3818ff28-298a-4a16-baee-eb5babf703fa')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6301', N'ระดับ 1 ตาก', N'Y', NULL, NULL, N'dd0ce7b5-38b6-4610-a5dd-07b8b850ed8e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6302', N'ระดับ 2 ตาก', N'Y', NULL, NULL, N'8b892f28-5a5b-4d3c-a7ab-786576c93139')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6303', N'ระดับ 3 ตาก', N'Y', NULL, NULL, N'9f2fde23-9f4f-4fa6-959f-994fb8cc6516')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6401', N'ระดับ 1 สุโขทัย', N'Y', NULL, NULL, N'7d5a641a-571c-4558-9098-46f46eaedcc7')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6402', N'ระดับ 2 สุโขทัย', N'Y', NULL, NULL, N'2d2662ca-932c-4d7c-84f7-1fd2c0e3115b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6403', N'ระดับ 3 สุโขทัย', N'Y', NULL, NULL, N'12b47927-a583-43ff-8617-02cc1661f6db')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6501', N'ระดับ 1 พิษณุโลก', N'Y', NULL, NULL, N'c95a73eb-b704-4985-9e3f-dd6a169e5123')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6502', N'ระดับ 2 พิษณุโลก', N'Y', NULL, NULL, N'1ee5d3db-0b30-4c3b-82e5-7ccfdfed570b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6503', N'ระดับ 3 พิษณุโลก', N'Y', NULL, NULL, N'd1a8d9bb-8b62-4b9b-b2a6-7a1961d1671f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6601', N'ระดับ 1 พิจิตร', N'Y', NULL, NULL, N'a0b0d23f-08c4-4ab5-abf2-a7c6183e7772')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6602', N'ระดับ 2 พิจิตร', N'Y', NULL, NULL, N'b0cfa4dc-0da9-4461-ab71-196bf0c349eb')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6603', N'ระดับ 3 พิจิตร', N'Y', NULL, NULL, N'3a4169b5-27a5-46ae-b420-779fc43bbc41')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6701', N'ระดับ 1 เพชรบูรณ์', N'Y', NULL, NULL, N'41c71828-0eb4-488f-bc8a-c08c80e0e143')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6702', N'ระดับ 2 เพชรบูรณ์', N'Y', NULL, NULL, N'06986aa7-d716-4193-aacb-dee16bb3b34b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6703', N'ระดับ 3 เพชรบูรณ์', N'Y', NULL, NULL, N'89dec970-f355-46ef-8ebd-59a8b58f1828')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7001', N'ระดับ 1 ราชบุรี', N'Y', NULL, NULL, N'ce8717e5-d55c-4eda-80ac-5aa0e574c637')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7002', N'ระดับ 2 ราชบุรี', N'Y', NULL, NULL, N'c6933a21-31a8-4ef5-961e-ade8c1758352')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7003', N'ระดับ 3 ราชบุรี', N'Y', NULL, NULL, N'445e5862-1213-42e4-88b7-5ce5f6aab50f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7101', N'ระดับ 1 กาญจนบุรี', N'Y', NULL, NULL, N'b5dfd336-33f0-43d5-a1a5-b629182baeff')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7102', N'ระดับ 2 กาญจนบุรี', N'Y', NULL, NULL, N'ff3753c4-beef-4adb-96eb-7cd086c93233')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7103', N'ระดับ 3 กาญจนบุรี', N'Y', NULL, NULL, N'2b16bb02-1ae6-4fb3-af3e-38cc24acfbae')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7201', N'ระดับ 1 สุพรรณบุรี', N'Y', NULL, NULL, N'7c21791d-5eeb-4045-8c01-0775ba08bf09')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7202', N'ระดับ 2 สุพรรณบุรี', N'Y', NULL, NULL, N'118d9a04-7cb1-435b-b6c0-3c4727acbb37')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7203', N'ระดับ 3 สุพรรณบุรี', N'Y', NULL, NULL, N'6f9f958b-3ea4-486e-994f-36b156ffb45b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7301', N'ระดับ 1 นครปฐม', N'Y', NULL, NULL, N'ac0aa18d-80d7-4499-b9d0-833727828993')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7302', N'ระดับ 2 นครปฐม', N'Y', NULL, NULL, N'f6883a5e-dfec-4408-91d3-1215ed26b93c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7303', N'ระดับ 3 นครปฐม', N'Y', NULL, NULL, N'9db665a9-5a4e-4c2c-ba51-f3a94025b567')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7401', N'ระดับ 1 สมุทรสาคร', N'Y', NULL, NULL, N'13aacb94-0e41-4729-aa8c-4fde87b4ea73')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7402', N'ระดับ 2 สมุทรสาคร', N'Y', NULL, NULL, N'4dcd586d-c174-45f8-9345-36eee7ccfb02')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7403', N'ระดับ 3 สมุทรสาคร', N'Y', NULL, NULL, N'b9eaeedd-19d6-493d-b4d6-8743891506fd')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7501', N'ระดับ 1 สมุทรสงคราม', N'Y', NULL, NULL, N'8f0a8405-057d-4d91-9295-536509be25ad')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7502', N'ระดับ 2 สมุทรสงคราม', N'Y', NULL, NULL, N'5ff06aa8-ebb1-4a83-93be-a22951e66994')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7503', N'ระดับ 3 สมุทรสงคราม', N'Y', NULL, NULL, N'4b125ee1-fc01-4c18-81f3-b14f6bdc3117')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7601', N'ระดับ 1 เพชรบุรี', N'Y', NULL, NULL, N'f3d0f1b8-4605-4637-9f43-f662a4a8e124')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7602', N'ระดับ 2 เพชรบุรี', N'Y', NULL, NULL, N'613173b5-a688-4f02-9e4c-a96b8c1c45a9')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7603', N'ระดับ 3 เพชรบุรี', N'Y', NULL, NULL, N'8acbb5bb-5f11-4034-8b9d-3d052a487445')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7701', N'ระดับ 1 ประจวบคีรีขันธ์', N'Y', NULL, NULL, N'175784c4-e3f4-4c16-8f0e-d66b51833792')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7702', N'ระดับ 2 ประจวบคีรีขันธ์', N'Y', NULL, NULL, N'9740ccd7-2f4f-42cc-a848-fe7a92d078d1')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'7703', N'ระดับ 3 ประจวบคีรีขันธ์', N'Y', NULL, NULL, N'e9246df7-13fb-4e27-8f02-5b5b64a4853b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8001', N'ระดับ 1 นครศรีธรรมราช', N'Y', NULL, NULL, N'3cd61017-8949-465b-8b63-62536373411f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8002', N'ระดับ 2 นครศรีธรรมราช', N'Y', NULL, NULL, N'87a8ddbe-a256-4dec-bafe-d6a7ee1a5a68')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8003', N'ระดับ 3 นครศรีธรรมราช', N'Y', NULL, NULL, N'a914116b-5016-41d2-8a9b-eb925627690d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8101', N'ระดับ 1 กระบี่', N'Y', NULL, NULL, N'3d81939c-264d-4eea-b1e5-d9fdc139f3e7')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8102', N'ระดับ 2 กระบี่', N'Y', NULL, NULL, N'5bd4110c-687a-45d6-9efd-23f7ba1cdc51')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8103', N'ระดับ 3 กระบี่', N'Y', NULL, NULL, N'604d4702-2330-4b4b-9d6f-70df4012da5e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8201', N'ระดับ 1 พังงา', N'Y', NULL, NULL, N'6505cd41-e9cb-4d52-95c5-5df7419579b5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8202', N'ระดับ 2 พังงา', N'Y', NULL, NULL, N'cd419995-d2a9-4e6d-abcc-6a9be8dfca92')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8203', N'ระดับ 3 พังงา', N'Y', NULL, NULL, N'2f633bc8-7caf-4133-bffe-6390919402dc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8301', N'ระดับ 1 ภูเก็ต', N'Y', NULL, NULL, N'ca09983a-da8d-4d3d-a0bd-ae96a90de397')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8302', N'ระดับ 2 ภูเก็ต', N'Y', NULL, NULL, N'b216ebf3-f19b-444a-990b-c4e493e29a0a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8303', N'ระดับ 3 ภูเก็ต', N'Y', NULL, NULL, N'45beb6ed-9436-48d1-a608-127b88e02fad')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8401', N'ระดับ 1 สุราษฎร์ธานี', N'Y', NULL, NULL, N'94d0566b-a9f3-4e76-9bf7-4dd4b65f4712')
GO
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8402', N'ระดับ 2 สุราษฎร์ธานี', N'Y', NULL, NULL, N'7d6b46ad-9843-4f1f-89e3-035b9e6a1165')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8403', N'ระดับ 3 สุราษฎร์ธานี', N'Y', NULL, NULL, N'5d26d84b-ee77-4f90-8b78-99810043596d')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8501', N'ระดับ 1 ระนอง', N'Y', NULL, NULL, N'5a5d5c82-e015-4ee5-a1d4-89faad5e4552')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8502', N'ระดับ 2 ระนอง', N'Y', NULL, NULL, N'78252bb6-a79b-4fb0-a404-13655c751782')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8503', N'ระดับ 3 ระนอง', N'Y', NULL, NULL, N'00fa4a80-5e47-4cbe-8f43-8a63877a599e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8601', N'ระดับ 1 ชุมพร', N'Y', NULL, NULL, N'81de5440-b74b-4b66-99ee-e0363549a060')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8602', N'ระดับ 2 ชุมพร', N'Y', NULL, NULL, N'b75ec339-36ab-4786-9c79-863a69aa4bf6')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'8603', N'ระดับ 3 ชุมพร', N'Y', NULL, NULL, N'be5594b9-65eb-46b9-aa03-018016617956')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9001', N'ระดับ 1 สงขลา', N'Y', NULL, NULL, N'87793879-688f-46fd-831c-5f2292420ffc')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9002', N'ระดับ 2 สงขลา', N'Y', NULL, NULL, N'b8b21c95-603b-4b39-a796-760bdaf104f0')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9003', N'ระดับ 3 สงขลา', N'Y', NULL, NULL, N'b3adbba3-1019-41d2-8af9-3d92ff7e866b')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9101', N'ระดับ 1 สตูล', N'Y', NULL, NULL, N'27b34010-e715-4a78-b46b-7c1c01ce20f7')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9102', N'ระดับ 2 สตูล', N'Y', NULL, NULL, N'dd0a084a-3f7b-4432-aaaa-7cfb89240f63')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9103', N'ระดับ 3 สตูล', N'Y', NULL, NULL, N'c42939de-b184-42bd-8f2f-c8cbc95bbc79')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9201', N'ระดับ 1 ตรัง', N'Y', NULL, NULL, N'7c1cdb3c-b5f9-492c-ba85-f47a4e843dfe')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9202', N'ระดับ 2 ตรัง', N'Y', NULL, NULL, N'a51c2c34-1dd5-497d-ae9d-6b2979f946f4')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9203', N'ระดับ 3 ตรัง', N'Y', NULL, NULL, N'9850b8b2-b9bc-4515-83e4-adbdb7ecad4f')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9301', N'ระดับ 1 พัทลุง', N'Y', NULL, NULL, N'e5e2f48e-f035-4805-9b44-e05e97ba6a3e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9302', N'ระดับ 2 พัทลุง', N'Y', NULL, NULL, N'8179b3ab-3279-4931-8b60-84fc2b93bc51')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9303', N'ระดับ 3 พัทลุง', N'Y', NULL, NULL, N'a0172f32-4d8d-480a-b0e7-ab4e00199bad')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9401', N'ระดับ 1 ปัตตานี', N'Y', NULL, NULL, N'8de0f38a-eb9e-4231-b9c3-8a52fe43671e')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9402', N'ระดับ 2 ปัตตานี', N'Y', NULL, NULL, N'cda07dc8-c629-4a82-b20a-b02535dcc05a')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9403', N'ระดับ 3 ปัตตานี', N'Y', NULL, NULL, N'67eb088f-0a7b-41b0-bad2-35eddd26c464')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9501', N'ระดับ 1 ยะลา', N'Y', NULL, NULL, N'afbcbad6-ca13-4d8b-876f-d472a264c4d5')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9502', N'ระดับ 2 ยะลา', N'Y', NULL, NULL, N'94720119-a8ac-4e86-9919-e2e47d060fab')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9503', N'ระดับ 3 ยะลา', N'Y', NULL, NULL, N'e3352719-59b3-4a14-afba-21d52c2e25a2')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9601', N'ระดับ 1 นราธิวาส', N'Y', NULL, NULL, N'dc3dce90-8355-46ea-9e51-3414cbc7f867')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9602', N'ระดับ 2 นราธิวาส', N'Y', NULL, NULL, N'5073f2cb-d314-478f-866b-85695ae44107')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9603', N'ระดับ 3 นราธิวาส', N'Y', NULL, NULL, N'f1bc9bfe-98ec-4d99-baf5-4ebc2a747c6c')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9701', N'ระดับ 1 บึงกาฬ', N'Y', NULL, NULL, N'c3e8d9b7-3e59-42f7-8a5f-b0840eb7d356')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9702', N'ระดับ 2 บึงกาฬ', N'Y', NULL, NULL, N'199c937b-5932-4dd6-8311-9834b8f4d4f7')
INSERT [dbo].[mem_level] ([mlevel_code], [mlevel_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'9703', N'ระดับ 3 บึงกาฬ', N'Y', NULL, NULL, N'096eedce-fb97-4f37-b992-560b00c70afc')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'?', NULL, 1, N'Y', NULL, NULL, N'7894f8be-8dc6-466d-8fa3-806242beb4ed')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'0001', NULL, 2, N'Y', NULL, NULL, N'e7060ed7-f98a-4e79-8cfa-e59b3369bdc8')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'005', NULL, 3, N'Y', NULL, NULL, N'043340ad-452d-44a0-9e97-52a2fad5713b')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'A', NULL, 4, N'Y', NULL, NULL, N'3938b53a-516e-4084-a41e-f06e805db559')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'AA', NULL, 5, N'Y', NULL, NULL, N'7e097f1c-229b-463f-9189-910beae34f88')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'DD', NULL, 6, N'Y', NULL, NULL, N'cdfbcd5b-aca4-4ce9-9411-d553a4321226')
INSERT [dbo].[mem_product] ([member_code], [product_code], [grow_area], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', N'FF', NULL, 7, N'Y', NULL, NULL, N'74488698-8181-4318-9b64-a374f70df894')
INSERT [dbo].[mem_reward] ([member_code], [rec_no], [reward_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', 1, N'ทุนเรียนดีอันดับ 1 สาขาเศรษฐศาสตร์เกษตร ชั้นปีที่ 2 ปี 2551', N'Y', NULL, NULL, N'3c60a61e-5905-4745-87af-0525c0988209')
INSERT [dbo].[mem_reward] ([member_code], [rec_no], [reward_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', 2, N'ทุนเรียนดีจากธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร (ธ.ก.ส.) ปี 2550', N'Y', NULL, NULL, N'3b5a2080-6d05-4743-924a-e2c5f651d934')
INSERT [dbo].[mem_reward] ([member_code], [rec_no], [reward_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3728800072724', 3, N'ทุนการศึกษาจากมูลนิธิ GE ', N'Y', NULL, NULL, N'33784b1d-3718-4154-ae90-e43834256938')
INSERT [dbo].[mem_social] ([member_code], [rec_no], [social_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2222222222232', 1, N'กวาดถนนหน้าโรงเรียน', N'Y', NULL, NULL, N'fc019bfe-d31f-4839-acd9-719fdae39199')
INSERT [dbo].[mem_social] ([member_code], [rec_no], [social_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3333334455555', 1, N'ทดดอออออ', N'Y', NULL, NULL, N'447942c0-9d77-47ab-818a-82fbad70fe1e')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'0  ', N'', N'Y', NULL, NULL, N'd52e6c3e-38c0-4a39-b55c-dd677f5f6461')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1  ', N'กำลังศึกษา', N'Y', NULL, NULL, N'd26a9077-7064-49b1-b46b-8fcdd05f5464')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'2  ', N'พักการศึกษาชั่วคราว', N'Y', NULL, NULL, N'e8c3c6dd-930c-496c-a310-d81901db74b8')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'3  ', N'พ้นสภาพการศึกษา', N'Y', NULL, NULL, N'a0ed9458-165f-422e-a8b4-87522e339107')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'4  ', N'สำเร็จการศึกษาระดับ 1', N'Y', NULL, NULL, N'640fe918-7ead-497b-8edf-ddfb886e3c10')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5  ', N'สำเร็จการศึกษาระดับ 2', N'Y', NULL, NULL, N'05005af4-52e9-49c7-a39a-90adbdd2acbe')
INSERT [dbo].[mem_status] ([mstatus_code], [mstatus_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'6  ', N'สำเร็จการศึกษาระดับ 3', N'Y', NULL, NULL, N'c1f8df56-876e-49e2-aacd-090b0de998b4')
INSERT [dbo].[mem_testcenter] ([mem_testcenter_code], [mem_testcenter_desc], [CreatedBy], [CreatedDate], [x_status], [x_note], [x_log], [id]) VALUES (N'591107104558', N'TYYYY', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T10:45:58.433' AS DateTime), N'Y', NULL, NULL, N'd4666c2f-7a65-4751-ae0f-7d1be1536653')
INSERT [dbo].[mem_testcenter] ([mem_testcenter_code], [mem_testcenter_desc], [CreatedBy], [CreatedDate], [x_status], [x_note], [x_log], [id]) VALUES (N'591128074938', N')))))', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-28T19:49:38.243' AS DateTime), N'Y', NULL, NULL, N'147d6b8f-12b7-420e-81fa-89dfbf9eb17d')
INSERT [dbo].[mem_train_record] ([course_code], [member_code], [course_grade], [course_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5907080944389429784', N'3728800072724', N'B', NULL, N'Y', NULL, NULL, N'27a3562d-7341-4650-b7cd-8384776046db')
INSERT [dbo].[mem_train_record] ([course_code], [member_code], [course_grade], [course_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5907080945404409447', N'3728800072724', N'A', NULL, N'Y', NULL, NULL, N'acf7b5b0-1848-4ec0-b96f-9901107e4bb0')
INSERT [dbo].[mem_train_record] ([course_code], [member_code], [course_grade], [course_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5907120106563343065', N'3728800072724', N'A', NULL, N'Y', NULL, NULL, N'1d2d97a9-5d1f-436b-b5c5-310f772d74de')
INSERT [dbo].[mem_train_record] ([course_code], [member_code], [course_grade], [course_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5907120107104590183', N'3728800072724', N'A', NULL, N'Y', NULL, NULL, N'b7c174e3-e7a5-41ee-8af9-ce8703187722')
INSERT [dbo].[mem_train_record] ([course_code], [member_code], [course_grade], [course_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'5907120107392396848', N'3728800072724', N'A', NULL, N'Y', NULL, NULL, N'7f13b730-c314-4624-9485-135897bf48f3')
INSERT [dbo].[mem_type] ([mem_group_code], [mem_type_code], [mem_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1  ', N'1  ', N'ผู้บริหาร', N'Y', NULL, NULL, N'daeb1abb-e55c-416d-8270-09b2d9ab51e4')
INSERT [dbo].[mem_type] ([mem_group_code], [mem_type_code], [mem_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1  ', N'2  ', N'ผู้บริหารกลุ่ม', N'Y', NULL, NULL, N'd5556b5a-a525-4ac6-990d-181b913a849e')
INSERT [dbo].[mem_type] ([mem_group_code], [mem_type_code], [mem_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'1  ', N'3  ', N'สมาชิก', N'Y', NULL, NULL, N'bab08f07-4092-4742-ba90-f7c4c9cd79a7')
INSERT [dbo].[mem_worklist] ([rec_no], [member_code], [company_name_th], [company_name_eng], [position_name_th], [position_name_eng], [work_year], [office_address], [x_status], [x_note], [x_log], [id]) VALUES (1, N'3728800072724', N'องค์การบริหารส่วนตำบลโพธิ์ทอง', N'', N'ทำหน้าที่เก็บและรวบรวมข้อมูลด้านรายได้-รายจ่าย ', N'', N'2548-2559', N'องค์การบริหารส่วนตำบลโพธิ์ทอง  อำเภอท่าศาลา จังหวัดนครศรีธรรมราช', N'Y', NULL, NULL, N'5d309d51-e31c-4072-961f-06c3e6315295')
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'1111111111111', N'1111111111111', N'B59C67BF196A4758191E42F76670CEBA', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'peggy', N'pres', N'rterteryery', NULL, NULL, NULL, NULL, N'1111111111111', NULL, CAST(N'1990-03-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1111111111', NULL, NULL, NULL, N'peggymercyprescott@gmail.com', NULL, N'591128074938', CAST(N'2016-11-30T12:09:40.810' AS DateTime), N'Y', NULL, NULL, N'dc281f5e-5196-4fca-a417-f0b4082593c4', CAST(N'2016-11-30T12:09:40.810' AS DateTime))
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'1111111112222', N'1111111112222', N'934B535800B1CBA8F96A5D72F72F1611', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'test', N'test', NULL, NULL, NULL, NULL, NULL, N'1111111112222', NULL, CAST(N'2009-11-04T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1111', NULL, NULL, NULL, N'', NULL, N'591107104558', CAST(N'2016-11-07T10:46:30.703' AS DateTime), N'Y', NULL, NULL, N'31e6f9c9-c2af-4f4b-b512-cc2372cbc0ce', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'1214234235543', N'1214234235543', N'A10A26631D45928CB8BE4EBABBEE8B8D', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'dddd', N'dddddddddddd', NULL, N'F', NULL, NULL, NULL, N'1214234235543', NULL, CAST(N'2016-11-03T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'591107104558', NULL, N'Y', NULL, NULL, N'312d9659-257e-4615-b220-0f0e6e626734', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'2222222222232', N'2222222222232', N'3E6260B81898BEACDA3D16DB379ED329', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'ppp', N'ppp', N'????????', NULL, NULL, NULL, NULL, N'2222222222232', NULL, CAST(N'2000-03-02T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6788888888', NULL, NULL, NULL, N'peggymercyprescott@gmail.com', NULL, N'591107104558', CAST(N'2016-11-30T12:42:36.893' AS DateTime), N'Y', NULL, NULL, N'd25fe4c1-802e-4097-a074-7e7d2d618f6d', CAST(N'2016-11-30T12:42:36.893' AS DateTime))
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3109955573724', N'3109955573724', N'4172F3101212A2009C74B547B6DDF935', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', N'นางสาว', N'วินิตา', N'คำเงิน', N'รับจ้าง', N'F', N'ไทย', N'M5907140855377354411.jpg', NULL, N'3109955573724', N'C5907140855377354411.jpg', CAST(N'1987-08-02T00:00:00.000' AS DateTime), NULL, N'พุทธ', N'18/3', N'N', NULL, N'9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'80000000', NULL, NULL, N'1  ', NULL, N'2  ', N'1001', NULL, NULL, NULL, N'18/3', N' หมู่ที่ 9', N' จังหวัด นครศรีธรรมราช', N'18/6 ถ.ราชเทวี กทม', N'025312546', N'0897674419', NULL, N'winita', N'winita_ta', N'panida@isolidsystem.com', NULL, NULL, NULL, N'Y', NULL, NULL, N'bab0a0a5-f0d4-4ba7-81d0-1c15fcd324c8', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3242353253453', N'3242353253453', N'F356355C1634839CF42769E7F30905A3', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'test', N'test', NULL, N'F', NULL, NULL, NULL, N'3242353253453', NULL, CAST(N'2016-11-02T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'591107104558', CAST(N'2016-11-07T14:44:55.120' AS DateTime), N'Y', NULL, NULL, N'40042d14-a9dc-4942-833b-22c5a2e55d15', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3242353453453', N'3242353453453', N'F356355C1634839CF42769E7F30905A3', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'asssss', N'asassssssssssssssss', NULL, N'F', NULL, NULL, NULL, N'3242353453453', NULL, CAST(N'2016-11-03T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'591107104558', CAST(N'2016-11-07T15:12:52.347' AS DateTime), N'Y', NULL, NULL, N'674d6b93-7f71-4c6c-af9b-7ac2513e2758', CAST(N'2016-11-07T15:13:50.633' AS DateTime))
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3333334455555', N'3333334455555', N'6074C6AA3488F3C2DDDFF2A7CA821AAB', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'ทดดด', N'สอบบบ', N'นักทดสอบ', NULL, NULL, NULL, NULL, N'3333334455555', NULL, CAST(N'2016-11-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'3636', NULL, NULL, NULL, N'p', NULL, N'591107104558', CAST(N'2016-11-30T12:54:15.157' AS DateTime), N'Y', NULL, NULL, N'521ce1c8-1296-4319-81bb-4d569148128a', CAST(N'2016-11-30T12:54:15.157' AS DateTime))
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3728800072724', N'3728800072724', N'64A08E5F1E6C39FAEB90108C430EB120', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', N'นางสาว', N'ชูใจ', N'ใจดี', N'รับจ้าง', N'F', NULL, N'M5907111001173471091.jpg', NULL, N'3728800072724', N'C5907111001174408595.jpg', CAST(N'1987-08-07T00:00:00.000' AS DateTime), NULL, N'พุทธ', NULL, N'N', N'18/3', N'6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'30000000', NULL, NULL, N'1  ', NULL, N'2  ', N'1001', NULL, NULL, NULL, NULL, N'บ้านเลขที่ 18/3 หมู่ที่ 6', N' จังหวัด นครราชสีมา', NULL, N'025342506', N'0897768890', NULL, N'vinida', N'vinida', N'panidaw39@hotmail.com', NULL, NULL, NULL, N'Y', NULL, NULL, N'58fa6784-eb07-4aa1-a0be-c16746ddd085', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'3845599901211', N'3845599901211', N'285AB9448D2751EE57ECE7F762C39095', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', N'นาย', N'ปรเมศน์', N'วัฒนกุลชัย', NULL, N'F', NULL, NULL, NULL, N'3845599901211', NULL, CAST(N'1986-10-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'10000000', NULL, NULL, N'1  ', NULL, N'2  ', N'1001', NULL, NULL, NULL, NULL, NULL, N' จังหวัด กรุงเทพมหานคร', NULL, NULL, N'0882431515', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y', NULL, NULL, N'66129935-7d14-4018-98ae-994714e31086', NULL)
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'5555555555555', N'5555555555555', N'6074C6AA3488F3C2DDDFF2A7CA821AAB', N'17822a90-1029-454a-b4c7-f631c9ca6c7d', NULL, N'rtert', N'ertert', NULL, NULL, NULL, NULL, NULL, N'5555555555555', NULL, CAST(N'2016-11-02T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'435345', NULL, NULL, NULL, N'', NULL, N'591107104558', CAST(N'2016-11-07T15:16:01.427' AS DateTime), N'Y', NULL, NULL, N'd8ef8bcd-2df6-4cef-94f2-9811f59aab88', CAST(N'2016-11-07T15:16:01.427' AS DateTime))
INSERT [dbo].[member] ([member_code], [mem_username], [mem_password], [mem_role_id], [title], [fname], [lname], [occupation], [sex], [nationality], [mem_photo], [income], [cid_card], [cid_card_pic], [birthdate], [current_age], [religion], [place_name], [marry_status], [h_no], [lot_no], [village], [building], [floor], [room], [lane], [street], [subdistrict_code], [district_code], [province_code], [country_code], [zip_code], [mstatus_code], [mem_type_code], [mem_group_code], [mlevel_code], [zone], [latitude], [longitude], [texta_address], [textb_address], [textc_address], [mail_address], [tel], [mobile], [fax], [facebook], [line], [email], [parent_code], [mem_testcenter_code], [register_date], [x_status], [x_note], [x_log], [id], [mlevel_change_date]) VALUES (N'U5908252029246310981', N'ADMIN', N'E020590F0E18CD6053D7AE0E0A507609', N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', NULL, N'Administrator', NULL, NULL, N'M', NULL, NULL, NULL, N'0160822210521', NULL, CAST(N'2016-08-22T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y', NULL, NULL, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', NULL)
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'?', N'002', N'108', N'น้ำลำไย', 1, N'Y', NULL, NULL, N'863f4681-ca01-4952-ac3d-316b3fde09e7')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'?B', N'002', N'101', N'ข้าวโพดดำ', 1, N'Y', NULL, NULL, N'4642f96f-1542-4fd7-b5df-13daca6832ca')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'0001', N'007', N'101', N'ถั่วฝักยาว', 1, N'Y', NULL, NULL, N'971b29ca-36b7-42e6-818a-2f51f218e4aa')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'0002', N'003', N'101', N'ถั่วลิสง', 1, N'Y', NULL, NULL, N'88ddbd47-7f6e-4fb1-a5a4-3670f4c34186')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'005', N'001', N'101', N'ข้าวกล้อง', 1, N'Y', NULL, NULL, N'2bd6ed0d-c8c5-4240-93f0-1a1d1851b23b')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'006', N'001', N'101', N'ข้าวซ้อมมือ', 2, N'Y', NULL, NULL, N'6300cdc6-e282-4c85-a15a-c4931138eaa4')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'A', N'002', N'101', N'ข้าวโพดขาว', 2, N'Y', NULL, NULL, N'906054d5-fd98-4e44-8095-b96aeb4585f2')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'AA', N'007', N'101', N'ถั่วพลู', 2, N'Y', NULL, NULL, N'5c324ddd-3303-43fe-9d5f-05cfc8d8af43')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'B', N'002', N'101', N'ข้าวโพดดำ', 3, N'Y', NULL, NULL, N'73c46724-a9f0-4698-9412-433b4e313ce7')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'C', N'005', N'105', N'ปลาตะเพียน', 1, N'Y', NULL, NULL, N'b3ae1ffc-f5b8-4c6c-ab2a-60facd526ff5')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'D', N'002', N'108', N'น้ำส้ม', 2, N'Y', NULL, NULL, N'4a47dd95-c614-4d85-8fa7-0674961931de')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'DD', N'007', N'101', N'ถั่วเขียว', 3, N'Y', NULL, NULL, N'5020f6a7-1e9e-4c00-98e3-a2e775c9068e')
INSERT [dbo].[product] ([product_code], [product_type_code], [product_group_code], [product_desc], [rec_no], [x_status], [x_note], [x_log], [id]) VALUES (N'FF', N'007', N'101', N'ถั่วแดง', 4, N'Y', NULL, NULL, N'34f47b74-88ba-4ed1-b078-804e2ac2219b')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'พืชไร่', N'Y', NULL, NULL, N'8a20710a-2152-48fb-93ae-218347593386')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'102', N'พืชสวน', N'Y', NULL, NULL, N'82583c56-71c8-4caa-a1b5-aad4c067ff63')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'สมุนไพร', N'Y', NULL, NULL, N'36944ace-b04f-436b-9724-170b4015154c')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'ปศุสัตว์', N'Y', NULL, NULL, N'9c5cba0d-659f-44c7-a0b8-1bea8af40405')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'ประมง', N'Y', NULL, NULL, N'5c64a8b5-c257-4884-b021-8e57a587236d')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'106', N'สินค้าแปรรูป', N'Y', NULL, NULL, N'2bd0b35c-1545-4fb3-b043-6abffe354243')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'ท่องเที่ยวและบริการ', N'Y', NULL, NULL, N'eae25748-b148-4f13-a29f-d07a21f92b39')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'อาหารและเครื่องดื่ม', N'Y', NULL, NULL, N'bc4c080c-8e5e-443e-a6b4-ace4e71c4cb0')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'ร้านค้า', N'Y', NULL, NULL, N'29225bb4-10bf-4ec2-9d97-a0b7b1e0284a')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'110', N'ศูนย์การเรียนรู้', N'Y', NULL, NULL, N'4f0eeddc-ea9a-431c-a88a-4acd20faae98')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'111', N'สิ่งทอและเสื้อผ้า', N'Y', NULL, NULL, N'43e89cbd-00ca-495d-83aa-386812fa1195')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'112', N'เกษตรผสมผสาน', N'Y', NULL, NULL, N'fea45575-037f-4230-8108-63e606b94d3f')
INSERT [dbo].[product_group] ([product_group_code], [product_group_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'113', N'สินค้านวัตกรรม', N'Y', NULL, NULL, N'fc0a9823-c429-49e5-9e39-d738a3bcf450')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'001', N'ข้าว', N'Y', NULL, NULL, N'70e42ba4-5b38-4f29-b4d4-753cae900f60')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'102', N'001', N'ผัก', N'Y', NULL, NULL, N'f98912a4-ad85-4568-bf29-3fd732f2629b')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'001', N'แกะ', N'Y', NULL, NULL, N'7cedcc02-36af-49a4-8f6b-de82cc52166d')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'001', N'กุ้ง', N'Y', NULL, NULL, N'9c2f740e-f895-4f39-86a5-9b9c3166329c')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'106', N'001', N'ของใช้ ประดับ ตกแต่ง', N'Y', NULL, NULL, N'a3e3c545-b234-49e8-9ff9-576c3967ed96')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'001', N'การท่องเที่ยวเชิงเกษตร', N'Y', NULL, NULL, N'c7a00111-ecfb-47dc-a69e-a1516a953916')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'001', N'ขนมหวาน', N'Y', NULL, NULL, N'deb59cc2-7037-43f6-a24b-90589f77658e')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'001', N'การบริการ', N'Y', NULL, NULL, N'09860b7d-69a3-4a85-9e60-0a2971431bb6')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'110', N'001', N'ธรรมชาติ', N'Y', NULL, NULL, N'db9fe57c-81e5-4c5a-830a-82a77b186218')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'111', N'001', N'เครื่องประดับ', N'Y', NULL, NULL, N'373f04f1-b941-41f6-a7e9-155636d89c4d')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'112', N'001', N'เครื่องมือ อุปกรณ์', N'Y', NULL, NULL, N'080f4bdc-7abf-444b-9083-f42178d70123')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'002', N'ข้าวโพด', N'Y', NULL, NULL, N'c31cfe93-41d5-44db-9d12-045d616ed746')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'102', N'002', N'ผลไม้', N'Y', NULL, NULL, N'86489940-1d1c-44ed-bdcf-84ec3fa9ae1d')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'002', N'ไก่', N'Y', NULL, NULL, N'ec90b98f-7233-41e8-8a9b-bac419654469')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'002', N'จระเข้', N'Y', NULL, NULL, N'27341f05-2691-44c7-833d-ed67908ccde6')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'106', N'002', N'เครื่องดื่ม', N'Y', NULL, NULL, N'20af1d5f-e499-44ad-8c95-5e907af71b94')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'002', N'การท่องเที่ยวเชิงธุรกิจ', N'Y', NULL, NULL, N'764b056b-3fa6-485a-9798-5b99a1d078f8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'002', N'เครื่องดื่ม', N'Y', NULL, NULL, N'0a0fa9b6-cbbc-4917-93aa-2603b4e87dba')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'002', N'การศึกษา', N'Y', NULL, NULL, N'1f1975ed-c769-429b-9d87-5f5dc4dd6443')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'110', N'002', N'บุคคล', N'Y', NULL, NULL, N'fd01657d-af9a-4904-a6c6-ba0760f334ea')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'111', N'002', N'ผ้าถุง', N'Y', NULL, NULL, N'06b5970a-a51b-4574-9a21-1a935c8ef70f')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'112', N'002', N'อาหารเครื่องดื่ม', N'Y', NULL, NULL, N'57263993-707b-4889-b6c7-d629a3c90d22')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'003', N'แคนตาลูป', N'Y', NULL, NULL, N'4a472df7-86ea-4bb1-9dbb-081dca801e5e')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'102', N'003', N'ไม้ดอก', N'Y', NULL, NULL, N'dfb93ea2-150e-4e54-b420-7e591984d278')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'003', N'ควาย', N'Y', NULL, NULL, N'2ca42290-b863-4cc4-b3f7-3c65b27d3078')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'003', N'ตะพาบน้ำ', N'Y', NULL, NULL, N'8ce454d3-a4e5-4538-93ea-245fda017ad1')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'106', N'003', N'เสื้อผ้า เครื่องแต่งกาย', N'Y', NULL, NULL, N'4aaa153b-e6d4-4a22-96bc-bdedb9b427ac')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'003', N'การท่องเที่ยวเชิงนิเวศ', N'Y', NULL, NULL, N'bdb53f69-5650-4328-ad40-819b0a3db72f')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'003', N'ติ่มซำ', N'Y', NULL, NULL, N'ec99c0b0-d716-473c-bbe4-282d49ae4c23')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'003', N'ของใช้ภายในบ้าน', N'Y', NULL, NULL, N'479e9406-926b-4ae8-8d37-85c4004091d6')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'110', N'003', N'วิชาการ', N'Y', NULL, NULL, N'3f8e341a-f793-4596-a88d-32ee5e2f133d')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'111', N'003', N'สูท', N'Y', NULL, NULL, N'3f7f0713-1bcd-4b39-931f-55889302487e')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'112', N'003', N'อุปกรณ์เครื่องใช้ไฟฟ้า', N'Y', NULL, NULL, N'dc31e4a3-c6b4-4b2e-995e-fb2e71d762b8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'004', N'งา', N'Y', NULL, NULL, N'fb8c3099-b6ec-49cc-9a7d-a4ac7bd80814')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'102', N'004', N'ไม้ประดับ', N'Y', NULL, NULL, N'064deaa5-7ca0-45c1-95d1-671b4487aa23')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'004', N'โค', N'Y', NULL, NULL, N'c0be14ad-1589-4b19-b9ad-f4a830fb8725')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'004', N'เต่า', N'Y', NULL, NULL, N'43ad128d-5357-435b-965b-c3a8cc6a78ba')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'106', N'004', N'อาหาร', N'Y', NULL, NULL, N'58d6a70c-db52-451e-80a4-03a4d9f90f61')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'004', N'การท่องเที่ยวเชิงวัฒนธรรม', N'Y', NULL, NULL, N'3538ed9c-78a1-47e9-a54a-b7366e9e003d')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'004', N'บะหมี่', N'Y', NULL, NULL, N'659f7eee-418a-4d1d-9cb0-788cd4d9a773')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'004', N'ความบันเทิง', N'Y', NULL, NULL, N'05d80b9c-7c10-4d4b-94b4-e1db03877032')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'110', N'004', N'สื่อ นวัตกรรม เทคโนโลยี', N'Y', NULL, NULL, N'2f152bc7-375e-4857-8663-cc97a8d5c02b')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'111', N'004', N'เสื้อ', N'Y', NULL, NULL, N'7a931e4a-9b47-4220-85d3-509ea3a28c7f')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'112', N'004', N'ไอที', N'Y', NULL, NULL, N'db79a57d-82af-41c3-a9a1-9e6474c52f24')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'005', N'ชา', N'Y', NULL, NULL, N'0c2c868e-3b39-4a7f-82af-5330d8e9bf62')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'005', N'ประเภทต้น', N'Y', NULL, NULL, N'cfd162f4-7459-4e93-bda8-96a046cb27a5')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'005', N'นก', N'Y', NULL, NULL, N'22cfaa8e-fee1-4deb-8e9a-f074d43bcb0a')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'005', N'ปลา', N'Y', NULL, NULL, N'a78e6e27-e4f2-4906-9df9-7098228b8e19')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'107', N'005', N'การท่องเที่ยวเชิงสุขภาพ', N'Y', NULL, NULL, N'be9962d1-e162-4e3b-ab1a-dcf1f60a6139')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'005', N'ผลไม้', N'Y', NULL, NULL, N'5b4f5635-d844-494b-89b8-6a12d835866b')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'005', N'ความสวย ความงาม สุขภาพ', N'Y', NULL, NULL, N'0d1bfac4-f822-4a13-acdc-d09f9b6683e8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'006', N'แตงโม', N'Y', NULL, NULL, N'4594d245-6575-4717-a04e-b59622437e94')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'006', N'ประเภทเถา', N'Y', NULL, NULL, N'a3654f5b-637a-4ae9-98f5-290c908ba566')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'006', N'เป็ด', N'Y', NULL, NULL, N'7b04777b-ef59-49ce-94e2-8e588c9eacba')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'006', N'ปู', N'Y', NULL, NULL, N'16c5efe9-3064-4081-b460-a0ba99eb7fc9')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'006', N'ผัก', N'Y', NULL, NULL, N'4a6e89d0-9baa-4cc9-9a6d-f5032b6509cd')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'006', N'ทอง เครื่องเพชรพลอย', N'Y', NULL, NULL, N'6e557e2a-12d2-4ad1-a29c-7f063eaf354c')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'007', N'ถั่ว', N'Y', NULL, NULL, N'd789b8b4-b972-4051-abf7-0671d5bdc3aa')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'007', N'ประเภทผัก', N'Y', NULL, NULL, N'd7d3e94f-2bf9-44a5-8d1d-59ba3d2ae401')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'007', N'แพะ', N'Y', NULL, NULL, N'c69cf6d6-cf73-4a2d-b896-1ace89d8f8b1')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'007', N'สาหร่าย', N'Y', NULL, NULL, N'18e153f8-bf06-43b4-97da-0239c9522842')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'007', N'อาหารจานเดียว', N'Y', NULL, NULL, N'33925b39-b1a4-4ea0-baa6-0b1046268ce8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'007', N'ธนาคาร และการเงิน', N'Y', NULL, NULL, N'b2ba0078-7c25-4209-a5f4-e836a4692450')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'008', N'ทานตะวัน', N'Y', NULL, NULL, N'5b09458f-abeb-4856-98b3-85cd4582e6b4')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'008', N'ประเภทหญ้า', N'Y', NULL, NULL, N'f467d9c4-6155-4dfd-98e9-a15f2ffb8235')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'008', N'ม้า', N'Y', NULL, NULL, N'cc6856e3-187d-485d-8ddb-5528af005bbb')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'008', N'หอย', N'Y', NULL, NULL, N'6bca242e-8f13-46d7-bee9-fbbc12c49b27')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'108', N'008', N'อาหารสด', N'Y', NULL, NULL, N'5151951d-b11e-4836-b2c4-1bcae29e3937')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'008', N'แฟชั่น', N'Y', NULL, NULL, N'7cdf839a-9597-4fa6-b952-a9cd78dd16c5')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'009', N'ปอ', N'Y', NULL, NULL, N'3538699e-f29b-4e95-aaa3-13f8a1c842da')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'103', N'009', N'ประเภทหัว', N'Y', NULL, NULL, N'c0362d4a-7a25-46dd-8706-c81a09c8c075')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'009', N'แมว', N'Y', NULL, NULL, N'7c01a3a2-4701-4cc5-8405-7bc0d083ae40')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'105', N'009', N'หินปะการัง', N'Y', NULL, NULL, N'998031ac-ac3f-4def-9c29-fd739897a554')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'009', N'อาหารและเครื่องดื่ม', N'Y', NULL, NULL, N'149194e6-3375-4c6b-839d-c17c95d93111')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'010', N'ปาล์ม', N'Y', NULL, NULL, N'53941a02-1ed6-489b-9706-843e8aa66328')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'010', N'วัว', N'Y', NULL, NULL, N'c4a0eba3-0349-46ed-9dd9-b26a99bc48a8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'109', N'010', N'ไอที', N'Y', NULL, NULL, N'dc46508d-605a-494f-bb7a-143b1b092ed8')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'011', N'ฝ้าย', N'Y', NULL, NULL, N'a2bd1577-3b05-4bfa-89b4-80b37b6554cb')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'011', N'หมา', N'Y', NULL, NULL, N'e950d6d9-3b45-4f73-bedc-3f16cdee8347')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'012', N'มันฝรั่ง', N'Y', NULL, NULL, N'01eb89bd-6cf6-4108-93f6-db87d22f6afc')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'012', N'หมู', N'Y', NULL, NULL, N'85082ca9-9d9f-4c86-a683-72ad0d7b3172')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'013', N'มันสำปะหลัง', N'Y', NULL, NULL, N'b3650d60-c6d6-4d63-a20b-7926ce2b7050')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'104', N'013', N'ห่าน', N'Y', NULL, NULL, N'49bd66c7-975f-4286-b832-9f8ed9d27293')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'014', N'ยางพารา', N'Y', NULL, NULL, N'4b97925d-08b8-4634-9c1e-507466d991a5')
INSERT [dbo].[product_type] ([product_group_code], [product_type_code], [product_type_desc], [x_status], [x_note], [x_log], [id]) VALUES (N'101', N'015', N'อ้อย', N'Y', NULL, NULL, N'6fc16b67-d16a-4756-a111-2f6294c56d7b')
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'312d9659-257e-4615-b220-0f0e6e626734', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T15:07:20.307' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T15:07:20.307' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'bab0a0a5-f0d4-4ba7-81d0-1c15fcd324c8', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:00:19.000' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:00:19.000' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'40042d14-a9dc-4942-833b-22c5a2e55d15', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T14:44:55.173' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T14:44:55.173' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'521ce1c8-1296-4319-81bb-4d569148128a', N'521ce1c8-1296-4319-81bb-4d569148128a', CAST(N'2016-11-30T12:54:15.300' AS DateTime), N'521ce1c8-1296-4319-81bb-4d569148128a', CAST(N'2016-11-30T12:54:15.300' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'b493c72b-39dd-4c79-adab-5cbfa88a982e', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:07:34.000' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:07:34.000' AS DateTime), CAST(N'2017-01-13T12:46:18.667' AS DateTime), CAST(N'2017-01-12T15:28:27.800' AS DateTime), N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'674d6b93-7f71-4c6c-af9b-7ac2513e2758', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T15:12:52.387' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-07T15:12:52.387' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'd25fe4c1-802e-4097-a074-7e7d2d618f6d', N'd25fe4c1-802e-4097-a074-7e7d2d618f6d', CAST(N'2016-11-30T12:42:37.160' AS DateTime), N'd25fe4c1-802e-4097-a074-7e7d2d618f6d', CAST(N'2016-11-30T12:42:37.160' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'd8ef8bcd-2df6-4cef-94f2-9811f59aab88', N'd8ef8bcd-2df6-4cef-94f2-9811f59aab88', CAST(N'2016-11-07T15:16:01.680' AS DateTime), N'd8ef8bcd-2df6-4cef-94f2-9811f59aab88', CAST(N'2016-11-07T15:16:01.680' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'66129935-7d14-4018-98ae-994714e31086', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:00:19.000' AS DateTime), N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:00:19.000' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'58fa6784-eb07-4aa1-a0be-c16746ddd085', N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-08-22T21:00:19.000' AS DateTime), N'bab0a0a5-f0d4-4ba7-81d0-1c15fcd324c8', CAST(N'2016-08-23T19:51:41.000' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'31e6f9c9-c2af-4f4b-b512-cc2372cbc0ce', N'31e6f9c9-c2af-4f4b-b512-cc2372cbc0ce', CAST(N'2016-11-07T10:46:30.757' AS DateTime), N'31e6f9c9-c2af-4f4b-b512-cc2372cbc0ce', CAST(N'2016-11-07T10:46:30.757' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMemberRoles] ([MemberId], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [LoggedInDate], [LoggedOutDate], [x_status], [x_note], [x_log]) VALUES (N'dc281f5e-5196-4fca-a417-f0b4082593c4', N'dc281f5e-5196-4fca-a417-f0b4082593c4', CAST(N'2016-11-30T12:09:40.827' AS DateTime), N'dc281f5e-5196-4fca-a417-f0b4082593c4', CAST(N'2016-11-30T12:09:40.827' AS DateTime), NULL, NULL, N'Y', NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (101000, 1, 1, 0, N'สมาชิก', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;สมาชิก', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (101010, 2, 0, 0, N'เพิ่มสมาชิก', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;เพิ่มสมาชิก', N'members', N'Create', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (101020, 2, 0, 0, N'ข้อมูลสมาชิก', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ข้อมูลสมาชิก', N'members', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (101021, 2, 0, 0, N'ข้อมูลสมาชิกส่วนบุคคล', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ข้อมูลสมาชิกส่วนบุคคล', N'members', N'DetailsPersonal', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (101030, 2, 0, 0, N'รายงานข้อมูลสมาชิก', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;รายงานข้อมูลสมาชิก', N'ReportMembers', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (201000, 1, 0, 0, N'ภาพกิจกรรม', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;ภาพกิจกรรม', N'albums', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (301000, 1, 0, 0, N'คลิปกิจกรรม', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;คลิปกิจกรรม', N'videos', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401000, 1, 1, 0, N'โครงการอบรม', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;โครงการอบรม', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401010, 2, 0, 0, N'กลุ่มหลักสูตร', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;กลุ่มหลักสูตร', N'course_group', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401020, 2, 0, 0, N'ผู้สนับสนุน', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ผู้สนับสนุน', N'project_sponsor', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401030, 2, 0, 0, N'โครงการ และผู้สนับสนุน', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;โครงการ และผู้สนับสนุน', N'projects', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401040, 2, 0, 0, N'หลักสูตรอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;หลักสูตรอบรม', N'project_course', N'CourseIndex', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401050, 2, 0, 0, N'วิทยากร', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;วิทยากร', N'instructors', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401060, 2, 0, 0, N'สถานที่จัดอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;สถานที่จัดอบรม', N'train_place', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401070, 2, 0, 0, N'ลงทะเบียนเข้าอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ลงทะเบียนเข้าอบรม', N'project_course_register', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401071, 2, 0, 0, N'สมาชิกลงทะเบียนเข้าอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;สมาชิกลงทะเบียนเข้าอบรม', N'project_course_register', N'MemberRegister', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401080, 2, 0, 0, N'เช็คชื่อเข้าอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;เช็คชื่อเข้าอบรม', N'project_daily_checklist', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (401090, 2, 0, 0, N'ตารางอบรม', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ตารางอบรม', N'ReportCourseCalendar', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (501000, 1, 1, 0, N'ผลิตผลสมาชิก', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;ผลิตผลสมาชิก', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (501010, 2, 0, 0, N'กลุ่มผลิตผลและประเภทผลิตผล', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;กลุ่มผลิตผลและประเภทผลิตผล', N'product_group', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (601000, 1, 0, 0, N'ส่งข่าว EMail', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;ส่งข่าว EMail', N'news', N'EMailAllMembers', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (651000, 1, 1, 0, N'ตั้งค่าระบบ', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;ตั้งค่าระบบ', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (651050, 2, 0, 0, N'ตั้งค่าระบบทั่วไป', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;ตั้งค่าระบบทั่วไป', N'Settings', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (651100, 2, 0, 0, N'สนามสอบ', N'<i class=''fa fa-caret-right''></i>&nbsp;&nbsp;สนามสอบ', N'mem_testcenter', N'Index', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (701000, 1, 0, 0, N'รายงานข้อมูล', N'<i class=''fa fa-caret-down''></i>&nbsp;&nbsp;รายงานข้อมูล', NULL, NULL, N'http://api.palangpanya.com/report')
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951000, 1, 1, 1, N'ชื่อผู้ใช้ ', N'<i class=''fa fa-user fa-fw''></i>  <i class=''fa fa-caret-down''></i>&nbsp;&nbsp;ชื่อผู้ใช้ : _displayname_', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951010, 2, 0, 1, N'จัดการผู้ใช้ระบบ', N'<i class=''fa fa-user fa-fw'' ></i> จัดการผู้ใช้ระบบ', N'Security', N'ManageMembers', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951020, 2, 0, 1, N'จัดการกลุ่มของผู้ใช้ระบบ', N'<i class=''fa fa-sitemap fa-fw''></i> จัดการกลุ่มของผู้ใช้ระบบ', N'Security', N'ManageRoles', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951030, 2, 0, 1, N'การตั้งค่า', N'<i class=''fa fa-cog fa-fw''></i> การตั้งค่า', N'Security', N'Settings', NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951040, 2, 0, 1, N'-', N'-', NULL, NULL, NULL)
INSERT [dbo].[SecurityMenus] ([MenuId], [Level], [HaveChild], [IsRightAlign], [MenuName], [MenuDisplay], [MenuController], [MenuAction], [MenuUrl]) VALUES (951050, 2, 0, 1, N'ออกจากระบบ', N'<i class=''fa fa-sign-out fa-fw''></i> ออกจากระบบ', N'Security', N'LogOff', NULL)
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'b493c72b-39dd-4c79-adab-5cbfa88a982e', 101030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:16:08.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'b493c72b-39dd-4c79-adab-5cbfa88a982e', 651050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:16:08.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 101000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 101010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 101020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 201000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 301000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401040, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401060, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401070, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 401080, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 501000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 501010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 601000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 651000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 651100, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 701000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951040, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', 951050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:20.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 101000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.713' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 101010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.717' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 101020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.717' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 101030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 201000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 301000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401040, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401060, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401070, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401080, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 401090, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:16:08.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 501000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 501010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 601000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 651000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 651050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 651100, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 701000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951010, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951020, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951040, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', 951050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-11-27T13:47:50.720' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 101000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 101021, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 401000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 401071, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 951000, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 951030, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 951040, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoleMenus] ([RoleId], [MenuId], [EditedBy], [EditedDate]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', 951050, N'b493c72b-39dd-4c79-adab-5cbfa88a982e', CAST(N'2016-09-02T14:17:35.000' AS DateTime))
INSERT [dbo].[SecurityRoles] ([RoleId], [RoleName], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [x_status], [x_note], [x_log]) VALUES (N'9a1a4601-f5ee-4087-b97d-d69e7f9bfd7e', N'Operators', N'f5e3130e-aa2e-4e82-8cf6-af887a955eb8', CAST(N'2016-08-18T09:43:38.000' AS DateTime), N'a6e221e4-6f2b-413c-97c2-1b282cfca657', CAST(N'2016-08-18T09:43:38.000' AS DateTime), N'Y', NULL, NULL)
INSERT [dbo].[SecurityRoles] ([RoleId], [RoleName], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [x_status], [x_note], [x_log]) VALUES (N'c5a644a2-97b0-40e5-aa4d-e2afe4cdf428', N'Administrators', N'9f514d3a-2344-424b-9735-b58e828fa9f0', CAST(N'2016-08-18T09:43:29.000' AS DateTime), N'd003ce81-285b-40d3-95dd-7d6309fc2555', CAST(N'2016-08-18T09:43:29.000' AS DateTime), N'Y', NULL, NULL)
INSERT [dbo].[SecurityRoles] ([RoleId], [RoleName], [CreatedBy], [CreatedDate], [EditedBy], [EditedDate], [x_status], [x_note], [x_log]) VALUES (N'17822a90-1029-454a-b4c7-f631c9ca6c7d', N'Members', N'c08497b4-cc74-4a06-b953-6c606e64c6ef', CAST(N'2016-08-18T09:43:46.000' AS DateTime), N'24d99240-640d-4886-8b66-30e44375e744', CAST(N'2016-08-18T09:43:46.000' AS DateTime), N'Y', NULL, NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SecurityRoles]    Script Date: 2/14/2017 3:38:45 PM ******/
ALTER TABLE [dbo].[SecurityRoles] ADD  CONSTRAINT [UK_SecurityRoles] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[album] ADD  DEFAULT (getdate()) FOR [album_date]
GO
ALTER TABLE [dbo].[album] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[course_grade] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[course_group] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[course_instructor] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[course_train_place] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[course_type] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_config] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_country] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_district] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_list_zip] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_province] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ini_subdistrict] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[instructor] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_education] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_group] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_health] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_level] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_product] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_reward] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_site_visit] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_social] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_status] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_testcenter] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_train_record] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_type] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[mem_worklist] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[member] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[product_group] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[product_type] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project_course] ADD  DEFAULT ((50)) FOR [passed_score]
GO
ALTER TABLE [dbo].[project_course] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project_course_register] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project_daily_checklist] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project_sponsor] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[project_supporter] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[SecurityRoleMenus] ADD  DEFAULT (getdate()) FOR [EditedDate]
GO
ALTER TABLE [dbo].[SecurityRoles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[SecurityRoles] ADD  DEFAULT (getdate()) FOR [EditedDate]
GO
ALTER TABLE [dbo].[train_place] ADD  DEFAULT (newid()) FOR [id]
GO
USE [master]
GO
ALTER DATABASE [PalangPanyaDB] SET  READ_WRITE 
GO
