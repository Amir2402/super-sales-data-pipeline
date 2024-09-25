WITH SOURCE AS(
    SELECT 
        DISTINCT 
            CUSTOMER_ID, 
            CUSTOMER_NAME, 
            SEGMENT
    FROM 
        {{ref('stg_customer')}}
)

SELECT * FROM SOURCE 