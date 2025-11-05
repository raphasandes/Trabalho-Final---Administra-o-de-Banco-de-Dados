use SpotyMusic;

/* Criação dos três usuários */
create user 'raphaels'@'localhost' identified by "@12345";
create user 'raphaelsandes'@'localhost' identified by "@12345";
create user 'rsandes'@'localhost' identified by "@12345";

select user from mysql.user;

/*Dar privilégio - create e inserir - para o 1° usuário (insercao@localhost) */
grant select, insert, create
on SpotyMusic.*
to 'raphaels'@'localhost';

flush privileges;

/*Dar privilégio - select e delete - para o 2° usuário (deletar@localhost) */
grant select, delete
on SpotyMusic.*
to 'raphaelsandes'@'localhost';

flush privileges;

/*Dar privilégio - select, update e drop - para o 3° usuário (atualizar@localhost) */
grant select, update, drop
on SpotyMusic.*
to 'rsandes'@'localhost';

flush privileges;