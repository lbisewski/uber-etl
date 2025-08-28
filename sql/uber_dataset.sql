-- Criação do schema e tabela do projeto Uber Dataset

CREATE SCHEMA uber_dataset;
USE uber_dataset;

CREATE TABLE IF NOT EXISTS `uberRides` (
  `Booking_ID` VARCHAR(20) PRIMARY KEY,
  `DateTime` DATETIME NOT NULL,
  `Booking_Status` VARCHAR(30) NOT NULL,
  `Customer_ID` VARCHAR(20) NOT NULL,
  `Vehicle_Type` VARCHAR(20) NOT NULL,
  `Pickup_Location` VARCHAR(60) NOT NULL,
  `Drop_Location` VARCHAR(60) NOT NULL,
  `Avg_VTAT` DECIMAL(10,2),
  `Avg_CTAT` DECIMAL(10,2),
  `Cancelled_Rides_by_Customer` TINYINT(1) NOT NULL,
  `Reason_for_cancelling_by_Customer` VARCHAR(150),
  `Cancelled_Rides_by_Driver` TINYINT(1) NOT NULL,
  `Driver_Cancellation_Reason` VARCHAR(150),
  `Incomplete_Rides` TINYINT(1) NOT NULL,
  `Incomplete_Rides_Reason` VARCHAR(150),
  `Booking_Value` DECIMAL(10,2),
  `Ride_Distance` DECIMAL(10,2),
  `Driver_Ratings` DECIMAL(2,1),
  `Customer_Rating` DECIMAL(2,1),
  `Payment_Method` VARCHAR(15)
);
