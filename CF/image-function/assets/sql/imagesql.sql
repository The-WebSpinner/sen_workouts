USE [trainingdb]
GO

/****** Object:  Table [dbo].[images]    Script Date: 26-06-2023 7.21.20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[orgimgName] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

