/*
 문제 23
윈도우 함수가 아직 헷갈리신다면 이 문제를 풀고 나면 완벽하게 이해되실 겁니다!

우리가 20번, 21번 문제에서 "각 국가별 최고/평균 평점"을 구하기 위해 복잡하게 서브쿼리를 쓰고 JOIN을 했었죠?
윈도우 함수의 `PARTITION BY`를 사용하면 그런 복잡한 과정 없이 단 한 줄로 국가별 통계값을 원본 데이터 옆에 찰싹 붙일 수 있습니다.

조건:
country가 비어 있지 않아야 함 (!= '')
국가별 '최고 평점(MAX)'을 구해서 원본 데이터 옆에 나란히 출력해 보세요.

결과 컬럼:
title | country | rating | max_rating_in_country (해당 국가의 최고 평점)

정렬:
country 알파벳 순서, 같으면 title 알파벳 순서
상위 15개만 보여주세요.

💡 힌트: SELECT 절에 `MAX(rating) OVER (PARTITION BY country)` 를 사용해보세요!
*/

SELECT title,
       country,
       rating,
       MAX(rating) OVER (PARTITION BY country) AS max_rating_in_country
FROM movies
WHERE country IS NOT NULL
  AND country != ''
  AND rating IS NOT NULL
ORDER BY country, title
LIMIT 15;