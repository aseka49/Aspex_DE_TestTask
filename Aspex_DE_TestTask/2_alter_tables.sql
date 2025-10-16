EXEC sp_rename 'Client.[Phone number]', 'PhoneNumber', 'COLUMN';
-- Убрал пробел для простоты и удобства

ALTER TABLE Bicycle
ALTER COLUMN RentPrice DECIMAL(10,2) NOT NULL;
-- INT целочисленное значение, DECIMAL(10,2) подходит для денежных значений, я не знал вдруг будет с копейками, по своему опыту, всегда использую данный тип данных

ALTER TABLE Detail
ALTER COLUMN Price DECIMAL(10,2) NOT NULL;
-- То же самое

ALTER TABLE Bicycle
ADD CONSTRAINT CHK_Bicycle_RentPrice_Positive CHECK (RentPrice > 0);
-- Чтобы не вводить отрицательные числа

ALTER TABLE Detail
ADD CONSTRAINT CHK_Detail_Price_Positive CHECK (Price > 0);
-- То же самое

ALTER TABLE Client
ADD CONSTRAINT UQ_Client_Passport UNIQUE (Passport);
-- Уникальные значения у паспортов

ALTER TABLE Staff
ADD CONSTRAINT UQ_Staff_Passport UNIQUE (Passport);
-- То же самое
