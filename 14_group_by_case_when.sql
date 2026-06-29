/*
 문제 14 CASE WHEN과 집계를 같이 써봅시다.
영화를 평점 그룹별로 묶어서 영화 개수와 평균 평점을 구하세요.
평점 그룹 기준:
rating >= 8.0  → 'high'
rating >= 6.0  → 'medium'
그 외        → 'low'
조건:
release_date가 2000년 이상
runtime이 60분 이상
결과 컬럼:
rating_group | movie_count | avg_rating
정렬:
avg_rating 높은 순서
 */

SELECT CASE
           WHEN rating >= 8.0 THEN 'high'
           WHEN rating >= 6.0 THEN 'medium'
           ELSE 'low'
           END     AS rating_group,
       COUNT(*)    AS movie_count,
       AVG(rating) AS avg_rating
FROM movies
WHERE release_date >= 2000
  AND runtime >= 60
GROUP BY rating_group
ORDER BY avg_rating DESC;