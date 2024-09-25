WITH SOURCE AS(
    SELECT 
        DISTINCT 
            PRODUCT_ID,
            PRODUCT_NAME, 
            CATEGORY, 
            SUBCATEGORY
    FROM 
        {{ ref('stg_product') }}
),

DROP_DUPS AS (
    SELECT 
        PRODUCT_ID, 
        PRODUCT_NAME, 
        CATEGORY, 
        SUBCATEGORY, 
        ROW_NUMBER() OVER(PARTITION BY PRODUCT_ID ORDER BY PRODUCT_ID) AS CNT 
    FROM 
        SOURCE 
)

SELECT 
    PRODUCT_ID, 
    PRODUCT_NAME, 
    CATEGORY, 
    SUBCATEGORY
FROM 
    DROP_DUPS  
WHERE   
    CNT = 1 


