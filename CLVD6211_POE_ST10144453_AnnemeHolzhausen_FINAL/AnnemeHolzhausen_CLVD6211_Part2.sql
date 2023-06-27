--Creating Database
CREATE DATABASE st10144453_clvd6211_poe2__

--Using Databasse 
USE st10144453_clvd6211_poe2__

--Creating Car Make Table 
CREATE TABLE CAR_MAKE 
(
	CarMakeID VARCHAR(50) NOT NULL,
	CarMakeDescription VARCHAR(50) NOT NULL,
	--Creating constraints 
	CONSTRAINT PK_CAR_MAKE PRIMARY KEY (CarMakeID) 
)

--Creating Car Body Type Table 
CREATE TABLE CAR_BODY_TYPE
(
	CarBodyTypeID VARCHAR(10) NOT NULL, 
	CarModelDescription VARCHAR(50) NOT NULL, 
	--Creating Constraints 
	CONSTRAINT PK_CAR_BODY_TYPE PRIMARY KEY (CarBodyTypeID)
)

--Creating Car Table 
CREATE TABLE CAR
(
	CarNo VARCHAR(10) NOT NULL, 
	CarMake VARCHAR(50) NOT NULL, 
	BodyType VARCHAR(10) NOT NULL,
	Model VARCHAR(100) NOT NULL, 
	KMTravelled INT NOT NULL, 
	ServiceKM INT NOT NULL, 
	Avaliable VARCHAR(10) NOT NULL,
	--Creating Constraints 
	CONSTRAINT PK_CAR PRIMARY KEY (CarNo),
	CONSTRAINT FK_CAR_CAR_MAKE FOREIGN KEY (CarMake) REFERENCES CAR_MAKE(CarMakeID),
	CONSTRAINT FK_CAR_CAR_BODY_TYPE FOREIGN KEY (BodyType) REFERENCES CAR_BODY_TYPE(CarBodyTypeID)
);

--Creating Inspector Table 
CREATE TABLE INSPECTOR
(
	InspectorNo VARCHAR(100) NOT NULL, 
	InspectorName VARCHAR(100) NOT NULL, 
	Email VARCHAR(100) NOT NULL, 
	Mobile INT NOT NULL,
	--Creating Constraints 
	CONSTRAINT PK_INSPECTOR PRIMARY KEY (InspectorNo)
)

--Creating Driver Table 
CREATE TABLE DRIVER
(
	DriverID VARCHAR(100) NOT NULL,
	DriverName VARCHAR(100) NOT NULL, 
	DriverAddress VARCHAR(200) NOT NULL, 
	Email VARCHAR(1000) NOT NULL, 
	Mobile INT NOT NULL,
	--Creating Constraints 
	CONSTRAINT PK_DRIVER PRIMARY KEY (DriverID)
)

--Create Rental Table 
CREATE TABLE RENTAL 
(
	RentalID VARCHAR(10) NOT NULL, 
	CarNumber VARCHAR(10) NOT NULL, 
	Inspector VARCHAR(100) NOT NULL, 
	Driver VARCHAR(100) NOT NULL,
	RentalFee INT NOT NULL, 
	StartDate DATE NOT NULL, 
	EndDate DATE NOT NULL,
	--Creating Constraints 
	CONSTRAINT PK_RENTAL PRIMARY KEY (RentalID),
	CONSTRAINT FK_RENTAL_CAR FOREIGN KEY (CarNumber) REFERENCES CAR(CarNo),
	CONSTRAINT FK_RENTAL_INSPECTOR FOREIGN KEY (Inspector) REFERENCES INSPECTOR(InspectorNo),
	CONSTRAINT FK_RENTAL_DRIVER FOREIGN KEY (Driver) REFERENCES DRIVER(DriverID)
);

--Creating Return Table 
CREATE TABLE RETURNCAR 
(
	ReturnID VARCHAR(10) NOT NULL, 
	CarNo VARCHAR(10) NOT NULL, 
	Inspector VARCHAR(100) NOT NULL, 
	Driver VARCHAR(100) NOT NULL, 
	ReturnDate DATETIME NOT NULL, 
	ElapsedDate INT NOT NULL, 
	Fine INT NOT NULL,
	--Creating Constraints 
	CONSTRAINT PK_RETURNCAR PRIMARY KEY (ReturnID),
	CONSTRAINT FK_RETURNCAR_CAR FOREIGN KEY (CarNo) REFERENCES CAR(CarNo),
	CONSTRAINT FK_RETURNCAR_INSPECTOR FOREIGN KEY (Inspector) REFERENCES INSPECTOR(InspectorNo),
	CONSTRAINT FK_RETURNCAR_DRIVER FOREIGN KEY (Driver) REFERENCES DRIVER(DRIVERID)
);
--populating CAR_MAKE Table 
INSERT INTO CAR_MAKE (CarMakeID, CarMakeDescription) VALUES
('Make01', 'Hyundai'), 
('Make02', 'BMW'), 
('Make03', 'Mercedes Benz'), 
('Make04', 'Toyota'), 
('Make05', 'Ford'); 

--populating CAR_BODY_TYPE Table
INSERT INTO CAR_BODY_TYPE (CarBodyTypeID, CarModelDescription) VALUES 
('Body01', 'Hatchback'), 
('Body02', 'Sedan'), 
('Body03', 'Coupe'), 
('Body04', 'SUV'); 

--populating CAR Table
INSERT INTO CAR (CarNo, CarMake, Model, BodyType, KMTravelled, ServiceKM, Avaliable) VALUES 
('HYU001', 'Hyundai', 'Grand i10 1.0 Motion', 'Hatchback', 1500, 15000, 'yes'),
('HYU002', 'Hyundai', 'i20 1.2 Fluid', 'Hatchback', 3000, 15000, 'yes'), 
('BMW001', 'BMW', '32od 1.2', 'Seddan', 20000, 50000, 'yes'), 
('BMW002', 'BMW', '240d 1.4', 'Sedan', 9500, 15000, 'yes'), 
('TOY001', 'Toyota', 'Corolla 1.0', 'Sedan', 15000, 50000, 'yes'), 
('TOY002', 'Toyota', 'Avanza 1.0', 'SUV', 98000, 15000, 'yes'), 
('TOY003', 'Toyota', 'Corolla Quest 1.0', 'Sedan', 15000, 50000, 'yes'), 
('MER001', 'Mercedes Benz', 'c180', 'Sedan', 5200, 15000, 'yes'), 
('MER001', 'Mercedes Benz', 'A200 Sedan', 'Sedan', 4080, 15000, 'yes'), 
('FOR001', 'Ford', 'Fiesta 1.0', 'Sedan', 7600, 15000, 'yes'); 

--populating INSPECTOR Table
INSERT INTO INSPECTOR (InspectorNo, InspectorName, Email, Mobile) VALUES 
('I101', 'Bud Barnes', 'bud@therideyourent.com', 0837113269), 
('I102', 'Tracy Reeves', 'tracy@therideyourent.com', 0822889988), 
('I103', 'Sandra Goodwin', 'sasndra@therideyourent.com', 0837695468),
('I104', 'Shannon Burke', 'shannon@therideyourent.com', 0836802514); 

--populating DRIVER Table 
INSERT INTO DRIVER (DriverID, DriverName, DriverAddress, Email, Mobile) VALUES
('D001', 'Gabrielle Clarke', '917 Heuvel St Botshabelo Free State 9718', 'gorix10987@macauvpn.com', 0837113269), 
('D002', 'Geoffrey Franklin', '1114 Dorp St Paarl Western Cape 7655', 'noceti8743@drlatvia.com', 0847728052), 
('D003', 'Fawn Cooke', '2158 Prospect St Garsfontein Gauteng 0042', 'yegifav388@enamelme.com', 0821966584), 
('D004', 'Darlene Peters', '2529 St. John Street Somerset West Western Cape 7110', 'mayeka4267@macauvpn.com', 0841221244),
('D005', 'Vita Soto', '1474 Wolmarans St Sundra Mpumalanga 2200', 'wegog55107@drlatvia.com', 0824567924), 
('D006', 'Opal Rehbein', '697 Thutlwa St Letaba Limpopo 0870', 'yiyow34505@enpaypal.com', 0826864938),
('D007', 'Vernon Hodgson', '1935 Thutlwa St Letsitele Limpopo 0885', 'gifeh11935@enamelme.com', 0855991446),
('D008', 'Crispin Wheatly', '330 Sandown Rd Cape Town Western Cape 8018', 'likon78255@macauvpn.com', 0838347945),
('D009', 'Melanie Cunningham', '616 Loop St Atlantis Western Cape 7350', 'sehapeb835@macauvpn.com', 0827329001),
('D010', 'Kevin Peay', '814 Daffodil Dr Elliotdale Eastern Cape 5118', 'xajic53991@enpaypal.com', 0832077149);

--populating RENTAL Table 
INSERT INTO RENTAL (RentalID, CarNumber, Inspector, Driver, RentalFee, StartDate, EndDate) VALUES
('RENT001', 'HYU001', 'Bud Barnes', 'Gabrielle Clarke', 5000, '2021-08-30', '2021-08-31'), 
('RENT002', 'HYU002', 'Bud Barnes', 'Gabrielle Clarke', 5000, '2021-09-01', '2021-09-10'), 
('RENT003', 'FOR001', 'Bud Barnes', 'Geoffrey Franklin', 6500, '2021-09-01', '2021-09-10'), 
('RENT004', 'BMW002', 'Tracy Reeves', 'Vita Soto', 7000, '2021-09-20', '2021-09-25'), 
('RENT005', 'TOY002', 'Tracy Reeves', 'Darelene Peters', 5000, '2021-10-03', '2021-10-31'), 
('RENT006', 'MER001', 'Sandra Goodwin', 'Darelene Peters', 8000, '2021-10-05', '2021-10-15'), 
('RENT007', 'HYU002', 'Shannon Burke', 'Vernon Hodgson', 5000, '2021-12-01', '2022-02-10'), 
('RENT008', 'TOY003', 'Shannon Burke', 'Melanie Cunningham', 5000, '2021-08-10', '2021-08-31'); 

--Populating RETURNCAR Table 
INSERT INTO RETURNCAR (ReturnID, CarNo, Inspector, Driver, ReturnDate, ElapsedDate, fine) VALUES
('RETURN001', 'HYU001', 'Bud Barnes', 'Gabrielle Clarke', '2021-08-31', 0, 0), 
('RETURN002', 'HYU002', 'Bud Barnes', 'Gabrielle Clarke', '2021-09-10', 0, 0), 
('RETURN003', 'FOR001', 'Bud Barnes', 'Geoffrey Franklin', '2021-09-10', 0, 0), 
('RETURN004', 'BMW002', 'Tracy Reeves', 'Vita Soto', '2021-09-30', 5, 2500), 
('RETURN005', 'TOY002', 'Tracy Reeves', 'Darlene Peters', '2021-10-31', 2, 1000), 
('RETURN006', 'MER001', 'Sandra Goodwin', 'Darlene Peters', '2021-10-15', 1, 500), 
('RETURN007', 'HYU002', 'Shannon Burke', 'Vernon Hodgson', '2021-02-10', 0, 0), 
('RETURN008', 'TOY003', 'Shannon Burke', 'Melanie Cunningham', '2021-08-31', 0, 0); 

--Query returning rentals between dates 
SELECT * FROM RENTAL WHERE Driver = 'Bud Barnes' ORDER BY RentalID DESC;
SELECT * FROM RETURNCAR WHERE CarNo IN ('TOY002', 'TOY003') ORDER BY ReturnDate;
SELECT COUNT(*) FROM RENTAL WHERE CarNumber IN ('HYU001', 'HYU002');
UPDATE CAR SET Model = 'Focus' WHERE CarNo = 'FOR001';
SELECT RENTAL.CarNumber, RENTAL.Driver AS DriverName, RENTAL.RentalFee, RENTAL.StartDate, RENTAL.EndDate, CAR.Available FROM RENTAL INNER JOIN CAR ON RENTAL.CarNo = Cars.CarNo WHERE Cars.Available = 'Yes' ORDER BY StartDate ASC;SELECT DISTINCT CarMake FROM CAR;
SELECT DISTINCT CarMake FROM CAR ORDER BY CarMake ASC;
SELECT CarNo FROM CAR WHERE ServiceKm <= 9000 ORDER BY CarNo ASC;
SELECT RentalID, (ReturnDate, EndDate) * 500 AS LateFee FROM RETURNCAR,RENTAL WHERE ReturnDate > EndDate ORDER BY RentalID ASC;