# Protseduur andmete lisamiseks 
CREATE PROCEDURE lisaToode
    @nimetus varchar(20),
    @tootja varchar(20),
    @kogus int,
    @hind money
AS
BEGIN
    INSERT INTO toode(toodeNimi, tootja, toodeHind, toodeKogus)
    VALUES (@nimetus, @tootja, @hind, @kogus);

    SELECT * FROM toode;
END;

# OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxHind
    @minHind MONEY OUTPUT,
    @maxHind MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minHind = MIN(toodeHind),
        @maxHind = MAX(toodeHind)
    FROM toode;
END;

# Dünaamiline SQL protseduuris (ALTER TABLE)
# Protseduur veeru lisamiseks või kustutamiseks 
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;


# Protseduur, mis kuvab toodete nime, hinna ja lisab automaatselt hinnangu
kui hind < 2 → "soodne"
muidu → "kallis"


CREATE PROCEDURE kuvaTootedHinnaKategooriaga
AS
BEGIN
    SELECT 
        toodeNimi,
        toodeHind,
        CASE 
            WHEN toodeHind < 2 THEN 'soodne'
            ELSE 'kallis'
        END AS hinnaKategooria
    FROM toode;
END;
