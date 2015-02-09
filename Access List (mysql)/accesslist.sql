SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accesslist
-- ----------------------------
DROP TABLE IF EXISTS `accesslist`;
CREATE TABLE `accesslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) DEFAULT NULL,
  `Uuid` varchar(255) DEFAULT NULL,
  `Acces` set('Entrepot','Police','Infirmerie','Cantina','Appartement #1','Appartement #2','Appartement #3','Appartement #4','Appartement #5') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
