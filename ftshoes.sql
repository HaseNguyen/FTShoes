create database	ftshoes; 
use ftshoes;

/*--TABLE ROLE*/
CREATE TABLE IF NOT EXISTS roles (
   Role_id VARCHAR(100) NOT NULL,
   NameRole VARCHAR(30) NOT NULL,
   description VARCHAR(255),
   CONSTRAINT pk_role PRIMARY KEY(role_id)
);

/*--TABLE MEMBER*/
CREATE TABLE IF NOT EXISTS members (
	Member_id VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    NameMember VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    GenderMember VARCHAR(20),
    Role_id VARCHAR (100) NOT NULL,
    CONSTRAINT pk_member PRIMARY KEY(Member_id),
    CONSTRAINT fk_member_role FOREIGN KEY (Role_id) REFERENCES roles(Role_id) ON DELETE CASCADE
);

/*--TABLE PRODUCER(NHA SAN XUAT)*/
CREATE TABLE IF NOT EXISTS producer (
	Producer_id VARCHAR(100) NOT NULL,
    NameProducer VARCHAR(100) NOT NULL,
    Phone	VARCHAR(20),
    Address VARCHAR(255),
    CONSTRAINT pk_producer PRIMARY KEY(Producer_id)
);

/*--TABLE PRODUCT(SAN PHAM)*/
CREATE TABLE IF NOT EXISTS product (
	Product_id VARCHAR(100) NOT NULL,
    NameProduct VARCHAR(100) NOT NULL,
    TypeProduct VARCHAR(100),
    AmountProduct VARCHAR(100) NOT NULL,
    Size INT,
    DayInput DATE,
    Producer_id VARCHAR(100) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(Product_id),
    CONSTRAINT fk_product_producer FOREIGN KEY (Producer_id) REFERENCES producer(Producer_id) ON DELETE CASCADE
);

/*--TABLE CUSTOMER*/
CREATE TABLE IF NOT EXISTS customer (
	Customer_id VARCHAR(100) NOT NULL,
    NameCustomer VARCHAR(100) NOT NULL,
    PhoneCustomer VARCHAR(20),
    GenderCustomer VARCHAR(20), 
    CONSTRAINT pk_customer PRIMARY KEY(Customer_id)
);

/*--TABLE SALE INVOICES (HOA DON)*/
CREATE TABLE IF NOT EXISTS saleInvoices (
	Sale_id VARCHAR(100) NOT NULL,
    Member_id VARCHAR(100) NOT NULL,
    Customer_id VARCHAR(100) NOT NULL,
    DayOutput DATE,
    TotalMoney DECIMAL(19,4),
    TotalInput Decimal(19,4),
    TolalOutput Decimal(19,4),
    CONSTRAINT pk_saleInvoices PRIMARY KEY(Sale_id ),
    CONSTRAINT fk_pk_saleInvoices_member FOREIGN KEY (Member_id) REFERENCES members(Member_id) ON DELETE CASCADE,
    CONSTRAINT fk_pk_saleInvoices_customer FOREIGN KEY (Customer_id) REFERENCES customer(Customer_id) ON DELETE CASCADE   
);

/*--TABLE DETAIL INVOICES (CHI TIET HOA DON) */
CREATE TABLE IF NOT EXISTS detailInvoices (
	Sale_id VARCHAR(100) NOT NULL,
    Product_id VARCHAR(100) NOT NULL,
    Amount INT,
    Price DECIMAL(19,4),
    CONSTRAINT pk_detailInvoices PRIMARY KEY(Sale_id , Product_id),
    CONSTRAINT fk_pk_detailInvoices_saleInvoices FOREIGN KEY (Sale_id) REFERENCES saleInvoices(Sale_id) ON DELETE CASCADE,
    CONSTRAINT fk_pk_detailInvoices_product FOREIGN KEY (Product_id) REFERENCES product(Product_id) ON DELETE CASCADE  
);
