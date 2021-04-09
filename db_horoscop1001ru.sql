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


