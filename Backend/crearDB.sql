CREATE SCHEMA `datawarehouse` ;
CREATE TABLE `dataWarehouse`.`users` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(100) NOT NULL, `last_name` VARCHAR(100) NOT NULL, `email` VARCHAR(255) NOT NULL UNIQUE, `password` VARCHAR(255) NOT NULL, `isAdmin` TINYINT(1) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `dataWarehouse`.`regions` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(50) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `dataWarehouse`.`countries` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(50) NOT NULL, `regionId` INTEGER NOT NULL, PRIMARY KEY (`id`), FOREIGN KEY (`regionId`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB;
CREATE TABLE `dataWarehouse`.`cities` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(50) NOT NULL, `countryId` INTEGER NOT NULL, PRIMARY KEY (`id`), FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB;
CREATE TABLE `dataWarehouse`.`companies` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(50) NOT NULL, `address` VARCHAR(100) NOT NULL, `email` VARCHAR(50) NOT NULL, `phone` VARCHAR(50) NOT NULL, `cityId` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB;
CREATE TABLE `dataWarehouse`.`contacts` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(50) NOT NULL, `last_name` VARCHAR(50) NOT NULL, `occupation` VARCHAR(50) NOT NULL, `email` VARCHAR(100) NOT NULL, `address` VARCHAR(100) NOT NULL, `phone` VARCHAR(100) NOT NULL, `companyId` INTEGER NOT NULL, `cityId` INTEGER NOT NULL, PRIMARY KEY (`id`), FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB;

