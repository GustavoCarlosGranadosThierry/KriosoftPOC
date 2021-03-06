USE [master]
GO
/****** Object:  Database [EjercicioKriosoft]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE DATABASE [EjercicioKriosoft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EjercicioKriosoft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EjercicioKriosoft.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EjercicioKriosoft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EjercicioKriosoft_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EjercicioKriosoft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EjercicioKriosoft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET ARITHABORT OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EjercicioKriosoft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EjercicioKriosoft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EjercicioKriosoft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EjercicioKriosoft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EjercicioKriosoft] SET  MULTI_USER 
GO
ALTER DATABASE [EjercicioKriosoft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EjercicioKriosoft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EjercicioKriosoft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EjercicioKriosoft] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EjercicioKriosoft] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EjercicioKriosoft] SET QUERY_STORE = OFF
GO
USE [EjercicioKriosoft]
GO
/****** Object:  User [testkriosoft]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE USER [testkriosoft] FOR LOGIN [testkriosoft] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [testkriosoft]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreAlumno] [varchar](250) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [datetime] NULL,
	[PadreTutor] [varchar](250) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnoGrupo]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoGrupo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Alumno] [int] NULL,
	[GrupoAsignado] [int] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_AlumnoGrupo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreMateria] [varchar](250) NULL,
	[CantidadAlumnos] [int] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoAsignado]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoAsignado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Profesor] [int] NULL,
	[Grupo] [int] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_GrupoAsignado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 3/11/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProfesor] [varchar](250) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/11/2022 11:05:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlumnoGrupo]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoGrupo_Alumno] FOREIGN KEY([Alumno])
REFERENCES [dbo].[Alumno] ([ID])
GO
ALTER TABLE [dbo].[AlumnoGrupo] CHECK CONSTRAINT [FK_AlumnoGrupo_Alumno]
GO
ALTER TABLE [dbo].[AlumnoGrupo]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoGrupo_GrupoAsignado] FOREIGN KEY([GrupoAsignado])
REFERENCES [dbo].[GrupoAsignado] ([ID])
GO
ALTER TABLE [dbo].[AlumnoGrupo] CHECK CONSTRAINT [FK_AlumnoGrupo_GrupoAsignado]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[GrupoAsignado]  WITH CHECK ADD  CONSTRAINT [FK_GrupoAsignado_Grupo] FOREIGN KEY([Grupo])
REFERENCES [dbo].[Grupo] ([ID])
GO
ALTER TABLE [dbo].[GrupoAsignado] CHECK CONSTRAINT [FK_GrupoAsignado_Grupo]
GO
ALTER TABLE [dbo].[GrupoAsignado]  WITH CHECK ADD  CONSTRAINT [FK_GrupoAsignado_Profesor] FOREIGN KEY([Profesor])
REFERENCES [dbo].[Profesor] ([ID])
GO
ALTER TABLE [dbo].[GrupoAsignado] CHECK CONSTRAINT [FK_GrupoAsignado_Profesor]
GO
USE [master]
GO
ALTER DATABASE [EjercicioKriosoft] SET  READ_WRITE 
GO
