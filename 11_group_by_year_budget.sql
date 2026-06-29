/*
 문제 11
연도별 총 매출과 평균 예산을 구하세요.
조건:
release_date가 1990년 이상
revenue가 0보다 커야 함
budget이 0보다 커야 함
영화 개수가 100개 이상인 연도만
결과 컬럼:
release_year | movie_count | total_revenue | avg_budget
정렬:
total_revenue 높은 순서
상위 10개만 보여주세요.
 */

SELECT release_date AS release_year,
       COUNT(*)     AS movie_count,
       SUM(revenue) AS total_revenue,
       AVG(budget)  AS avg_budget
FROM movies
WHERE release_year >= 1990
  AND revenue > 0
  AND budget > 0
GROUP BY release_year
HAVING movie_count >= 100
ORDER BY total_revenue DESC
LIMIT 10;
