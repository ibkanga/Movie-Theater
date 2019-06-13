CREATE VIEW pozoriste.pretplatnikukupnonovca
AS
SELECT pr.pretplatnikid,  SUM(v.ukupno) as ukupnonovcapotroseno, kr.broj
FROM pretplatnik pr, ukupaniznos v, kreditnakartica kr
WHERE pr.pretplatnikid = v.pretplatnikid AND pr.pretplatnikid = kr.pretplatnikid
GROUP BY pr.pretplatnikid
