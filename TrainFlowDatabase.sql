/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 8.0.45 : Database - trainflow
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trainflow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `trainflow`;

/*Table structure for table `exercises` */

DROP TABLE IF EXISTS `exercises`;

CREATE TABLE `exercises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` enum('Cardio','HIIT','Mobility','Strength') DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `exercises` */

insert  into `exercises`(`id`,`category`,`description`,`name`) values 
(1,'Strength','Classic chest press exercise with barbell.','Bench Press'),
(2,'Strength','Fundamental lower body barbell movement.','Barbell Squat'),
(3,'Strength','Hip hinge movement for posterior chain strength.','Deadlift'),
(4,'Strength','Bodyweight vertical pulling exercise for back and biceps.','Pull Up'),
(5,'Strength','Overhead press for shoulders and triceps.','Shoulder Press'),
(6,'Strength','Isolation exercise for biceps.','Bicep Curl'),
(7,'Strength','Isolation exercise for triceps.','Tricep Extension'),
(8,'Cardio','Steady-state treadmill or outdoor running.','Running'),
(9,'Mobility','Core stability hold exercise.','Plank'),
(10,'HIIT','Full body explosive conditioning exercise.','Burpees'),
(11,'Strength','Horizontal rowing movement for upper back.','Barbell Row'),
(12,'Strength','Lower body unilateral exercise targeting quads and glutes.','Lunges'),
(13,'Strength','Chest isolation exercise with dumbbells or cables.','Chest Fly'),
(14,'Strength','Lat-focused vertical pulling exercise.','Lat Pulldown'),
(15,'Strength','Leg isolation exercise for quadriceps.','Leg Extension'),
(16,'Strength','Hamstring isolation machine exercise.','Leg Curl'),
(17,'Strength','Shoulder isolation exercise for side delts.','Lateral Raise'),
(18,'Strength','Arm isolation exercise for brachialis and biceps.','Hammer Curl'),
(19,'Strength','Triceps isolation movement usually done on cable machine.','Cable Pushdown'),
(20,'HIIT','Fast bodyweight lower body movement for conditioning.','Jump Squats'),
(21,'HIIT','Mountain climber exercise for core and conditioning.','Mountain Climbers'),
(22,'Cardio','Jump rope exercise for endurance and coordination.','Jump Rope'),
(23,'Mobility','Dynamic mobility drill for hips and legs.','Walking Knee Hugs'),
(24,'Mobility','Mobility exercise for hips and thoracic spine.','World Greatest Stretch');

/*Table structure for table `refresh_token` */

DROP TABLE IF EXISTS `refresh_token`;

CREATE TABLE `refresh_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKf95ixxe7pa48ryn1awmh2evt7` (`user_id`),
  CONSTRAINT `FKjtx87i0jvq2svedphegvdwcuy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `refresh_token` */

insert  into `refresh_token`(`id`,`expiry_date`,`token`,`user_id`) values 
(9,'2026-04-13 21:23:53.244397','b62138f5-c570-49f7-ba8e-3e2fba367fe8',1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`) values 
(3,'ROLE_USER'),
(4,'ROLE_ADMIN');

/*Table structure for table `training_day_exercises` */

DROP TABLE IF EXISTS `training_day_exercises`;

CREATE TABLE `training_day_exercises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reps` int DEFAULT NULL,
  `rest_time` int DEFAULT NULL,
  `sets` int DEFAULT NULL,
  `exercise_id` int DEFAULT NULL,
  `training_day_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK85q8ocin0e8hki9g14sx2lfif` (`exercise_id`),
  KEY `FKavr6fmmee9yq46seei6yrgiei` (`training_day_id`),
  CONSTRAINT `FK85q8ocin0e8hki9g14sx2lfif` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`),
  CONSTRAINT `FKavr6fmmee9yq46seei6yrgiei` FOREIGN KEY (`training_day_id`) REFERENCES `training_days` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `training_day_exercises` */

insert  into `training_day_exercises`(`id`,`reps`,`rest_time`,`sets`,`exercise_id`,`training_day_id`) values 
(10,8,90,3,2,1),
(11,8,90,3,1,1),
(12,10,75,3,11,1),
(13,30,45,3,9,1),
(14,8,60,2,23,1),
(15,6,60,2,24,1),
(16,8,90,3,3,2),
(17,10,75,3,5,2),
(18,10,75,3,12,2),
(19,10,60,3,6,2),
(20,30,45,3,9,2),
(21,8,60,2,23,2),
(22,8,90,3,2,3),
(23,8,90,3,14,3),
(24,10,75,3,13,3),
(25,12,60,3,7,3),
(26,12,60,3,17,3),
(27,6,60,2,24,3),
(28,8,90,4,1,4),
(29,8,90,4,11,4),
(30,10,75,3,5,4),
(31,12,60,3,13,4),
(32,12,60,3,6,4),
(33,12,60,3,19,4),
(34,8,90,4,2,5),
(35,8,90,4,3,5),
(36,12,60,3,15,5),
(37,12,60,3,16,5),
(38,12,60,3,12,5),
(39,30,45,3,9,5),
(40,8,90,4,14,6),
(41,8,90,4,1,6),
(42,12,60,3,17,6),
(43,12,60,3,18,6),
(44,12,60,3,7,6),
(45,8,75,3,4,6),
(46,10,90,4,2,7),
(47,10,75,3,12,7),
(48,12,60,3,15,7),
(49,12,60,3,16,7),
(50,30,45,3,9,7),
(51,8,60,2,23,7),
(52,15,30,4,10,8),
(53,20,30,4,20,8),
(54,30,30,4,21,8),
(55,60,30,4,22,8),
(56,30,30,3,9,8),
(57,20,0,1,8,9),
(58,45,30,3,9,9),
(59,20,30,3,21,9),
(60,8,60,2,24,9),
(61,10,60,2,23,9),
(62,12,45,4,1,10),
(63,15,45,4,12,10),
(64,12,45,4,14,10),
(65,15,30,4,10,10),
(66,30,30,3,9,10),
(67,25,0,1,8,11),
(68,90,30,4,22,11),
(69,20,30,4,20,11),
(70,30,30,4,21,11),
(71,8,60,2,24,11);

/*Table structure for table `training_days` */

DROP TABLE IF EXISTS `training_days`;

CREATE TABLE `training_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` enum('Friday','Monday','Saturday','Sunday','Thursday','Tuesday','Wednesday') DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKvh2xgcusjvc4ax2j998jwikt` (`plan_id`),
  CONSTRAINT `FKvh2xgcusjvc4ax2j998jwikt` FOREIGN KEY (`plan_id`) REFERENCES `training_plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `training_days` */

insert  into `training_days`(`id`,`day`,`name`,`plan_id`) values 
(1,'Monday','Full Body A',1),
(2,'Wednesday','Full Body B',1),
(3,'Friday','Full Body C',1),
(4,'Monday','Chest',2),
(5,'Tuesday','Back',2),
(6,'Wednesday','Legs',2),
(7,'Thursday','Shoulders',2),
(8,'Friday','Arms',2),
(9,'Monday','HIIT 1',3),
(10,'Wednesday','Cardio + Core',3),
(11,'Friday','HIIT 2',3),
(12,'Saturday','Fat Burn',3);

/*Table structure for table `training_plans` */

DROP TABLE IF EXISTS `training_plans`;

CREATE TABLE `training_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `difficulty` varchar(255) NOT NULL,
  `goal` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `is_suggested` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfmh2q5ujep9t2ysd9eh75mto2` (`user_id`),
  CONSTRAINT `FKfmh2q5ujep9t2ysd9eh75mto2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `training_plans` */

insert  into `training_plans`(`id`,`description`,`difficulty`,`goal`,`is_active`,`is_suggested`,`name`,`user_id`) values 
(1,'Full body plan for beginners, 3x per week','Beginner','Strength','\0','','Beginner Full Body',1),
(2,'Advanced muscle building split','Advanced','Muscle Gain','\0','','Muscle Gain Split',1),
(3,'Fat loss plan with HIIT and cardio','Intermediate','Fat Loss','\0','','Fat Loss HIIT',1);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`),
  CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values 
(1,3);

/*Table structure for table `user_saved_plans` */

DROP TABLE IF EXISTS `user_saved_plans`;

CREATE TABLE `user_saved_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) DEFAULT NULL,
  `saved_at` datetime(6) DEFAULT NULL,
  `plan_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3h9trhngo1i90hgeg3aojf79b` (`plan_id`),
  KEY `FKh2simt7xf8o34x6bc6q4eyhsw` (`user_id`),
  CONSTRAINT `FK3h9trhngo1i90hgeg3aojf79b` FOREIGN KEY (`plan_id`) REFERENCES `training_plans` (`id`),
  CONSTRAINT `FKh2simt7xf8o34x6bc6q4eyhsw` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_saved_plans` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `age` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`age`,`email`,`gender`,`height`,`name`,`password`,`surname`,`weight`) values 
(1,25,'domagoj@test.com','MALE',180,'Domagoj','$2a$10$FitSFgXP68OD5YGFX28PxuosxHTRFIAiLAhoT7kst5qiQPVEqIEt.','Cirko',80);

/*Table structure for table `workout_logs` */

DROP TABLE IF EXISTS `workout_logs`;

CREATE TABLE `workout_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `actual_reps` int DEFAULT NULL,
  `actual_sets` int DEFAULT NULL,
  `actual_weight` int DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `planned_reps` int DEFAULT NULL,
  `planned_sets` int DEFAULT NULL,
  `planned_weight` int DEFAULT NULL,
  `exercise_id` int NOT NULL,
  `training_day_id` int NOT NULL,
  `training_day_exercise_id` int NOT NULL,
  `training_plan_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq91yj006d78mkwanc7h1731i6` (`exercise_id`),
  KEY `FKdm3r35e6h7v6pgvnou9m66e9o` (`training_day_id`),
  KEY `FKeyc406n88v34fbl3j2mgf86eq` (`training_day_exercise_id`),
  KEY `FK1jwtgdfij322kbvhgq4kmnqxs` (`training_plan_id`),
  KEY `FK6d7vhgag2nq8cnachxbcmpe0b` (`user_id`),
  CONSTRAINT `FK1jwtgdfij322kbvhgq4kmnqxs` FOREIGN KEY (`training_plan_id`) REFERENCES `training_plans` (`id`),
  CONSTRAINT `FK6d7vhgag2nq8cnachxbcmpe0b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKdm3r35e6h7v6pgvnou9m66e9o` FOREIGN KEY (`training_day_id`) REFERENCES `training_days` (`id`),
  CONSTRAINT `FKeyc406n88v34fbl3j2mgf86eq` FOREIGN KEY (`training_day_exercise_id`) REFERENCES `training_day_exercises` (`id`),
  CONSTRAINT `FKq91yj006d78mkwanc7h1731i6` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `workout_logs` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
