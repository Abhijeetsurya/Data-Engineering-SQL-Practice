SELECT 
    * 
FROM 
    read_csv('https://storage.googleapis.com/sql_de/company_dim.csv', AUTO_DETECT=True) AS company_dim
LIMIT 10;