-- to launch this script, use following command:
-- SOURCE C:/Users/imnottheguy/Documents/MyStuff/work/Formation POE/Introduction git/Documents/projets/30 Mai SopraSteria/Formation/5. Langage SQL ou PL SQL - Les fondamentaux 02.06.2022-07.06.2022/TP/TP_3/code/tp_3_create_tables.sql


DROP DATABASE IF EXISTS tp3;


CREATE DATABASE tp3;

USE tp3;



create table utilisateurs(
    id integer not null auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    pseudo varchar(50) not null unique,
    email varchar(50) not null unique,
    avatar varchar(200) not null
);

SELECT 'Created table' AS '', 'utilisateurs' AS '';


create table photos (
    id integer not null auto_increment primary key,
    image varchar(200) not null,
    description varchar(200),
    localisation varchar(50),
    date_creation DATE DEFAULT CURRENT_DATE,
    utilisateurid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE 
);

SELECT 'Created table' AS '', 'photos' AS '';


create table commentaires (
    id integer not null auto_increment primary key,
    comments varchar(200) not null,
    date_creation DATE DEFAULT CURRENT_DATE,
    utilisateurid int not null,
    photoid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE,
    foreign key (photoid) references photos(id) on delete CASCADE on update CASCADE
);

SELECT 'Created table' AS '', 'commentaires' AS '';

create table likes (
    id integer not null auto_increment primary key,
    utilisateurid int not null,
    photoid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE,
    foreign key (photoid) references photos(id) on delete CASCADE on update CASCADE
);

SELECT 'Created table' AS '', 'likes' AS '';