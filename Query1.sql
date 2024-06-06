
-- for testing 
DELETE FROM DAY_PACKAGE
WHERE UID = 5 AND Description = 'Family Fun Day';

DELETE FROM DAY_PACKAGE
WHERE UID = 4 AND Description = 'Spa Day';
DELETE FROM DAY_PACKAGE
WHERE UID = 11 AND Description = 'Spa Day';


INSERT INTO DAY_PACKAGE
VALUES 
(3, 'Family Fun Day', 5, 17);

INSERT INTO DAY_PACKAGE
VALUES 
(1, 'Spa Day', 11, 17),
(1, 'Spa Day', 4, 20);

-- Query 1 code 
SELECT DP1.DID, DP1.Description, COUNT(DISTINCT DP1.UID) AS Participant_Count
FROM DAY_PACKAGE AS DP1, DAY_PACKAGE AS DP2, RELATED AS R
 WHERE DP1.UID = R.Person1_UID AND DP2.UID = R.Person2_UID AND DP1.DID = DP2.DID
AND R.Type = 'family' OR R.Type = 'club member'
GROUP BY DP1.DID, DP1.Description
HAVING COUNT(DISTINCT DP1.UID) = (
    SELECT MAX(Participant_Count)
    FROM (
        SELECT COUNT(DISTINCT DP1.UID) AS Participant_Count
        FROM DAY_PACKAGE AS DP1
        INNER JOIN DAY_PACKAGE AS DP2 ON DP1.DID = DP2.DID
        INNER JOIN RELATED AS R ON DP1.UID = R.Person1_UID AND DP2.UID = R.Person2_UID
        WHERE R.Type = 'family' OR R.Type = 'club member'
        GROUP BY DP1.DID, DP1.Description
    ) AS MaxParticipantCount
);


















