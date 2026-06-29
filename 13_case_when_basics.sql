/*
 문제 13
이번에는 CASE WHEN을 연습해봅시다.
영화별로 평점 등급을 붙여서 조회하세요.
등급 기준:
rating >= 8.0  → 'high'
rating >= 6.0  → 'medium'
그 외        → 'low'
조건:
release_date가 2010년 이상
runtime이 60분 이상
결과 컬럼:
title | release_date | rating | rating_group
정렬:
rating 높은 순서
상위 30개만 보여주세요.
 */

SELECT movies.title,
       movies.release_date,
       movies.rating,
       CASE
           WHEN rating >= 8.0 THEN 'high'
           WHEN rating >= 6.0 THEN 'medium'
           ELSE 'low'
           END AS rating_group
FROM movies
WHERE release_date >= 2010
  AND runtime >= 60
ORDER BY rating DESC
LIMIT 30;
