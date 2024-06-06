WITH FamilyShoppingDining AS ( 

	SELECT  

		r.family_id,
		
		r.Person1_UID, 

		CASE WHEN COUNT(DISTINCT s.UID) >= 0.5 * COUNT(DISTINCT u.UID) THEN 'Frequent' ELSE 'Not Frequent' END AS frequent_shopping, 

		CASE WHEN COUNT(DISTINCT d.UID) >= 0.5 * COUNT(DISTINCT u.UID) THEN 'Frequent' ELSE 'Not Frequent' END AS frequent_dining

	FROM RELATED r

	JOIN USER_ACCOUNT u ON r.Person1_UID = u.UID OR r.Person2_UID = u.UID 

	LEFT JOIN USERSHOP s ON u.UID = s.UID 

	LEFT JOIN USERDINE d ON u.UID = d.UID 

	WHERE r.Type = 'Family'

	GROUP BY r.family_id, r.Person1_UID

), 

FamilyDayPackage AS ( 

	SELECT  

		r.family_id,
		
		r.Person1_UID, 

		CASE WHEN COUNT(DISTINCT dp.UID) > 0 THEN 'Yes' ELSE 'No' END AS day_package_used 

	FROM related r 

	JOIN user_account u ON r.person1_UID = u.UID OR r.person2_UID = u.UID 

	LEFT JOIN day_package dp ON u.UID = dp.UID 

	GROUP BY r.family_id, r.Person1_UID 

) 

SELECT DISTINCT

	fsd.family_id AS Family,

	fsd.frequent_shopping AS Frequent_Shopping, 

	fsd.frequent_dining AS Frequent_Dining, 

	fdp.day_package_used AS Day_Package_Used

FROM FamilyShoppingDining fsd 

JOIN FamilyDayPackage fdp ON fsd.Person1_UID = fdp.Person1_UID;


