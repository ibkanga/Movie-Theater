SELECT ukupaniznos.rezervacijaid, ukupaniznos.pretplatnikid, kreditnakartica.broj, ukupaniznos.ukupno
FROM pozoriste.ukupaniznos, pozoriste.kreditnakartica
WHERE ukupaniznos.pretplatnikid = kreditnakartica.pretplatnikid
ORDER BY ukupno desc
LIMIT 1;
