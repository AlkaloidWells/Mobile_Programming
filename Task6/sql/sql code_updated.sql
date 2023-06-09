
CREATE TABLE Account( 
   AccountID          INT PRIMARY KEY,
   Account_ype        VARCHAR(20) NOT NULL,
   Account_name       VARCHAR(20) NOT NULL,
   Password           VARCHAR(20) NOT NULL
  
 );


CREATE TABLE Users(
   UserID          INT PRIMARY KEY,
   AccountID	   INT not null,
   First_name      VARCHAR(50) NOT NULL,
   Last_name       VARCHAR(50) NOT NULL,
   Email           VARCHAR(50) NOT NULL,
   Phone_number    VARCHAR(20) NOT NULL,
   Location        VARCHAR(50) NOT NULL
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
   );
   

CREATE TABLE Post(
   PostID          INT PRIMARY KEY,
   UserID          int not null,
   Post_name       VARCHAR(50) NOT NULL,
   Post_location   VARCHAR(50) NOT NULL,
   Price           INT(50)     NOT NULL,
   Status          VARCHAR(20) NOT NULL,
   Post_date       DATETIME    NOT NULL,
   FOREIGN KEY (UserID) REFERENCES Users (UserID)
 );

CREATE TABLE Message(
   MessageID         INT PRIMARY KEY,
   PostID            INT not null,
   sender_id        int not null,
   Status            VARCHAR(20) NOT NULL,
   Message_date      DATETIME    NOT NULL,
   message           varchar(255),
   FOREIGN KEY (sender_id) REFERENCES Users (UserID),
   FOREIGN KEY (PostID) REFERENCES Post (PostID)
 );

CREATE TABLE Notification(
   NotificationID        INT PRIMARY KEY,
   receiver_id           int null,
   Notification_type     VARCHAR(50) NOT NULL,
   Status                VARCHAR(20) NOT NULL,
   Notification_date     DATETIME    NOT NULL,
   Netifiction           VARCHAR(255),
   FOREIGN KEY (receiver_id) REFERENCES Users (UserID)
 );


CREATE TABLE Wallet(
   WalletID          INT PRIMARY KEY,
   UserID          int not null,
   Balance           INT         NOT NULL,
   Last_update       DATETIME    NOT NULL,
   FOREIGN KEY (UserID) REFERENCES Users (UserID)
 );

CREATE TABLE History( 
   HistoryID          INT PRIMARY KEY,
   UserID          int not null,
   History_type       VARCHAR(50) NOT NULL,
   Event_tittle       VARCHAR(20) NOT NULL,
   History_date       DATETIME    NOT NULL,
   FOREIGN KEY (UserID) REFERENCES Users (UserID)
  );

  
CREATE TABLE Transactions(
   TransactionID         INT PRIMARY KEY,
   WalletID               INT not null,
   Transaction_type      VARCHAR(20) NOT NULL,
   Transaction_amount    INT         NOT NULL,
   Transaction_date      DATETIME    NOT NULL,
   FOREIGN KEY (WalletID) REFERENCES Wallet (WalletID),
 );

