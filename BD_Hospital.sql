CREATE TABLE ���������
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	������ INT NOT NULL CHECK(1 <= ������ AND ������ <= 5),
	�������� NVARCHAR(100) NOT NULL UNIQUE CHECK(�������� != '')
);

CREATE TABLE �����
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	������� NVARCHAR(50) NOT NULL CHECK(������� != ''),
	��� NVARCHAR(50) NOT NULL CHECK(��� != ''),
	������ MONEY NOT NULL CHECK(������ > 0),
	�������� MONEY DEFAULT 0 CHECK(�������� > 0)
);

CREATE TABLE [����� � ������������]
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	[����� ������] TIME NOT NULL CHECK([����� ������] >= '08:00:00'
										AND [����� ������] <= '18:00:00'),
	[����� ����������] TIME NOT NULL,
		CHECK([����� ����������] > [����� ������]),
	[������������� �����] INT NOT NULL,
		FOREIGN KEY ([������������� �����]) REFERENCES ����� (ID),
	[������������� ������������] INT NOT NULL,
	[������������� ������] INT NOT NULL
);

CREATE TABLE �������������
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	����� MONEY NOT NULL CHECK(����� > 0),
	���� DATE NOT NULL DEFAULT GETDATE(), CHECK(���� < GETDATE()),
	[������������� ���������] INT NOT NULL,
		FOREIGN KEY ([������������� ���������]) REFERENCES ��������� (ID),
	[������������� ��������] INT NOT NULL
);

CREATE TABLE ������������
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	�������� NVARCHAR(100) NOT NULL UNIQUE CHECK(�������� != '')
);

CREATE TABLE ��������
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	�������� NVARCHAR(100) NOT NULL UNIQUE CHECK(�������� != '')
);

CREATE TABLE ������
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	�������� NVARCHAR(20) NOT NULL UNIQUE CHECK(�������� != ''),
	����� INT NOT NULL CHECK(����� > 1),
	[������������� ���������] INT NOT NULL,
		FOREIGN KEY ([������������� ���������]) REFERENCES ��������� (ID)
);

ALTER TABLE [����� � ������������]
ADD FOREIGN KEY([������������� ������������]) REFERENCES ������������(ID);

ALTER TABLE [����� � ������������]
ADD FOREIGN KEY([������������� ������]) REFERENCES ������(ID);

ALTER TABLE �������������
ADD FOREIGN KEY([������������� ��������]) REFERENCES ��������(ID);

		

	
