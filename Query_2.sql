/*
 문제 3
미국(country = 'US') 영화 중에서 매출(revenue)이 예산(budget)보다 큰 영화만 조회하세요.
결과 컬럼:
title | release_date | budget | revenue | profit
조건:
profit = revenue - budget
정렬은 profit이 큰 순서대로 하고, 상위 15개만 보여주세요.
 */

SELECT movies.title,
       movies.release_date,
       movies.budget,
       movies.revenue,
       movies.revenue - movies.budget AS profit
FROM movies
WHERE country = 'US'
  AND revenue > budget
ORDER BY profit DESC
LIMIT 15;
