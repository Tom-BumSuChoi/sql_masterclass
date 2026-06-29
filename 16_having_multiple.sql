/*
 문제 16
이번에는 HAVING을 한 번 더 연습합니다.
감독별 영화 수, 평균 평점, 평균 상영시간을 구하세요.
조건:
director가 비어 있지 않아야 함
runtime이 0보다 커야 함
release_date가 2000년 이상
영화 개수가 10개 이상인 감독만
평균 평점이 7.0 이상인 감독만
결과 컬럼:
director | movie_count | avg_rating | avg_runtime
정렬:
avg_rating 높은 순서
movie_count 많은 순서
상위 20명만 보여주세요.
 */

SELECT movies.director,
       COUNT(*)            AS movie_count,
       AVG(rating)         AS avg_rating,
       AVG(movies.runtime) AS avg_runtime
FROM movies
WHERE director IS NOT NULL
  AND director != ''
  AND runtime > 0
  AND release_date >= 2000
GROUP BY director
HAVING movie_count >= 10
   AND avg_rating >= 7.0
ORDER BY avg_rating DESC,
         movie_count DESC
LIMIT 20;