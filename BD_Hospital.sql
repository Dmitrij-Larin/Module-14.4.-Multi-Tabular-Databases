CREATE TABLE Отделения
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Корпус INT NOT NULL CHECK(1 <= Корпус AND Корпус <= 5),
	Название NVARCHAR(100) NOT NULL UNIQUE CHECK(Название != '')
);

CREATE TABLE Врачи
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Фамилия NVARCHAR(50) NOT NULL CHECK(Фамилия != ''),
	Имя NVARCHAR(50) NOT NULL CHECK(Имя != ''),
	Ставка MONEY NOT NULL CHECK(Ставка > 0),
	Надбавка MONEY DEFAULT 0 CHECK(Надбавка > 0)
);

CREATE TABLE [Врачи и обследования]
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	[Время начала] TIME NOT NULL CHECK([Время начала] >= '08:00:00'
										AND [Время начала] <= '18:00:00'),
	[Время завершения] TIME NOT NULL,
		CHECK([Время завершения] > [Время начала]),
	[Идентификатор врача] INT NOT NULL,
		FOREIGN KEY ([Идентификатор врача]) REFERENCES Врачи (ID),
	[Идентификатор обследования] INT NOT NULL,
	[Идентификатор палаты] INT NOT NULL
);

CREATE TABLE Пожертвования
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Сумма MONEY NOT NULL CHECK(Сумма > 0),
	Дата DATE NOT NULL DEFAULT GETDATE(), CHECK(Дата < GETDATE()),
	[Идентификатор отделения] INT NOT NULL,
		FOREIGN KEY ([Идентификатор отделения]) REFERENCES Отделения (ID),
	[Идентификатор спонсора] INT NOT NULL
);

CREATE TABLE Обследования
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Название NVARCHAR(100) NOT NULL UNIQUE CHECK(Название != '')
);

CREATE TABLE Спонсоры
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Название NVARCHAR(100) NOT NULL UNIQUE CHECK(Название != '')
);

CREATE TABLE Палаты
(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Название NVARCHAR(20) NOT NULL UNIQUE CHECK(Название != ''),
	Места INT NOT NULL CHECK(Места > 1),
	[Идентификатор отделения] INT NOT NULL,
		FOREIGN KEY ([Идентификатор отделения]) REFERENCES Отделения (ID)
);

ALTER TABLE [Врачи и обследования]
ADD FOREIGN KEY([Идентификатор обследования]) REFERENCES Обследования(ID);

ALTER TABLE [Врачи и обследования]
ADD FOREIGN KEY([Идентификатор палаты]) REFERENCES Палаты(ID);

ALTER TABLE Пожертвования
ADD FOREIGN KEY([Идентификатор спонсора]) REFERENCES Спонсоры(ID);

		

	
