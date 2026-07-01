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

-- Calculate the average rating for movies released in the 21st century.
-- Find the director with the highest average movie runtime.
-- List the top 5 most prolific directors (those who have directed the most movies).
-- Find the highest and lowest rating of each director.
-- Find the director that has made the most money (revenue - budget)
-- Calculate the average rating for movies longer than 2 hours.
-- Find the year with the most movies released.
-- Find the average runtime of movies for each decade.
-- Calculate the percentage of movies with a rating above 8.0.
-- List directors who have never made a movie shorter than 2 hours.
-- Categorize and group movies by length.