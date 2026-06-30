/*
 문제 20
이번에는 한 단계 더 나아간 **상관 서브쿼리(Correlated Subquery)**입니다.
단순히 전체 평균이 아니라, "해당 영화가 속한 국가의 평균 평점"보다 평점이 높은 영화들을 찾으세요.
(예: 미국 영화는 미국의 평균 평점보다 높아야 하고, 영국 영화는 영국의 평균 평점보다 높아야 함)

조건:
country가 비어 있지 않아야 함
runtime이 100 이상일 것

결과 컬럼:
title | country | rating

정렬:
country 알파벳 순서, 같으면 rating 높은 순서
상위 20개만 보여주세요.

힌트: 메인 쿼리의 country와 서브쿼리의 country를 연결(매핑)해 주어야 합니다.
*/

SELECT title,
       country,
       rating
FROM movies AS m1
WHERE country IS NOT NULL
  AND country != ''
  AND runtime >= 100
  AND rating > (SELECT AVG(rating)
                FROM movies AS m2
                WHERE m1.country = m2.country)
ORDER BY country,
         rating DESC
LIMIT 20;