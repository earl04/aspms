-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_aspms
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_aspms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_aspms` DEFAULT CHARACTER SET utf8 ;
USE `db_aspms` ;

-- -----------------------------------------------------
-- Table `db_aspms`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`client` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1',
  `last_name` VARCHAR(20) NOT NULL COMMENT 'Benito',
  `first_name` VARCHAR(20) NOT NULL COMMENT 'Lawrence John',
  `middle_name` VARCHAR(20) NULL COMMENT 'Pano',
  `company_name` VARCHAR(40) NULL COMMENT 'Globe Telecom Inc.',
  `contact_num` VARCHAR(13) NOT NULL COMMENT '09497580056',
  `email_address` VARCHAR(45) NULL COMMENT 'lawrencejohn.benito@gmail.com',
  `tin` VARCHAR(45) NULL COMMENT '135-536-536-001',
  `address_line` TEXT(45) NOT NULL COMMENT 'B1 L19 Golden Mile, San Isidro',
  `address_municipality` VARCHAR(45) NOT NULL COMMENT 'Cainta',
  `address_province` VARCHAR(45) NOT NULL COMMENT 'Rizal',
  `active` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1 - active | 0 - inactive',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 23:14:08',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_name` (`last_name` ASC, `first_name` ASC, `middle_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintenance Table. This table contains information about the clients of the system.';


-- -----------------------------------------------------
-- Table `db_aspms`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`employee` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1',
  `last_name` VARCHAR(20) NOT NULL COMMENT 'Benito',
  `first_name` VARCHAR(20) NOT NULL COMMENT 'Lawrence John',
  `middle_name` VARCHAR(20) NOT NULL COMMENT 'Pano',
  `contact_number` VARCHAR(13) NOT NULL COMMENT '09497580056',
  `email_address` VARCHAR(45) NOT NULL COMMENT 'lawrencejohn.benito@gmail.com',
  `address` TEXT NOT NULL COMMENT 'Cainta, Rizal',
  `active` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1 - active | 0 - inactive',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_name` (`last_name` ASC, `first_name` ASC, `middle_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintenance Table. This table contains all the information of a employee or a person in the system';


-- -----------------------------------------------------
-- Table `db_aspms`.`fabric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`fabric` (
  `id` INT(3) NOT NULL AUTO_INCREMENT COMMENT '1',
  `name` VARCHAR(45) NOT NULL COMMENT 'Cotton',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Categorical Table. This table holds all the used types of fabric for the system like Cotton, Twill, Satin, Leather or etc. The user may add new type of fabric.';


-- -----------------------------------------------------
-- Table `db_aspms`.`garment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`garment` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1',
  `name` VARCHAR(45) NOT NULL COMMENT 'T-shirt',
  `active` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1 - active | 0 - inactive',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unq_garment` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintenance Table. This table holds basic information of a base garment like T-shirts, Shorts, Pajama, etc. ';


-- -----------------------------------------------------
-- Table `db_aspms`.`operation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`operation` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1',
  `name` VARCHAR(45) NOT NULL COMMENT 'Leg Bias',
  `active` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1 - active | 0 - inactive',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_unq` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintenance Table. This table holds basic information of a certain operation, like O.E, Attach Garter, Leg Bias, Fold-Hem, etc.';


-- -----------------------------------------------------
-- Table `db_aspms`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`order` (
  `id` INT(4) ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'ORD20180001',
  `date_ordered` DATE NOT NULL COMMENT '2018-06-26',
  `client` INT(11) NOT NULL COMMENT '7',
  `po_number` VARCHAR(45) NOT NULL COMMENT 'PO2018-005 (From Client)',
  `payment_terms` VARCHAR(45) NOT NULL COMMENT '30 Days',
  `remarks` TEXT NULL COMMENT 'Special Request, Shipping Address, Delivery Conditions, Etc.',
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  INDEX `fk_client_idx` (`client` ASC),
  UNIQUE INDEX `unq_client_date` (`date_ordered` ASC, `client` ASC),
  CONSTRAINT `fk_client_order`
    FOREIGN KEY (`client`)
    REFERENCES `db_aspms`.`client` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'This table contains information about the order of the clients to the company.';


-- -----------------------------------------------------
-- Table `db_aspms`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`payment` (
  `id` INT(4) ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '0457',
  `order` INT(4) ZEROFILL NOT NULL,
  `date_received` DATE NOT NULL COMMENT '2018-07-04',
  `payment_mode` VARCHAR(45) NOT NULL COMMENT 'Cash',
  `reference_num` VARCHAR(45) NULL DEFAULT NULL COMMENT 'N/A',
  `amount_received` DOUBLE NOT NULL COMMENT '2500',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  INDEX `fk_payment_order_idx` (`order` ASC),
  CONSTRAINT `fk_payment_order`
    FOREIGN KEY (`order`)
    REFERENCES `db_aspms`.`order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'This table will contain information about the payment collection per order.';


-- -----------------------------------------------------
-- Table `db_aspms`.`quotation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`quotation` (
  `id` INT(4) ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '1',
  `client` INT(5) NOT NULL COMMENT '4',
  `date_created` DATE NOT NULL COMMENT '2018-06-25',
  `product_count` INT(2) NOT NULL COMMENT '3 (Number of products in the quotation)',
  PRIMARY KEY (`id`),
  INDEX `fk_client_quo_idx` (`client` ASC),
  UNIQUE INDEX `unique_quote` (`client` ASC, `date_created` ASC),
  CONSTRAINT `fk_client_quo`
    FOREIGN KEY (`client`)
    REFERENCES `db_aspms`.`client` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'This table connects operations needed for a certain product/garment.';


-- -----------------------------------------------------
-- Table `db_aspms`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`product` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1\n',
  `quotation` INT(4) ZEROFILL NOT NULL COMMENT '5',
  `garment` INT(5) NOT NULL COMMENT '3',
  `fabric` INT(5) NOT NULL COMMENT '1',
  `unit_price` DOUBLE NOT NULL COMMENT '950.00',
  `description` TEXT NULL COMMENT 'production description',
  PRIMARY KEY (`id`),
  INDEX `fk_garmet_idx` (`garment` ASC),
  INDEX `fk_fabric_idx` (`fabric` ASC),
  INDEX `fk_quotation_prod_idx` (`quotation` ASC),
  CONSTRAINT `fk_quotation_prod`
    FOREIGN KEY (`quotation`)
    REFERENCES `db_aspms`.`quotation` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_fabric_prod`
    FOREIGN KEY (`fabric`)
    REFERENCES `db_aspms`.`fabric` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_garment_prod`
    FOREIGN KEY (`garment`)
    REFERENCES `db_aspms`.`garment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintenance Table. This table will hold information about the product to be sold and will be placed in quotation, purchase order, or etc.';


-- -----------------------------------------------------
-- Table `db_aspms`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`order_product` (
  `id` INT(5) NOT NULL AUTO_INCREMENT COMMENT '1',
  `order` INT(4) ZEROFILL NOT NULL COMMENT 'ORD20180001',
  `product` INT(5) NOT NULL COMMENT '9',
  `size` VARCHAR(10) NOT NULL COMMENT 'FS, XS, S, M, L, XL, XXL, XXL',
  `quantity` INT(11) NOT NULL COMMENT '500',
  `excess` INT(5) NULL COMMENT 'excess qtyt for production, null if no excess',
  PRIMARY KEY (`id`),
  INDEX `fk_product_idx` (`product` ASC),
  UNIQUE INDEX `unq_ordered_product` (`order` ASC, `product` ASC, `size` ASC),
  CONSTRAINT `fk_order`
    FOREIGN KEY (`order`)
    REFERENCES `db_aspms`.`order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product`
    FOREIGN KEY (`product`)
    REFERENCES `db_aspms`.`product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'This table contains the list of ordered products with its quantity, size and excess for production';


-- -----------------------------------------------------
-- Table `db_aspms`.`product_operation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`product_operation` (
  `product` INT(5) NOT NULL COMMENT '1',
  `operation` INT(5) NOT NULL COMMENT '4',
  `rate` DOUBLE NOT NULL COMMENT '0.50',
  PRIMARY KEY (`product`, `operation`),
  INDEX `fk_operation_po_idx` (`operation` ASC),
  CONSTRAINT `fk_operation_po`
    FOREIGN KEY (`operation`)
    REFERENCES `db_aspms`.`operation` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_po`
    FOREIGN KEY (`product`)
    REFERENCES `db_aspms`.`product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'This table connects operations needed for a certain product/garment.';


-- -----------------------------------------------------
-- Table `db_aspms`.`work_assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`work_assignment` (
  `id` INT(5) NOT NULL COMMENT '1',
  `order` INT(4) ZEROFILL NOT NULL COMMENT 'ORD20180001',
  `employee` INT(5) NOT NULL COMMENT '5',
  `operation` INT(5) NOT NULL COMMENT '6',
  `quantity` INT(5) NOT NULL COMMENT '500',
  `due_date` DATE NOT NULL COMMENT '2018-07-04',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  INDEX `fk_order_wo_idx` (`order` ASC),
  INDEX `fk_employee_wo_idx` (`employee` ASC),
  INDEX `fk_operation_wo_idx` (`operation` ASC),
  CONSTRAINT `fk_employee_wo`
    FOREIGN KEY (`employee`)
    REFERENCES `db_aspms`.`employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_operation_wo`
    FOREIGN KEY (`operation`)
    REFERENCES `db_aspms`.`operation` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_wo`
    FOREIGN KEY (`order`)
    REFERENCES `db_aspms`.`order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Transaction Table. This table contains the assigned task(operation) with quantity of a order for a certan worker.';


-- -----------------------------------------------------
-- Table `db_aspms`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`status` (
  `id` TINYINT(2) NOT NULL AUTO_INCREMENT COMMENT '1',
  `description` VARCHAR(45) NOT NULL COMMENT 'Completed',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_description` (`description` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COMMENT = 'Categorical Table. This table holds all the status used for the system like Completed, Pending, Rejected or etc. The user may add new status.';


-- -----------------------------------------------------
-- Table `db_aspms`.`production_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aspms`.`production_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '1',
  `assignment` INT(11) NOT NULL COMMENT '8',
  `quantity` INT(5) NOT NULL COMMENT '200',
  `status` TINYINT(2) NOT NULL DEFAULT '2' COMMENT '2',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '2018-06-25 23:14:08',
  `date_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '2018-07-19 20:00:00',
  PRIMARY KEY (`id`),
  INDEX `fk_status_pl_idx` (`status` ASC),
  INDEX `fk_assignment_pl_idx` (`assignment` ASC),
  CONSTRAINT `fk_assignment_pl`
    FOREIGN KEY (`assignment`)
    REFERENCES `db_aspms`.`work_assignment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_status_pl`
    FOREIGN KEY (`status`)
    REFERENCES `db_aspms`.`status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Transaction Table. This table will contains all the log of the employee for task(operation) they did.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
