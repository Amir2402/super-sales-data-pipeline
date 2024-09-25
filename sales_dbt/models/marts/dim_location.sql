WITH SOURCE AS(
    SELECT 
        DISTINCT 
            LOCATION_ID, 
            STATE, 
            COUNTRY, 
            CITY, 
            REGION, 
            POSTAL_CODE
    FROM {{ref('stg_location')}}
)

SELECT * FROM SOURCE 