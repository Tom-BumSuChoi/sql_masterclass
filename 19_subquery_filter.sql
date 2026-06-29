/*
 문제 19
전체 영화의 평균 평점보다 높은 평점을 받은 한국 영화들을 찾으세요.

조건:
country가 'KR' 일 것
release_date가 2000년 이상
평점(rating)이 '전체 영화의 평균 평점'보다 높아야 함 (WHERE 절에서 서브쿼리 활용)

결과 컬럼:
title | release_date | rating

정렬:
rating 높은 순서, 같으면 release_date 최신 순서
상위 15개만 보여주세요.
 */

SELECT title, release_date, rating
FROM movies
WHERE country = 'KR'
  AND rating > (SELECT AVG(rating) FROM movies WHERE rating IS NOT NULL)
  AND release_date >= 2000
ORDER BY rating DESC,
         release_date DESC
LIMIT 15;
