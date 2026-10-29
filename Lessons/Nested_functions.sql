--- Array 

SELECT [1, 2, 3];

SELECT ['SQL', 'R', 'Python'] AS skills_array;

WITH skills AS (
    SELECT 'python' AS skill
    UNION ALL
    SELECT 'sql'
    UNION ALL
    SELECT 'r'
), skills_array AS (
    SELECT ARRAY_AGG(skill ORDER BY skill) AS skills_array FROM skills
)
SELECT skills_array[1] FROM skills_array;

--- STRUCT

SELECT { skill: 'Python', type: 'Programming' } AS skill_struct;