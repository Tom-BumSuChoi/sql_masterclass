/*
 문제 17
이번에는 조건부 집계입니다.
국가별로 전체 영화 수와 고평점 영화 수를 구하세요.
고평점 기준:
rating >= 8.0
조건:
country가 비어 있지 않아야 함
release_date가 2000년 이상
영화 개수가 500개 이상인 국가만
결과 컬럼:
country | movie_count | high_rating_count
힌트:
SUM(CASE WHEN ... THEN 1 ELSE 0 END)
정렬:
high_rating_count 많은 순서
상위 15개만 보여주세요.
 */

SELECT movies.country,
       COUNT(*) AS movie_count,
       SUM(CASE
               WHEN rating >= 8.0 THEN 1
               ELSE 0
           END) AS high_rating_count
FROM movies
WHERE country IS NOT NULL
  AND country != ''
  AND release_date >= 2000
GROUP BY country
HAVING movie_count >= 500
ORDER BY high_rating_count DESC
LIMIT 15;