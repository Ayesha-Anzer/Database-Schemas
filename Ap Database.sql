-- Switch to the 'mysql' database (or any existing database) to check for the existence of 'AP' database
USE mysql;

-- Drop the 'AP' database if it exists
DROP DATABASE IF EXISTS `AP`;

-- Create the 'AP' database
CREATE DATABASE `AP`;

-- Switch to the 'AP' database
USE `AP`;

-- Create the 'ContactUpdates' table
CREATE TABLE `ContactUpdates` (
  `VendorID` INT NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(50),
  `FirstName` VARCHAR(50),
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB;

-- Create the 'GLAccounts' table
CREATE TABLE `GLAccounts` (
  `AccountNo` INT NOT NULL,
  `AccountDescription` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AccountNo`)
) ENGINE=InnoDB;

-- Create the 'InvoiceArchive' table
CREATE TABLE `InvoiceArchive` (
  `InvoiceID` INT NOT NULL,
  `VendorID` INT NOT NULL,
  `InvoiceNumber` VARCHAR(50) NOT NULL,
  `InvoiceDate` DATE NOT NULL,
  `InvoiceTotal` DECIMAL(19, 4) NOT NULL,
  `PaymentTotal` DECIMAL(19, 4) NOT NULL,
  `CreditTotal` DECIMAL(19, 4) NOT NULL,
  `TermsID` INT NOT NULL,
  `InvoiceDueDate` DATE NOT NULL,
  `PaymentDate` DATE
) ENGINE=InnoDB;

-- Create the 'InvoiceLineItems' table
CREATE TABLE `InvoiceLineItems` (
  `InvoiceID` INT NOT NULL,
  `InvoiceSequence` SMALLINT NOT NULL,
  `AccountNo` INT NOT NULL,
  `InvoiceLineItemAmount` DECIMAL(19, 4) NOT NULL,
  `InvoiceLineItemDescription` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`InvoiceID`, `InvoiceSequence`)
) ENGINE=InnoDB;

-- Create the 'Invoices' table
CREATE TABLE `Invoices` (
  `InvoiceID` INT NOT NULL AUTO_INCREMENT,
  `VendorID` INT NOT NULL,
  `InvoiceNumber` VARCHAR(50) NOT NULL,
  `InvoiceDate` DATE NOT NULL,
  `InvoiceTotal` DECIMAL(19, 4) NOT NULL,
  `PaymentTotal` DECIMAL(19, 4) NOT NULL,
  `CreditTotal` DECIMAL(19, 4) NOT NULL,
  `TermsID` INT NOT NULL,
  `InvoiceDueDate` DATE NOT NULL,
  `PaymentDate` DATE,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB;

-- Create the 'Terms' table
CREATE TABLE `Terms` (
  `TermsID` INT NOT NULL AUTO_INCREMENT,
  `TermsDescription` VARCHAR(50) NOT NULL,
  `TermsDueDays` SMALLINT NOT NULL,
  PRIMARY KEY (`TermsID`)
) ENGINE=InnoDB;

-- Create the 'Vendors' table
CREATE TABLE `Vendors` (
  `VendorID` INT NOT NULL AUTO_INCREMENT,
  `VendorName` VARCHAR(50) NOT NULL,
  `VendorAddress1` VARCHAR(50),
  `VendorAddress2` VARCHAR(50),
  `VendorCity` VARCHAR(50) NOT NULL,
  `VendorState` CHAR(2) NOT NULL,
  `VendorZipCode` VARCHAR(20) NOT NULL,
  `VendorPhone` VARCHAR(50),
  `VendorContactLName` VARCHAR(50),
  `VendorContactFName` VARCHAR(50),
  `DefaultTermsID` INT NOT NULL,
  `DefaultAccountNo` INT NOT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB;

-- Insert data into 'ContactUpdates'
INSERT INTO `ContactUpdates` (`VendorID`, `LastName`, `FirstName`) VALUES
(5, 'Davison', 'Michelle'),
(12, 'Mayteh', 'Kendall'),
(17, 'Onandonga', 'Bruce'),
(44, 'Antavius', 'Anthony'),
(76, 'Bradlee', 'Danny'),
(94, 'Suscipe', 'Reynaldo'),
(101, 'O\'Sullivan', 'Geraldine'),
(123, 'Bucket', 'Charles');

-- Insert data into 'GLAccounts'
INSERT INTO `GLAccounts` (`AccountNo`, `AccountDescription`) VALUES
(100, 'Cash'),
(110, 'Accounts Receivable'),
(120, 'Book Inventory'),
(150, 'Furniture'),
(160, 'Computer Equipment'),
(162, 'Capitalized Lease'),
(167, 'Software'),
(170, 'Other Equipment'),
(181, 'Book Development'),
(200, 'Accounts Payable'),
(205, 'Royalties Payable'),
(221, '401K Employee Contributions'),
(230, 'Sales Taxes Payable'),
(234, 'Medicare Taxes Payable'),
(235, 'Income Taxes Payable'),
(237, 'State Payroll Taxes Payable'),
(238, 'Employee FICA Taxes Payable'),
(239, 'Employer FICA Taxes Payable'),
(241, 'Employer FUTA Taxes Payable'),
(242, 'Employee SDI Taxes Payable'),
(243, 'Employer UCI Taxes Payable'),
(251, 'IBM Credit Corporation Payable'),
(280, 'Capital Stock'),
(290, 'Retained Earnings'),
(300, 'Retail Sales'),
(301, 'College Sales'),
(302, 'Trade Sales'),
(306, 'Consignment Sales'),
(310, 'Compositing Revenue'),
(394, 'Book Club Royalties'),
(400, 'Book Printing Costs'),
(403, 'Book Production Costs'),
(500, 'Salaries and Wages'),
(505, 'FICA'),
(506, 'FUTA'),
(507, 'UCI'),
(508, 'Medicare'),
(510, 'Group Insurance'),
(520, 'Building Lease'),
(521, 'Utilities'),
(522, 'Telephone'),
(523, 'Building Maintenance'),
(527, 'Computer Equipment Maintenance'),
(528, 'IBM Lease'),
(532, 'Equipment Rental'),
(536, 'Card Deck Advertising'),
(540, 'Direct Mail Advertising'),
(541, 'Space Advertising'),
(546, 'Exhibits and Shows'),
(548, 'Web Site Production and Fees'),
(550, 'Packaging Materials'),
(551, 'Business Forms'),
(552, 'Postage'),
(553, 'Freight'),
(555, 'Collection Agency Fees'),
(556, 'Credit Card Handling'),
(565, 'Bank Fees'),
(568, 'Auto License Fee'),
(569, 'Auto Expense'),
(570, 'Office Supplies'),
(572, 'Books, Dues, and Subscriptions'),
(574, 'Business Licenses and Taxes'),
(576, 'PC Software'),
(580, 'Meals'),
(582, 'Travel and Accommodations'),
(589, 'Outside Services'),
(590, 'Business Insurance'),
(591, 'Accounting'),
(610, 'Charitable Contributions'),
(611, 'Profit Sharing Contributions'),
(620, 'Interest Paid to Banks'),
(621, 'Other Interest'),
(630, 'Federal Corporation Income Taxes'),
(631, 'State Corporation Income Taxes'),
(632, 'Sales Tax');

-- Insert data into 'InvoiceLineItems'
INSERT INTO `InvoiceLineItems` (`InvoiceID`, `InvoiceSequence`, `AccountNo`, `InvoiceLineItemAmount`, `InvoiceLineItemDescription`) VALUES
(1, 1, 553, 3813.33, 'Freight'),
(2, 1, 553, 40.20, 'Freight'),
(3, 1, 553, 138.75, 'Freight'),
(4, 1, 553, 144.70, 'Int\'l shipment'),
(5, 1, 553, 15.50, 'Freight'),
(6, 1, 553, 42.75, 'Freight'),
(7, 1, 553, 172.50, 'Freight'),
(8, 1, 522, 95.00, 'Telephone service'),
(9, 1, 403, 601.95, 'Cover design'),
(10, 1, 553, 42.67, 'Freight'),
(11, 1, 553, 42.50, 'Freight'),
(12, 1, 580, 50.00, 'DiCicco\'s'),
(12, 2, 570, 75.60, 'Kinko\'s'),
(12, 3, 570, 58.40, 'Office Max'),
(12, 4, 540, 478.00, 'Publishers Marketing'),
(13, 1, 522, 16.33, 'Telephone (line 5)'),
(14, 1, 553, 6.00, 'Freight out'),
(15, 1, 574, 856.92, 'Property Taxes'),
(16, 1, 572, 9.95, 'Monthly access fee'),
(17, 1, 553, 10.00, 'Address correction'),
(18, 1, 553, 104.00, 'Freight'),
(19, 1, 160, 116.54, 'MVS Online Library'),
(20, 1, 553, 6.00, 'Freight out'),
(21, 1, 589, 4901.26, 'Office lease'),
(22, 1, 553, 108.25, 'Freight');

-- Insert data into 'Invoices'
INSERT INTO `Invoices` (`InvoiceID`, `VendorID`, `InvoiceNumber`, `InvoiceDate`, `InvoiceTotal`, `PaymentTotal`, `CreditTotal`, `TermsID`, `InvoiceDueDate`, `PaymentDate`) VALUES
(1, 73, '968799', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(2, 73, '303456', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(3, 3, '3081', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(4, 73, '319446', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(5, 73, '357911', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(6, 73, '366491', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(7, 73, '885008', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(8, 9, '27725', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(9, 73, '94274', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(10, 3, '3082', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(11, 3, '3083', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(12, 23, '3777', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(13, 8, '51528', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(14, 73, '59466', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(15, 1, '8199', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(16, 73, '97525', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(17, 5, '144188', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(18, 9, '32301', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(19, 73, '410347', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(20, 8, '49608', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(21, 73, '534936', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01'),
(22, 73, '87406', '2018-08-01', 7.78, 0.00, 0.00, 1, '2018-08-01', '2018-08-01');

-- Insert data into 'Terms'
INSERT INTO `Terms` (`TermsID`, `TermsDescription`, `TermsDueDays`) VALUES
(1, 'Net 30', 30),
(2, 'Net 60', 60),
(3, 'Net 90', 90);

-- Insert data into 'Vendors'
INSERT INTO `Vendors` (`VendorID`, `VendorName`, `VendorAddress1`, `VendorAddress2`, `VendorCity`, `VendorState`, `VendorZipCode`, `VendorPhone`, `VendorContactLName`, `VendorContactFName`, `DefaultTermsID`, `DefaultAccountNo`) VALUES
(1, 'BAE SYSTEMS', '1234 Central Blvd.', 'Suite 100', 'Santa Clara', 'CA', '95050', '408-123-4567', 'Smith', 'John', 1, 100),
(2, 'Sierra Systems', '5678 Industrial Rd.', NULL, 'San Jose', 'CA', '95112', '408-234-5678', 'Doe', 'Jane', 2, 110),
(3, 'Lockheed Martin', '9012 Lockheed Dr.', NULL, 'Sunnyvale', 'CA', '94086', '408-345-6789', 'Brown', 'Charlie', 1, 120),
(4, 'Northrop Grumman', '3456 Space Way', NULL, 'Redwood City', 'CA', '94065', '650-987-6543', 'White', 'Alice', 3, 150),
(5, 'General Dynamics', '7890 Aerospace Blvd.', NULL, 'Mountain View', 'CA', '94040', '650-765-4321', 'Black', 'David', 1, 160);
DELETE FROM ContactUpdates 
WHERE VendorID NOT IN (SELECT VendorID FROM Vendors);

DELETE FROM Invoices 
WHERE VendorID NOT IN (SELECT VendorID FROM Vendors);

DELETE FROM InvoiceLineItems 
WHERE AccountNo NOT IN (SELECT AccountNo FROM GLAccounts);

DELETE FROM InvoiceLineItems 
WHERE AccountNo NOT IN (SELECT AccountNo FROM GLAccounts);

-- Add foreign key constraint to 'ContactUpdates' table
ALTER TABLE `ContactUpdates`
ADD CONSTRAINT `fk_contactupdates_vendors`
FOREIGN KEY (`VendorID`) REFERENCES `Vendors`(`VendorID`);

-- Add foreign key constraint to 'InvoiceArchive' table
ALTER TABLE `InvoiceArchive`
ADD CONSTRAINT `fk_invoicearchive_vendors`
FOREIGN KEY (`VendorID`) REFERENCES `Vendors`(`VendorID`),
ADD CONSTRAINT `fk_invoicearchive_terms`
FOREIGN KEY (`TermsID`) REFERENCES `Terms`(`TermsID`);



-- Add foreign key constraints to 'Invoices' table
ALTER TABLE `Invoices`
ADD CONSTRAINT `fk_invoices_vendors`
FOREIGN KEY (`VendorID`) REFERENCES `Vendors`(`VendorID`),
ADD CONSTRAINT `fk_invoices_terms`
FOREIGN KEY (`TermsID`) REFERENCES `Terms`(`TermsID`);

-- Add foreign key constraints to 'Vendors' table
ALTER TABLE `Vendors`
ADD CONSTRAINT `fk_vendors_terms`
FOREIGN KEY (`DefaultTermsID`) REFERENCES `Terms`(`TermsID`),
ADD CONSTRAINT `fk_vendors_glaccounts`
FOREIGN KEY (`DefaultAccountNo`) REFERENCES `GLAccounts`(`AccountNo`);
-- Temporarily disable foreign key checks so that you can add the foreign key constraint without errors.

SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `invoicelineitems`
ADD CONSTRAINT `fk_invoiceline`
FOREIGN KEY (`invoiceid`) REFERENCES `invoices`(`invoiceid`);



-- Update the 'Invoices' table to set 'InvoiceTotal' values between 1000 and 5000
UPDATE `Invoices`
SET `InvoiceTotal` = ROUND(1000 + (RAND() * 4000), 2); -- Generates random values between 1000 and 5000
