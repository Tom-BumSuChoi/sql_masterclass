/*
 문제 15
이번에는 CASE WHEN으로 영화 길이 그룹을 만들어봅시다.
상영시간 기준:
runtime >= 120 → 'long'
runtime >= 90  → 'normal'
그 외          → 'short'
조건:
runtime이 0보다 커야 함
release_date가 2010년 이상
결과 컬럼:
runtime_group | movie_count | avg_rating | avg_runtime
정렬:
avg_rating 높은 순서
 */

SELECT CASE
           WHEN movies.runtime >= 120 THEN 'long'
           WHEN movies.runtime >= 90 THEN 'normal'
           ELSE 'short'
           END             AS runtime_group,
       COUNT(*)            AS movie_count,
       AVG(movies.rating)  AS avg_rating,
       AVG(movies.runtime) AS avg_runtime
FROM movies
WHERE runtime > 0
  AND release_date >= 2010
GROUP BY runtime_group
ORDER BY avg_rating DESC