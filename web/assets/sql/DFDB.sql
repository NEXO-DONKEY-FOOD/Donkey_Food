################################# Creación de la DB #################################
create database DFDB;
################################# Acceso a la DB ##############################################
use DFDB;

################################# Creación de tablas ##################################################
create table Cafeterias
	(idCafeteria int not null primary key,
    NombreCaf varchar(40));
    
create table Trabajadores
	(idTrabajador int not null primary key,
    Nombre varchar(40),
    a_Paterno varchar(40),
    a_Materno varchar(40),
    idCafeteria int,
    foreign key (idCafeteria) references Cafeterias (idCafeteria));
    
	create table Oferta
	(idOferta int not null primary key,
	PorcentajeOfer int,
	Caducidad Date);
    
    create table Producto
	(idProducto int not null primary key,
    Producto varchar(40),
    Precio int,
    idOferta int,
    foreign key (idOferta) references Oferta (idOferta));
    

    
create table Prodcaf
	(idProcaf int not null primary key,
    idCafeteria int,
    idProducto int,
    foreign key (idCafeteria) references Cafeterias (idCafeteria),
    foreign key (idProducto) references Producto (idProducto));
    
    
    
    create table Usuario
	(Boleta int not null primary key,
    Nombre varchar(40),
    a_Paterno varchar(40),
    a_Materno varchar(40),
    Alias varchar(40),
    Correo_electronico varchar(50));
    
    
create table Pedido
	(idPedido int not null primary key,
    Boleta int,
    Fecha Date,
    Total int,
    foreign key (Boleta) references Usuario (Boleta));
    
    
    create table Complemento
	(idComplemento int not null primary key,
    Complemento varchar(40));
    
    
create table Detalle_Pedido
	(idDetallePed int not null primary key,
    idPedido int,
    idProducto int,
    Cantidad int,
    idComplemento int,
    foreign key (idPedido) references Pedido (idPedido),
    foreign key (idProducto) references Producto (idProducto),
    foreign key (idComplemento) references Complemento (idComplemento));
    
    
    
    
