WITH SOURCE AS(
    SELECT 
        ORDER_ID, 
        TO_DATE(ORDER_DATE, 'DD/MM/YYYY') AS ORDER_DATE, 
        CUSTOMER_ID,
        PRODUCTID AS PRODUCT_ID, 
        COUNTRY, 
        STATE, 
        CITY, 
        REGION,
        POSTALCODE AS POSTAL_CODE, 
        SALES, 
        QUANTITY, 
        DISCOUNT, 
        PROFIT
    FROM 
        {{source('sales', 'SUPERSTORE')}}
)

SELECT * FROM SOURCE 