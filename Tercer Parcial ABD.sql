--creamos la tabla 1
create table t_producto(
    id_producto number(5),
    nombre varchar2(50),
    precio number(5),
    num_tipo number(3),
    num_marca number(3)
);

--creamos la tabla 2
create table t_tipo(
    id_tipo number(5),
    tipo varchar2(50)
);

--creamos la tabla 3
create table t_marca(
    id_marca number(5),
    marca varchar2(50)
);

--creamos la tabla extra
create table t_vitamina(
    mensaje varchar2(100));

--creamos o remplazamos nuestro disparador tr_almacenar tablas
create or replace trigger tr_almacenar_tablas
before insert --para antes de insertar en la tabla t_producto
on t_producto
for each row --por cada fila
begin
-- creamos la condición,donde si el valor que ingresa el usuario en num_tipo es n, entonces inserta en la tabla
-- t_tipo el número n y también ingresa el tipo de alimento o bebida que le corresponde
    if(:new.num_tipo=1) then
    insert into t_tipo values(:new.num_tipo,'Torta');
    elsif(:new.num_tipo=2) then
    insert into t_tipo values(:new.num_tipo,'Sandwich');
    elsif(:new.num_tipo=3) then
    insert into t_tipo values(:new.num_tipo,'Taco');
    elsif(:new.num_tipo=4) then
    insert into t_tipo values(:new.num_tipo,'Quesadilla');
    elsif(:new.num_tipo=5) then
    insert into t_tipo values(:new.num_tipo,'Gringa');
    elsif(:new.num_tipo=6) then
    insert into t_tipo values(:new.num_tipo,'Tamal');
    elsif(:new.num_tipo=7) then
    insert into t_tipo values(:new.num_tipo,'Comida Rapida');
    elsif(:new.num_tipo=8) then
    insert into t_tipo values(:new.num_tipo,'Atole');
    elsif(:new.num_tipo=9) then
    insert into t_tipo values(:new.num_tipo,'Agua');
    elsif(:new.num_tipo=10) then
    insert into t_tipo values(:new.num_tipo,'Cacahuates');
    elsif(:new.num_tipo=11) then
    insert into t_tipo values(:new.num_tipo,'Refresco');
    elsif(:new.num_tipo=12) then
    insert into t_tipo values(:new.num_tipo,'Gordita');
    elsif(:new.num_tipo=13) then
    insert into t_tipo values(:new.num_tipo,'Pizza');
    elsif(:new.num_tipo=14) then
    insert into t_tipo values(:new.num_tipo,'Frituras');
    elsif(:new.num_tipo=15) then
    insert into t_tipo values(:new.num_tipo,'Chilaquiles');
    elsif(:new.num_tipo=16) then
    insert into t_tipo values(:new.num_tipo,'Enchiladas');
    elsif(:new.num_tipo=17) then
    insert into t_tipo values(:new.num_tipo,'Fruta');
    elsif(:new.num_tipo=18) then
    insert into t_tipo values(:new.num_tipo,'Bebida Caliente');
    elsif(:new.num_tipo=19) then
    insert into t_tipo values(:new.num_tipo,'Dulce');
    elsif(:new.num_tipo=20) then
    insert into t_tipo values(:new.num_tipo,'Desayuno');
    end if;
    
    -- creamos la condición,donde si el valor que ingresa el usuario en num_marca es n, entonces inserta en la tabla
    -- t_marca el número n y también ingresa quien es el que vende ese producto
    if(:new.num_marca=1) then
    insert into t_marca values(:new.num_tipo,'El Tio');
    elsif(:new.num_marca=2) then
    insert into t_marca values(:new.num_tipo,'La Amiga');
    elsif(:new.num_marca=3) then
    insert into t_marca values(:new.num_tipo,'La Toña');
    elsif(:new.num_marca=4) then
    insert into t_marca values(:new.num_tipo,'La Tamalera');
    elsif(:new.num_marca=5) then
    insert into t_marca values(:new.num_tipo,'El Homie');
    elsif(:new.num_marca=6) then
    insert into t_marca values(:new.num_tipo,'El Timador');
    elsif(:new.num_marca=7) then
    insert into t_marca values(:new.num_tipo,'La Doña');
    end if;
    
    
    -- creamos la condición,donde substraemos el primer caracter del nombre en la tabla t_productos
    -- y si el caracter es igual a la letra T, lo agregamos a la tabla t_vitamina y a ese le concatenamos un mensaje
    if(substr(:new.nombre,1,1)='T') then
    insert into t_vitamina values('Se insertó un producto con vitamina T :' || :new.nombre);
    end if;
    
    --terminamos nuestro disparador
end tr_almacenar_tablas;


--realizamos todas las inserciones a nuestra tabla t_producto, automáticamente llenará las demás
insert into t_producto values(1,'Torta de jamón',40,1,1);
insert into t_producto values(2,'Torta de salchicha',40,1,1);
insert into t_producto values(3,'Torta de pastor',45,1,1);
insert into t_producto values(4,'Torta de suadero',45,1,1);
insert into t_producto values(5,'Torta campechana',50,1,1);
insert into t_producto values(6,'Torta de milanesa',45,1,1);
insert into t_producto values(7,'Torta de pierna',45,1,1);
insert into t_producto values(8,'Sandwich de jamón',25,2,1);
insert into t_producto values(9,'Sandwich de salchicha',25,2,1);
insert into t_producto values(10,'Sandwich de pastor',30,2,1);
insert into t_producto values(11,'Sandwich de suadero',30,2,1);
insert into t_producto values(12,'Sandwich campechana',35,2,1);
insert into t_producto values(13,'Sandwich de milanesa',30,2,1);
insert into t_producto values(14,'Sandwich de pierna',30,2,1);
insert into t_producto values(15,'Taco de suadero',22,3,1);
insert into t_producto values(16,'Taco de pastor',22,3,1);
insert into t_producto values(17,'Taco campechano',22,3,1);
insert into t_producto values(18,'Taco de canasta',18,3,2);
insert into t_producto values(19,'Quesadilla de queso',25,4,3);
insert into t_producto values(20,'Quesadilla de pollo',25,4,3);
insert into t_producto values(21,'Gringa de pastor',35,5,1);
insert into t_producto values(22,'Gringa de suadero',35,5,1);
insert into t_producto values(23,'Tamal verde',18,6,4);
insert into t_producto values(24,'Tamal rojo',18,6,4);
insert into t_producto values(25,'Tamal de mole',18,6,4);
insert into t_producto values(26,'Tamal dulce',18,6,4);
insert into t_producto values(27,'Tamal oaxaqueño',22,6,4);
insert into t_producto values(28,'Hot dogs',35,7,4);
insert into t_producto values(29,'Atole de chocolate',18,8,4);
insert into t_producto values(30,'Atole de galleta',18,8,4);
insert into t_producto values(31,'Atole de fresa',18,8,4);
insert into t_producto values(32,'Atole de vainilla',18,8,4);
insert into t_producto values(33,'Agua natural',13,9,5);
insert into t_producto values(34,'Agua de limon',17,9,2);
insert into t_producto values(35,'Agua de horchata',17,9,2);
insert into t_producto values(36,'Agua de jamaica',17,9,2);
insert into t_producto values(37,'Agua de piña colada',17,9,2);
insert into t_producto values(38,'Agua de frutos tropicales',17,9,2);
insert into t_producto values(39,'Agua de carlos quinto',17,9,2);
insert into t_producto values(40,'Cacahuates japoneses',6,10,5);
insert into t_producto values(41,'Cacahuates españoles',6,10,5);
insert into t_producto values(42,'Cacahuates enchilados',6,10,5);
insert into t_producto values(43,'Refresco de cola',16,11,5);
insert into t_producto values(44,'Refresco de manzana',16,11,5);
insert into t_producto values(45,'Refresco de tutifruti',16,11,5);
insert into t_producto values(46,'Refresco de limon',16,11,5);
insert into t_producto values(47,'Refresco de tamarindo',16,11,5);
insert into t_producto values(48,'Refresco de toronja',16,11,5);
insert into t_producto values(49,'Refrsco de uva',16,11,5);
insert into t_producto values(50,'Gordita de chicharron',40,12,1);
insert into t_producto values(51,'Gordita de longaniza',40,12,1);
insert into t_producto values(52,'Pizza hawuaiana',17,13,6);
insert into t_producto values(53,'Pizza de peperoni',17,13,6);
insert into t_producto values(54,'Pizza a la mexicana',17,13,6);
insert into t_producto values(55,'Papas fritas',10,14,5);
insert into t_producto values(56,'Chilaquiles verdes',50,15,3);
insert into t_producto values(57,'Chilaquiles rojos',50,15,3);
insert into t_producto values(58,'Enchiladas verdes',50,16,3);
insert into t_producto values(59,'Enchiladas rojas',50,16,3);
insert into t_producto values(60,'Coctel de frutas',50,17,7);
insert into t_producto values(61,'Café',20,18,7);
insert into t_producto values(62,'Té',20,18,7);
insert into t_producto values(63,'Chicles',2,19,5);
insert into t_producto values(64,'Mentas',10,19,5);
insert into t_producto values(65,'Mazapán normal',9,19,5);
insert into t_producto values(66,'Mazapán de chocolate',6,19,5);
insert into t_producto values(67,'Cigarros',7,20,5);

insert into t_tipo values(21,'Cerveza');
insert into t_tipo values(22,'Blue');
insert into t_tipo values(23,'Paloma');
insert into t_tipo values(24,'Cantarito');
insert into t_tipo values(25,'Mojito');

insert into t_marca values(8,'Caverna');
insert into t_marca values(9,'Ranchito');
insert into t_marca values(10,'Pariente');
insert into t_marca values(11,'Oxxo');
insert into t_marca values(12,'Aurrera');



--hacemos un full join donde mostraremos solo el precio de la tabla t_producto, el tipo de la tabla t_tipo y la marca de la tabla t_marca
--si es que estos tienen relacion
select t_producto.precio,t_tipo.tipo,t_marca.marca from t_producto full join t_tipo on t_producto.num_tipo = t_tipo.id_tipo full join t_marca on t_producto.num_marca = t_marca.id_marca;
--hacemos un inner join donde mostraremos los datos de la tabla t_producto y de la tabla t_tipo
--si es que estos tienen relacion y si el nombre del producto es 'taco de canasta'
select * from t_producto inner join t_tipo on t_producto.num_tipo = 3 and t_tipo.id_tipo = 3 and t_producto.nombre = 'taco de canasta';
--hacemos un left join donde mostraremos los datos de la tabla t_producto y de la tabla t_tipo
--si es que estos tienen relacion
select * from t_producto left join t_tipo on t_producto.num_tipo = t_tipo.id_tipo;
--hacemos un right join donde mostraremos los datos de la tabla t_producto y de la tabla t_marca
--si es que estos NO tienen relacion
select * from t_producto right join t_marca on t_producto.num_marca <> t_marca.id_marca;
--hacemos un full join donde mostraremos todos los datos de las tablas t_producto, t_tipo y t_marca
--si es que estos NO tienen relacion
select * from t_producto full join t_tipo on t_producto.num_tipo <> t_tipo.id_tipo full join t_marca on t_producto.num_marca <> t_marca.id_marca;
--hacemos un full join donde mostraremos todos los datos de las tablas t_producto, t_tipo y t_marca
--en el que substraeremos el primer caracter del nombre, tipo y marca de los datos de la tabla y mostraremos solo los que
--empiecen por la letra B y por la letra P
select * from t_producto full join t_tipo on substr(t_producto.nombre,1,1)='B' and substr(t_producto.nombre,1,1)='P' and
 substr(t_tipo.tipo,1,1)='B' and substr(t_tipo.tipo,1,1)='P'full join t_marca on substr(t_marca.marca,1,1)='B' and substr(t_marca.marca,1,1)='P';



select * from t_producto;
select * from t_tipo;
select * from t_marca;
select * from t_vitamina;
drop table t_producto;
drop table t_tipo;
drop table t_marca;
drop table t_vitamina;
drop trigger tr_almacenar_tablas;