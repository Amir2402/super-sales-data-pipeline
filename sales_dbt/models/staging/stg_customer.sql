WITH SOURCE AS(
SELECT 
    CUSTOMER_ID, 
    CUSTOMER_NAME, 
    SEGMENT
FROM 
    {{source('sales', 'SUPERSTORE')}}
)

SELECT * FROM SOURCE
