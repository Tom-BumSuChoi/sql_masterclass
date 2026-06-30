/*
 문제 24
실무에서 엉망으로 들어온 데이터를 깔끔하게 다듬을 때(데이터 클렌징) 가장 많이 사용하는 문자열 함수들을 연습해 보겠습니다.

조건:
제목(title)의 길이가 15글자 이상일 것

결과 컬럼:
1. title (원본 제목)
2. title_length (제목 길이)
3. upper_title (대문자로 변환된 제목)
4. short_title (앞 10글자만 자른 제목 뒤에 '...' 붙이기, 예: 'THE LORD O...')

정렬:
제목 길이(title_length) 기준 내림차순 (가장 긴 제목부터)
상위 10개만 보여주세요.

💡 힌트:
- 길이: LENGTH(컬럼명)
- 대문자: UPPER(컬럼명)
- 문자열 자르기: SUBSTR(컬럼명, 시작위치, 자를글자수)
- 문자열 붙이기: || 기호 사용 (예: '안녕' || '하세요' -> '안녕하세요')
*/

SELECT title,
       LENGTH(title)                        AS title_length,
       UPPER(title)                         AS upper_title,
       SUBSTR(UPPER(title), 1, 10) || '...' AS short_title
FROM movies
WHERE LENGTH(title) >= 15
ORDER BY LENGTH(title) DESC
LIMIT 10;
