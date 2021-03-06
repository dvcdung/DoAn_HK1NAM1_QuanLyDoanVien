
USE [master]
GO
/****** Object:  Database [QLDoanVien]    Script Date: 25/01/2022 11:31:31 SA ******/
CREATE DATABASE [QLDoanVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDoanVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLDoanVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDoanVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLDoanVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDoanVien] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDoanVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDoanVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDoanVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDoanVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDoanVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDoanVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDoanVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDoanVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDoanVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDoanVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDoanVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDoanVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDoanVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDoanVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDoanVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDoanVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDoanVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDoanVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDoanVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDoanVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDoanVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDoanVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDoanVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDoanVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLDoanVien] SET  MULTI_USER 
GO
ALTER DATABASE [QLDoanVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDoanVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDoanVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDoanVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDoanVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDoanVien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLDoanVien] SET QUERY_STORE = OFF
GO
USE [QLDoanVien]
GO
/****** Object:  Table [dbo].[DOANVIEN]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOANVIEN](
	[MaDoanVien] [varchar](10) NOT NULL,
	[HoDem] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](10) NULL,
	[NgayVaoDoan] [date] NULL,
	[MaChiDoan] [varchar](10) NULL,
	[MaChucVu] [varchar](10) NULL,
 CONSTRAINT [PK__DOANVIEN__2FB3FC5C80615CB2] PRIMARY KEY CLUSTERED 
(
	[MaDoanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[KETNAPDOAN1]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[KETNAPDOAN1] AS
SELECT HODEM+' '+TEN AS 'HOVATEN', NGAYSINH, DIACHI, NGAYVAODOAN, SDT
	FROM DOANVIEN
	WHERE NGAYVAODOAN = '2018-5-19'
GO
/****** Object:  Table [dbo].[CHIDOAN]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHIDOAN](
	[MaChiDoan] [varchar](10) NOT NULL,
	[TenChiDoan] [nvarchar](50) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[MaKhoa] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiDoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DSSVNU]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DSSVNU] AS
SELECT MADOANVIEN, TEN, TENCHIDOAN, NGAYSINH , DIACHI, DV.SDT
	FROM DOANVIEN DV
		INNER JOIN CHIDOAN CD ON DV.MACHIDOAN = CD.MACHIDOAN
		INNER JOIN KHOA K ON CD.MAKHOA = K.MAKHOA
	WHERE TENKHOA = N'KHOA HỌC MÁY TÍNH'
GO
/****** Object:  Table [dbo].[ANHDAIDIEN]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANHDAIDIEN](
	[MaAnh] [varchar](10) NOT NULL,
	[TenAnh] [nvarchar](30) NOT NULL,
	[DiaChiAnh] [varchar](100) NOT NULL,
 CONSTRAINT [PK__ANHDAIDI__356240DF6FBAD62B] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[MaChucVu] [varchar](10) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOANPHI]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOANPHI](
	[MaPhieu] [varchar](10) NOT NULL,
	[MaDoanVien] [varchar](10) NULL,
	[TenPhieu] [nvarchar](50) NOT NULL,
	[NgayNop] [date] NOT NULL,
	[SoTien] [int] NOT NULL,
 CONSTRAINT [PK__DOANPHI__2660BFE01BD4E550] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKDOANVIEN]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKDOANVIEN](
	[MaDoanVien] [varchar](10) NOT NULL,
	[MatKhau] [varchar](20) NOT NULL,
	[CauHoiQuenMK] [nvarchar](100) NOT NULL,
	[DapAnCauHoi] [nvarchar](100) NOT NULL,
	[MaAnh] [varchar](10) NOT NULL,
 CONSTRAINT [KHOACHINH] PRIMARY KEY CLUSTERED 
(
	[MaDoanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKQUANLY]    Script Date: 25/01/2022 11:31:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKQUANLY](
	[MaQuanLy] [varchar](10) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[CauHoiQuenMK] [nvarchar](100) NOT NULL,
	[DapAnCauHoi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__TKQUANLY__2AB9EAF8C9F3C7E7] PRIMARY KEY CLUSTERED 
(
	[MaQuanLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ANHDAIDIEN] ([MaAnh], [TenAnh], [DiaChiAnh]) VALUES (N'hinh00', N'Mặc Định', N'/Image/anhdaidien.png')
INSERT [dbo].[ANHDAIDIEN] ([MaAnh], [TenAnh], [DiaChiAnh]) VALUES (N'hinh01', N'Hình 1', N'/Image/hinh01.jpg')
INSERT [dbo].[ANHDAIDIEN] ([MaAnh], [TenAnh], [DiaChiAnh]) VALUES (N'hinh02', N'Hình 2', N'/Image/hinh02.jpg')
INSERT [dbo].[ANHDAIDIEN] ([MaAnh], [TenAnh], [DiaChiAnh]) VALUES (N'hinh03', N'Hình 3', N'/Image/hinh03.jpg')
INSERT [dbo].[ANHDAIDIEN] ([MaAnh], [TenAnh], [DiaChiAnh]) VALUES (N'hinh04', N'Hình 4', N'/Image/hinh04.jpg')
GO
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'ba01', N'BA1', N'0942346656', N'kts')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'ba02', N'BA2', N'0125345465', N'kts')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'ce01', N'CE1', N'0957484758', N'ktmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'ce02', N'CE2', N'0743685457', N'ktmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'ce03', N'CE3', N'0975746846', N'ktmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'it01', N'IT1', N'0822452245', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'it02', N'IT2', N'0934334334', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'it03', N'IT3', N'0912358735', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'it04', N'IT4', N'0369696969', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'it05', N'IT5', N'0812557248', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'se01', N'SE1', N'0945345264', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'se02', N'SE2', N'0845362345', N'khmt')
INSERT [dbo].[CHIDOAN] ([MaChiDoan], [TenChiDoan], [SDT], [MaKhoa]) VALUES (N'se03', N'SE3', N'0845323455', N'khmt')
GO
INSERT [dbo].[CHUCVU] ([MaChucVu], [TenChucVu]) VALUES (N'bt', N'Bí thư')
INSERT [dbo].[CHUCVU] ([MaChucVu], [TenChucVu]) VALUES (N'dv', N'Đoàn Viên')
INSERT [dbo].[CHUCVU] ([MaChucVu], [TenChucVu]) VALUES (N'uv', N'Ủy Viên')
GO
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp01', N'dv04', N'Nộp Phí Đoàn', CAST(N'2021-12-24' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp02', N'dv01', N'Nộp Phí Đoàn', CAST(N'2021-12-22' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp03', N'dv30', N'Nộp Phí Đoàn ', CAST(N'2021-12-20' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp04', N'dv03', N'Nộp Phí Đoàn ', CAST(N'2021-12-21' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp05', N'dv12', N'Nộp Phí Đoàn ', CAST(N'2021-12-25' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp06', N'dv18', N'Nộp Phí Đoàn ', CAST(N'2021-12-25' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp07', N'dv25', N'Nộp Phí Đoàn ', CAST(N'2021-12-25' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp08', N'dv37', N'Nộp Phí Đoàn', CAST(N'2021-12-27' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp09', N'dv43', N'Nộp Phí Đoàn ', CAST(N'2021-12-20' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp10', N'dv08', N'Nộp Phí Đoàn ', CAST(N'2021-12-20' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp11', N'dv49', N'Nộp Phí Đoàn ', CAST(N'2021-12-21' AS Date), 20000)
INSERT [dbo].[DOANPHI] ([MaPhieu], [MaDoanVien], [TenPhieu], [NgayNop], [SoTien]) VALUES (N'dp12', N'dv15', N'Nộp Phí Đoàn ', CAST(N'2021-12-21' AS Date), 20000)
GO
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv01', N'Nguyễn Trường', N'Chí', 1, CAST(N'2003-08-18' AS Date), N'Quảng Bình', N'0933233425', CAST(N'2018-09-02' AS Date), N'ba01', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv02', N'Lê Thành', N'Đạt', 1, CAST(N'2003-06-07' AS Date), N'Quảng Ngãi', N'0343523455', CAST(N'2018-09-02' AS Date), N'ba02', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv03', N'Phạm Tiến', N'Đạt', 1, CAST(N'2003-06-10' AS Date), N'Huế', N'0323543234', CAST(N'2018-09-02' AS Date), N'ce03', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv04', N'Phùng Văn Tiến', N'Đạt', 1, CAST(N'2003-11-09' AS Date), N'Nghệ An', N'0988888888', CAST(N'2018-12-22' AS Date), N'ce02', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv05', N'Cao Quôc', N'Dũng', 1, CAST(N'2003-05-27' AS Date), N'Đà Nẵng', N'0978653342', CAST(N'2018-09-02' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv06', N'Nguyễn Trọng', N'Quốc', 1, CAST(N'2003-05-13' AS Date), N'Đà Nẵng', N'0978656438', CAST(N'2018-05-19' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv07', N'Nguyễn Văn', N'Quốc', 1, CAST(N'2003-07-03' AS Date), N'Hà Nội', N'0978656744', CAST(N'2018-05-19' AS Date), N'it03', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv08', N'Hoàng Khánh', N'Duy', 1, CAST(N'2003-09-10' AS Date), N'Quảng Trị', N'0956781234', CAST(N'2018-12-22' AS Date), N'ce03', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv09', N'Nguyễn Thị Thanh', N'Hiền', 0, CAST(N'2003-05-21' AS Date), N'Quảng Nam', N'0123456789', CAST(N'2018-03-26' AS Date), N'ba02', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv10', N'Nguyễn Thị Phương', N'Uyên', 0, CAST(N'2003-05-02' AS Date), N'Quảng Trị', N'0123453456', CAST(N'2018-03-26' AS Date), N'ba01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv11', N'Đỗ Lê', N'Hoan', 1, CAST(N'2003-08-06' AS Date), N'Quảng Nam', N'0987654323', CAST(N'2018-09-02' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv12', N'Đỗ Trịnh Huy', N'Hoàng', 1, CAST(N'2003-08-07' AS Date), N'Huế', N'0934433234', CAST(N'2018-09-02' AS Date), N'it01', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv13', N'Đỗ  Huy', N'Bình', 1, CAST(N'2003-08-17' AS Date), N'TP HCM', N'0937633254', CAST(N'2018-09-15' AS Date), N'se01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv14', N'Nguyễn Quốc ', N'Hoàng', 1, CAST(N'2003-08-09' AS Date), N'Hà Tĩnh', N'0164323453', CAST(N'2018-09-02' AS Date), N'it01', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv15', N'Lê Thanh', N'Hoàng', 1, CAST(N'2003-08-08' AS Date), N'Nghệ An', N'0912243542', CAST(N'2018-09-02' AS Date), N'ba02', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv17', N'Nguyễn Phúc', N'Hưng', 1, CAST(N'2003-08-12' AS Date), N'Huế', N'0345234525', CAST(N'2018-09-02' AS Date), N'it04', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv18', N'Nguyễn Vũ', N'Hưng', 1, CAST(N'2003-02-13' AS Date), N'Hà Nội', N'0123345142', CAST(N'2018-03-26' AS Date), N'ce03', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv19', N'Đinh Thị Lan', N'Hương', 0, CAST(N'2003-01-14' AS Date), N'TP HCM', N'0656453512', CAST(N'2018-03-26' AS Date), N'it02', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv20', N'Võ Chí', N'Dũng', 1, CAST(N'2003-01-04' AS Date), N'Nghê An', N'0123456789', CAST(N'2018-03-26' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv21', N'Lê Vinh', N'Khánh', 1, CAST(N'2003-12-16' AS Date), N'Đà Nẵng', N'0656453523', CAST(N'2018-12-22' AS Date), N'it04', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv24', N'Nguyễn Thị Ngọc ', N'Liên', 0, CAST(N'2003-03-19' AS Date), N'Hà Tĩnh', N'0524515163', CAST(N'2018-03-26' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv25', N'Lê Nhật', N'Linh', 1, CAST(N'2003-12-20' AS Date), N'Quảng Bình', N'0415134523', CAST(N'2018-12-22' AS Date), N'ba01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv26', N'Nguyễn Tiến ', N'Linh', 1, CAST(N'2003-08-21' AS Date), N'Hà Tĩnh', N'0453654346', CAST(N'2018-09-02' AS Date), N'it05', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv27', N'Mai Đức', N'Lộc', 1, CAST(N'2003-08-22' AS Date), N'Hà Tĩnh', N'0423456356', CAST(N'2018-09-02' AS Date), N'ce02', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv28', N'Doãn Bá', N'Lực', 1, CAST(N'2003-06-23' AS Date), N'Quảng Trị', N'0523452345', CAST(N'2018-09-02' AS Date), N'ce01', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv30', N'Phan Thị Thảo ', N'Mai', 0, CAST(N'2003-08-25' AS Date), N'Quảng Bình', N'0523456254', CAST(N'2018-09-02' AS Date), N'it02', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv31', N'Phan Thị Thảo ', N'Nguyên', 0, CAST(N'2003-08-25' AS Date), N'Quảng Nam', N'0523456254', CAST(N'2018-09-02' AS Date), N'ce03', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv33', N'Nguyễn Phương', N'Nam', 1, CAST(N'2003-08-28' AS Date), N'Hà Tĩnh', N'0762452341', CAST(N'2018-09-02' AS Date), N'it01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv35', N'Đinh Châu Hiếu ', N'Nghĩa', 1, CAST(N'2003-08-30' AS Date), N'Kiên Giang', N'0545341534', CAST(N'2018-09-02' AS Date), N'it05', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv36', N'Nguyễn Đức ', N'Nhã', 1, CAST(N'2003-08-31' AS Date), N'Lai Châu', N'0523451451', CAST(N'2018-09-02' AS Date), N'ce02', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv37', N'Nguyễn Tấn', N'Nhân', 1, CAST(N'2003-09-01' AS Date), N'Sơn La', N'0513451612', CAST(N'2018-09-02' AS Date), N'se01', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv38', N'Bùi An ', N'Ninh', 1, CAST(N'2003-05-02' AS Date), N'Bắc Giang', N'0523413412', CAST(N'2018-05-19' AS Date), N'se03', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv40', N'Nguyễn Minh', N'Phi', 1, CAST(N'2003-09-04' AS Date), N'Bình Thuận', N'0451234145', CAST(N'2018-12-22' AS Date), N'ce01', N'bt')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv41', N'Phạm Quốc', N'Phú', 1, CAST(N'2003-10-05' AS Date), N'Ninh Thuận', N'0134526562', CAST(N'2018-12-22' AS Date), N'ce01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv42', N'Ngô Quý Bảo', N'Phúc', 1, CAST(N'2003-09-06' AS Date), N'Vũng Tàu', N'0123145345', CAST(N'2018-12-22' AS Date), N'it05', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv43', N'Phạm Hoàng ', N'Phúc', 1, CAST(N'2003-09-07' AS Date), N'Hải Phòng', N'0123416312', CAST(N'2018-12-22' AS Date), N'se02', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv44', N'Nguyễn Thị Kim', N'Phụng', 0, CAST(N'2003-09-08' AS Date), N'Ninh Bình', N'0574523234', CAST(N'2018-12-22' AS Date), N'se02', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv46', N'Hoàng Trọng', N'Quân', 1, CAST(N'2003-10-10' AS Date), N'Hải Dương', N'0635623453', CAST(N'2018-12-22' AS Date), N'it04', N'uv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv48', N'Lê Đăng', N'Thành', 1, CAST(N'2003-12-12' AS Date), N'Sơn La', N'0523451235', CAST(N'2018-12-22' AS Date), N'ce01', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv49', N'Trương Thị Út', N'Thi', 0, CAST(N'2003-09-13' AS Date), N'Cao Bằng', N'0452313451', CAST(N'2018-12-22' AS Date), N'se03', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv50', N'Nguyễn Hữu ', N'Thức', 1, CAST(N'2003-02-14' AS Date), N'Quảng Trị', N'0265463454', CAST(N'2018-03-26' AS Date), N'it04', N'dv')
INSERT [dbo].[DOANVIEN] ([MaDoanVien], [HoDem], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayVaoDoan], [MaChiDoan], [MaChucVu]) VALUES (N'dv52', N'Nguyễn Quốc ', N'Hoàng', 1, CAST(N'2003-08-09' AS Date), N'Hà Tĩnh', N'0164323453', CAST(N'2018-09-02' AS Date), N'it01', N'bt')
GO
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa]) VALUES (N'ktmt', N'Kĩ Thuật máy tính và Điện tử')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa]) VALUES (N'kts', N'Kinh tế số và Thương mại điện tử')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa]) VALUES (N'khmt', N'Khoa học Máy tính')
GO
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv01', N'doanvien01', N'Con vật yêu thích của mày là gì?', N'Mèo', N'hinh04')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv02', N'doanvien02', N'Đói không?', N'Có', N'hinh03')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv03', N'doanvien03', N'Con mèo có mấy chân?', N'4', N'hinh00')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv04', N'doanvien04', N'Chú bé loắt choắt ...?', N'cái xắc xinh xinh', N'hinh00')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv05', N'doanvien05', N'Where are u from?', N'Viet Nam', N'hinh00')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv06', N'doanvien06', N'Năm 2021 có ngày 30/12 âm lịch không?', N'Không', N'hinh03')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv11', N'doanvien11', N'Năm Mười Mười Lăm ... ', N'Hai Mươi', N'hinh00')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv20', N'vochidung', N'Mày tên Gì hả?', N'Không', N'hinh01')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv31', N'doanvien31', N'45 + 49 = ?', N'93', N'hinh02')
INSERT [dbo].[TKDOANVIEN] ([MaDoanVien], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi], [MaAnh]) VALUES (N'dv49', N'doanvien49', N'Người anh em ở đâu?', N'Nghệ An', N'hinh00')
GO
INSERT [dbo].[TKQUANLY] ([MaQuanLy], [MatKhau], [CauHoiQuenMK], [DapAnCauHoi]) VALUES (N'ql01', N'quanly01', N'1 + 1 = ?', N'3')
GO
ALTER TABLE [dbo].[CHIDOAN]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DOANPHI]  WITH CHECK ADD  CONSTRAINT [FK__DOANPHI__MaDoanV__3F466844] FOREIGN KEY([MaDoanVien])
REFERENCES [dbo].[DOANVIEN] ([MaDoanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DOANPHI] CHECK CONSTRAINT [FK__DOANPHI__MaDoanV__3F466844]
GO
ALTER TABLE [dbo].[DOANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__DOANVIEN__MaChiD__403A8C7D] FOREIGN KEY([MaChiDoan])
REFERENCES [dbo].[CHIDOAN] ([MaChiDoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DOANVIEN] CHECK CONSTRAINT [FK__DOANVIEN__MaChiD__403A8C7D]
GO
ALTER TABLE [dbo].[DOANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__DOANVIEN__MaChuc__412EB0B6] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[CHUCVU] ([MaChucVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DOANVIEN] CHECK CONSTRAINT [FK__DOANVIEN__MaChuc__412EB0B6]
GO
ALTER TABLE [dbo].[TKDOANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__TKDOANVIE__MaAnh__3E1D39E1] FOREIGN KEY([MaAnh])
REFERENCES [dbo].[ANHDAIDIEN] ([MaAnh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TKDOANVIEN] CHECK CONSTRAINT [FK__TKDOANVIE__MaAnh__3E1D39E1]
GO
ALTER TABLE [dbo].[TKDOANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__TKDOANVIE__MaDoa__1CBC4616] FOREIGN KEY([MaDoanVien])
REFERENCES [dbo].[DOANVIEN] ([MaDoanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TKDOANVIEN] CHECK CONSTRAINT [FK__TKDOANVIE__MaDoa__1CBC4616]
GO
USE [master]
GO
ALTER DATABASE [QLDoanVien] SET  READ_WRITE 
GO
