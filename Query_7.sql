/*
 문제 8
감독별 평균 매출을 구하세요.
조건:
director가 비어 있지 않아야 함
revenue가 0보다 커야 함
영화 개수가 5개 이상인 감독만
결과 컬럼:
director | movie_count | avg_revenue
정렬:
avg_revenue 높은 순서
상위 10명만 보여주세요.
 */

SELECT movies.director,
       COUNT(*)     AS movie_count,
       AVG(revenue) AS avg_revenue
FROM movies
WHERE director IS NOT NULL
  AND revenue > 0
GROUP BY director
HAVING movie_count >= 5
LIMIT 10;