/*
 문제 6
국가별 평균 평점을 구하세요.
조건:
country가 비어 있지 않아야 함
영화 개수가 100개 이상인 국가만
결과 컬럼:
country | movie_count | avg_rating
정렬:
avg_rating 높은 순서
상위 10개 국가만 보여주세요.
 */

SELECT country, COUNT(*) AS movie_count, AVG(movies.rating) AS avg_rating
FROM movies
GROUP BY country
HAVING movie_count > 100
ORDER BY avg_rating DESC
LIMIT 10;