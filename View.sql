CREATE VIEW v_flop_or_not AS
SELECT CASE
           WHEN movies.revenue < movies.budget
               THEN 'Flop'
           ELSE 'success'
           END  AS flop_or_not,
       COUNT(*) AS total_movies
FROM movies
WHERE budget IS NOT NULL
  AND revenue IS NOT NULL
GROUP BY flop_or_not;

SELECT *
FROM v_flop_or_not;