WITH SOURCE AS (
    SELECT
        CITY, 
        REGION, 
        STATE, 
        COUNTRY,
        POSTALCODE
    FROM 
        {{source('sales', 'SUPERSTORE')}} 
)

SELECT 
    CITY, 
    REGION, 
    STATE, 
    COUNTRY, 
    POSTALCODE AS POSTAL_CODE, 
    {{ dbt_utils.generate_surrogate_key([
        'CITY', 
        'REGION', 
        'STATE', 
        'COUNTRY', 
        'POSTAL_CODE'
    ]) }} AS LOCATION_ID
FROM 
    SOURCE


