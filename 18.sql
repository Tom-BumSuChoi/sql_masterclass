/*
 문제 18
이번에는 비율 계산입니다.
국가별로 전체 영화 수, 고평점 영화 수, 고평점 비율을 구하세요.
고평점 기준:
rating >= 8.0
조건:
country가 비어 있지 않아야 함
release_date가 2000년 이상
영화 개수가 500개 이상인 국가만
결과 컬럼:
country | movie_count | high_rating_count | high_rating_ratio
계산식:
high_rating_ratio = high_rating_count / movie_count
정렬:
high_rating_ratio 높은 순서
상위 15개만 보여주세요.
 */

WITH ContryStatus AS (SELECT movies.country,
                             COUNT(*) AS movie_count,
                             SUM(CASE
                                     WHEN rating >= 8 THEN 1
                                     ELSE 0
                                 END) AS high_rating_count
                      FROM movies
                      WHERE country IS NOT NULL
                        AND country != ''
                        AND release_date >= 2000
                      GROUP BY country
                      HAVING movie_count >= 500)

SELECT country,
       movie_count,
       high_rating_count,
       high_rating_count * 1.0 / movie_count AS high_rating_ratio
FROM ContryStatus
ORDER BY high_rating_ratio DESC
LIMIT 15;