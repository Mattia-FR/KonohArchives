-- Nettoyage
DROP TABLE IF EXISTS ninja_missions;
DROP TABLE IF EXISTS ninja_jutsus;
DROP TABLE IF EXISTS missions;
DROP TABLE IF EXISTS jutsus;
DROP TABLE IF EXISTS ninjas;
DROP TABLE IF EXISTS villages;

-- VILLAGES
CREATE TABLE villages (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL
);

INSERT INTO villages (name, country) VALUES
('Konohagakure', 'Pays du Feu'),
('Sunagakure', 'Pays du Vent'),
('Kirigakure', 'Pays de l’Eau'),
('Kumogakure', 'Pays de la Foudre'),
('Iwagakure', 'Pays de la Terre'),
('Amegakure', 'Pays de la Pluie'),
('Takigakure', 'Pays des Cascades'),
('Otogakure', 'Pays du Son'),
('Kusagakure', 'Pays de l’Herbe'),
('Hoshigakure', 'Pays des Étoiles');

-- JUTSUS
CREATE TABLE jutsus (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  type ENUM('Ninjutsu', 'Genjutsu', 'Taijutsu', 'Kekkei Genkai', 'Fuuinjutsu', 'Senjutsu'),
  chakra_nature ENUM('Fire', 'Water', 'Earth', 'Wind', 'Lightning', 'None') DEFAULT 'None',
  description TEXT
);

INSERT INTO jutsus (name, type, chakra_nature, description) VALUES
('Rasengan', 'Ninjutsu', 'None', 'Technique de concentration du chakra en une sphère tournoyante, inventée par le Quatrième Hokage.'),
('Chidori', 'Ninjutsu', 'Lightning', 'Accumulation de chakra foudre dans la main, permet des attaques rapides et perçantes.'),
('Kage Bunshin no Jutsu', 'Ninjutsu', 'None', 'Clone d’ombre : création de copies matérielles du corps de l’utilisateur.'),
('Amaterasu', 'Kekkei Genkai', 'Fire', 'Flammes noires inextinguibles générées par le Mangekyō Sharingan.'),
('Tsukuyomi', 'Genjutsu', 'None', 'Illusion mentale extrêmement puissante qui déforme le temps perçu.'),
('Kirin', 'Ninjutsu', 'Lightning', 'Invocation de la foudre naturelle pour une attaque rapide et destructrice.'),
('Byakugan', 'Kekkei Genkai', 'None', 'Dojutsu du clan Hyuuga, permet une vision à 360° et à travers les objets.'),
('Hakke Rokujūyon Shō', 'Taijutsu', 'None', 'Technique de combat du clan Hyuuga : frappe 64 points de chakra d’un adversaire.'),
('Suiton: Suiryūdan no Jutsu', 'Ninjutsu', 'Water', 'Technique de l’élément eau qui crée un dragon aquatique géant.'),
('Katon: Gōkakyū no Jutsu', 'Ninjutsu', 'Fire', 'Technique du feu : l’utilisateur crache une énorme boule de feu.'),
('Raikiri', 'Ninjutsu', 'Lightning', 'Version améliorée du Chidori, maîtrisée par Kakashi.'),
('Fūinjutsu: Shiki Fūjin', 'Fuuinjutsu', 'None', 'Technique de scellement ultime invoquant le Dieu de la Mort.'),
('Rasenshuriken', 'Ninjutsu', 'Wind', 'Extension du Rasengan avec du chakra Fûton, inflige des dégâts cellulaires.'),
('Hiraishin no Jutsu', 'Ninjutsu', 'None', 'Technique de téléportation instantanée via marquage, inventée par Minato.'),
('Senjutsu: Mode Sennin', 'Senjutsu', 'None', 'Fusion du chakra naturel avec celui de l’utilisateur, augmente ses capacités.');

-- NINJAS
CREATE TABLE ninjas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  age INT,
  clan VARCHAR(100),
  `rank` ENUM('Genin', 'Chunin', 'Jonin', 'Anbu', 'Sannin', 'Kage') DEFAULT 'Genin',
  description TEXT,
  village_id INT,
  gender ENUM('Homme', 'Femme', 'Autre') DEFAULT 'Homme',
  FOREIGN KEY (village_id) REFERENCES villages(id)
);

INSERT INTO ninjas (name, age, clan, `rank`, description, village_id, gender) VALUES
-- Konoha
('Naruto Uzumaki', 17, 'Uzumaki', 'Jonin', 'Jinchuriki de Kyubi, futur Hokage, spécialisé en Ninjutsu.', 1, 'Homme'),
('Sasuke Uchiha', 17, 'Uchiha', 'Jonin', 'Dernier survivant de son clan, manie le Sharingan et techniques foudre.', 1, 'Homme'),
('Sakura Haruno', 17, NULL, 'Jonin', 'Disciple de Tsunade, spécialisée en médecine et force brute.', 1, 'Femme'),
('Kakashi Hatake', 29, 'Hatake', 'Jonin', 'Ninja copieur, ancien maître de l’équipe 7, Sharingan.', 1, 'Homme'),
('Hinata Hyuga', 17, 'Hyuga', 'Chunin', 'Membre du clan Hyuuga, utilisatrice du Byakugan.', 1, 'Femme'),
('Shikamaru Nara', 17, 'Nara', 'Jonin', 'Stratège surdoué, utilisateur des ombres.', 1, 'Homme'),
('Ino Yamanaka', 17, 'Yamanaka', 'Chunin', 'Spécialiste des techniques de possession mentale.', 1, 'Femme'),
('Rock Lee', 17, NULL, 'Chunin', 'Expert en Taijutsu pur, sans chakra.', 1, 'Homme'),
('Tenten', 17, NULL, 'Chunin', 'Spécialisée dans les armes ninja.', 1, 'Femme'),
('Neji Hyuga', 17, 'Hyuga', 'Jonin', 'Prodige du clan Hyuuga, Byakugan maîtrisé.', 1, 'Homme'),
-- Suna
('Gaara', 18, 'Sabaku', 'Kage', 'Jinchuriki de Shukaku, devenu Kazekage du village du sable.', 2, 'Homme'),
('Temari', 19, NULL, 'Jonin', 'Utilisatrice du Fūton, grande maîtrise de l’éventail.', 2, 'Femme'),
('Kankuro', 19, NULL, 'Jonin', 'Pupeteer, manie les marionnettes avec expertise.', 2, 'Homme'),
-- Kiri
('Mei Terumi', 30, NULL, 'Kage', 'Mizukage actuelle, manipule deux affinités élémentaires.', 3, 'Femme'),
('Zabuza Momochi', 26, NULL, 'Jonin', 'Démon du brouillard, ancien épéiste légendaire.', 3, 'Homme'),
('Haku', 15, NULL, 'Chunin', 'Maîtrise le Hyoton. Apparence androgyne et loyauté envers Zabuza.', 3, 'Autre'),
-- Kumo
('Killer Bee', 35, NULL, 'Jonin', 'Jinchuriki de Hachibi, manie les sabres et le rapping.', 4, 'Homme'),
('Darui', 26, NULL, 'Jonin', 'Bras droit du Raikage, manipule l’élément lumière et ténèbres.', 4, 'Homme'),
('Samui', 22, NULL, 'Jonin', 'Ninja calme et compétente du village de la Foudre.', 4, 'Femme'),
-- Iwa
('Kurotsuchi', 18, NULL, 'Chunin', 'Petite-fille de l’ancien Tsuchikage, maîtrise le Doton et Yōton.', 5, 'Femme');

-- MISSIONS
CREATE TABLE missions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(150) NOT NULL,
  `rank` ENUM('D', 'C', 'B', 'A', 'S') DEFAULT 'D',
  description TEXT
);

INSERT INTO missions (title, `rank`, description) VALUES
('Escorte du Daimyō du Pays du Feu', 'B', 'Protéger le seigneur féodal jusqu’à Konoha. Prévoir embuscades possibles.'),
('Surveillance de la frontière nord', 'C', 'Patrouille dans les forêts limitrophes à Iwa, identifier toute activité suspecte.'),
('Infiltration à Otogakure', 'S', 'Mission secrète pour recueillir des informations sur Orochimaru.'),
('Extermination d’un groupe de bandits', 'B', 'Localiser et neutraliser un groupe de pillards dans les montagnes.'),
('Protection d’un convoi médical', 'A', 'Accompagner des médecins de Suna à Konoha. Priorité absolue à la survie.'),
('Mission de récupération de rouleaux volés', 'A', 'Récupérer des documents classés volés dans les archives de Konoha.'),
('Neutralisation d’un déserteur rang A', 'A', 'Traquer un ninja renégat dangereux, ancien membre de l’Anbu.'),
('Surveillance d’un jinchūriki instable', 'S', 'Observation rapprochée d’un hôte démoniaque hors contrôle.'),
('Escorter une équipe scientifique à Taki', 'C', 'Mission diplomatique et logistique dans les ruines anciennes de Takigakure.'),
('Protection d’un festival local à Suna', 'D', 'Mission de rang mineur : prévenir les troubles pendant les festivités.');

-- RELATIONS JUTSUS/NINJAS
CREATE TABLE ninja_jutsus (
  ninja_id INT,
  jutsu_id INT,
  PRIMARY KEY (ninja_id, jutsu_id),
  FOREIGN KEY (ninja_id) REFERENCES ninjas(id) ON DELETE CASCADE,
  FOREIGN KEY (jutsu_id) REFERENCES jutsus(id) ON DELETE CASCADE
);

INSERT INTO ninja_jutsus (ninja_id, jutsu_id) VALUES
(1, 1),
(1, 3),
(1, 13),
(1, 15),
(2, 2),
(2, 4),
(2, 5),
(2, 6),
(3, 15),
(4, 2),
(4, 3),
(4, 11),
(4, 14),
(5, 7),
(5, 8),
(6, 5),
(7, 5),
(9, 3),
(10, 7),
(10, 8),
(11, 3),
(11, 10),
(12, 13),
(13, 3),
(14, 9),
(14, 10),
(15, 9),
(15, 12),
(16, 9),
(17, 1),
(17, 15),
(18, 2),
(18, 6),
(19, 10),
(20, 9);

-- RELATIONS MISSIONS/NINJAS
CREATE TABLE ninja_missions (
  ninja_id INT,
  mission_id INT,
  PRIMARY KEY (ninja_id, mission_id),
  FOREIGN KEY (ninja_id) REFERENCES ninjas(id) ON DELETE CASCADE,
  FOREIGN KEY (mission_id) REFERENCES missions(id) ON DELETE CASCADE
);

INSERT INTO ninja_missions (ninja_id, mission_id) VALUES
(4, 1),
(6, 1),
(7, 1),
(5, 2),
(10, 2),
(9, 2),
(2, 3),
(15, 3),
(16, 3),
(11, 4),
(13, 4),
(12, 4),
(3, 5),
(14, 5),
(19, 5),
(1, 6),
(2, 6),
(4, 6),
(17, 7),
(18, 7),
(20, 7),
(5, 8),
(6, 8),
(8, 8),
(7, 9),
(9, 9),
(10, 9),
(11, 10),
(12, 10),
(13, 10);
