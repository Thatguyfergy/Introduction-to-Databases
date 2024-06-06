(SELECT UA.Name, UA.UID
FROM USER_ACCOUNT AS UA
WHERE 
    EXISTS (
        SELECT UID,
            COUNT(DISTINCT U.OID) AS NumDistinctOIDVisited,
            COUNT(DISTINCT R.OID) AS NumDistinctOIDMalls
        FROM USERDINE AS U
        INNER JOIN RESTAURANT_OUTLET AS R ON U.OID = R.OID
        WHERE U.UID = UA.UID
        GROUP BY UID
        HAVING COUNT(DISTINCT U.OID) = COUNT(DISTINCT R.OID)
    )
)
EXCEPT 
(SELECT UA.Name, UA.UID
FROM USER_ACCOUNT AS UA
WHERE 
    EXISTS (
        SELECT UID,
            COUNT(DISTINCT U.OID) AS NumDistinctOIDVisited,
            COUNT(DISTINCT R.OID) AS NumDistinctOIDMalls
        FROM USERDINE AS U
        INNER JOIN RESTAURANT_OUTLET AS R ON U.OID = R.OID
        WHERE U.UID = UA.UID
        GROUP BY UID
        HAVING COUNT(DISTINCT U.OID) < (
            SELECT MAX(CountDistinctOID) FROM (
                SELECT COUNT(DISTINCT R.OID) AS CountDistinctOID
                FROM RESTAURANT_OUTLET AS R
                GROUP BY R.MID
            ) AS SubQueryAlias
        )
	)
);