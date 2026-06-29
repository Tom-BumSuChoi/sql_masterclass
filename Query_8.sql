/*
 문제 9
영화별 수익률을 계산하세요.
조건:
budget이 0보다 커야 함
revenue가 0보다 커야 함
결과 컬럼:
title | budget | revenue | profit | roi
계산식:
profit = revenue - budget
roi = revenue / budget
정렬:
roi 높은 순서
상위 20개만 보여주세요.
 */

SELECT title,
       budget,
       revenue,
       revenue - budget       AS profit,
       1.0 * revenue / budget AS roi
FROM movies
WHERE budget > 0
  AND revenue > 0
ORDER BY roi DESC
LIMIT 20;
