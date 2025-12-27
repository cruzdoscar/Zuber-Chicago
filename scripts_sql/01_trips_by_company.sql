SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips ON trips.cab_id = cabs.cab_id
WHERE
    trips.start_ts::date IN ('2017-11-15', '2017-11-16')
GROUP BY 
    cabs.company_name
ORDER BY 
    trips_amount DESC;