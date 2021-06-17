Use fetch_reward;

Drop TABLE Receipts;
Drop TABLE Users;
Drop TABLE Brand;
Drop TABLE rewardsReceiptItemList;



CREATE Table Brand (
    _id VARCHAR (45) NOT NULL,
	barcode VARCHAR (45),
    brandCode VARCHAR (45),
    category VARCHAR (45),
    categoryCode VARCHAR (45),
    cpg VARCHAR (45),
    topBrand TINYINT,
    name VARCHAR (45),
    PRIMARY KEY(_id))


CREATE Table rewardsReceiptItemList (
    barcode VARCHAR (45) NOT NULL,
	description VARCHAR (45),
    finalPrice Decimal (10,2),
    itemPrice Decimal (10,2),
    needsFetchReview TINYINT,
    partnerItemId INT,
    preventTargetGapPoints TINYINT,
    quantityPurchased INT,
	userFlaggedBarcode VARCHAR (45),
	userFlaggedNewItem TINYINT,
	userFlaggedPrice Decimal (10,2),
	userFlaggedQuantity INT,
    PRIMARY KEY (barcode)
	);


CREATE Table Users (
    _id VARCHAR (45) NOT NULL,
    state VARCHAR (45),
    createdDate DATETIME,
    lastLogin DATETIME,
	role VARCHAR (45),
	active VARCHAR (45),
    PRIMARY KEY (_id)
	);

CREATE TABLE Receipts (
    _id VARCHAR (45)  NOT NULL,
    bonusPointsEarned Decimal (4,1),
    bonusPointsEarnedReason VARCHAR (100),
    createDate DATETIME,
	dateScanned DATETIME,
	finishedDate DATETIME,
    modifyDate DATETIME,
    pointsAwardedDate DATETIME,
	pointsEarned Decimal (4,1),
	purchaseDate DATETIME,
	purchasedItemCount INT,
	rewardsReceiptItemList Varchar(45),
	rewardsReceiptStatus Varchar(45),
    totalSpent Decimal (10,1),
    userId Varchar(45) NOT NULL,
    PRIMARY KEY (_id),
	FOREIGN KEY (userId) REFERENCES Users (_id),
	FOREIGN KEY (rewardsReceiptItemList) REFERENCES rewardsReceiptItemList (barcode),
	FOREIGN KEY (rewardsReceiptItemList) REFERENCES Brand (_id)
	);

--------------------------------------------------------------------------------------------------------------------

INSERT INTO Users (_id ,
    state ,
    createdDate ,
    lastLogin ,
	role,
	active)
	VALUES ('5ff1e1eacfcf6c399c274ae6', 'WA', '2020-06-16 10:34:09', '2020-06-16 10:34:09', 'Consumer', 'True')

	INSERT INTO Users (_id ,
    state ,
    createdDate ,
    lastLogin ,
	role,
	active)
	VALUES ('5ff1e1eacfcf6c399c274ae7', 'WA', '2020-05-16 10:34:09', '2020-05-16 10:34:09', 'Consumer', 'True')

Delete from brand where _id = '4012'

INSERT INTO Brand (_id,barcode ,brandCode ,category , categoryCode , cpg , topBrand, name)
	VALUES ('4011', '4011', 'jeff', 'Pop', 'P', 'G', 1, 'Gucci')
    
INSERT INTO Brand (_id,barcode ,brandCode ,category , categoryCode , cpg , topBrand, name)
	VALUES ('4013', '4013', 'jeff', 'Pop', 'P', 'G', 0, 'Versace')

	INSERT INTO Brand (_id,barcode ,brandCode ,category , categoryCode , cpg , topBrand, name)
	VALUES ('4012', '4012', 'jeff', 'Pop', 'P', 'G', 1, 'Cartier')
    
 INSERT INTO Brand (_id,barcode ,brandCode ,category , categoryCode , cpg , topBrand, name)
	VALUES ('4014', '4014', 'jeff', 'Pop', 'P', 'G', 1, 'Hugo Boss')   
    
INSERT INTO Brand (_id,barcode ,brandCode ,category , categoryCode , cpg , topBrand, name)
	VALUES ('4015', '4015', 'jeff', 'Pop', 'P', 'G', 1, 'Channel')   

INSERT INTO rewardsReceiptItemList (barcode,
	description ,
    finalPrice,
    itemPrice,
    needsFetchReview ,
    partnerItemId,
    preventTargetGapPoints,
    quantityPurchased,
	userFlaggedBarcode,
	userFlaggedNewItem,
	userFlaggedPrice,
	userFlaggedQuantity)
	VALUES('4011', 'Check', 26.00, 26.00, 0,1,0,2,'4011', 0, 26.00, 2);

INSERT INTO rewardsReceiptItemList (barcode,
	description ,
    finalPrice,
    itemPrice,
    needsFetchReview ,
    partnerItemId,
    preventTargetGapPoints,
    quantityPurchased,
	userFlaggedBarcode,
	userFlaggedNewItem,
	userFlaggedPrice,
	userFlaggedQuantity)
	VALUES('4012', 'Check', 26.00, 26.00, 0,1,0,2,'4012', 0, 26.00, 2);
    
    INSERT INTO rewardsReceiptItemList (barcode,
	description ,
    finalPrice,
    itemPrice,
    needsFetchReview ,
    partnerItemId,
    preventTargetGapPoints,
    quantityPurchased,
	userFlaggedBarcode,
	userFlaggedNewItem,
	userFlaggedPrice,
	userFlaggedQuantity)
	VALUES('4013', 'Check', 26.00, 26.00, 0,1,0,2,'4013', 0, 26.00, 2);
    
        INSERT INTO rewardsReceiptItemList (barcode,
	description ,
    finalPrice,
    itemPrice,
    needsFetchReview ,
    partnerItemId,
    preventTargetGapPoints,
    quantityPurchased,
	userFlaggedBarcode,
	userFlaggedNewItem,
	userFlaggedPrice,
	userFlaggedQuantity)
	VALUES('4014', 'Check', 26.00, 26.00, 0,1,0,1,'4014', 0, 26.00, 2);

Delete from receipts where _id = '5ff1e1eb0a720f0523000578'
Delete from receipts where _id = '5ff1e1eb0a720f0523000576'
INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES     ('5ff1e1eb0a720f0523000575', 500.0,'Receipt number 2 completed', '2020-06-16 10:34:09', '2020-06-16 10:34:09', '2020-06-16 10:34:09',
 '2020-06-16 10:34:09','2020-06-16 10:34:09',500.0, '2020-06-16 10:34:09',5,'4011', 'Accepted', 26.0, '5ff1e1eacfcf6c399c274ae6')

 INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES     ('5ff1e1eb0a720f0523000578', 500.0,'Receipt number 2 completed', '2020-05-16 10:34:09', '2020-05-16 10:34:09', '2020-05-16 10:34:09',
 '2020-05-16 10:34:09','2020-05-16 10:34:09',500.0, '2020-05-16 10:34:09',5,'4012', 'Accepted', 26.0, '5ff1e1eacfcf6c399c274ae7')
-------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES ('5ff1e1eb0a720f0523000579', 500.0,'Receipt number 2 completed', '2020-05-16 10:34:09', '2020-05-16 10:34:09', '2020-05-16 10:34:09',
 '2020-05-16 10:34:09','2020-05-16 10:34:09',500.0, '2020-05-16 10:34:09',5,'4011', 'Accepted', 26.0, '5ff1e1eacfcf6c399c274ae7')
 
 INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES     ('5ff1e1eb0a720f0523000576', 500.0,'Receipt number 2 completed', '2020-06-16 10:34:09', '2020-06-16 10:34:09', '2020-06-16 10:34:09',
 '2020-06-16 10:34:09','2020-06-16 10:34:09',500.0, '2020-06-16 10:34:09',5,'4012', 'Accepted', 26.0, '5ff1e1eacfcf6c399c274ae6')

INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES     ('5ff1e1eb0a720f0523000577', 500.0,'Receipt number 2 completed', '2020-06-16 10:34:09', '2020-06-16 10:34:09', '2020-06-16 10:34:09',
 '2020-06-16 10:34:09','2020-06-16 10:34:09',500.0, '2020-06-16 10:34:09',5,'4013', 'Rejected', 26.0, '5ff1e1eacfcf6c399c274ae6')

INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES     ('5ff1e1eb0a720f0523000580', 500.0,'Receipt number 2 completed', '2020-06-16 10:34:09', '2020-06-16 10:34:09', '2020-06-16 10:34:09',
 '2020-06-16 10:34:09','2020-06-16 10:34:09',500.0, '2020-06-16 10:34:09',5,'4013', 'Rejected', 26.0, '5ff1e1eacfcf6c399c274ae7')
 
 INSERT INTO Receipts
            (_id, bonusPointsEarned, bonusPointsEarnedReason , createDate, dateScanned , finishedDate ,
    modifyDate , pointsAwardedDate , pointsEarned , purchaseDate , purchasedItemCount , rewardsReceiptItemList,
	rewardsReceiptStatus, totalSpent, userId)
 VALUES ('5ff1e1eb0a720f0523000581', 500.0,'Receipt number 2 completed', '2020-05-16 10:34:09', '2020-05-16 10:34:09', '2020-05-16 10:34:09',
 '2020-05-16 10:34:09','2020-05-16 10:34:09',500.0, '2020-05-16 10:34:09',5,'4014', 'Accepted', 26.0, '5ff1e1eacfcf6c399c274ae7')
 