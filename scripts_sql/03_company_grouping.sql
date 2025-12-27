SELECT 
    CASE -- Agrupamos las empresas por sus nombres y una categoria 'Other' para las demás
        WHEN c.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN c.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
    ELSE 'Other' -- Agrupamos todas las demas empresas bajo el nombre 'Other'
    END AS company, -- Creamos un alias 'company' para la columna resultante
    COUNT(t.trip_id) AS trips_amount
FROM 
    cabs AS c
INNER JOIN 
    trips AS t ON t.cab_id = c.cab_id
WHERE 
    (t.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07')
GROUP BY
    company -- Agrupamos por la columna 'company' creada en el CASE
ORDER BY 
    trips_amount DESC;