/*
 문제 4 다시
장르에 Comedy가 포함된 영화 중에서 제목, 장르, 평점, 상영시간을 조회하세요.
조건:
genres에 Comedy가 포함
runtime은 90분 이상 120분 이하
정렬:
rating 높은 순서
상위 20개만 보여주세요.
결과 컬럼:
title | genres | rating | runtime
 */

SELECT movies.title,
       movies.genres,
       movies.rating,
       movies.runtime
FROM movies
WHERE genres IN ('Comedy')
  AND runtime BETWEEN 90 AND 120
ORDER BY rating DESC
LIMIT 20;