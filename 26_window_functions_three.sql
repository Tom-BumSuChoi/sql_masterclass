/*
 문제 26
윈도우 함수 삼총사(`ROW_NUMBER`, `RANK`, `DENSE_RANK`)의 차이를 한눈에 확인해 보세요.
이 세 함수는 동점자를 처리하는 방식이 확실히 다르며, 실무와 면접에서 단골로 묻는 핵심 개념입니다.

조건:
평점(rating)이 8.0 이상일 것
상영 시간(runtime)이 150분 이상일 것

결과 컬럼:
1. title
2. rating
3. row_num: ROW_NUMBER()를 사용 (동점이라도 무조건 1, 2, 3, 4 고유 번호 부여)
4. rank_num: RANK()를 사용 (동점자가 2명이면 1, 2, 2, 4 처럼 다음 등수 건너뜀)
5. dense_rank_num: DENSE_RANK()를 사용 (동점자가 2명이어도 1, 2, 2, 3 처럼 촘촘하게 부여)

정렬:
평점(rating) 내림차순 (가장 높은 평점부터)
상위 15개만 보여주세요.

💡 힌트: OVER (ORDER BY rating DESC) 구문을 각 함수 뒤에 똑같이 붙여서 세 가지 컬럼을 동시에 뽑아보시면 됩니다!
*/

SELECT title,
       rating,
       ROW_NUMBER() OVER (ORDER BY rating DESC) AS row_num,
       RANK() OVER (ORDER BY rating DESC)       AS rank_num,
       DENSE_RANK() OVER (ORDER BY rating DESC) AS dense_rank_num
FROM movies
WHERE rating >= 8.0
  AND runtime >= 150
ORDER BY rating DESC
LIMIT 15;