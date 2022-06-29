/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.26 : Database - trade
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `trade`;

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_id` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_order` */

insert  into `t_order`(`order_id`,`create_time`,`price`,`status`,`user_id`) values ('16541575901291','2022-06-02 16:13:10','64.80',0,1),('16544171962611','2022-06-05 16:19:56','38.50',0,1),('16544173855641','2022-06-05 16:23:06','7.50',0,1);

/*Table structure for table `t_order_item` */

DROP TABLE IF EXISTS `t_order_item`;

CREATE TABLE `t_order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `total_price` decimal(11,2) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_order_item` */

insert  into `t_order_item`(`id`,`name`,`count`,`price`,`total_price`,`order_id`) values (1,'iPad保护套',1,'12.80','12.80','16541575901291'),(2,'锐舞可充电小风扇',2,'26.00','52.00','16541575901291'),(6,'锐舞可充电小风扇',1,'26.00','26.00','16544171962611'),(7,'支架三脚架',1,'12.50','12.50','16544171962611'),(8,'四六级收音机',1,'7.50','7.50','16544173855641');

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sales` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `img_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `releaseTime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`name`,`price`,`username`,`sales`,`stock`,`img_path`,`describe`,`releaseTime`) values (1,'iPad保护套','12.80','劳动积极分子',2,0,'static/img/product_img/保护套.jpg','全新未拆封2021款苹果iPad保护套、迪士尼保护套，适用型号，2019/2020/2021iPad 10.2寸','2022/6/3 21:28:37'),(2,'锐舞可充电小风扇','26.00','啃刀先生',3,-1,'static/img/product_img/锐舞风扇.jpg','锐舞轻语系列桌面风扇、超级静音、超大风量、续航8小时，功能正常、轻微使用痕迹','2022/6/3 21:28:37'),(3,'四六级收音机','7.50','外向的小麦',1,1,'static/img/product_img/收音机.jpg','四六级收音机+送两节南孚5号电池','2022/6/3 21:28:37'),(4,'支架三脚架','12.50','鼓浪屿的小清新',1,1,'static/img/product_img/三脚架.jpg','考研复试/面试落地三脚架自拍架，一套包含支架+手机夹+云台+收纳袋','2022/6/3 21:28:37'),(5,'粉笔公考教材＋网课','80.00','用户_10086',1,1,'static/img/product_img/粉笔公考.jpg','正品粉笔教材，已上岸低价出','2022/6/3 21:28:37'),(31,'化妆棉','10.00','懒熊',1,1,'static/img/product_img/化妆棉.jpg','全新未拆封化妆棉','2022/6/3 21:28:37'),(32,'书立','3.50','小贝壳',1,1,'static/img/product_img/书立.jpg','简约四叶草书立','2022/6/3 21:28:37'),(33,'台灯','7.80','丘树',1,1,'static/img/product_img/台灯.jpg','可充电插电台灯','2022/6/3 21:28:37'),(34,'洗衣机','100.00','souk010',1,1,'static/img/product_img/洗衣机.jpg','毕业出，功能正常，只是有点旧','2022/6/3 21:28:37'),(35,'A4纸','5.00','别在熬夜',1,1,'static/img/product_img/A4纸.jpg','晨光A4纸','2022/6/3 21:28:37'),(36,'收纳箱','6.50','guiji',1,1,'static/img/product_img/收纳箱.jpg','大号收纳箱，便宜出','2022/6/3 21:28:37'),(37,'鞋架','10.00','guiji',1,1,'static/img/product_img/鞋架.jpg','出鞋架','2022/6/5 19:50:41');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`email`) values (1,'guiji','123456','guiji@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
