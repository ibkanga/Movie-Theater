CREATE VIEW pozoriste.ukupaniznos
AS
SELECT r.rezervacijaid, pr.pretplatnikid, r.brojmjesta, p.cijenaulaznice, r.brojmjesta * p.cijenaulaznice as ukupno
FROM rezervacija r, predstava p, pretplatnik pr
WHERE r.predstavaid = p.predstavaid AND r.pretplatnikid = pr.pretplatnikid
ORDER BY r.rezervacijaid
