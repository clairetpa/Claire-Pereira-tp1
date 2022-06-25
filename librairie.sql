--
-- Structure de la table livre
--
CREATE TABLE IF NOT EXISTS Livre(
  idLivre SMALLINT UNSIGNED AUTO_INCREMENT,
  titre varchar(200) NOT NULL,
  resume varchar(2000) NOT NULL,
  dateParution DATE NOT NULL,
  idAuteur SMALLINT UNSIGNED,
  idEditeur SMALLINT UNSIGNED,
  idGenre SMALLINT UNSIGNED,
  PRIMARY KEY (idLivre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table Auteur
--
CREATE TABLE IF NOT EXISTS Auteur (
  idAuteur SMALLINT UNSIGNED AUTO_INCREMENT,
  nomAuteur varchar(50) NOT NULL,
  prenomAuteur varchar(50) NOT NULL,
  PRIMARY KEY (idAuteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Structure de la table Editeur
--
CREATE TABLE IF NOT EXISTS Editeur (
  idEditeur SMALLINT UNSIGNED AUTO_INCREMENT,
  nomEditeur varchar(50) NOT NULL,
  PRIMARY KEY (idEditeur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Structure de la table Genre
--
CREATE TABLE IF NOT EXISTS Genre (
  idGenre SMALLINT UNSIGNED,
  genre varchar(100) NOT NULL,
  PRIMARY KEY (idGenre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE Livre ADD CONSTRAINT contrainte1 FOREIGN KEY(idAuteur) references Auteur(idAuteur);
ALTER TABLE Livre ADD CONSTRAINT contrainte2 FOREIGN KEY(idEditeur) references Editeur(idEditeur);
ALTER TABLE Livre ADD CONSTRAINT contrainte3 FOREIGN KEY(idGenre) references Genre(idGenre);


--
-- Déchargement des données des tables
--

INSERT INTO Auteur (idAuteur,nomAuteur,prenomAuteur) VALUES
(1,'Musso','Guillaume'),
(2,'Pob','Robert'),
(3,'Daniel','Marc'),
(4,'Wild','Emmy'),
(5,'Bussi','Michel'),
(6,'Grisham','John'),
(7,'Atwood','Margaret'),
(8,'Owens','Delia'),
(9,'Dugoni','Robert');


INSERT INTO Editeur (idEditeur,nomEditeur) VALUES
(1,'Éditions de l\'épée'),
(2,'Points'),
(3,'Aparis'),
(4,'Albin Michel'),
(5,'Presses de la Cité '),
(6,'Le Livre de Poche'),
(7,'Pavillion poche'),
(8,'Le Seuil '),
(9,'Amazon Crossing');

INSERT INTO Genre (idGenre,genre) VALUES
(1,'Policier'),
(2,'Fiction'),
(3,'Histoire'),
(4,'Horreur'),
(5,'Aventure'),
(6,'Classique'),
(7,'Romantique');

INSERT INTO Livre (idLivre,idAuteur,idEditeur,dateParution,idGenre,titre,resume) VALUES
(1,1,1,'2015-03-26',1,'L\'Instant présent','\" Souviens-toi que l\'on a deux vies.La seconde commence le jour où on se rend compte que l\'on n\'en a qu\'une.\"Pour payer ses études d\'art dramatique, Lisa travaille dans un bar de Manhattan. Elle y fait la connaissance d\'Arthur Costello, un jeune médecin urgentiste.En apparence, il a tout pour plaire. Mais Arthur n\'est pas un homme comme les autres. Deux ans plus tôt, il a hérité de la résidence de son grand-père : un vieux phare isolé dans lequel une pièce a été condamnée.Malgré sa promesse, il a choisi d\'ouvrir la porte, découvrant une vérité bouleversante qui lui interdit de mener une vie normale.Sa rencontre avec Lisa va tout changer et lui redonner une raison d\'espérer. Dès lors, Arthur et Lisa n\'ont qu\'une obsession, déjouer les pièges que leur impose le plus impitoyable des ennemis : le temps.
Un suspense psychologique vertigineux au final stupéfiant.'),
(2,2,2,'2021-03-11',2,'City of windows', 'New York : lors d\'une effroyable tempête de neige, un flic du FBI, puis un autre, sont assassinés par un sniper. Désemparés par l\'étrange mode opératoire du tueur, les enquêteurs font appel à un de leurs anciens agents : Lucas Page. Devenu professeur d\'astrophysique, atteint du syndrome d\'Asperger, Page possède un talent exceptionnel pour décrypter une scène de crime dès lors qu\'angles et trajectoires entrent en ligne de compte. Grandiose et captivant, empreint d\'un humour dévastateur, ce roman se lit sans temps mort.Après deux thrillers à succès, Robert Pobi revient sur le devant de la scène avec cette première enquête de Lucas Page, début d\'une série magnétique.'),
(3,3,3,'2021-07-09',3,'La Fille de Nulle Part', 'Pourquoi une fillette de neuf ans sortirait-elle du chalet de ses parents au beau milieu de la nuit ? Pourquoi quitterait-elle son lit douillet pour affronter la rigueur d\'un hiver dans le Montana ? Et pourquoi ne l\'a-t-on jamais revue ?Vingt ans plus tard, son oncle est sauvagement assassiné alors que des dépouilles d\'enfants sont découvertes dissimulées dans une grotte à quelques kilomètres du chalet familial.
S\'agirait-il d\'une coïncidence ? Ethan Archer ne le croit pas. Mais cet ancien profileur criminel peut-il se fier à son propre jugement ? N\'a-t-il pas perdu son savoir-faire en même temps que tout le reste, lors de cette nuit fatidique qui transforma son existence en véritable cauchemar ? Archer n\'a pas travaillé sur une affaire de meurtre depuis et n\'a aucune envie de s\'y remettre. Mais lorsque les cadavres se multiplient et qu\'il se retrouve dans la ligne de mire du tueur, il n\'a plus d\'autre choix.'),
(4,4,4,'2022-02-03',4,'Until I Found You', 'Mon année de césure devait être la plus belle de ma vie. J\'avais tout prévu. Des petits boulots pour m\'autofinancer à l\'itinéraire du roadtrip dont je rêvais depuis des mois. J\'étais sur le point de conquérir le Canada. 
Sur le point de changer ma vie pour le meilleur.Jusqu\'à ce qu\'un soir, mes yeux croisent ce regard bleu à la lueur assassine.Rien ne me prédestinait à tomber dans les griffes de la mafia irlandaise. Pourtant, cette nuit-là, mon rêve a viré au cauchemar.'),
(5,5,5,'2021-01-21',5,'Rien ne t\'efface', 'Par amour pour un enfant, que seriez-vous prêt à faire ? Maddi, elle, ira jusqu\'au bout...Une intrigue magistrale, un twist virtuose pour le nouveau suspense 100% Bussi.2010. Maddi est médecin généraliste à Saint-Jean-de-Luz, une vie comblée avec Esteban, son fils de 10 ans.Ce jour d\'été là, elle le laisse quelques minutes seul sur la plage. Quand elle revient, Esteban a disparu.2020. Maddi a refait sa vie, et revient sur cette plage en pèlerinage.Au bord de l\'eau, un enfant est là. Même maillot de bain, même taille, même corpulence, même coupe de cheveux. Elle s\'approche. Le temps se fige. C\'est Esteban, ou son jumeau parfait.Maddi n\'a plus qu\'une obsession, savoir qui est cet enfant.'),
(6,6,6,'2022-03-21',6,'Les oubliés','À Seabrook, petite ville de Floride, le jeune avocat Keith Russo est tué à coups de fusil alors qu\'il travaille un soir dans son bureau. L\'assassin n\'a laissé aucun indice. Il n\'y a aucun témoin, aucun mobile. Mais la police trouve bientôt un suspect, Quincy Miller, un homme noir et ancien client de Russo.Quincy est jugé et condamné à une peine de réclusion à perpétuité. Pendant vingt-deux ans, il se morfond en prison et ne cesse de clamer son innocence. De désespoir, il écritune lettre aux Anges Gardiens, une fondation qui tente de réparer les erreurs judiciaires et sauver des innocents. Cullen Post, avocat et ancien pasteur de l\'Église épiscopale,en fait partie. 
Les Anges Gardiens n\'acceptent que très peu d\'affaires.'),
(7,7,7,'2017-06-08',7,'La Servante écarlate','Devant la chute drastique de la fécondité, la république de Gilead, récemment fondée par des fanatiques religieux.Vêtue de rouge, Defred, \" servante écarlate \" parmi d\'autres, à qui l\'ona ôté jusqu\'à son nom,elle songe au temps où les femmes avaient le droit de lire, de travailler... En rejoignant un réseau secret, elle va tout tenter pour recouvrer sa liberté.'),
(8,8,8,'2020-01-02',1,'Là où chantent les écrevisses', 'Pendant des années, les rumeurs les plus folles ont couru sur " la Fille des marais " de Barkley Cove, une petite ville de Caroline du Nord. Pourtant, Kya n\'est pas cette fille sauvage et analphabète que tous imaginent et craignent.A l\'âge de dix ans, abandonnée par sa famille, elle doit apprendre à survivre seule dans le marais, devenu pour elle un refuge naturel et une protection. Sa rencontre avec Tate, un jeune homme doux et cultivé qui lui apprend à lire et à écrire, lui fait découvrir la science et la poésie, transforme la jeune fille à jamais. Mais Tate, appelé par ses études, l\'abandonne à son tour. La solitude Devient si pesante que Kya ne se méfie pas assez de celui qui va bientôt croiser son chemin et lui promettre une autre vie.'),
(9,9,9,'2021-11-23',2,'Fausses pistes', 'La dernière fois que la détective Tracy Crosswhite s\'est trouvée à Cedar Grove, c\'était pour voir l\'assassin de sa sœur envoyé derrière les barreaux. Elle compte bien profiter de son congé maternité, mais le shérif de la petite bourgade lui demande son aide pour résoudre une double affaire : un incendie criminel ayant causé la mort de la femme d\'un officier de police et celle d\'un ancien avocat victime d\'un prétendu accident de chasse.Alors que le meurtrier qu\'elle traque se rapproche dangereusement d\'elle, jusqu\'où Tracy sera-t-elle prête à aller pour trouver la vérité ?')