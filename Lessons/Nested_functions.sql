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

WITH skill_struct AS (
SELECT
    STRUCT_PACK(
        skill := 'Python',
        type := 'Programming'
    ) AS s
)
 SELECT s.skill, s.type FROM skill_struct;

WITH skill_table AS (
    SELECT 'python' AS skill, 'Programming' AS type
    UNION ALL
    SELECT 'sql', 'query_language'
    UNION ALL
    SELECT 'r', 'programming'
)
SELECT
    STRUCT_PACK(
        skill := skill,
        type := type
    ) AS skill_struct
FROM skill_table;


--- Array of STRUCT

SELECT [
    { skill:'python', type:'Programming' },
    {skill:'sql', type:'query_language'}
] AS skills_array_of_struct;


WITH skill_table AS (
    SELECT 'python' AS skill, 'Programming' AS type
    UNION ALL
    SELECT 'sql', 'query_language'
    UNION ALL
    SELECT 'r', 'programming'
), skills_array_struct as(
SELECT
    ARRAY_AGG(
    STRUCT_PACK(
        skill := skill,
        type := type
        )
    ) array_struct
FROM skill_table
)
SELECT
    array_struct[1].skill,
    array_struct[1].type
FROM skills_array_struct;
 

-- MAP
