-- Populate DAY_PACKAGE
INSERT INTO DAY_PACKAGE
VALUES 
(2,'Adventure Time',10,18);

-- Populate RELATED
INSERT INTO RELATED
VALUES 
(2,9,'club member'),
(6,10,'club member'),
(5,7,'follower');

DELETE FROM DAY_PACKAGE
WHERE UID = 7 AND Description = 'Family Fun Day';

UPDATE RELATED
SET Type = 'club member'
WHERE Person1_UID = 3 AND Person2_UID = 10; 

INSERT INTO MALL (MID, Address, NumShops)
VALUES 
(1, '35 Jurong East Drive', 68),
(2, '17 Hillview Avenue', 54),
(3, '33 Raffles Place', 97),
(4, '43 Boon Keng Road', 38),
(5, '72 Bedok North St', 74);

INSERT INTO VOUCHER 
VALUES 
(1, 'Issued', '2024-12-31', '2024-03-20', 'Purchase Voucher'),
(2, NULL, '2024-12-30', NULL, 'Purchase Voucher'),
(3, 'Issued', '2024-12-29', '2024-03-19', 'Purchase Voucher'),
(4, 'Expired', '2024-03-28', '2024-03-18', 'Purchase Voucher'),
(5, 'Redeemed', '2024-12-27', '2024-03-17', 'Purchase Voucher'),
(6, 'Issued', '2024-12-31', '2024-03-16', 'Dine Voucher'),
(7, NULL,'2024-12-30', NULL, 'Dine Voucher'),
(8, 'Issued', '2024-12-29', '2024-03-14', 'Dine Voucher'),
(9, 'Expired', '2024-03-28', '2024-03-13', 'Dine Voucher'),
(10, 'Redeemed', '2024-12-27', '2024-03-12', 'Dine Voucher'),
(11, 'Issued', '2024-12-31', '2024-03-11', 'Group Voucher'),
(12, NULL, '2024-12-30', NULL, 'Group Voucher'),
(13, 'Issued', '2024-12-29', '2024-03-09', 'Group Voucher'),
(14, 'Expired', '2024-03-28', '2024-03-08', 'Group Voucher'),
(15, 'Redeemed', '2024-12-27', '2024-03-07', 'Group Voucher'),
(16, 'Issued', '2024-12-31', '2024-03-06', 'Package Voucher'),
(17, NULL, '2024-12-30', NULL, 'Package Voucher'),
(18, 'Issued', '2024-12-29', '2024-03-04', 'Package Voucher'),
(19, 'Expired', '2024-03-28', '2024-03-03', 'Package Voucher'),
(20, 'Redeemed', '2024-12-27', '2024-03-02', 'Package Voucher');

UPDATE VOUCHER set Status = 'Allocated' where Status = 'Issued'
UPDATE VOUCHER set Status = 'Allocated' where Status IS NULL
UPDATE VOUCHER set dateIssued = '2024-02-14' where dateIssued IS NULL

INSERT INTO DAY_PACKAGE
VALUES
(1, '1,2',2,1), 
(2, '2,3',4,16), 
(3, '3,4',3,7), 
(4, '4,5',5,11), 
(5, '5,1',6,10);

INSERT INTO PURCHASE_VOUCHER
VALUES
(1, 10, NULL, 2), 
(2, 20,NULL,3), 
(3, 30,NULL,7), 
(4, 35,NULL,11), 
(5, 25,'2024-03-20 14:30:30',10);

INSERT INTO DINE_VOUCHER
VALUES
(6, 10, NULL, 2), 
(7, 20,NULL,4), 
(8, 30,NULL,8), 
(9, 35,NULL,11), 
(10, 25,'2024-03-21 14:30:30',9);

INSERT INTO GROUP_VOUCHER
VALUES
(11, 2, 10, NULL, 1), 
(12, 4, 20,NULL,3), 
(13, 6, 30,NULL,6), 
(14, 8, 35,NULL,8), 
(15, 10, 25,'2024-02-21 17:30:30',9);

INSERT INTO PACKAGE_VOUCHER
VALUES
(16, 5), 
(17, 10), 
(18, 15), 
(19, 20), 
(20, 25);

INSERT INTO RESTAURANT_OUTLET
VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3),
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4),
(21, 5), (22, 5), (23, 5), (24, 5), (25, 5);

INSERT INTO USERDINE
VALUES 
(1,2,20.00,'2024-03-21 12:30:30','2024-03-21 13:30:30'),
(2,2,25.00,'2024-02-21 11:30:30','2024-02-21 12:30:30'),
(3,2,28.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(4,2,30.00,'2024-02-18 12:30:30','2024-02-18 13:30:30'),
(5,2,26.00,'2024-02-01 14:30:30','2024-02-01 15:30:30'),
(6,2,20.00,'2024-03-22 12:30:30','2024-03-22 13:30:30'),
(7,2,25.00,'2024-02-26 11:30:30','2024-02-26 12:30:30'),
(8,2,28.00,'2024-01-10 11:00:30','2024-01-10 11:30:30'),
(9,2,30.00,'2024-02-08 12:30:30','2024-02-08 13:30:30'),
(10,2,26.00,'2024-02-03 14:30:30','2024-02-03 15:30:30'),

(1,4,20.00,'2024-03-21 12:30:30','2024-03-21 13:30:30'),
(2,4,25.00,'2024-01-21 11:00:30','2024-01-21 12:30:30'),
(3,4,28.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(4,4,30.00,'2024-02-19 10:30:30','2024-02-19 12:30:30'),
(5,4,26.00,'2024-02-02 14:30:30','2024-02-02 16:30:30'),
(11,4,20.00,'2024-03-21 12:30:30','2024-03-21 13:30:30'),
(12,4,25.00,'2024-02-21 11:30:30','2024-02-21 12:30:30'),
(13,4,28.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(14,4,30.00,'2024-02-18 12:30:30','2024-02-18 13:30:30'),
(15,4,26.00,'2024-02-01 14:30:30','2024-02-01 15:30:30'),

(21,6,25.00,'2024-03-26 12:30:30','2024-03-26 13:30:30'),
(22,6,22.00,'2024-01-25 11:00:30','2024-01-25 12:30:30'),
(23,6,25.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(24,6,30.00,'2024-02-19 10:30:30','2024-02-19 12:30:30'),
(25,6,29.00,'2024-02-06 14:30:30','2024-02-06 15:30:30'),
(11,6,15.00,'2024-03-22 12:30:30','2024-03-22 13:30:30'),
(12,6,25.00,'2024-02-26 11:30:30','2024-02-26 12:30:30'),
(13,6,28.00,'2024-01-19 11:00:30','2024-01-19 12:30:30'),
(14,6,35.00,'2024-02-17 12:30:30','2024-02-17 13:30:30'),
(15,6,30.00,'2024-02-01 14:30:30','2024-02-01 15:30:30'),

(1,1,20.00,'2024-03-21 12:30:30','2024-03-21 13:30:30'),
(5,7,25.00,'2024-01-21 11:00:30','2024-01-21 12:30:30'),
(7,8,28.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(10,3,30.00,'2024-02-19 10:30:30','2024-02-19 12:30:30'),
(15,7,26.00,'2024-02-02 14:30:30','2024-02-02 16:30:30'),
(11,9,20.00,'2024-03-21 12:30:30','2024-03-21 13:30:30'),
(17,9,25.00,'2024-02-21 11:30:30','2024-02-21 12:30:30'),
(13,11,28.00,'2024-01-20 11:00:30','2024-01-20 11:30:30'),
(18,5,30.00,'2024-02-18 12:30:30','2024-02-18 13:30:30'),
(19,3,26.00,'2024-02-01 14:30:30','2024-02-01 15:30:30');

INSERT INTO COMPLAINT
VALUES 
(1,10,'pending','Shop is dirty.','2024-03-31 14:30:30'),
(2,13,'pending','Many shoes were out of stock.','2024-03-11 18:30:30'),
(3,14,'pending','Not worth my time here.','2024-03-01 12:30:30'),
(4,16,'being handled','Rude unfriendly staff.','2023-12-01 13:30:30'),
(5,17,'being handled','Staff was unfriendly.','2023-12-18 09:30:30'),
(6,19,'being handled','Bad attitude.','2023-12-14 14:21:30'),
(7,1,'being handled','Shop has insects.','2023-12-31 15:30:30'),
(8,4,'addressed','Shop too crowded.','2023-12-01 14:30:30'),
(9,7,'addressed','Shop has a strange smell.','2023-12-05 10:30:30'),
(10,9,'addressed','Too little staff members.','2023-12-10 12:30:30'),
(11,10,'pending','Clothes did not have my size','2023-12-21 14:30:30'),
(12,12,'pending','Poor service by staff members.','2023-12-01 21:30:30'),
(13,7,'pending','Extremely rude staff.','2023-12-02 11:30:30'),
(14,6,'being handled','Shop is not clean.','2024-02-28 16:30:30'),
(15,4,'being handled','Insects in shops.','2024-02-20 10:30:30'),
(16,2,'being handled','Restaurant is dirty.','2024-02-25 11:30:30'),
(17,11,'being handled','Poor service by staff members.','2024-02-15 19:30:30'),
(18,17,'addressed','Not worth my service tax.','2024-01-31 08:30:30'),
(19,14,'addressed','Quality of food is bad.','2024-01-11 20:30:30'),
(20,1,'addressed','There is a cockroach in my noodles.','2024-01-15 14:30:30');


INSERT INTO COMPLAINTS_ON_RESTAURANT
VALUES 
(16,2,5,'being handled','Restaurant is dirty.','2024-02-25 11:30:30'),
(17,11,7,'being handled','Poor service by staff members.','2024-02-15 19:30:30'),
(18,17,9,'addressed','Not worth my service tax.','2024-01-31 08:30:30'),
(19,14,12,'addressed','Quality of food is bad.','2024-01-11 20:30:30'),
(20,1,19,'addressed','There is a cockroach in my noodles.','2024-01-15 14:30:30');

INSERT INTO RESTAURANT_CHAIN
VALUES
(1, '35 Jurong East Drive #B1-01'),
(2, '17 Hillview Avenue #01-01'),
(3, '33 Raffles Place #03-01'),
(4, '43 Boon Keng Road #02-01'),
(5, '72 Bedok North St #06-01');

INSERT INTO MALL_MGMT_COMPANY
VALUES
(1, ' 25 Orchard Road #10-01'),
(2, '8 Marina Boulevard #15-02'),
(3, '17 Bukit Timah Road #07-03'),
(4, '42 Serangoon Central #20-04'),
(5, '3 Temasek Avenue #12-05');

INSERT INTO DAYPACKAGE_HAS_RESTAURANTOUTLET
VALUES
(1,1,1),
(1,2,2),
(1,3,9),
(2,4,4),
(2,5,6),
(2,6,10),
(3,7,3),
(3,8,4),
(3,9,10),
(4,10,5),
(4,11,7),
(5,12,8);