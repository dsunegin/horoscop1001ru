CREATE DATABASE esoteric CHARACTER SET utf8 COLLATE utf8_general_ci;
create user esoteric_user@localhost;
set password for esoteric_user@localhost=password('psw_esoteric_user');
grant all on esoteric.* to esoteric_user@localhost with grant option;

use esoteric;

CREATE TABLE horoscope (
id INT(7) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
title_tpl TEXT,
post_tpl  TEXT,
title TEXT,
post  TEXT,
date      DATE,
zodiac    VARCHAR(255),
site      VARCHAR(255),
href      VARCHAR(255),
lang      VARCHAR(2) NOT NULL,
published BOOLEAN DEFAULT false
);

CREATE TABLE zodiac (
id INT(7) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
zodiac VARCHAR(255),

kto_chto  VARCHAR(255),
kogo_chego  VARCHAR(255),
komu_chemu  VARCHAR(255),
kogo_chto  VARCHAR(255),
kem_chem  VARCHAR(255),
kom_chom  VARCHAR(255),

m_kto_chto  VARCHAR(255),
m_kogo_chego  VARCHAR(255),
m_komu_chemu  VARCHAR(255),
m_kogo_chto  VARCHAR(255),
m_kem_chem  VARCHAR(255),
m_kom_chom  VARCHAR(255),

lang      VARCHAR(2) NOT NULL
);


INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (1,'aries','Овен','Овна','Овну','Овна','Овном','Овне',   'Овны','Овнов','Овнам','Овнов','Овнами','Овнах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (2,'taurus','Телец','Тельца','Тельцу','Тельца','Тельцом','Тельце',   'Тельцы','Тельцов','Тельцам','Тельцов','Тельцами','Тельцах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (3,'gemini','Близнец','Близнеца','Близнецу','Близнеца','Близнецом','Близнеце',  'Близнецы','Близнецов','Близнецам','Близнецов','Близнецами','Близнецах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (4,'cancer','Рак','Рака','Раку','Рака','Раком','Раке',  'Раки','Раков','Ракам','Раков','Раками','Раках','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (5,'leo','Лев','Льва','Льву','Льва','Львом','Льве',   'Львы','Львов','Львам','Львов','Львами','Львах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (6,'virgo','Дева','Девы','Деве','Деву','Девою','Деве',   'Девы','Дев','Девам','Дев','Девами','Девах','ru');

INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (7,'libra','','','','','','',   'Весы','Весов','Весам','Весы','Весами','Весах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (8,'scorpio','Скорпион','Скорпиона','Скорпиону','Скорпиона','Скорпионом','Скорпионе',   'Скорпионы','Скорпионов','Скорпионам','Скорпионов','Скорпионами','Скорпионах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (9,'sagittarius','Стрелец','Стрельца','Стрельцу','Стрельца','Стрельцом','Стрельце',   'Стрельцы','Стрельцов','Стрельцам','Стрельцов','Стрельцами','Стрельцах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (10,'capricorn','Козерог','Козерога','Козерогу','Козерога','Козерогом','Козероге',   'Козероги','Козерогов','Козерогам','Козерогов','Козерогами','Козерогах','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (11,'aquarius','Водолей','Водолея','Водолею','Водолея','Водолеем','Водолее',    'Водолеи','Водолеев','Водолеям','Водолеев','Водолеями','Водолеях','ru');
INSERT INTO zodiac(id,zodiac,kto_chto,kogo_chego,komu_chemu,kogo_chto,kem_chem,kom_chom, m_kto_chto,m_kogo_chego,m_komu_chemu,m_kogo_chto,m_kem_chem,m_kom_chom,lang)
VALUES (12,'pisces','Рыба','Рыбы','Рыбе','Рыбу','Рыбою','Рыбе',    'Рыбы','Рыб','Рыбам','Рыб','Рыбами','Рыбах','ru');


