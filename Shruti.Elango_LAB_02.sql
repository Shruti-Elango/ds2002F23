#Create Schema
CREATE SCHEMA 'stock_port';

#Creating tables
CREATE TABLE `stock_port`.`company_tbl` (
  `company_name` VARCHAR(45) NOT NULL,
  `stock_ticker` VARCHAR(45) NULL,
  `industry` VARCHAR(45) NULL,
  PRIMARY KEY (`company_name`));
  
CREATE TABLE `stock_port`.`current_port` (
  `stock_ticker` VARCHAR(45) NOT NULL,
  `number_shares` INT NOT NULL,
  `date_purchased` DATE NOT NULL,
  `price_purchased` DECIMAL(10,0) NOT NULL,
  `current_price` DECIMAL(10,0) NULL,
  PRIMARY KEY (`stock_ticker`));


USE stock_port;
#first table--> current portfolio

INSERT INTO current_port (stock_ticker, number_shares, date_purchased, price_purchased, current_price) VALUES
	("AAPL", 10, '2022-10-31', 152.44, 179.36),
    ("AMZN", 20, '2022-11-25', 93.41, 143.10),
    ("T", 30, '2023-09-07', 14.61, 14.52),
    ("DIS", 40, '2023-09-05', 81.19, 82.52),
    ("PFE", 50, '2022-10-10', 40.13, 33.94);
    
select * from current_port;
# 2nd table--> company 

INSERT INTO company_tbl (company_name, stock_ticker, industry) VALUES
	("Apple INC", "AAPL", "Electronics"),
    ("Amazon.com INC", "AMZN", "Internet Retail"),
    ("The Walt Disney Company", "DIS", "Entertainment"),
    ("AT&T INC", "T", "Telecom"),
    ("Pfizer", "PFE", "Drug Manufacturers");
    
select * from company_tbl;

#SQL
select company_name as "Company Name", current_port.stock_ticker as "Ticker", number_shares as "Number of Shares", price_purchased as "Price Purchased", current_price as "Current Price"
FROM current_port, company_tbl
WHERE current_port.stock_ticker = company_tbl. stock_ticker;

