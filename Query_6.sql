/*
 문제 7
연도별 영화 개수와 평균 평점을 구하세요.
조건:
release_date가 2000년 이상
영화 개수가 500개 이상인 연도만
결과 컬럼:
release_year | movie_count | avg_rating
정렬:
release_year 오래된 순서
 */


SELECT release_date AS release_year, COUNT(*) AS movie_count, AVG(rating) AS avg_rating
FROM movies
WHERE release_year >= 2000
GROUP BY release_year
HAVING movie_count >= 500
ORDER BY release_year;