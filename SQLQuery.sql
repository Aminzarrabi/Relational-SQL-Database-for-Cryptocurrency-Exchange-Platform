create database exchange 

create table Tb_client(client_id int primary key ,
fname varchar(20) not null ,
lname varchar(20) not null,
card_number varchar(16) not null ,
phone_number bigint not null ,
national_number bigint not null,
national_code varchar(10) not null)

create table Tb_crypto (crypto_id int primary key,
crypto_name varchar(20) not null,
crypto_sign varchar(5) not null,
crypto_net varchar(20) not null,
crypto_buy_price int not null,
crypto_sell_price int not null)

create table Tb_variz_bardasht (transaction_id int primary key ,
amout bigint not null,
transaction_type varchar(10) not null ,
resid_number bigint not null,
tarikh date null)

create table Tb_kifpol(kifpol_id int primary key ,
client_id int not null
foreign key (client_id) references Tb_client (client_id),
transaction_id int not null
foreign key (transaction_id) references Tb_variz_bardasht (transaction_id),
mojodi_toman bigint not null ,
mojodi_crypto int not null)

create table Tb_sell_crypto (sell_id int primary key ,
kifpol_id int not null
foreign key (kifpol_id) references Tb_kifpol (kifpol_id),
crypto_id int not null
foreign key (crypto_id) references Tb_crypto (crypto_id),
tether_sell_price int not null,
sell_time date not null)

create table Tb_buy_crypto (buy_id int primary key ,
kifpol_id int not null
foreign key (kifpol_id) references Tb_kifpol (kifpol_id),
crypto_id int not null
foreign key (crypto_id) references Tb_crypto (crypto_id),
tether_buy_price int not null,
buy_time date not null)

create table Tb_transfer_crypto (transfer_id int primary key ,
kifpol_id int not null
foreign key (kifpol_id) references Tb_kifpol (kifpol_id),
transfer_type varchar(10) not null ,
crypto_id int not null
foreign key (crypto_id) references Tb_crypto (crypto_id),
maximum_amount int not null,
destination_wallet varchar(48) not null,
source_wallet varchar(48) not null,
comment_memo varchar(20) not null)


insert into Tb_client values
(10001,'golnaz','bahrami',5047061072728088,09121004546,0924588812,0924588812)
,(10002,'sam','zamani',5047061024963532,09152204875,0925644852,0928584)
,(10003,'helia','farokhi',5958458923652145,09355628912,0925744212,0925144)
,(10004,'raha','motaleb',5896324859622278,09151002022,0927844011,0927844011)
,(10005,'yunes','karimi',4852631597995864,09369986952,0927045799,09275375)

insert into Tb_crypto values
(120,'Bitcoin','BTC','BITCOIN',68241,68200)
,(145,'Ethereum','ETH','ETHEREUM',2537,2527)
,(117,'Notcoin','NOT','TON',0.007528,0.007500)
,(111,'Aave','AAVE','ETHEREUM',148.12,146.84)
,(186,'Helium','HNT','SOLANA',7.01,6.89)

insert into Tb_variz_bardasht values
(425777,1500000,'variz',475457,'2021-03-18')
,(142411,30000000,'variz',7584217,'2023-07-01')
,(362544,8000000,'bardasht',857428,'2022-11-15')
,(174225,250000,'variz',4775287,'2024-10-25')
,(871431,680000000,'bardasht',1991523,'2023-07-08')

insert into Tb_kifpol values
(157274,10001,425777,140000000,500)
,(4757271,10002,362544,4220000,200)
,(5758981,10003,871431,70000000,7000)
,(1175268,10004,174225,4530000,2100)
,(7618378,10005,142411,610000,46000)

insert into Tb_buy_crypto values
(200004,1175268,120,54000,'2023-07-01')
,(200572,7618378,145,68000,'2024-10-25')
,(200321,5758981,120,70000,'2023-04-13')
,(200879,157274,120,57000,'2022-11-15')
,(200787,4757271,111,63500,'2024-08-03')

insert into Tb_sell_crypto values
(300101,1175268,111,54000,'2023-07-25')
,(300452,7618378,111,40000,'2021-03-18')
,(300875,1175268,120,65000,'2024-10-01')
,(300142,4757271,111,45300,'2022-11-12')
,(300334,157274,120,61000,'2023-07-08')

insert into Tb_transfer_crypto values
(400871,1175268,'variz',111,1000000000,'1Cvwr9i5W1ibSgJFbEUQgmoRZ7hJC9ZmUD','1A8Hy7khhS1iavb51mvjdFrYxeAVM6bCwP','152648597562')
,(400410,7618378,'bardasht',111,1000000,'18nub8ngtYSXxoTxPXzbCt5L9ErV4V4jEM','1DR23oMzPrzkSKY47QcS9mKpf69UHVR9MW','732728757571')
,(400900,1175268,'variz',111,10000000,'16CMN1AwtX64EiFEgu27VN5gWLDACz36WV','12NjWRAJNJHnCBso3F4TMBLryQT5yzi4Re','76187819688')
,(400142,4757271,'variz',145,100000000,'1LMWfeBv8d12YnPcr6drkWU8Be9wmRWuzK','17jDWJTQvwn8V1tBJ155EdtLa8j94nrraT','5252485273')
,(400774,157274,'bardasht',117,1000000000,'1A8Hy7khhS1iavb51mvjdFrYxeAVM6bCwP','16kVbxZpvswLUp4WGbEXqktbc3BJSNBt25','34672154976')


select * from Tb_kifpol
select * from Tb_client
select * from Tb_crypto
select * from Tb_variz_bardasht
select * from Tb_transfer_crypto
select * from Tb_buy_crypto
select * from Tb_sell_crypto