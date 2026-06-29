/*
 문제 12
감독별 최고 평점 영화를 찾기 전에, 먼저 감독별 통계를 구하세요.
조건:
director가 비어 있지 않아야 함
영화 개수가 20개 이상인 감독만
결과 컬럼:
director | movie_count | avg_rating | max_rating
정렬:
max_rating 높은 순서
avg_rating 높은 순서
상위 15명만 보여주세요.
 */

SELECT director,
       COUNT(*)    AS movie_count,
       AVG(rating) AS avg_rating,
       MAX(rating) AS max_rating
FROM movies
WHERE director IS NOT NULL
GROUP BY director
HAVING movie_count >= 20
ORDER BY max_rating DESC,
         avg_rating DESC
LIMIT 15;
