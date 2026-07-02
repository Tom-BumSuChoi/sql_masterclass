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
ORDER BY total_movies DESC;

-- Find the number of movies released each year.
SELECT movies.release_date,
       COUNT() AS total_movies
FROM movies
WHERE release_date IS NOT NULL
GROUP BY release_date
ORDER BY total_movies DESC;

-- List the top 10 years with the highest average movie runtime.
SELECT movies.release_date,
       AVG(runtime) AS avg_runtime
FROM movies
GROUP BY release_date
ORDER BY avg_runtime DESC
LIMIT 10;

-- Calculate the average rating for movies released in the 21st century.
SELECT AVG(movies.rating)
FROM movies
WHERE release_date >= 2000;

-- Find the director with the highest average movie runtime.
SELECT movies.director,
       AVG(runtime) AS avg_runtime
FROM movies
WHERE director IS NOT NULL
GROUP BY director
ORDER BY avg_runtime DESC
LIMIT 1;

-- List the top 5 most prolific directors (those who have directed the most movies).
SELECT movies.director,
       COUNT(*) AS total_movie
FROM movies
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_movie DESC
LIMIT 5;

-- Find the highest and lowest rating of each director.
SELECT movies.director,
       MIN(movies.rating) AS lowest,
       MAX(movies.rating) AS highest
FROM movies
WHERE director IS NOT NULL
  AND rating IS NOT NULL
GROUP BY director;

-- Find the director that has made the most money (revenue - budget)
SELECT director,
       SUM(revenue) - SUM(budget) AS profit
FROM movies
WHERE director IS NOT NULL
  AND revenue IS NOT NULL
  AND budget IS NOT NULL
GROUP BY director
ORDER BY profit DESC
LIMIT 10;

-- Calculate the average rating for movies longer than 2 hours.
SELECT AVG(movies.rating) AS avg_rating
FROM movies
WHERE runtime > 120;

-- Find the year with the most movies released.
SELECT movies.release_date,
       COUNT(*) AS total_count
FROM movies
WHERE release_date IS NOT NULL
GROUP BY release_date
ORDER BY total_count DESC
LIMIT 1;

-- Find the average runtime of movies for each decade.
SELECT (release_date / 10) * 10 AS decade,
       AVG(runtime)             AS avg_runtime
FROM movies
WHERE release_date IS NOT NULL
  AND runtime IS NOT NULL
GROUP BY decade
ORDER BY avg_runtime DESC;

-- Calculate the percentage of movies with a rating above 8.0.
SELECT SUM(CASE
               WHEN rating > 8.0 THEN 1
               ELSE 0
    END) * 100 / COUNT(*)
FROM movies
WHERE rating IS NOT NULL;

-- List directors who have never made a movie shorter than 2 hours.
SELECT movies.director,
       SUM(CASE
               WHEN runtime > 120 THEN 0
               ELSE 1
           END) AS has_movie_shorter_than_2h
FROM movies
WHERE director IS NOT NULL
GROUP BY director
HAVING has_movie_shorter_than_2h = 0;

-- 위의 것 보다 아래가 나은듯
SELECT director
FROM movies
WHERE director IS NOT NULL
GROUP BY director
HAVING MIN(runtime) >= 120;

-- List the top 5 years where the differecne between the highest and lowest rated movie was the greatest.
SELECT movies.release_date,
       MAX(rating) - MIN(rating) AS difference
FROM movies
WHERE rating IS NOT NULL
  AND release_date IS NOT NULL
GROUP BY release_date
ORDER BY difference DESC
LIMIT 5;

-- Categorize and group movies by length.
SELECT CASE
           WHEN movies.runtime < 90
               THEN 'Short'
           WHEN movies.runtime BETWEEN 90 AND 120
               THEN 'Normal'
           WHEN movies.runtime > 120
               THEN 'Long'
           END  AS runtime_category,
       COUNT(*) AS total_movies
FROM movies
WHERE runtime IS NOT NULL
GROUP BY runtime_category
ORDER BY total_movies DESC;