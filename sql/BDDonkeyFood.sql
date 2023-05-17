Drop database if exists DonkeyFoodDB;
CREATE database DonkeyFoodDB;
use DonkeyFoodDB;

#Tabla para usuarios
Create table Usuarios(
Correo varchar (300),
Nombre varchar (300),
Contrasena varchar (300)
);
insert into Usuarios values("Pedro@gmail","Juan","A1");
insert into Usuarios values("a@gmail","a1","A1");

Select * From Usuarios;

#Tabla para vendedores
Create table Vendedores(
CorreoV varchar (300),
NombreV varchar (300),
ContrasenaV varchar (300)
);

insert into Vendedores values ("1","Juan perez","1Juan");
insert into Usuarios values("a@gmail","a1","A1");
insert into Vendedores values("a","a","a");
select * from Vendedores;

#Tabla de productos en venta
Create table Productos(
IdProducto int primary key,
CantidadProducto int,
NombreProducto varchar (300),
PrecioProducto varchar (30),
DescripcionProducto varchar (300),
ImagenProducto varchar (9999),        #Cambiar una vez se tenga el codigo para subir archivos tipo png a la base de datos
DetallesProducto varchar (300)       #Para guardar los detalles de los productos se ocupara un array dentro de los jsp para que los pueda leer separados por una ","
);

insert into Productos values ("1","2","Coca","300","COCACOLA DE 1 LITRO","https://thefoodtech.com/wp-content/uploads/2020/05/coca-cola.jpg","Es coca");
insert into Productos values ("2","3","Torta de jamon","100","Torta de jamon","https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Torta_Cubana.jpg/1200px-Torta_Cubana.jpg","Torta con jamon");
insert into Productos values ("3","3","Dulce","25","10 dulces","https://s.cornershopapp.com/product-images/1500044.jpg?versionId=JFF.DrhbeWhVfbySDICNiyZyOed0K4JL","10 dulces aciduladitos");
insert into Productos values ("4","3","Pepsi","250","Pepsi en lata","https://cdn.shopify.com/s/files/1/0566/4391/1854/products/7501031311309_352c0ce2-9ab3-4721-b68c-f8f5bfa493d0.png?v=1626649481","200ml");
insert into Productos values ("5","3","Hamburguesa","20","Hamburguesa de carne","https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/NCI_Visuals_Food_Hamburger.jpg/640px-NCI_Visuals_Food_Hamburger.jpg","Lleva carne");
select * from Productos;

Create table Pedidos(
IdUsuario int,
IdVendedor int,
DetallesPedido varchar (300),   #Aca se enviara el arreglo de los detalles del pedido en caso de que el producto tenga detalles como condimentos
FormaPago varchar (300),
FechaPedido varchar (300),
FechaFinPedido varchar (300)
);
Insert into Pedidos values (1,"1","Detalle,XD","Efectivo","1/2/23","2/3/23");
select * from Pedidos;

create table bolsa(
Correo varchar (300),
Objetos varchar (1000), #aqui se gurdara el array de los objetos para que le llegue el mensaje a la cafeteria de los productos que se quieren 
Detalles varchar (1000) #Aca se va a guardar el array de cada uno de los detalles de cada pedido
);

create table ped(

correo varchar (300),
productos varchar (300),
nota varchar (300),
estado varchar (300)
);
select  * from ped;











