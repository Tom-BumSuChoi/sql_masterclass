-- What is the average rating of each director?
-- * that has more than 5 movies
SELECT movies.director,
       ROUND(AVG(rating), 3) AS avg_rating,
       COUNT(*)              AS total_movies
FROM movies
WHERE director IS NOT NULL
  AND director != ''
  AND rating IS NOT NULL
GROUP BY director
HAVING total_movies >= 5
ORDER BY avg_rating DESC;

-- How many movies are in each genre?
SELECT movies.genres, COUNT(*) total_movies
FROM movies
WHERE genres IS NOT NULL
GROUP BY genres
ORDER BY total_movies DESC;

-- How many movies have a rating greater than 6? What is the most common?
SELECT movies.rating,
       COUNT(*) AS total_movies
FROM movies
WHERE rating > 6
GROUP BY rating
ORDER BY total_movies DESC
