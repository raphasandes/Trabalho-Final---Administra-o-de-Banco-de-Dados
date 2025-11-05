/* Queries */

/* 1- Indicar todas as músicas do ritmo "pop" */
select * from musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
inner join Genero
on IdGenero = Id_Genero
where nomegenero = "Pop";

/* 2- Das músicas do estilo pop selecionadas anteriormente, mostrar apenas as da cantora Taylor Swift */
select * from musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
inner join Genero
on IdGenero = Id_Genero
where nomegenero = "Pop" and nomeartista = "Taylor Swift";

/* 3 - Quais são os artistas do ritmo rock? */
select nomeartista as "Artista/Banda" from artista
inner join Genero
on IdGenero = Id_Genero
where NomeGenero = "rock"
order by nomeartista;

/* 4 - Qual é a música de maior duração? */
select NomeMusica as "Música", duracao as "Duração" from musica
order by duracao desc
limit 1;

/* 5 - A música acima pertence a qual artista? */
select NomeMusica as "Música", duracao as "Duração", NomeArtista as "Artista/Banda" from musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
order by duracao desc
limit 1;

/* 6- Selecionar todas as músicas, com seus respectivos compositor, por ordem alfabética. */
select NomeMusica as "Musica", Duracao as "Duração", concat(NomeCompositor," ",SobrenomeCompositor) as "Compositor"
from musica
inner join compositor
on IdCompositor = Id_Compositor
order by Compositor asc;

/* 7 - Das músicas acima, selecione também os respectivos alguns e artistas */
select NomeMusica as "Musica", Duracao as "Duração", concat(NomeCompositor," ",SobrenomeCompositor) as "Compositor", TituloAlbum as "Album", AnoLancamento as "Lançamento", NomeArtista as "Artista/Banda"
from musica
inner join compositor
on IdCompositor = Id_Compositor
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
order by Compositor asc;

/* 8 - Quais playlists contêm a música "Bohemian Rhapsody"?*/
Select NomePlaylist as "Playlist" from Playlist
inner join Musica_Playlist
on IdPlaylist = Id_Playlist
inner join musica
on IdMusica = Id_Musica
where NomeMusica = "Bohemian Rhapsody";

/* 9 - Qual é o número total de música em cada playlist?*/
Select NomePlaylist as "Playlist", count(IdMusica) as "Total de Músicas" from Playlist
inner join musica_playlist
on IdPlaylist = Id_Playlist
inner join musica
on IdMusica = Id_Musica
group by nomeplaylist asc;

/* 10- Quais são os gêneros com maior número de música? */
Select NomeGenero as "Gênero", count(IdMusica) as "Total de Músicas" from Genero
inner join artista
on IdGenero = Id_Genero
inner join album
on IdArtista = Id_Artista
inner join Musica
on IdAlbum = Id_Album
group by Nomegenero 
order by IdMusica asc;

/* 11- De quem são as músicas lançadas entre 2010 e 2015 */
Select NomeMusica as "Musica", AnoLancamento as "Ano", NomeArtista as "Artista" from Musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
where Anolancamento between 2010 and 2015
order by AnoLancamento asc;

/* 12- Quantas músicas foram lançadas no período anterior (entre 2010 e 2015)? */
Select AnoLancamento as "Ano", count(AnoLancamento) as "Quantidade" from Musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
where Anolancamento between 2010 and 2015
group by AnoLancamento
order by AnoLancamento asc;

/* 13- Liste os compositores, em order alfabética */
select sobrenomecompositor, nomecompositor from Compositor
order by sobrenomecompositor asc;

/* 14- Qual é a duração média das músicas */
select NomeGenero as "Gênero", sec_to_time(avg(time_to_sec(Duracao))) as "Duração Média" from Musica
inner join Album
on IdAlbum = Id_Album
inner join Artista 
on IdArtista = Id_Artista
inner join Genero
on IdGenero = Id_Genero
group by NomeGenero
order by Duracao desc;

/* 15 - Quais são as músicas que têm duração menor que 3 minutos e 30 segundos? */
select * from musica
where duracao < "00:03:30"
order by duracao asc;

/* 16 - Verificar se todas as músicas estão adicionadas na tabela de backup */
select Count(IdMusica) as "Quantidade de Musicas"
from Musica;
select Count(IdBkpMusica) as "BKP: Quantidade de Musicas"
from BackupMusica;

/* 17 - Quais são os albuns do século passado? */
select * from Album
where anolancamento between 1900 and 1999;

/* 18 - Os albuns da questão anterior são de quais artistas? */
select TituloAlbum as "Titulo Album", Anolancamento as "Ano de Lançamento", NomeArtista as "Artista/Banda"
from Album
inner join Artista
on IdArtista = Id_Artista
where anolancamento between 1900 and 1999;

/* 19 - Quais são as músicas do cantor Eminem presentes no banco de dados? */
select * from musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
where NomeArtista = "Eminem";

/* 20- Quais músicas não estão em nenhum playlist? */
select NomeMusica as "Musica", NomeArtista as "Artista"
from Musica
left join Musica_Playlist
on IdMusica = Id_Musica
inner join Album
on IdAlbum = Id_Album
inner join Artista
on IdArtista = Id_Artista
where Id_Playlist is null;

/* 21- Qual é a média de duração de cada gênero? */
select NomeGenero as "Gênero", sec_to_time(avg(time_to_sec(Duracao))) AS "Duração Mádia"
from Genero
inner join Artista
on IdGenero = Id_Genero
inner join Album 
on IdArtista = Id_Artista
inner join Musica 
on IdAlbum = Id_Album
group by NomeGenero
order by avg(time_to_sec(Duracao)) desc;

/* 22- Qual é a duração média de cada álbum?*/
select TituloAlbum as "Album", sec_to_time(avg(time_to_sec(Duracao))) AS "Duração Mádia"
from Album
inner join Musica
on IdAlbum = Id_ALbum
group by TituloAlbum
order by avg(time_to_sec(Duracao)) desc;

/* 23 - Quais são os três albuns com maior duração? */
select TituloAlbum as "Album", sec_to_time(avg(time_to_sec(Duracao))) AS "Duração Mádia"
from Album
inner join Musica
on IdAlbum = Id_ALbum
group by TituloAlbum
order by avg(time_to_sec(Duracao)) desc
limit 3;

/*24 - Quais são os três albuns com menor duração? */
select TituloAlbum as "Album", sec_to_time(avg(time_to_sec(Duracao))) AS "Duração Mádia"
from Album
inner join Musica
on IdAlbum = Id_ALbum
group by TituloAlbum
order by avg(time_to_sec(Duracao)) asc
limit 3;

/*25- Qual é o ano com maior número de lançamentos?*/
select AnoLancamento AS "Ano", COUNT(IdAlbum) AS "Quantidade de Lançamentos"
from Album
group by AnoLancamento
order by "Quantidade de Lançamentos" desc
LIMIT 1;

/*26 - Quais foram os álbuns lançados em 2017?*/
select TituloAlbum as "Álbum", AnoLancamento as "Lançamento", NomeArtista as "Artista/Banda" from Album
inner join Artista
on IdArtista = Id_Artista
where AnoLancamento = "2017";

/*27 - Quais são as músicas do Queen que estão na playlist "Rock Clássico Essencial"?*/
select NomeMusica as "Música", NomePlaylist as "Playlist"
from Musica
join Album 
on Id_Album = IdAlbum
inner join Artista
on Id_Artista = IdArtista
inner join Musica_Playlist 
on IdMusica = Id_Musica
inner join Playlist 
on Id_Playlist = IdPlaylist
WHERE NomeArtista = 'Queen' and NomePlaylist = 'Rock Clássico Essencial';

/*28- Qual a música mais antiga no banco de dados? */
select NomeArtista as "Artista/Banda", NomeMusica as "Música", AnoLancamento as "Lançamento"
from Artista
inner join Album 
on IdArtista = Id_Artista
inner join Musica 
on IdAlbum = Id_Album
order by AnoLancamento asc, NomeMusica asc
LIMIT 1;

/*29- Quais artistas aparecem em mais de um playlist?*/
select NomeArtista as "Artista/Banda", count(distinct Id_Playlist) as "Playlists"
from Artista
inner join Album
on IdArtista = Id_Artista
inner join Musica 
on IdAlbum = Id_Album
inner join Musica_Playlist
on IdMusica = Id_Musica
group by NomeArtista
having Playlists > 1
order by Playlists desc;

/*30- Qual o número de músicas por gênero que foram lançadas antes do ano 2000?*/
select NomeGenero as "Gênero", count(IdMusica) as "Quantidade de Músicas"
from Genero
inner join Artista
on IdGenero = Id_Genero
inner join Album
on IdArtista = Id_Artista
inner join Musica
on IdAlbum = Id_Album
where AnoLancamento < 2000
group by NomeGenero
order by "Quantidade de Musicas" desc;
