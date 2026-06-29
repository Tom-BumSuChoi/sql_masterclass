/*
 문제 1 movies 테이블에서 영화 제목, 개봉연도, 평점만 조회하세요.
단, 평점이 높은 순서대로 정렬하고 상위 10개만 보여주세요.
원하는 결과 컬럼:
title | release_date | rating
 */

SELECT movies.title, movies.release_date, movies.rating
FROM movies
ORDER BY rating DESC
LIMIT 10;