WITH SOURCE_JOIN_LOC AS (
    SELECT 
        ORDER_ID, 
        ORDER_DATE, 
        CUSTOMER_ID,
        PRODUCT_ID, 
        F.COUNTRY, 
        F.STATE, 
        F.POSTAL_CODE,
        F.CITY, 
        F.REGION, 
        SALES, 
        QUANTITY, 
        DISCOUNT, 
        PROFIT, 
        L.LOCATION_ID 
    FROM 
        {{ref('stg_fact')}} F 
    LEFT JOIN {{ref('dim_location')}} L
    ON 
        F.COUNTRY = L.COUNTRY AND 
        F.CITY = L.CITY AND 
        F.STATE = L.STATE AND 
        F.POSTAL_CODE = L.POSTAL_CODE AND 
        F.REGION = L.REGION
)

SELECT 
    ORDER_ID, 
    ORDER_DATE, 
    CUSTOMER_ID,
    PRODUCT_ID, 
    LOCATION_ID,  
    SALES, 
    QUANTITY, 
    DISCOUNT, 
    PROFIT, 
FROM 
    SOURCE_JOIN_LOC


