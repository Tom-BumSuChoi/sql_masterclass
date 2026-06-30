/*
 문제 21
이번에는 20번 문제에서 배웠던 성능 최적화 기법인 **JOIN과 CTE(WITH)**를 직접 연습해 보겠습니다.
각 국가별로 '최고 평점'을 구한 뒤, 그 최고 평점을 받은 영화들의 제목, 국가, 평점을 조회하세요.

조건:
country가 비어 있지 않아야 함
(1) 먼저 CTE(WITH)를 사용해 국가별 최고 평점(MAX(rating))을 구하는 가상 테이블을 만드세요.
(2) 메인 쿼리에서 원본 movies 테이블과 방금 만든 CTE 테이블을 JOIN하여, 최고 평점과 일치하는 영화만 필터링하세요.

결과 컬럼:
title | country | rating

정렬:
country 알파벳 순서, 같으면 title 알파벳 순서
상위 15개만 보여주세요.
*/

WITH MaxRaingForCountry AS (SELECT country, MAX(rating) AS max_rating
                            FROM movies
                            WHERE rating IS NOT NULL
                              AND country IS NOT NULL
                            GROUP BY country)

SELECT m.title, m.country, m.rating
FROM movies AS m
         JOIN MaxRaingForCountry AS c
              ON m.country = c.country
                  AND m.rating = c.max_rating
ORDER BY m.country ASC,
         m.title ASC
LIMIT 15;
