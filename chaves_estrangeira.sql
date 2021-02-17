

DROP TABLE IF EXISTS niveis_acessos;

CREATE TABLE `niveis_acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `situacao_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY (`situacao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO niveis_acessos VALUES("1","Administrador","1","2019-09-23 00:00:00",NULL);
INSERT INTO niveis_acessos VALUES("2","Coordenador","2","2019-09-23 00:00:00",NULL);
INSERT INTO niveis_acessos VALUES("3","Usuário","1","2019-09-23 00:00:00",NULL);


DROP TABLE IF EXISTS situacaos;

CREATE TABLE `situacaos` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`nome` varchar(30) NOT NULL,
`created` datetime NOT NULL,
`modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO situacaos VALUES("1","Ativo","2019-09-23 00:00:00",NULL);
INSERT INTO situacaos VALUES("2","Inativo","2019-09-23 00:00:00",NULL);
INSERT INTO situacaos VALUES("3","Bloqueado","2019-09-23 00:00:00",NULL);
INSERT INTO situacaos VALUES("4","Invalido","2019-09-23 00:00:00",NULL);

CREATE TABLE `usuarios` (
`id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`nome` varchar(120) NOT NULL,
`email` varchar(220) NOT NULL,
`situacao_id` int(11) NOT NULL,
`niveis_acesso_id` int(11) NOT NULL,
`created` datetime NOT NULL,
`modified` datetime DEFAULT NULL,
foreign key(situacao_id) references situacaos(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `niveis_acessos`
  ADD CONSTRAINT `niveis_acessos_ibfk_1` FOREIGN KEY (`situacao_id`) REFERENCES `situacaos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
