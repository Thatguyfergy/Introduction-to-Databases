-- delete data to restart population of data
delete from RECOMMENDATION  

DECLARE @UserID INT, @MallID INT, @currentMaxNID INT;

SELECT @currentMaxNID = ISNULL(MAX(NID), 0) FROM RECOMMENDATION;

BEGIN TRANSACTION;
-- Populating Data
DECLARE @i INT = 1;
WHILE @i <= 15
BEGIN
    -- Selecting random user
    SELECT TOP 1 @UserID = UID FROM USER_ACCOUNT ORDER BY NEWID();

    -- Selecting random mall
    SELECT TOP 1 @MallID = MID FROM MALL ORDER BY NEWID();

    -- Increasing NID by 1 to allow for unique NID(key)
    SET @currentMaxNID = @currentMaxNID + 1;

    -- Insertion
    INSERT INTO RECOMMENDATION (NID, ValidPeriod, DateIssued, MID, UID)
    VALUES (@currentMaxNID, DATEADD(MONTH, @i, GETDATE()), GETDATE(), @MallID, @UserID);

    SET @i = @i + 1;
END

COMMIT TRANSACTION;

-- Assuming that the most popular recommedation is the mall that is recommended the most, not user visiting that recommendation
-- Therefore, we will be counting the number of recommendations based on Mall ID ( key for mall ) 
SELECT 
    m.MID, 
    m.Address, 
    COUNT(r.NID) AS NumberOfRecommendations
FROM 
    MALL m
JOIN 
    RECOMMENDATION r ON m.MID = r.MID
GROUP BY 
    m.MID, 
    m.Address
ORDER BY 
    NumberOfRecommendations DESC;
