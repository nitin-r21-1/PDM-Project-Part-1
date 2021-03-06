#drop database cs336project;
create database cs336project;
use cs336project;

create table `User` (`id` int,
					`username` varchar (30),
					`password` varchar(30),
                    `first_name` varchar(50),
                    `last_name` varchar(50),
                    `email` varchar(75),
                    `address` varchar(75),
                    primary key (`id`));
                    
create table `Admin`(`id` int,
					primary key (`id`),
                    foreign key (`id`) references user (`id`));
                    
create table `Representative`(`id` int,
								primary key (`id`), 
                                foreign key (`id`) references `User` (`id`));
                                
create table `End_User`(`id` int, 
						primary key (`id`),
						foreign key (`id`) references user (`id`));
                        
create table `QandA_AsksAnswers`(`qid` int,
								`question` varchar(280),
                                `answer` varchar(280),
                                `rep_id` int,
                                `end_id` int,
                                primary key (`qid`),
                               foreign key (`rep_id`) references `Representative` (`id`),
                                foreign key (`end_id`) references `End_User` (`id`));

create table `Text_Sells`(`textID` int,
							`end_id` int,
                            `condition` varchar(10),
                            `author` varchar(100),
                            `title` varchar(50),
                            `publisher` varchar(50),
                            `copyright` int,
                            `description` varchar(280),
                            `textType` varchar(10),
                            primary key (`textID`),
							foreign key (`end_id`) references `End_User` (`id`));
                                
create table `Auction_Held` (`auctionID` int,
						    `textID` int,
						    `price` int,
                            `minimum` int,
                            `increment` int,
                            `current` int,
						    `closing` datetime,
						    `closed` boolean,
						    `winner` int,
                            primary key (`auctionID`),
						    foreign key (`winner`) references `End_User` (`id`),
						    foreign key (`textID`) references `Text_Sells` (`textID`));
                        
create table `Bid_PlacesIn`(`bid_num` int,
							`auctionID` int,
                            `end_id` int,
                            `value` int,
                            `upper_limit` int,
                            `increment` int,
                            `placement` datetime,
                            primary key (`bid_num`),
                            foreign key (`auctionID`) references `Auction_Held` (`auctionID`),
                            foreign key (`end_id`) references `End_User` (`id`));
                        
create table `History` (`auctionID` int,
						`end_id` int,
                        `role` varchar(6),
                        primary key (`auctionID`, `end_id`),
                        foreign key (`auctionID`) references `Auction_Held` (`auctionID`),
						foreign key (`end_id`) references `End_User` (`id`));

                            
create table `Sends_Alert`(`end_id` int,
						`auctionID` int,
                        `message` varchar(280),
                        primary key(`end_id`, `auctionID`),
                        foreign key (`end_id`) references `End_User` (`id`),
                        foreign key (`auctionID`) references `Auction_held` (`auctionID`));
                        
create table `Book` (`textID` int,
					`isbn` varchar(13),
                    `genre` varchar(25),
                    `cover` varchar(10),
                    primary key (`textID`),
                    foreign key (`textID`) references `Text_Sells` (`textID`));
                    
create table `Magazine`(`textID` int,
						`issn` varchar(8),
                        `volume` int,
                        `issue` int,
                        primary key (`textID`),
						foreign key (`textID`) references `Text_Sells` (`textID`));
                        
create table `Reference`(`textID` int,
						`isbn` varchar(13),
                        `type` varchar(25),
                        primary key (`textID`),
						foreign key (`textID`) references `Text_Sells` (`textID`));
                        
create table `Earnings`(`end_id` int,
						`textID` int,
                        `auctionID` int,
                        `type` varchar(25),
                        `price` int,
                        primary key (`end_id`, `textID`, `auctionID`),
                        foreign key (`end_id`) references `End_User` (`id`),
                        foreign key (`textID`) references `Text_Sells` (`textID`),
                        foreign key (`auctionID`) references `Auction_Held` (`auctionID`));

#show tables;
insert into `User` (`id`, `username`, `password`) values (1, 'Admin', 'password');
insert into `User` (`id`, `username`, `password`) values (2, 'Rep', 'repwd');
insert into `User` (`id`, `username`, `password`) values (3, 'End', 'pwd'), (4, 'End2', 'pwd');
insert into `Admin` (`id`) values (1);
insert into `Representative` (`id`) values (2);
insert into `End_User` (`id`) values (3), (4);

insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (1, 3, 'Used', 'Author', 'Default', 'Publisher', 2021, 'DO NOT DELETE', 'Reference');
insert into `Reference` (`textID`, `isbn`, `type`) values (1, '2000', 'Dictionary');
insert into `Auction_Held` (`auctionID`, `textID`, `price`, `minimum`, `increment`, `current`, `closing`, `closed`) values (1, 1, 10, 15, 1, 0, '2021-4-23 23:59:59', true); 

#Test Data Below

insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (2, 3, 'New', 'Riordan', 'Percy Jackson', 'Hyperion', 2008, 'Greek Mythology for kids', 'Book');
insert into `Book` (`textID`, `isbn`, `genre`, `cover`) values (2, '2000', 'Fiction', 'Paperback');
insert into `Auction_Held` (`auctionID`, `textID`, `price`, `minimum`, `increment`, `current`, `closing`, `closed`) values (2, 2, 10, 15, 1, 0, '2021-4-26 23:59:59', false); 

insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (3, 3, 'Mint', 'Washington', 'Game Informer', 'Gamestop', 2005, 'Gaming News', 'Magazine');
insert into `Magazine` (`textID`, `issn`, `volume`, `issue`) values (3, '2000', 14 , 11);
insert into `Auction_Held` (`auctionID`, `textID`, `price`, `minimum`, `increment`, `current`, `closing`, `closed`) values (3, 3, 20, 50, 5, 0, '2021-4-27 23:59:59', false); 

insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (4, 3, 'Used', 'U.S.A', 'English Dictionary', 'Oxford', 1998, 'Antique', 'Reference');
insert into `Reference` (`textID`, `isbn`, `type`) values (4, '2000', 'Dictionary');
insert into `Auction_Held` (`auctionID`, `textID`, `price`, `minimum`, `increment`, `current`, `closing`, `closed`) values (4, 4, 64, 300, 30, 0, '2021-4-25 23:59:59', false); 

select * from `User`;