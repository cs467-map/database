SELECT C.name, C.id, P.total FROM City C
INNER JOIN Population P ON P.cityid = C.id
WHERE C.name LIKE '%Port%'
ORDER BY P.total DESC
;
