SELECT 
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM 
    cabs AS c
INNER JOIN 
    trips AS t ON t.cab_id = c.cab_id
WHERE
    (c.company_name LIKE '%Yellow%' OR c.company_name LIKE '%Blue%') AND (t.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07')
GROUP BY 
    c.company_name;