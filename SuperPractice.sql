-- What is the average rating of each director?
SELECT movies.director,
       AVG(rating) AS avg_rating
FROM movies
WHERE director IS NOT NULL
  AND director != ''
  AND rating IS NOT NULL
GROUP BY director
ORDER BY avg_rating DESC