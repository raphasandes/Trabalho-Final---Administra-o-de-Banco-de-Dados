/*TRIGGERS*/

/*Criação de tabela backup para cada tabela*/
/* Backup de Compositor (inserir)*/
Create table BackupCompositor(
IdBkpCompositor int primary key auto_increment,
NomeCompositor varchar(50) not null,
SobrenomeCompositor varchar(50) not null);

/* Backup de Playlist (inserir)*/
Create table BackupPlaylist(
IdBkpPlaylist int primary key auto_increment,
NomePlaylist varchar(30) not null);

/* Backup de Genero (inserir)*/
Create table BackupGenero(
IdBkpGenero int primary key auto_increment,
NomeGenero varchar(30) not null);

/* Backup de Artista (inserir)*/
Create table BackupArtista(
IdBkpArtista int primary key auto_increment,
NomeArtista varchar(50) not null,
Id_Genero int,
foreign key(Id_Genero) references Genero (IdGenero) on delete cascade
);

/* Backup de Album (inserir)*/
Create table BackupAlbum(
IdBkpAlbum int primary key auto_increment,
TituloAlbum varchar(60) not null,
AnoLancamento year not null,
Id_Artista int,
foreign key (Id_Artista) references Artista(IdArtista) on delete cascade
);

/* Backup de Música (inserir)*/
Create table BackupMusica(
IdBkpMusica int primary key auto_increment,
Duracao time not null,
NomeMusica varchar(50) not null,
Id_Album int,
foreign key (Id_Album) references Album(IdAlbum) on delete cascade,
Id_Compositor int,
foreign key (Id_Compositor) references Compositor(IdCompositor) on delete cascade
);

/*Backup de Playlist (inserir)*/
Create table BackupMusica_Playlist(
Id_Musica int not null,
Id_Playlist int not null,
Primary key (Id_Musica, Id_Playlist),
Foreign key (Id_Musica) references Musica(IdMusica) on delete cascade,
Foreign key (Id_Playlist) references Playlist(IdPlaylist) on delete cascade
);

/* Backup de Música (deletar)*/
Create table DeletarMusica(
IdDltMusica int primary key auto_increment,
Duracao time not null,
NomeMusica varchar(50) not null,
Id_Album int,
foreign key (Id_Album) references Album(IdAlbum) on delete cascade,
Id_Compositor int,
foreign key (Id_Compositor) references Compositor(IdCompositor) on delete cascade,
user varchar(50),
now datetime
);

/*Criação da trigger para inserir */
/* Trigger para inserir Compositor*/
delimiter $$
create trigger Inserir_Compositor
after insert on Compositor
for each row
begin
insert into BackupCompositor values(null, new.nomecompositor, new.sobrenomecompositor);
end $$
delimiter ;

/*Trigger para inserir Playlist*/
delimiter $$
create trigger Inserir_Playlist
after insert on Playlist
for each row
begin
insert into BackupPlaylist values(null, new.nomeplaylist);
end $$
delimiter ;

/*Trigger para inserir Gênero*/
delimiter $$
create trigger Inserir_Genero
after insert on Genero
for each row
begin
insert into BackupGenero values(null, new.nomegenero);
end $$
delimiter ;

/*Trigger para inserir Artista*/
delimiter $$
create trigger Inserir_Artista
after insert on Artista
for each row
begin
insert into BackupArtista values(null, new.nomeartista, new.id_genero);
end $$
delimiter ;

/*Trigger para inserir Álbum */
delimiter $$
create trigger Inserir_Album
after insert on Album
for each row
begin
insert into BackupAlbum values(null, new.tituloalbum, new.anolancamento, new.id_artista);
end $$
delimiter ;

/*Trigger para inserir Música */
delimiter $$
create trigger Inserir_Musica
after insert on Musica
for each row
begin
insert into BackupMusica values(null, new.duracao, new.nomemusica, new.id_album, new.id_compositor);
end $$
delimiter ;

/*Trigger para inserir Música_Playlist */
delimiter $$
create trigger Inserir_Musica_Playlist
after insert on Musica_Playlist
for each row
begin
insert into BackupMusica_Playlist values(new.id_musica, new.id_playlist);
end $$
delimiter ;

/*Trigger para deletar Música */
DELIMITER $$
create Trigger DeletarMusica
before delete on Musica
for each row
begin
	insert into DeletarMusica values(null, old.duracao, old.nomemusica, old.id_album, old.id_compositor, user(), now());
end $$
DELIMITER ;


/*Teste de Procedure e Trigger*/

/* Inserção de dados na procedure inserir_genero*/
call inserir_genero("Pop");
select * from Genero;

/*Inserção de dados na procedure inserir_artista*/
call inserir_artista("Taylor Swift", 1);
select * from Artista;

/* Inserção de dados na procedure inserir_album*/
call inserir_album("Reputation", 2017, 1);
select * from Album;

/* Inserção de dados na procedure inserir_compositor*/
call inserir_compositor("Taylor", "Alisson Swift");
select * from compositor;

/* Inserção de dados na procedure inserir_playlist*/
call inserir_playlist("V de Vingança");
select * from Playlist;

/* Inserção de dados na procedure inserir_musica*/
call inserir_musica("00:03:28", "...Ready For It?", 1, 1);
select * from Musica;

/* Inserção de dados na procedure inserir_musica_playlist*/
call inserir_musica_playlist(1, 1);
select * from musica_playlist;

/*Compilado de inserção */
select * from Artista
inner join Genero
on IdGenero = Id_Genero
inner join Album
on IdArtista = Id_Artista
inner join Musica
on IdAlbum = Id_Album
inner join Compositor
on IdCompositor = Id_Compositor
inner join Musica_Playlist
on IdMusica = Id_Musica
inner join Playlist
on IdPlaylist = Id_Playlist;


/* Inserção dos demais gêneros musicais. Total: 10
Gênero "Pop" já fora adicionado, sob o Id = 1 */
call inserir_genero("Rock"); /* Id = 2 */
call inserir_genero("Hip Hop");/* Id = 3 */
call inserir_genero("Eletrônica");/* Id = 4 */
call inserir_genero("Clássica");/* Id = 5 */
call inserir_genero("Pagode");/* Id = 6 */
call inserir_genero("Samba");/* Id = 7 */
call inserir_genero("Rap");/* Id = 8 */
call inserir_genero("MPB");/* Id = 9 */
call inserir_genero("Axé");/* Id = 10 */

select * from Genero;


/* Inserção dos demais Artistas. Total: 10
"Taylor Swift já foi adicionada, sob o Id = 1 */
call inserir_artista("Ed Sheeran", 1); /*Pop */
call inserir_artista("Queen", 2); /*Rock*/
call inserir_artista("Eminem", 3); /*Hip Hop*/
call inserir_artista("Daft Punk", 4); /*Eletrônica*/
call inserir_artista("Adele", 1); /*Pop*/
call inserir_artista("Coldplay", 2); /*Rock*/
call inserir_artista("Drake", 3); /*Hip Hop*/
call inserir_artista("Calvin Harris", 4); /*Eletrônica*/
call inserir_artista("Bruno Mars", 1); /*Pop*/

select * from Artista;


/* Inserção dos demais Compositores. Total: 10
"Taylor Alisson Swift já foi adicionada, sob o Id = 1 */
call inserir_compositor("Ed", "Sheeran");
call inserir_compositor("Freddie", "Mercury");
call inserir_compositor("Marshall", "Mathers");
call inserir_compositor("Guy-Manuel", "de Homem-Christo");
call inserir_compositor("Thomas", "Bangalter");
call inserir_compositor("Adele", "Adkins");
call inserir_compositor("Chris", "Martin");
call inserir_compositor("Aubrey", "Graham");
call inserir_compositor("Adam", "Wiles");
call inserir_compositor("Peter", "Hernandez");

select * from Compositor;


/* Inserção dos demais Albuns. Total: 10
"Reputation (Taylor Swift) já foi adicionada, sob o Id = 1 */
/* Albuns para Taylor Swift (IdArtista = 1)*/
call inserir_album("1989", 2014, 1);

/* Albuns para Ed Sheeran (IdArtista = 2)*/
call inserir_album("Divide", 2017, 2);
call inserir_album("Plus", 2011, 2);

/* Albuns para Queen (IdArtista = 3)*/
call inserir_album("A Night at the Opera", 1975, 3);
call inserir_album("News of the World", 1977, 3);

/* Albuns para Eminem (IdArtista = 4)*/
call inserir_album("The Slim Shady LP", 1999, 4);
call inserir_album("The Marshall Mathers LP", 2000, 4);

/* Albuns para Daft Punk (IdArtista = 5)*/
call inserir_album("Discovery", 2001, 5);
call inserir_album("Random Access Memories", 2013, 5);

/* Albuns para Adele (IdArtista = 6)*/
call inserir_album("21", 2011, 6);
call inserir_album("25", 2015, 6);

/* Albuns para Coldplay (IdArtista = 7)*/
call inserir_album("Parachutes", 2000, 7);
call inserir_album("A Rush of Blood to the Head", 2002, 7);

/* Albuns para Drake (IdArtista = 8)*/
call inserir_album("Take Care", 2011, 8);
call inserir_album("Views", 2016, 8);

/* Albuns para Calvin Harris (IdArtista = 9)*/
call inserir_album("Funk Wav Bounces Vol. 1", 2017, 9);
call inserir_album("Motion", 2014, 9);

/* Albuns para Bruno Mars (IdArtista = 10)*/
call inserir_album("Doo-Wops & Hooligans", 2010, 10);
call inserir_album("24K Magic", 2016, 10);

select * from Album;


/* INSERÇÃO DE MÚSICAS */
/* Músicas para o Album "Reputation" (IdAlbum = 1) de Taylor Swift (IdArtista = 1) */
call inserir_musica("00:03:55", "End Game", 1, 1);
call inserir_musica("00:03:37", "I Did Something Bad", 1, 1);
call inserir_musica("00:03:49", "Don't Blame Me", 1, 1);
call inserir_musica("00:03:25", "Delicate", 1, 1);
call inserir_musica("00:03:40", "Look What You Made Me Do", 1, 1);
call inserir_musica("00:04:11", "So It Goes...", 1, 1);
call inserir_musica("00:03:54", "Gorgeous", 1, 1);
call inserir_musica("00:03:31", "King of My Heart", 1, 1);
call inserir_musica("00:03:35", "Dancing With Our Hands Tied", 1, 1);

/* Músicas para o álbum "1989" (IdAlbum = 2) de Taylor Swift (IdArtista = 1) */
call inserir_musica("00:03:51", "Blank Space", 2, 1);
call inserir_musica("00:03:31", "Style", 2, 1);
call inserir_musica("00:03:39", "Out of the Woods", 2, 1);
call inserir_musica("00:03:54", "Shake It Off", 2, 1);
call inserir_musica("00:04:02", "Bad Blood", 2, 1);
call inserir_musica("00:04:30", "Wildest Dreams", 2, 1);
call inserir_musica("00:03:40", "Clean", 2, 1);
call inserir_musica("00:03:50", "Welcome to New York", 2, 1);
call inserir_musica("00:03:52", "All You Had To Do Was Stay", 2, 1);
call inserir_musica("00:04:09", "New Romantics", 2, 1);

/* Músicas para o álbum "Divide" (IdAlbum = 3) de Ed Sheeran (IdArtista = 2) */
call inserir_musica("00:04:23", "Castle on the Hill", 3, 2);
call inserir_musica("00:03:54", "Shape of You", 3, 2);
call inserir_musica("00:03:59", "Galway Girl", 3, 2);
call inserir_musica("00:04:19", "Perfect", 3, 2);
call inserir_musica("00:04:12", "Happier", 3, 2);
call inserir_musica("00:04:10", "New Man", 3, 2);
call inserir_musica("00:04:01", "Dive", 3, 2);
call inserir_musica("00:04:13", "Supermarket Flowers", 3, 2);
call inserir_musica("00:03:58", "What Do I Know?", 3, 2);
call inserir_musica("00:03:39", "Eraser", 3, 2);

/* Músicas para o álbum "Plus" (IdAlbum = 4) de Ed Sheeran (IdArtista = 2) */
call inserir_musica("00:04:11", "The A Team", 4, 2);
call inserir_musica("00:03:39", "Drunk", 4, 2);
call inserir_musica("00:03:47", "Lego House", 4, 2);
call inserir_musica("00:03:56", "Grade 8", 4, 2);
call inserir_musica("00:04:06", "Wake Me Up", 4, 2);
call inserir_musica("00:04:47", "Small Bump", 4, 2);
call inserir_musica("00:04:26", "This", 4, 2);
call inserir_musica("00:04:19", "U.N.I.", 4, 2);
call inserir_musica("00:04:20", "Autumn Leaves", 4, 2);
call inserir_musica("00:04:13", "Give Me Love", 4, 2);

/* Músicas para o álbum "A Night at the Opera" (IdAlbum = 5) de Queen (IdArtista = 3) */
call inserir_musica("00:03:52", "Death on Two Legs", 5, 3);
call inserir_musica("00:04:08", "Lazing on a Sunday Afternoon", 5, 3);
call inserir_musica("00:03:22", "I'm in Love with My Car", 5, 3);
call inserir_musica("00:03:09", "You're My Best Friend", 5, 3);
call inserir_musica("00:03:52", "'39", 5, 3);
call inserir_musica("00:03:39", "Sweet Lady", 5, 3);
call inserir_musica("00:03:20", "Seaside Rendezvous", 5, 3);
call inserir_musica("00:03:47", "The Prophet's Song", 5, 3);
call inserir_musica("00:03:38", "Love of My Life", 5, 3);
call inserir_musica("00:06:00", "Bohemian Rhapsody", 5, 3);

/* Músicas para o álbum "News of the World" (IdAlbum = 6) de Queen (IdArtista = 3) */
call inserir_musica("00:02:01", "We Will Rock You", 6, 3);
call inserir_musica("00:02:59", "We Are the Champions", 6, 3);
call inserir_musica("00:03:02", "Sheer Heart Attack", 6, 3);
call inserir_musica("00:03:28", "All Dead, All Dead", 6, 3);
call inserir_musica("00:02:54", "Spread Your Wings", 6, 3);
call inserir_musica("00:04:09", "Fight from the Inside", 6, 3);
call inserir_musica("00:03:23", "Get Down, Make Love", 6, 3);
call inserir_musica("00:04:16", "Sleeping on the Sidewalk", 6, 3);
call inserir_musica("00:03:19", "Who Needs You", 6, 3);
call inserir_musica("00:03:09", "It's Late", 6, 3);

/* Músicas para o álbum "The Slim Shady LP" (IdAlbum = 7) de Eminem (IdArtista = 4) */
call inserir_musica("00:04:13", "My Name Is", 7, 4);
call inserir_musica("00:04:36", "Guilty Conscience", 7, 4);
call inserir_musica("00:03:45", "Brain Damage", 7, 4);
call inserir_musica("00:04:38", "Paul (Skit)", 7, 4);
call inserir_musica("00:04:28", "If I Had", 7, 4);
call inserir_musica("00:04:23", "97' Bonnie & Clyde", 7, 4);
call inserir_musica("00:03:57", "Role Model", 7, 4);
call inserir_musica("00:04:47", "My Fault", 7, 4);
call inserir_musica("00:05:01", "Cum on Everybody", 7, 4);
call inserir_musica("00:04:12", "Rock Bottom", 7, 4);

/*Músicas para o álbum "The Marshall Mathers LP" (IdAlbum = 8) de Eminem (IdArtista = 4)*/
call inserir_musica("00:05:34", "Stan", 8, 4);
call inserir_musica("00:04:50", "The Real Slim Shady", 8, 4);
call inserir_musica("00:04:59", "Drug Ballad", 8, 4);
call inserir_musica("00:04:44", "Kim", 8, 4);
call inserir_musica("00:04:59", "Bitch (Skit)", 8, 4);
call inserir_musica("00:05:14", "Who Knew", 8, 4);
call inserir_musica("00:05:21", "The Way I Am", 8, 4);
call inserir_musica("00:05:07", "Criminal", 8, 4);
call inserir_musica("00:04:37", "Kill You", 8, 4);
call inserir_musica("00:04:58", "Amityville", 8, 4);

/* Músicas para o álbum "Discovery" (IdAlbum = 9) de Daft Punk (IdArtista = 5) */
call inserir_musica("00:04:00", "One More Time", 9, 5);
call inserir_musica("00:05:20", "Aerodynamic", 9, 6);
call inserir_musica("00:04:40", "Digital Love", 9, 5);
call inserir_musica("00:04:55", "Harder, Better, Faster, Stronger", 9, 5);
call inserir_musica("00:05:10", "Crescendolls", 9, 6);
call inserir_musica("00:04:20", "Nightvision", 9, 5);
call inserir_musica("00:03:50", "Superheroes", 9, 6);
call inserir_musica("00:03:45", "High Life", 9, 5);
call inserir_musica("00:04:30", "Something About Us", 9, 6);
call inserir_musica("00:05:00", "Voyager", 9, 5);

/* Músicas para o álbum "Random Access Memories" (IdAlbum = 10) - Daft Punk (IdArtista = 5) */
call inserir_musica("00:08:20", "Give Life Back to Music", 10, 5);
call inserir_musica("00:09:01", "The Game of Love", 10, 6);
call inserir_musica("00:05:37", "Giorgio by Moroder", 10, 5);
call inserir_musica("00:06:07", "Within", 10, 6);
call inserir_musica("00:05:43", "Instant Crush", 10, 5);
call inserir_musica("00:04:37", "Lose Yourself to Dance", 10, 6);
call inserir_musica("00:04:50", "Touch", 10, 5);
call inserir_musica("00:05:38", "Get Lucky", 10, 6);
call inserir_musica("00:06:21", "Beyond", 10, 5);
call inserir_musica("00:04:10", "Motherboard", 10, 6);

/* Músicas para o álbum "21" (IdAlbum = 11) - Adele (IdArtista = 6) */
call inserir_musica("00:03:48", "Rolling in the Deep", 11, 7);
call inserir_musica("00:04:43", "Rumour Has It", 11, 7);
call inserir_musica("00:04:47", "Turning Tables", 11, 7);
call inserir_musica("00:03:50", "Don't You Remember", 11, 7);
call inserir_musica("00:04:45", "Set Fire to the Rain", 11, 7);
call inserir_musica("00:03:02", "He Won't Go", 11, 7);
call inserir_musica("00:04:09", "Take It All", 11, 7);
call inserir_musica("00:04:10", "I'll Be Waiting", 11, 7);
call inserir_musica("00:03:58", "One and Only", 11, 7);
call inserir_musica("00:04:02", "Lovesong", 11, 7);

/* Músicas para o álbum "25" (IdAlbum = 12) - Adele (IdArtista = 6) */
call inserir_musica("00:04:55", "Hello", 12, 7);
call inserir_musica("00:05:47", "Send My Love (To Your New Lover)", 12, 7);
call inserir_musica("00:04:45", "I Miss You", 12, 7);
call inserir_musica("00:03:43", "When We Were Young", 12, 7);
call inserir_musica("00:03:59", "Remedy", 12, 7);
call inserir_musica("00:03:50", "Water Under the Bridge", 12, 7);
call inserir_musica("00:03:45", "River Lea", 12, 7);
call inserir_musica("00:04:01", "Love in the Dark", 12, 7);
call inserir_musica("00:04:14", "Million Years Ago", 12, 7);
call inserir_musica("00:03:48", "All I Ask", 12, 7);

/* Músicas para o álbum "Parachutes" (IdAlbum = 13) - Coldplay (IdArtista = 7) */
call inserir_musica("00:04:16", "Don't Panic", 13, 8);
call inserir_musica("00:04:36", "Shiver", 13, 8);
call inserir_musica("00:05:05", "Spies", 13, 8);
call inserir_musica("00:04:27", "Sparks", 13, 8);
call inserir_musica("00:04:29", "Yellow", 13, 8);
call inserir_musica("00:04:17", "Trouble", 13, 8);
call inserir_musica("00:04:31", "Parachutes", 13, 8);
call inserir_musica("00:04:29", "High Speed", 13, 8);
call inserir_musica("00:04:47", "We Never Change", 13, 8);
call inserir_musica("00:04:25", "Everything's Not Lost", 13, 8);

/* Músicas para o álbum "A Rush of Blood to the Head" (IdAlbum = 14) - Coldplay (IdArtista = 7) */
call inserir_musica("00:05:09", "Politik", 14, 8);
call inserir_musica("00:04:30", "In My Place", 14, 8);
call inserir_musica("00:05:32", "God Put a Smile upon Your Face", 14, 8);
call inserir_musica("00:05:18", "The Scientist", 14, 8);
call inserir_musica("00:05:08", "Clocks", 14, 8);
call inserir_musica("00:05:51", "Daylight", 14, 8);
call inserir_musica("00:05:15", "Green Eyes", 14, 8);
call inserir_musica("00:05:43", "A Whisper", 14, 8);
call inserir_musica("00:05:36", "A Rush of Blood to the Head", 14, 8);
call inserir_musica("00:05:23", "Amsterdam", 14, 8);

/* Músicas para o álbum "Take Care" (IdAlbum = 15) - Drake (IdArtista = 8) */
call inserir_musica("00:04:43", "Over My Dead Body", 15, 9);
call inserir_musica("00:05:07", "Shot for Me", 15, 9);
call inserir_musica("00:04:34", "Headlines", 15, 9);
call inserir_musica("00:05:26", "Crew Love", 15, 9);
call inserir_musica("00:05:50", "Take Care", 15, 9);
call inserir_musica("00:04:27", "Marvins Room", 15, 9);
call inserir_musica("00:04:30", "Underground Kings", 15, 9);
call inserir_musica("00:05:05", "We'll Be Fine", 15, 9);
call inserir_musica("00:04:50", "Make Me Proud", 15, 9);
call inserir_musica("00:05:04", "Lord Knows", 15, 9);

/* Músicas para o álbum "Views" (IdAlbum = 16) - Drake (IdArtista = 8) */
call inserir_musica("00:04:12", "Feel No Ways", 16, 9);
call inserir_musica("00:03:56", "Hotline Bling", 16, 9);
call inserir_musica("00:05:05", "One Dance", 16, 9);
call inserir_musica("00:03:57", "Pop Style", 16, 9);
call inserir_musica("00:04:54", "Controlla", 16, 9);
call inserir_musica("00:04:42", "Too Good", 16, 9);
call inserir_musica("00:04:59", "Faithful", 16, 9);
call inserir_musica("00:04:23", "Still Here", 16, 9);
call inserir_musica("00:05:13", "With You", 16, 9);
call inserir_musica("00:04:02", "Views", 16, 9);

/* Músicas para o álbum "Funk Wav Bounces Vol. 1" (IdAlbum = 17) - Calvin Harris (IdArtista = 9) */
call inserir_musica("00:03:42", "Slide", 17, 10);
call inserir_musica("00:03:22", "Cash Out", 17, 10);
call inserir_musica("00:03:39", "Heatstroke", 17, 10);
call inserir_musica("00:03:54", "Rollin", 17, 10);
call inserir_musica("00:03:38", "Prayers Up", 17, 10);
call inserir_musica("00:03:54", "Holiday", 17, 10);
call inserir_musica("00:03:25", "Skrt On Me", 17, 10);
call inserir_musica("00:03:32", "Feels", 17, 10);
call inserir_musica("00:03:22", "Faking It", 17, 10);
call inserir_musica("00:03:36", "Hard to Love", 17, 10);

/* Músicas para o álbum "Motion" (IdAlbum = 18) - Calvin Harris (IdArtista = 9) */
call inserir_musica("00:03:52", "Faith", 18, 10);
call inserir_musica("00:03:49", "Under Control", 18, 10);
call inserir_musica("00:04:05", "Outside", 18, 10);
call inserir_musica("00:03:54", "It Was You", 18, 10);
call inserir_musica("00:03:50", "Summer", 18, 10);
call inserir_musica("00:04:02", "Blame", 18, 10);
call inserir_musica("00:04:14", "Love Now", 18, 10);
call inserir_musica("00:03:57", "Together", 18, 10);
call inserir_musica("00:04:00", "Burnin'", 18, 10);
call inserir_musica("00:03:45", "Ecstasy", 18, 10);

/* Músicas para o álbum "Doo-Wops & Hooligans" (IdAlbum = 19) - Bruno Mars (IdArtista = 10) */
call inserir_musica("00:03:29", "Grenade", 19, 11);
call inserir_musica("00:03:06", "Just the Way You Are", 19, 11);
call inserir_musica("00:03:42", "Our First Time", 19, 11);
call inserir_musica("00:02:40", "Runaway Baby", 19, 11);
call inserir_musica("00:02:55", "The Lazy Song", 19, 11);
call inserir_musica("00:03:26", "Marry You", 19, 11);
call inserir_musica("00:03:35", "Talking to the Moon", 19, 11);
call inserir_musica("00:03:33", "Liquor Store Blues", 19, 11);
call inserir_musica("00:03:10", "Count On Me", 19, 11);
call inserir_musica("00:03:00", "The Other Side", 19, 11);

/* Músicas para o álbum "24K Magic" (IdAlbum = 20) - Bruno Mars (IdArtista = 10) */
call inserir_musica("00:03:46", "24K Magic", 20, 11);
call inserir_musica("00:03:26", "Chunky", 20, 11);
call inserir_musica("00:03:10", "Perm", 20, 11);
call inserir_musica("00:03:45", "That's What I Like", 20, 11);
call inserir_musica("00:03:52", "Versace on the Floor", 20, 11);
call inserir_musica("00:03:05", "Finesse", 20, 11);
call inserir_musica("00:03:24", "Calling All My Lovelies", 20, 11);
call inserir_musica("00:03:46", "Straight Up & Down", 20, 11);
call inserir_musica("00:03:20", "Too Good to Say Goodbye", 20, 11);
call inserir_musica("00:04:00", "Uptown Funk", 20, 11);


/* INSERÇÃO DE PLAYLISTS */
call inserir_playlist("Minhas Favoritas Pop");
call inserir_playlist("Rock Clássico Essencial");
call inserir_playlist("Pump-Up");


/* INSERÇÃO DE MUSICA_PLAYLIST */
/* Playlist "V de Vingança" (IdPlaylist = 1) */
call inserir_musica_playlist(2, 1);
call inserir_musica_playlist(3, 1);
call inserir_musica_playlist(4, 1);
call inserir_musica_playlist(5, 1);
call inserir_musica_playlist(6, 1);
call inserir_musica_playlist(7, 1);
call inserir_musica_playlist(8, 1);
call inserir_musica_playlist(9, 1); 
call inserir_musica_playlist(10, 1);

/* Playlist "Minhas Favoritas Pop" (IdPlaylist = 2) */
call inserir_musica_playlist(11, 2);
call inserir_musica_playlist(12, 2); 
call inserir_musica_playlist(14, 2); 
call inserir_musica_playlist(22, 2); 
call inserir_musica_playlist(24, 2); 
call inserir_musica_playlist(51, 2); 
call inserir_musica_playlist(52, 2); 
call inserir_musica_playlist(71, 2); 
call inserir_musica_playlist(73, 2); 
call inserir_musica_playlist(80, 2); 

/* Playlist "Rock Clássico Essencial" (IdPlaylist = 3) */
call inserir_musica_playlist(40, 3); 
call inserir_musica_playlist(39, 3);
call inserir_musica_playlist(41, 3); 
call inserir_musica_playlist(42, 3); 
call inserir_musica_playlist(60, 3); 
call inserir_musica_playlist(61, 3); 
call inserir_musica_playlist(65, 3); 
call inserir_musica_playlist(66, 3); 
call inserir_musica_playlist(10, 3); 
call inserir_musica_playlist(35, 3);

/* Playlist "Pump" (IdPlaylist = 4) */
call inserir_musica_playlist(5, 4);  
call inserir_musica_playlist(14, 4); 
call inserir_musica_playlist(22, 4); 
call inserir_musica_playlist(41, 4);
call inserir_musica_playlist(42, 4);
call inserir_musica_playlist(43, 4);
call inserir_musica_playlist(48, 4);
call inserir_musica_playlist(50, 4);
call inserir_musica_playlist(72, 4);
call inserir_musica_playlist(80, 4);


/*TESTE DE INSERÇÃO DE DADOS */
select * from Artista
inner join Genero
on IdGenero = Id_Genero
inner join Album
on IdArtista = Id_Artista
inner join Musica
on IdAlbum = Id_Album
inner join Compositor
on IdCompositor = Id_Compositor
inner join Musica_Playlist
on IdMusica = Id_Musica
inner join Playlist
on IdPlaylist = Id_Playlist;