/*Criação de Procedures*/
/*Procedure Tabela Gênero */
DELIMITER $$
CREATE PROCEDURE inserir_genero(ng VARCHAR(30))
BEGIN
    INSERT INTO Genero(NomeGenero)
    VALUES (ng);
END $$
DELIMITER ;


/*Procedure Tabela Artista */
DELIMITER $$
CREATE PROCEDURE inserir_artista(nart VARCHAR(50),id_g INT)
BEGIN
    INSERT INTO Artista (NomeArtista, Id_Genero)
    VALUES (nart, id_g);
END $$
DELIMITER ;


/*Procedure Tabela Album */
DELIMITER $$
CREATE PROCEDURE inserir_album(ta VARCHAR(60), ano YEAR, id_art INT)
BEGIN
    INSERT INTO Album (TituloAlbum, AnoLancamento, Id_Artista)
    VALUES (ta, ano, id_art);
END $$
DELIMITER ;

/*Procedure Tabela Compositor*/
DELIMITER $$
CREATE PROCEDURE inserir_compositor(nomcomp VARCHAR(30), sobrcomp VARCHAR(50)
)
BEGIN
    INSERT INTO Compositor (NomeCompositor, SobrenomeCompositor)
    VALUES (nomcomp, sobrcomp);
END $$
DELIMITER ;


/* Procedure Tabela Playlist*/
DELIMITER $$
CREATE PROCEDURE inserir_playlist(npl VARCHAR(30))
BEGIN
    INSERT INTO Playlist (NomePlaylist)
    VALUES (npl);
END $$
DELIMITER ;


/* Procedure Tabela Música*/
DELIMITER $$
CREATE PROCEDURE inserir_musica(d TIME, nmu VARCHAR(50), id_alb INT, id_c INT)
BEGIN
    INSERT INTO Musica (Duracao, NomeMusica, Id_Album, Id_Compositor)
    VALUES (d, nmu, id_alb, id_c);
END $$
DELIMITER ;


/* Procedure Tabela Musica_Playlist*/
DELIMITER $$
CREATE PROCEDURE inserir_musica_playlist(id_mus INT, id_pl INT)
BEGIN
    INSERT INTO Musica_Playlist (Id_Musica, Id_Playlist)
    VALUES (id_mus, id_pl);
END $$
DELIMITER ;