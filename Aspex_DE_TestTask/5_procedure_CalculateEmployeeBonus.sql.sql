CREATE PROCEDURE CalculateEmployeeBonus
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM EmployeeBonusMart 
    WHERE [Year] = YEAR(GETDATE()) 
      AND [Month] = MONTH(GETDATE());


    INSERT INTO EmployeeBonusMart ([Year], [Month], [StaffId], [StaffName], [BonusAmount])
    SELECT 
        YEAR(GETDATE()) AS [Year],
        MONTH(GETDATE()) AS [Month],
        s.Id AS StaffId,
        s.Name AS StaffName,
        (
            ISNULL(SUM(b.RentPrice * r.Time * 0.3), 0)
            +
            ISNULL(SUM(sb.Price * 0.8), 0)
        )
        *
        CASE 
            WHEN DATEDIFF(MONTH, s.[Date], GETDATE()) < 12 THEN 0.05
            WHEN DATEDIFF(MONTH, s.[Date], GETDATE()) < 24 THEN 0.10
            ELSE 0.15
        END AS BonusAmount
    FROM Staff s
    LEFT JOIN RentBook r ON s.Id = r.StaffId
    LEFT JOIN Bicycle b ON r.BicycleId = b.Id
    LEFT JOIN ServiceBook sb ON s.Id = sb.StaffId
    GROUP BY s.Id, s.Name, s.[Date];
END;