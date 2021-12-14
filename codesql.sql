#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Categories
#------------------------------------------------------------

CREATE TABLE Categories(
        CategoryID   Varchar (30) NOT NULL ,
        CategoryName Varchar (30) NOT NULL
	,CONSTRAINT Categories_PK PRIMARY KEY (CategoryID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Undercategory
#------------------------------------------------------------

CREATE TABLE Undercategory(
        UndercategoryID       Varchar (30) NOT NULL ,
        UndercategoryName     Varchar (30) NOT NULL ,
        CategoryID            Varchar (30) NOT NULL ,
        CategoryID_Categories Varchar (30) NOT NULL
	,CONSTRAINT Undercategory_PK PRIMARY KEY (UndercategoryID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Market
#------------------------------------------------------------

CREATE TABLE Market(
        MarketID      Varchar (30) NOT NULL ,
        MarketDate    Date NOT NULL ,
        MarketPlace   Varchar (30) NOT NULL ,
        ProducerID    Varchar (30) NOT NULL ,
        MarketZipCode Varchar (30) NOT NULL
	,CONSTRAINT Market_PK PRIMARY KEY (MarketID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Producer
#------------------------------------------------------------

CREATE TABLE Producer(
        ProducerID      Varchar (30) NOT NULL ,
        ProducerZipCode Int NOT NULL
	,CONSTRAINT Producer_PK PRIMARY KEY (ProducerID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Products
#------------------------------------------------------------

CREATE TABLE Products(
        ProductsID             Varchar (30) NOT NULL ,
        ProductsName           Varchar (30) NOT NULL ,
        ProducerID             Varchar (30) NOT NULL ,
        ProductsDescription    Varchar (30) NOT NULL ,
        ProductsPrice          Varchar (30) NOT NULL ,
        ProductsPricekg        Varchar (50) NOT NULL ,
        CategoryID             Varchar (50) NOT NULL ,
        UndercategoryID        Varchar (50) NOT NULL ,
        ProductsDateOfArrival  Date NOT NULL ,
        ProductsStorage        Varchar (30) NOT NULL ,
        ProductsMaxStorageTime Varchar (50) NOT NULL ,
        ProductsQuantity       Varchar (50) NOT NULL ,
        ProducerID_catalog     Varchar (30) NOT NULL ,
        CategoryID_Categories  Varchar (30) NOT NULL
	,CONSTRAINT Products_PK PRIMARY KEY (ProductsID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Saletype
#------------------------------------------------------------

CREATE TABLE Saletype(
        ID_saletype Varchar (30) NOT NULL ,
        OrderID     Varchar (30) NOT NULL
	,CONSTRAINT Saletype_PK PRIMARY KEY (ID_saletype)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Packaging
#------------------------------------------------------------

CREATE TABLE Packaging(
        PackagingID Varchar (30) NOT NULL
	,CONSTRAINT Packaging_PK PRIMARY KEY (PackagingID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Payment
#------------------------------------------------------------

CREATE TABLE Payment(
        PaymentID Varchar (30) NOT NULL ,
        OrderID   Varchar (30) NOT NULL
	,CONSTRAINT Payment_PK PRIMARY KEY (PaymentID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Modedelivery
#------------------------------------------------------------

CREATE TABLE Modedelivery(
        ModedeliveryID   Varchar (30) NOT NULL ,
        ModedeliveryName Varchar (30) NOT NULL
	,CONSTRAINT Modedelivery_PK PRIMARY KEY (ModedeliveryID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Delivery
#------------------------------------------------------------

CREATE TABLE Delivery(
        DeliveryID          Varchar (30) NOT NULL ,
        DeliveryDelay       Varchar (30) NOT NULL ,
        DeliveryZipCode     Int NOT NULL ,
        ModedeliveryID      Varchar (30) NOT NULL ,
        ModedeliveryID_type Varchar (30) NOT NULL
	,CONSTRAINT Delivery_PK PRIMARY KEY (DeliveryID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Orders
#------------------------------------------------------------

CREATE TABLE Orders(
        OrderID         Varchar (30) NOT NULL ,
        StatusID        Varchar (30) NOT NULL ,
        ClientID        Varchar (30) NOT NULL ,
        Total_price     Varchar (30) NOT NULL ,
        BillID          Varchar (30) NOT NULL ,
        PaymentID       Varchar (30) NOT NULL ,
        PackagingID     Varchar (30) NOT NULL ,
        ID_saletype     Varchar (30) NOT NULL ,
        MarketID        Varchar (30) NOT NULL ,
        PackagingID_use Varchar (30) NOT NULL ,
        DeliveryID      Varchar (30) NOT NULL
	,CONSTRAINT Orders_PK PRIMARY KEY (OrderID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Shipping_Status
#------------------------------------------------------------

CREATE TABLE Shipping_Status(
        StatusID   Varchar (30) NOT NULL ,
        StatusName Varchar (30) NOT NULL
	,CONSTRAINT Shipping_Status_PK PRIMARY KEY (StatusID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: composed of 
#------------------------------------------------------------

CREATE TABLE composed_of(
        ProductsID Varchar (30) NOT NULL ,
        OrderID    Varchar (30) NOT NULL
	,CONSTRAINT composed_of_PK PRIMARY KEY (ProductsID,OrderID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: defined by 
#------------------------------------------------------------

CREATE TABLE defined_by(
        StatusID Varchar (30) NOT NULL ,
        OrderID  Varchar (30) NOT NULL
	,CONSTRAINT defined_by_PK PRIMARY KEY (StatusID,OrderID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        ClientID          Varchar (30) NOT NULL ,
        Client_Account_ID Varchar (30) NOT NULL ,
        ID_customer       Varchar (50) NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (ClientID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client_account
#------------------------------------------------------------

CREATE TABLE Client_account(
        ID_customer       Varchar (50) NOT NULL ,
        Client_Account_ID Varchar (50) NOT NULL ,
        Account_Username  Varchar (50) NOT NULL ,
        Account_Password  Varchar (50) NOT NULL ,
        Client_FirstName  Varchar (50) NOT NULL ,
        Client_LastName   Varchar (50) NOT NULL ,
        Client_Country    Varchar (50) NOT NULL ,
        Client_City       Varchar (50) NOT NULL ,
        Client_ZipCode    Varchar (50) NOT NULL ,
        Client_Address    Varchar (50) NOT NULL ,
        Client_Phone      Varchar (50) NOT NULL ,
        Fidelity_Points   Int NOT NULL ,
        ClientID          Varchar (30) NOT NULL
	,CONSTRAINT Client_account_PK PRIMARY KEY (ID_customer)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Bills
#------------------------------------------------------------

CREATE TABLE Bills(
        BillID                Varchar (30) NOT NULL ,
        total_price           Float NOT NULL ,
        Date_sale             Date NOT NULL ,
        Shipping_Status_price Varchar (30) NOT NULL ,
        OrderID               Varchar (50) NOT NULL ,
        ClientID              Varchar (30) NOT NULL ,
        PaymentID             Varchar (30) NOT NULL
	,CONSTRAINT Bills_PK PRIMARY KEY (BillID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: place an
#------------------------------------------------------------

CREATE TABLE place_an(
        OrderID  Varchar (30) NOT NULL ,
        ClientID Varchar (30) NOT NULL
	,CONSTRAINT place_an_PK PRIMARY KEY (OrderID,ClientID)
)ENGINE=InnoDB;




ALTER TABLE Undercategory
	ADD CONSTRAINT Undercategory_Categories0_FK
	FOREIGN KEY (CategoryID_Categories)
	REFERENCES Categories(CategoryID);

ALTER TABLE Products
	ADD CONSTRAINT Products_Producer0_FK
	FOREIGN KEY (ProducerID_catalog)
	REFERENCES Producer(ProducerID);

ALTER TABLE Products
	ADD CONSTRAINT Products_Categories1_FK
	FOREIGN KEY (CategoryID_Categories)
	REFERENCES Categories(CategoryID);

ALTER TABLE Delivery
	ADD CONSTRAINT Delivery_Modedelivery0_FK
	FOREIGN KEY (ModedeliveryID_type)
	REFERENCES Modedelivery(ModedeliveryID);

ALTER TABLE Orders
	ADD CONSTRAINT Orders_Saletype0_FK
	FOREIGN KEY (ID_saletype)
	REFERENCES Saletype(ID_saletype);

ALTER TABLE Orders
	ADD CONSTRAINT Orders_Market1_FK
	FOREIGN KEY (MarketID)
	REFERENCES Market(MarketID);

ALTER TABLE Orders
	ADD CONSTRAINT Orders_Packaging2_FK
	FOREIGN KEY (PackagingID_use)
	REFERENCES Packaging(PackagingID);

ALTER TABLE Orders
	ADD CONSTRAINT Orders_Delivery3_FK
	FOREIGN KEY (DeliveryID)
	REFERENCES Delivery(DeliveryID);

ALTER TABLE composed_of
	ADD CONSTRAINT composed_of_Products0_FK
	FOREIGN KEY (ProductsID)
	REFERENCES Products(ProductsID);

ALTER TABLE composed_of
	ADD CONSTRAINT composed_of_Orders1_FK
	FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID);

ALTER TABLE defined_by
	ADD CONSTRAINT defined_by_Shipping_Status0_FK
	FOREIGN KEY (StatusID)
	REFERENCES Shipping_Status(StatusID);

ALTER TABLE defined_by
	ADD CONSTRAINT defined_by_Orders1_FK
	FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID);

ALTER TABLE Client
	ADD CONSTRAINT Client_Client_account0_FK
	FOREIGN KEY (ID_customer)
	REFERENCES Client_account(ID_customer);

ALTER TABLE Client 
	ADD CONSTRAINT Client_Client_account0_AK 
	UNIQUE (ID_customer);

ALTER TABLE Client_account
	ADD CONSTRAINT Client_account_Client0_FK
	FOREIGN KEY (ClientID)
	REFERENCES Client(ClientID);

ALTER TABLE Client_account 
	ADD CONSTRAINT Client_account_Client0_AK 
	UNIQUE (ClientID);

ALTER TABLE Bills
	ADD CONSTRAINT Bills_Client0_FK
	FOREIGN KEY (ClientID)
	REFERENCES Client(ClientID);

ALTER TABLE Bills
	ADD CONSTRAINT Bills_Payment1_FK
	FOREIGN KEY (PaymentID)
	REFERENCES Payment(PaymentID);

ALTER TABLE place_an
	ADD CONSTRAINT place_an_Orders0_FK
	FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID);

ALTER TABLE place_an
	ADD CONSTRAINT place_an_Client1_FK
	FOREIGN KEY (ClientID)
	REFERENCES Client(ClientID);
