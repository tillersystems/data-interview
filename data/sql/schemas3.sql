
/* --- Initialization --- */

set SQL_MODE = "NO_AUTO_VALUE_ON_ZERO" ;
set time_zone = "+00:00" ;

/* --- Schema creation --- */

drop schema if exists `oltp3`;
create schema `oltp3` ;  
use `oltp3` ;

/* --- Entities table creation --- */

create table `oltp3`.`store` (
    `id` int(10) not null,
    `name` varchar(128) collate utf8_bin not null,
    `address` text collate utf8_bin,
    
    primary key (`id`)
) engine=InnoDB default charset=utf8 collate=utf8_bin ;

create table `oltp3`.`product` (
    `id` int(10) not null,
    `name` varchar(128) collate utf8_bin not null,
    `unit_price` int(10) not null,
    
    primary key (`id`)
) engine=InnoDB default charset=utf8 collate=utf8_bin ;

create table `oltp3`.`sale` (
    `id` int(10) not null,
    `product_id` int(10) not null,
    `quantity` int(10) not null,
    
    primary key (`id`),
    foreign key (`product_id`) references `oltp3`.`product` (`id`)
) engine=InnoDB default charset=utf8 collate=utf8_bin ;

/* --- Relations tables creation --- */

create table `oltp3`.`product_store_relation` (
    `product_id` int(10) not null,
    `store_id` int(10) not null,
    
    foreign key (`product_id`) references `oltp3`.`product` (`id`),
    foreign key (`store_id`) references `oltp3`.`store` (`id`)
) engine=InnoDB default charset=utf8 collate=utf8_bin ;
