SELECT 
    b.Brand AS BicycleBrand,
    COUNT(r.Id) AS TotalRents
FROM RentBook AS r
JOIN Bicycle AS b ON r.BicycleId = b.Id
GROUP BY b.Brand
ORDER BY TotalRents DESC;
-- Велосипеды, которые чаще всего арендовали

SELECT Name, Date
FROM Staff
WHERE DATEDIFF(YEAR, Date, GETDATE()) >= 1;
-- Сотрудники, работающие дольше года

SELECT AVG(RentPrice) AS AverageRentPrice
FROM Bicycle;
-- Средняя цена аренды велосипеда

SELECT 
    s.Name AS StaffName,
    COUNT(sb.DetailId) AS TotalServices,
    AVG(sb.Price) AS AvgServicePrice
FROM ServiceBook AS sb
JOIN Staff AS s ON sb.StaffId = s.Id
JOIN Detail AS d ON sb.DetailId = d.Id
GROUP BY s.Name
ORDER BY AvgServicePrice DESC;
--Сколько обслуживаний выполнял каждый сотрудник и какова была средняя стоимость

SELECT 
    s.Name AS StaffName,
    SUM(ISNULL(b.RentPrice * r.Time, 0) + ISNULL(sb.Price, 0)) AS TotalRevenue
FROM Staff s
LEFT JOIN RentBook r ON s.Id = r.StaffId
LEFT JOIN Bicycle b ON r.BicycleId = b.Id
LEFT JOIN ServiceBook sb ON s.Id = sb.StaffId
GROUP BY s.Name
ORDER BY TotalRevenue DESC;
--Топ сотрудников по суммарной выручке от аренды и обслуживания