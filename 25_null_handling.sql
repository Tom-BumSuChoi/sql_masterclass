/*
 문제 25
실무에서 데이터를 다루다 보면 값이 비어있는 경우(NULL)를 정말 많이 마주치게 됩니다.
NULL 값을 그대로 두면 앱 화면에서 에러가 나거나 'null'이라고 이상하게 표시될 수 있습니다.
값이 비어있을 때 다른 문자로 대체해주는 **COALESCE()** 함수를 연습해 보겠습니다.

조건:
영화 평점(rating)이 8.0 이상일 것

결과 컬럼:
title | rating | homepage_url (homepage가 NULL이면 '정보 없음'으로 출력)

정렬:
평점 내림차순, 같으면 제목 알파벳 순서
상위 10개만 보여주세요.

💡 힌트: `COALESCE(컬럼명, '대체할 문자')` 를 사용하면 컬럼이 NULL일 때 지정한 문자로 바꿔줍니다.
*/

SELECT title,
       rating,
       COALESCE(homepage, '정보 없음') AS homepage_url
FROM movies
WHERE rating >= 8.0
ORDER BY rating DESC,
         title
LIMIT 10;
