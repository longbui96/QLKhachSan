USE [master]
GO
/****** Object:  Database [TrungTamKhoKS]    Script Date: 04/19/2017 01:46:58 ******/
CREATE DATABASE [TrungTamKhoKS] ON  PRIMARY 
( NAME = N'TrungTamKhoKS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TrungTamKhoKS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrungTamKhoKS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TrungTamKhoKS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrungTamKhoKS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrungTamKhoKS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrungTamKhoKS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET ARITHABORT OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TrungTamKhoKS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TrungTamKhoKS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TrungTamKhoKS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET  DISABLE_BROKER
GO
ALTER DATABASE [TrungTamKhoKS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TrungTamKhoKS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TrungTamKhoKS] SET  READ_WRITE
GO
ALTER DATABASE [TrungTamKhoKS] SET RECOVERY FULL
GO
ALTER DATABASE [TrungTamKhoKS] SET  MULTI_USER
GO
ALTER DATABASE [TrungTamKhoKS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TrungTamKhoKS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrungTamKhoKS', N'ON'
GO
USE [TrungTamKhoKS]
GO
/****** Object:  Table [dbo].[DSChuSoHuu]    Script Date: 04/19/2017 01:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSChuSoHuu](
	[MaChuSoHuu] [nchar](10) NOT NULL,
	[Ho] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoDienThoai] [nchar](15) NOT NULL,
	[CMND] [nchar](10) NOT NULL,
	[DiaChiNha] [ntext] NOT NULL,
	[HoKhauThuongTru] [ntext] NOT NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [PK_DSChuSoHuu] PRIMARY KEY CLUSTERED 
(
	[MaChuSoHuu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[DSChuSoHuu] ([MaChuSoHuu], [Ho], [Ten], [NgaySinh], [SoDienThoai], [CMND], [DiaChiNha], [HoKhauThuongTru], [GhiChu]) VALUES (N'ChKS20002 ', N'Huynh Nhật', N'Lưu', CAST(0x541E0B00 AS Date), N'0904252634     ', N'021554236 ', N'235/4 Nguyễn Kiệm, P. 3, Q.Gò Vấp', N'235/4 Nguyễn Kiệm, P. 3, Q.Gò Vấp', NULL)
INSERT [dbo].[DSChuSoHuu] ([MaChuSoHuu], [Ho], [Ten], [NgaySinh], [SoDienThoai], [CMND], [DiaChiNha], [HoKhauThuongTru], [GhiChu]) VALUES (N'ChKS40001 ', N'Phan Hoàng', N'Nhân', CAST(0xCC1E0B00 AS Date), N'01653050279    ', N'253412145 ', N'371 Nguyễn Kiệm, P. 3, Q.Gò Vấp', N'371 Nguyễn Kiệm, P. 3, Q.Gò Vấp', NULL)
/****** Object:  Table [dbo].[DanhSachKhachSan]    Script Date: 04/19/2017 01:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachKhachSan](
	[MaKS] [nchar](10) NOT NULL,
	[TenKS] [nvarchar](50) NOT NULL,
	[DC_So] [nvarchar](12) NOT NULL,
	[DC_Duong] [nvarchar](50) NOT NULL,
	[DC_Phuong] [nvarchar](50) NOT NULL,
	[DC_Quan] [nvarchar](50) NOT NULL,
	[DC_Tinh] [nvarchar](50) NOT NULL,
	[SoGiuongTrong] [int] NOT NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [PK_DanhSachKhachSan] PRIMARY KEY CLUSTERED 
(
	[MaKS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[DanhSachKhachSan] ([MaKS], [TenKS], [DC_So], [DC_Duong], [DC_Phuong], [DC_Quan], [DC_Tinh], [SoGiuongTrong], [GhiChu]) VALUES (N'NgK03GV001', N'Hoàng Thiên Ân', N'371', N'Nguyễn Kiệm', N'3', N'Gò Vấp', N'Tp. Hồ Chí Minh', 0, NULL)
INSERT [dbo].[DanhSachKhachSan] ([MaKS], [TenKS], [DC_So], [DC_Duong], [DC_Phuong], [DC_Quan], [DC_Tinh], [SoGiuongTrong], [GhiChu]) VALUES (N'NgK03GV002', N'Huỳnh Lưu', N'225/2', N'Nguyễn Kiệm', N'3', N'Gò Vấp', N'Tp.Hồ Chí Minh', 0, NULL)
/****** Object:  Table [dbo].[ChiTietDichVu]    Script Date: 04/19/2017 01:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDichVu](
	[MaKS] [nchar](10) NOT NULL,
	[ChuSoHuu] [nchar](10) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ChiPhiHangThang] [int] NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [PK_ChiTietDichVu] PRIMARY KEY CLUSTERED 
(
	[MaKS] ASC,
	[ChuSoHuu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDichVu] ([MaKS], [ChuSoHuu], [ThoiGianBatDau], [ChiPhiHangThang], [GhiChu]) VALUES (N'NgK03GV001', N'ChKS40001 ', CAST(0xB13C0B00 AS Date), 2300000, NULL)
INSERT [dbo].[ChiTietDichVu] ([MaKS], [ChuSoHuu], [ThoiGianBatDau], [ChiPhiHangThang], [GhiChu]) VALUES (N'NgK03GV002', N'ChKS20002 ', CAST(0x7B3C0B00 AS Date), 1700000, NULL)
/****** Object:  Table [dbo].[BangGiaKS]    Script Date: 04/19/2017 01:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangGiaKS](
	[MaKS] [nchar](10) NOT NULL,
	[STT] [int] NOT NULL,
	[LoaiPhong] [nvarchar](10) NOT NULL,
	[LoaiThue] [nvarchar](10) NOT NULL,
	[SoGiuong] [int] NOT NULL,
	[GiaThue] [int] NOT NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [PK_BangGiaKS] PRIMARY KEY CLUSTERED 
(
	[MaKS] ASC,
	[STT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 1, N'VIP', N'Qua Đêm', 1, 1, N'')
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 2, N'VIP', N'Ngày', 1, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 3, N'VIP', N'Ngày', 2, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 4, N'VIP', N'Qua Đêm', 2, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 5, N'Thường', N'Ngày', 1, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 6, N'Thường', N'Qua Đêm', 1, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 7, N'Thường', N'Ngày', 1, 1, NULL)
INSERT [dbo].[BangGiaKS] ([MaKS], [STT], [LoaiPhong], [LoaiThue], [SoGiuong], [GiaThue], [GhiChu]) VALUES (N'NgK03GV001', 8, N'Thường', N'Qua Đêm', 1, 1, NULL)
/****** Object:  ForeignKey [FK_ChiTietDichVu_DanhSachKhachSan]    Script Date: 04/19/2017 01:46:59 ******/
ALTER TABLE [dbo].[ChiTietDichVu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDichVu_DanhSachKhachSan] FOREIGN KEY([MaKS])
REFERENCES [dbo].[DanhSachKhachSan] ([MaKS])
GO
ALTER TABLE [dbo].[ChiTietDichVu] CHECK CONSTRAINT [FK_ChiTietDichVu_DanhSachKhachSan]
GO
/****** Object:  ForeignKey [FK_ChiTietDichVu_DSChuSoHuu]    Script Date: 04/19/2017 01:46:59 ******/
ALTER TABLE [dbo].[ChiTietDichVu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDichVu_DSChuSoHuu] FOREIGN KEY([ChuSoHuu])
REFERENCES [dbo].[DSChuSoHuu] ([MaChuSoHuu])
GO
ALTER TABLE [dbo].[ChiTietDichVu] CHECK CONSTRAINT [FK_ChiTietDichVu_DSChuSoHuu]
GO
/****** Object:  ForeignKey [FK_BangGiaKS_DanhSachKhachSan]    Script Date: 04/19/2017 01:46:59 ******/
ALTER TABLE [dbo].[BangGiaKS]  WITH CHECK ADD  CONSTRAINT [FK_BangGiaKS_DanhSachKhachSan] FOREIGN KEY([MaKS])
REFERENCES [dbo].[DanhSachKhachSan] ([MaKS])
GO
ALTER TABLE [dbo].[BangGiaKS] CHECK CONSTRAINT [FK_BangGiaKS_DanhSachKhachSan]
GO
