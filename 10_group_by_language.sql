/*
 문제 10
언어별 영화 개수와 평균 평점을 구하세요.
조건:
original_language가 비어 있지 않아야 함
영화 개수가 1000개 이상인 언어만
결과 컬럼:
original_language | movie_count | avg_rating
정렬:
movie_count 많은 순서
 */

SELECT movies.original_language,
       COUNT(*)    AS movie_count,
       AVG(rating) AS avg_rating
FROM movies
WHERE original_language IS NOT NULL
  AND original_language != ''
GROUP BY original_language
HAVING movie_count >= 1000
ORDER BY movie_count DESC;