

create table Utilisateurs(
	id integer primary key AUTOINCREMENT,
	nom text,
	prenom text,
	pseudo text,
	type text,
	email text,
	adresse text,
	password text,
	photo text default 'defaut.png',
	tel integer
);

create table Commandes(
	client_id integer not null,
	prop_id integer not null,
	prod_ref integer not null,
	cref integer primary key AUTOINCREMENT,
	clibelle text,
	date_commande text,
	quantite_prod integer,
	validite integer default 0,
	constraint `fk_cmd_author`
    foreign key(client_id) references Utilisateurs(id)
    on delete cascade,
    constraint `fk_cmd_prop`
    foreign key(prop_id) references Utilisateurs(id),
    constraint `fk_prod`
    foreign key(prod_ref) references Produits(p_ref)
    on delete cascade
);


create table Champs(
	ch_prop_id integer,
	ch_ref integer primary key AUTOINCREMENT,
	ch_nom text,
	ch_libelle text,
	constraint `fk_ch_author`
    foreign key(ch_prop_id) references Utilisateurs(id)
    on delete cascade
);

create table Produits(
	p_prop_id integer not null,
	p_champ_id integer not null,
	p_ref integer primary key AUTOINCREMENT,
	p_nom text,
	p_libelle text,
	p_type text,
	p_quantite integer,
	p_prix real,
	constraint `fk_prod_author`
	foreign key(p_prop_id) references Utilisateurs(id)
	on delete cascade,
	constraint `fk_prod_container`
	foreign key(p_champ_id) references Champs(ch_ref)
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

insert into Champs(ch_prop_id, ch_nom, ch_libelle)
	values 
	(1, 'field 1' , 'juste pour tester'
);

insert into Produits(p_prop_id,p_champ_id, p_nom, p_libelle, p_type, p_quantite, p_prix)
	values
	(1, 1,'carotte', '', 'legume', 460, 100
);

insert into Produits(p_prop_id,p_champ_id, p_nom, p_libelle, p_type, p_quantite, p_prix)
	values
	(1, 1,'concombre', '', 'legume', 120, 200
);

insert into Produits(p_prop_id,p_champ_id, p_nom, p_libelle, p_type, p_quantite, p_prix)
	values
	(1, 1,'banane', '', 'fruit', 500, 100
);

insert into Commandes(client_id, prop_id, prod_ref, quantite_prod, clibelle, date_commande) 
	values
	(2, 1, 1, 100, 'juste pour tester', '29/04/2020'
);

	