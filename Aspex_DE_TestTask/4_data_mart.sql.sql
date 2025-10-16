CREATE TABLE EmployeeBonusMart
(
    [Year] INT NOT NULL,
    [Month] INT NOT NULL,
    [StaffId] INT NOT NULL,
    [StaffName] VARCHAR(50) NOT NULL,
    [BonusAmount] DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_EmployeeBonusMart PRIMARY KEY ([Year], [Month], [StaffId])
);