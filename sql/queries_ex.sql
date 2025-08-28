-- Exemplos de teste

USE uber_dataset;

SELECT * FROM uberRides;

SELECT COUNT(Cancelled_Rides_by_Driver)
FROM uberRides
WHERE Cancelled_Rides_by_Driver = 1;

SELECT AVG(Booking_Value) 
FROM uberRides
WHERE Booking_Status = 'Completed';

SELECT DATE(DateTime) AS dia, COUNT(*) AS total_corridas
FROM uberRides
GROUP BY dia
ORDER BY dia;