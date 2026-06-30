/*
 문제 22
이번에는 실무에서 정말 많이 쓰이는 **윈도우 함수(Window Function)**의 기초를 배워보겠습니다.
가장 대표적인 RANK() 함수를 사용하여 영화들의 평점 순위를 매겨볼 것입니다.

조건:
release_date가 2020년 이상일 것
runtime이 60 이상일 것

결과 컬럼:
title | release_date | rating | rating_rank (평점 순위)

정렬:
평점 순위(rating_rank) 오름차순, 순위가 같으면 title 알파벳 순서
상위 20개만 보여주세요.

💡 힌트: SELECT 절에 `RANK() OVER (ORDER BY rating DESC) AS rating_rank` 를 사용하면 전체 랭킹을 쉽게 구할 수 있습니다!
*/

SELECT title,
       release_date,
       rating,
       RANK() OVER (ORDER BY rating DESC ) AS rating_rank
FROM movies
WHERE release_date >= 2020
  AND runtime >= 60
ORDER BY rating_rank,
         title
LIMIT 20;
