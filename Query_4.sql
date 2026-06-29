/*
 감독별로 영화 개수를 세어보세요.
조건:
director가 비어 있지 않아야 함
결과 컬럼:
director | movie_count
정렬:
movie_count 많은 순서
상위 10명만 보여주세요.
 */

SELECT movies.director, COUNT(*) AS movie_count
FROM movies
WHERE director IS NOT NULL
-- AND director != ''
GROUP BY director
ORDER BY movie_count DESC
LIMIT 10;