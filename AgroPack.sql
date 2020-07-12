create database AgroPack;
use AgroPack;

create table Utilisateurs(
	id int auto_increment not null,
	nom varchar(100),
	prenom varchar(100),
	pseudo varchar(100),
	type ENUM('agriculteur', 'client'),
	email varchar(100),
	adresse varchar(100),
	password varchar(100),
	photo varchar(100) default 'defaut.png',
	tel int,
	primary key(id, email,tel)
);

create table Commandes(
	client_id int not null,
	prop_id int not null,
	prod_ref int not null,
	ref int auto_increment not null,
	libelle text,
	date_commande Date default current_date,
	quantite_prod int,
	validite boolean default 0,
	primary key(ref),
	constraint `fk_cmd_author`
    foreign key(client_id) references Utilisateurs(id)
    on delete cascade,
    constraint `fk_cmd_prop`
    foreign key(prop_id) references Utilisateurs(id)
    on delete cascade,
    constraint `fk_prod`
    foreign key(prod_ref) references Utilisateurs(id)
    on delete cascade
);


create table Champs(
	prop_id int,
	ref int not null auto_increment,
	nom varchar(100),
	libelle text,
	primary key(ref),
	constraint `fk_ch_author`
    foreign key(prop_id) references Utilisateurs(id)
    on delete cascade
);

create table Produits(
	prop_id int not null,
	ref int not null auto_increment ,
	nom varchar(100),
	libelle text,
	type ENUM('legume','fruit','plante'),
	quantite int,
	prix numeric,
	primary key(ref),
	constraint `fk_prod_container`
	foreign key(prop_id) references Utilisateurs(id)
	on delete cascade
);



insert into Utilisateurs(id,nom,prenom,pseudo,type,email,adresse,password,tel) 
	values
	(1,
	'admin',
	'admin',
	'admin33',
	'agriculteur',
	'admin@esp.sn',
	'Dakar, esp',
	'passer',
	 781506477
);

insert into Utilisateurs(id,nom,prenom,pseudo,type,email,adresse,password,tel) 
	values
	(2,
	'client1',
	'client1',
	'client33',
	'client',
	'client1@esp.sn',
	'Dakar, esp',
	'passer',
	 775004050
);

insert into Champs(prop_id, nom, libelle)
	values 
	(1, 'field 1' , 'juste pour tester'
);

insert into Produits(prop_id, nom, libelle, type, quantite, prix)
	values
	(1, 'carotte', '', 'legume', 460, 100
);

insert into Produits(prop_id, nom, libelle, type, quantite, prix)
	values
	(1, 'concombre', '', 'legume', 120, 200
);

insert into Produits(prop_id, nom, libelle, type, quantite, prix)
	values
	(1, 'banane', '', 'fruit', 500, 100
);

insert into Commandes(client_id, prop_id, prod_ref, quantite_prod, libelle) 
	values
	(2, 1, 1, 100, 'juste pour tester'
);