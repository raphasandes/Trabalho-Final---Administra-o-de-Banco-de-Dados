/*Criação do banco de dados */
Create database SpotyMusic;

use SpotyMusic;

/*Criação das tabelas*/
/*1- Criação da tabela Compositor*/
Create table Compositor(
IdCompositor int primary key auto_increment,
NomeCompositor varchar(50) not null,
SobrenomeCompositor varchar(50) not null);

/*2- Criação da tabela Playlist*/
Create table Playlist(
IdPlaylist int primary key auto_increment,
NomePlaylist varchar(30) not null);

/*3- Criação da tabela Gênero*/
Create table Genero(
IdGenero int primary key auto_increment,
NomeGenero varchar(30) not null);

/*4- Criação da tabela Artista*/
Create table Artista(
IdArtista int primary key auto_increment,
NomeArtista varchar(50) not null,
Id_Genero int,
foreign key(Id_Genero) references Genero (IdGenero) on delete cascade
);

/*5- Criação da tabela Álbum*/
Create table Album(
IdAlbum int primary key auto_increment,
TituloAlbum varchar(60) not null,
AnoLancamento year not null,
Id_Artista int,
foreign key (Id_Artista) references Artista(IdArtista) on delete cascade
);

/*6- Criação da tabela Musica*/
Create table Musica(
IdMusica int primary key auto_increment,
Duracao time not null,
NomeMusica varchar(50) not null,
Id_Album int,
foreign key (Id_Album) references Album(IdAlbum) on delete cascade,
Id_Compositor int,
foreign key (Id_Compositor) references Compositor(IdCompositor) on delete cascade
);

/*7- Criação da tabela Musica_Playlist*/
Create table Musica_Playlist(
Id_Musica int not null,
Id_Playlist int not null,
Primary key (Id_Musica, Id_Playlist),
Foreign key (Id_Musica) references Musica(IdMusica) on delete cascade,
Foreign key (Id_Playlist) references Playlist(IdPlaylist) on delete cascade
);
