/*
 문제 2
평점이 8.5 이상인 영화 중에서 제목, 개봉연도, 평점, 감독을 조회하세요.
평점 높은 순서로 정렬하고, 같은 평점이면 개봉연도가 최신인 영화가 먼저 나오게 하세요.
상위 20개만 보여주세요.
결과 컬럼:
title | release_date | rating | director
 */

SELECT movies.title, movies.release_date, movies.rating, movies.director
FROM movies
WHERE rating >= 8.5
ORDER BY rating DESC, release_date DESC
LIMIT 20;