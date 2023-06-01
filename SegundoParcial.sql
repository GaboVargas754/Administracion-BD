--Creamos nuestra tabla principal con PK--
create table t_alumnos (
    id_alu number(10) PRIMARY key,
    matricula_alu number(10) unique,
    nombre varchar2 (30),
    primer_apellido varchar2(30),
    segundo_apellido varchar2(30),
    carrera varchar2 (60),
    CONSTRAINT chk_carrera CHECK(carrera in ('Ing. Sistemas C','Ing. Sistemas A','Lic. Gastronomia','Contador Publico','Ing. Administracion','Ing. en ER','Ing. Indrustrial','Ing. Tics')),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

drop table t_alumnos;

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_isc (
    ISC nvarchar2(60),
    id_alu_S number(10),
    CONSTRAINT fk_id_alu_S FOREIGN key(id_alu_S) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table t_tics (
    Tic nvarchar2(60),
    id_alu_T number(10),
    CONSTRAINT fk_id_alu_T FOREIGN key(id_alu_T) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_gastro (
    Gas nvarchar2(60),
    id_alu_G number(10),
    CONSTRAINT fk_id_alu_G FOREIGN key(id_alu_G) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_admon (
    Admi nvarchar2(60),
    id_alu_A number(10),
    CONSTRAINT fk_id_alu_A FOREIGN key(id_alu_A) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_industrial (
    Ind nvarchar2(60),
    id_alu_I number(10),
    CONSTRAINT fk_id_alu_I FOREIGN key(id_alu_I) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_energias (
    Ener nvarchar2(60),
    id_alu_E number(10),
    CONSTRAINT fk_id_alu_E FOREIGN key(id_alu_E) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_automotriz (
    Aut nvarchar2(60),
    id_alu_Au number(10),
    CONSTRAINT fk_id_alu_Au FOREIGN key(id_alu_Au) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

--Creamos nuestra tabla secundaria y agregamos FK--
create table t_conta (
    Cont nvarchar2(60),
    id_alu_C number(10),
    CONSTRAINT fk_id_alu_C FOREIGN key(id_alu_C) references t_alumnos(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);


--Creamos procedimiento almacenado para ingresar alumnos, agregando los atributos a ocupar de las tablas--
create or replace procedure pa_almacenarAlumno
    (id_alu_p in number, matricula_alu_p in number,nombre_p in varchar2,apellido_paterno_p in varchar2,apellido_materno_p in varchar2,carrera_p in varchar2,grupo_p in varchar,semestre_p in number,edificio_p in varchar,promedio_pasado_p in varchar default '0')
as 
begin
--insertamos datos en la tabla principal--
    insert into t_alumnos values (id_alu_p, matricula_alu_p, nombre_p, apellido_paterno_p, apellido_materno_p, carrera_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    --realizamos
    if carrera_p = 'Ing. Sistemas C' then 
        insert into t_isc values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Sistemas A' then 
        insert into t_automotriz values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Lic. Gastronomia' then 
        insert into t_gastro values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Contador Publico' then 
        insert into t_conta values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Administracion' then 
        insert into t_admon values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. en ER' then 
        insert into t_energias values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Indrustrial' then 
        insert into t_industrial values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Tics' then 
        insert into t_tics values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
end;

drop PROCEDURE pa_almacenarAlumno;
delete from t_alumnos where  carrera='Ing. Sistemas A';

select * from  t_alumnos;

select * from  t_isc;
drop table  t_isc;
select * from  t_gastro;
drop table  t_gastro;
select * from  t_conta;
drop table  t_conta;
select * from  t_energias;
drop table  t_energias;
select * from  t_industrial;
drop table  t_industrial;
select * from  t_tics;
drop table  t_tics;
select * from  t_admon;
select * from  t_automotriz;
drop table  t_automotriz;
delete from t_automotriz where matricula_alu= 229020101;
delete from t_alumnos  where matricula_alu= 229020101;

/************fin consulta semesetres iguales*********/
select * from t_alumnos where semestre = 2;
    SELECT a.matricula_alu as matricula,a.primer_apellido || ' ' ||a.segundo_apellido|| ' ' ||  a.nombre as Nombre, a.promedio_pasado as promedio, a.semestre,a.carrera
    FROM t_alumnos a
    LEFT JOIN t_isc isc ON a.id_alu = isc.id_alu_S
    LEFT JOIN t_admon ad ON a.id_alu = ad.id_alu_A
    LEFT JOIN t_gastro gas ON a.id_alu = gas.id_alu_G
    LEFT JOIN t_industrial ind ON a.id_alu = ind.id_alu_I
    LEFT JOIN t_energias ener ON a.id_alu = ener.id_alu_E
    LEFT JOIN t_conta con ON a.id_alu = con.id_alu_C
    LEFT JOIN t_automotriz auto ON a.id_alu = auto.id_alu_Au
    LEFT JOIN t_tics tic ON a.id_alu = tic.id_alu_T
    WHERE a.semestre = '8';
/************fin consulta semesetres iguales*********/
execute pa_almacenarAlumno (1,206020065,'Brenda','Galvan','Nicolas','Ing. Sistemas C','6s11','6','A','80');
execute pa_almacenarAlumno (2,206020009,'Jose Antonio','Rodriguez','Segura','Ing. Sistemas C','6s11','6','A','90');
execute pa_almacenarAlumno (3,200020137,'Ricardo','Lopez','Castillo','Lic. Gastronomia','6g11','6','D','75');
execute pa_almacenarAlumno (4,191020002,'Erick Mauricio','Cevedo','Cruz','Contador Publico','8c11','8','I','89');
execute pa_almacenarAlumno (5,202210026,'Jenifer','Rubio','Tenorio','Ing. Administracion','3ad11','3','D','83');
execute pa_almacenarAlumno (6,185010032,'Sarai Eliza','Castillo','Mejia','Ing. en ER','8i11','8','I','95');
execute pa_almacenarAlumno (7,193020077,'Santi','Olivares','Alada','Ing. Indrustrial','8i11','8','I','98');
execute pa_almacenarAlumno (8,206020112,'Joshua Demian','Carrion','Galindo','Ing. Tics','6g21','6','E','95');
execute pa_almacenarAlumno (9,229020101,'Cesar','Mendez','Ortiz','Ing. Sistemas A','2sa11','2','D','79');
execute pa_almacenarAlumno (10,229026124,'Russel Santiago','Mis','Cocom','Ing. Sistemas A','2sA11','2','D','76');
execute pa_almacenarAlumno (11,229020070,'David','Vasquez','Gonzales','Ing. Sistemas A','2sA11','2','D','87');
execute pa_almacenarAlumno (12,229020016,'Diego','Angon','Garcia','Ing. Sistemas A','2sA11','2','D','89');
execute pa_almacenarAlumno (13,191020062,'Ricardo','Angeles','Castillo','Contador Publico','2c11','2','D','79');
execute pa_almacenarAlumno (14,190020105, 'Nubia', 'Delgadillo', 'Corona', 'Lic. Gastronomia', '8g12', '8',  'C', '85');
execute pa_almacenarAlumno (15,190020925, 'Karla', 'Martínez', 'Flores', 'Lic. Gastronomia', '8g12', '8', 'C', '85');
execute pa_almacenarAlumno (16,190025865, 'Gabriela Monserat', 'Maredo', 'Andrade', 'Lic. Gastronomia', '8g12', '8', 'C', '79');
execute pa_almacenarAlumno (17,200151466, 'Marisela', 'Figueroa', 'González', 'Lic. Gastronomia', '9III', '9', 'I', '87');
execute pa_almacenarAlumno (18,242020593, 'Carla', 'Hernández', 'Orozco', 'Lic. Gastronomia', '4ad12','4', 'D', '98');
execute pa_almacenarAlumno (19,195021178, 'Arturo', 'Raya', 'Soriano', 'Ing. en ER', '8e11', '8', 'I', '96');
execute pa_almacenarAlumno (20,225022005, 'Eduardo', 'Martínez', 'Casuales', 'Ing. en ER', '8e11', '8', 'I', '82');
execute pa_almacenarAlumno (21,195020099, 'Joshua', 'Aranda', 'Álvarez', 'Ing. en ER', '8e11', '8', 'I', '87');
execute pa_almacenarAlumno (22,205022148, 'José Luis', 'Romero', 'Martínez', 'Ing. en ER', '8e11', '8', 'I', '98');
execute pa_almacenarAlumno (23,212010027, 'Carla Leslie', 'Hernández', 'Morales', 'Ing. Administracion', '5ad11', '5', 'D', '95');
execute pa_almacenarAlumno (24,210020009, 'Ricardo', 'orgel', 'vineira', 'Lic. Gastronomia', '4g11', '4', 'C','84');
execute pa_almacenarAlumno (25,210800001, 'Alexis', 'Gutiérrez', 'González', 'Ing. Administracion', '3ad11', '3', 'D', '83');
execute pa_almacenarAlumno (26,220016057, 'Daniela', 'Rodríguez', 'Belmares', 'Lic. Gastronomia', '3g11', '3', 'C', '89');
execute pa_almacenarAlumno (27,191020067, 'Alan Brian', 'Uribe', 'Rubio', 'Contador Publico', '8c12', '8', 'E', '85');
execute pa_almacenarAlumno (28,229010089, 'Eduardo', 'Castellano', 'Chico', 'Ing. Sistemas A', '3sa11', '3', 'E', '85');
execute pa_almacenarAlumno (29,190010051, 'Juan Rubén', 'Figueroa', 'Anaya', 'Lic. Gastronomia','7g21', '7', 'G', '83');
execute pa_almacenarAlumno (30,225023010, 'Tania', 'caballero', 'Hernández', 'Ing. en ER', '7e11', '9', 'I', '98');
execute pa_almacenarAlumno (31,220026978, 'Lidia', 'Flores', 'Corral', 'Lic. Gastronomia', '2g22', '2', 'C', '88');
execute pa_almacenarAlumno (32,220020090, 'Álvaro', 'González', 'Vázquez', 'Lic. Gastronomia', '4g22', '2',  'C', '71');
execute pa_almacenarAlumno (33,234010012, 'Ricardo', 'Velázquez', 'Ramírez', 'Ing. en ER', '1a11', '1', 'H', '80');
execute pa_almacenarAlumno (34,206020001, 'Cristian Gabriel', 'Vargas', 'Salas', 'Ing. Sistemas C', '6s11', '6', 'A', '100');
execute pa_almacenarAlumno (35,212020053, 'Angie', 'Hernández', 'Osorio', 'Ing. Administracion', '4d11', '4', 'D', '86');
execute pa_almacenarAlumno (36,212020087, 'Valeria', 'Rivera', 'Chaco', 'Ing. Administracion', '4d11', '4', 'D', '89');
execute pa_almacenarAlumno (37,212028367, 'Vania', 'gastro', 'Ibarra', 'Ing. Administracion', '4ad11', '4', 'D', '90');
execute pa_almacenarAlumno (38,213023876, 'Isaac Fabián', 'García', 'Pérez', 'Ing. Indrustrial', '4i21', '4', 'I', '92');
execute pa_almacenarAlumno (39,181020024, 'Isaac Yair', 'Martínez', 'Hernández', 'Contador Publico', '3cs11', '3', 'C', '90');
execute pa_almacenarAlumno (40,220010027, 'Erika Yuliana', 'Cortés', 'Hernández', 'Lic. Gastronomia', '3g11', '3', 'C', '80');
execute pa_almacenarAlumno (41,220010039, 'Nidia', 'Guadalupe', 'Jiménez', 'Lic. Gastronomia', '3g11', '3', 'C', '83');
execute pa_almacenarAlumno (42,220010028, 'Itzel', 'González', 'Nava', 'Lic. Gastronomia', '3g11', '3', 'C', '87');
execute pa_almacenarAlumno (43,221020009, 'Alan Alfredo', 'Ramírez', 'Sánchez', 'Contador Publico', '2c11', '2', 'I', '89');
execute pa_almacenarAlumno (44,224020008, 'Amali Nayelin', 'Delgadillo', 'Castellano', 'Lic. Gastronomia', '2a11', '2', 'H', '92');
execute pa_almacenarAlumno (45,207010014, 'Pamela', 'Pérez', 'Ayala', 'Ing. Tics', '7t11', '7', 'E', '91');
execute pa_almacenarAlumno (46,200701100, 'Dulce María', 'Ortiz', 'Reyes', 'Ing. Tics', '7t11', '7', 'E', '91');
execute pa_almacenarAlumno (47,207010066, 'Ángel Gabriel', 'Hernández', 'García', 'Ing. Tics', '7t11', '7', 'E', '90');
execute pa_almacenarAlumno (48,221020002, 'Pamela', 'Marín', 'Hernández', 'Contador Publico', '2c11', '2', 'I', '81');
execute pa_almacenarAlumno (49,222020200, 'Sandra', 'Sánchez', 'Bravo','Ing. Administracion', '2ad11', '2', 'D', '85');
execute pa_almacenarAlumno (50,220010011, 'Denis', 'colmera', 'temple', 'Lic. Gastronomia', '3g21', '3', 'G', '80');
execute pa_almacenarAlumno (51,203020071, 'Samuel Benjamín', 'Romero', 'Martínez', 'Ing. Indrustrial', '6i11', '6', 'I', '92');
execute pa_almacenarAlumno (52,196027545, 'Edgar Adrián', 'Reyes', 'Miranda', 'Ing. Sistemas C', '8s11', '8', 'B', '82');

execute pa_almacenarAlumno (53,192030113,'Brandon Eduardo','Palma','Uribe','Ing. Indrustrial','7t11','7','F','81');
execute pa_almacenarAlumno (54,203010004,'Brandon','Duarte','Mendoza','Ing. Indrustrial','7t11','7','F','80');
execute pa_almacenarAlumno (55,193020010,'David Angel','Vara','Camacho','Ing. en ER','7e12','7','E','86');
execute pa_almacenarAlumno (56,193020047,'Jonathan','Romero','Ramon','Ing. en ER','7e11','7','E','87');
execute pa_almacenarAlumno (57,193020083,'Alan','Gusman','Castillo','Lic. Gastronomia','6g12','6','C','89');
execute pa_almacenarAlumno (58,203020061,'Itan','Palma','Uribe','Lic. Gastronomia','7g11','7','C','81');
execute pa_almacenarAlumno (59,203020061,'Joanna','Hurtado','Gerrero','Lic. Gastronomia','7g11','7','C','88');
execute pa_almacenarAlumno (60,232010027,'Alejandro','Juares','Marquez','Lic. Gastronomia','7g11','7','C','83');
execute pa_almacenarAlumno (61,232010003,'Vianey Monroy','Lopez','Garcia','Lic. Gastronomia','1g11','1','C','83');
execute pa_almacenarAlumno (62,232010004,'Joselyn','Arrieta','Perada','Lic. Gastronomia','1g11','1','C','74');
execute pa_almacenarAlumno (63,232010003,'Adamary Fernanda','Dominguez','Rocha','Ing. Indrustrial','1t11','1','F','85');
execute pa_almacenarAlumno (64,232010024,'Patricia','Cuevas','Mir','Ing. Indrustrial','1t11','1','F','70');
execute pa_almacenarAlumno (65,220020139,'Itan','Palma','Uribe','Ing. Indrustrial','7t11','7','F','81');
execute pa_almacenarAlumno (67,910206610,'Cristian','Sereno','López','Ing. en ER','8e11','8','I','87');
execute pa_almacenarAlumno (68,199002007,'Rafael','valen', 'Fernández','Ing. en ER','8e11','8','I','79');
execute pa_almacenarAlumno (70,194026986,'Noé','Fuentes', 'Ortiz','Ing. en ER','8e11','8','I','79');
execute pa_almacenarAlumno (71,194021070,'Adrián','García', 'Oregon','Ing. en ER','8e11','8','I','75');
execute pa_almacenarAlumno (73,203027010,'Yulissa ','arenas', 'reyes','Ing. Indrustrial','6t11','6','F','90');
execute pa_almacenarAlumno (72,203023545,'Alexander','Fuga', 'Castillo','Ing. Indrustrial','6t11','6','F','95');
execute pa_almacenarAlumno (74,203027009,'karla','fernández', 'figueroa','Lic. Gastronomia','3g11','3','B','83');
execute pa_almacenarAlumno (75,210020093,'Gustavo Alonso','Elvira', 'Leggins','Lic. Gastronomia','4g24','4','B','86');
execute pa_almacenarAlumno (76,203027023,'Orlando','Gerrero', 'Hernández','Lic. Gastronomia','7g11','7','B','78');
execute pa_almacenarAlumno (77,219010013,'Alonso','Hernandes', 'Garcia','Lic. Gastronomia','4g24','4','B','84');
execute pa_almacenarAlumno (78,203027012,'jonathan','jiménez', 'ortiz','Ing. Sistemas A','4sa2','2','D','87');
execute pa_almacenarAlumno (79,196820034,'soid','Quiñoles', 'Moion','Ing. Sistemas A','4sa2','2','D','90');
execute pa_almacenarAlumno (80,210022972,'jesús','Garcia', 'Cerrano','Ing. Sistemas A','4sa2','2','D','87');
execute pa_almacenarAlumno (81,222022070,'marco antonio','cruz', 'eugenio','Ing. Sistemas A','4sa2','4','D','83');
execute pa_almacenarAlumno (82,222020190,'lauro axel','ramírez', 'Galicia','Ing. Sistemas A','4sa2','4','D','81');
execute pa_almacenarAlumno (83,216020191,'uriel sosa','jaramillo', 'Guienes','Ing. Sistemas A','4sa2','4','D','80');
execute pa_almacenarAlumno (84,260101012,'armando','navarrete', 'moctezuma','Ing. Sistemas A','4sa2','4','D','75');
execute pa_almacenarAlumno (85,196020051,'cristian joshua','Galicia', 'Rodrigues','Ing. Sistemas A','4sa2','4','I','84');
execute pa_almacenarAlumno (86,196020986,'Michelle','Morales', 'Rodrigues','Ing. Indrustrial','4t21','4','I','86');
execute pa_almacenarAlumno (87,203027035,'luis alberto','elvira', 'barrios','Ing. Indrustrial','4t21','4','I','83');
execute pa_almacenarAlumno (88,196020053,'brando uriel','Trigo', 'Soriano','Ing. Indrustrial','4t21','4','I','95');
execute pa_almacenarAlumno (89,970200200, 'marina', 'aguilar', 'salvador', 'Leggins','Ing. Indrustrial','4t21','4','I','86');
execute pa_almacenarAlumno (90,232010025, 'Axel Gabriel', 'Rodríguez', 'Hernández','Ing. Indrustrial','4t21','4','I','86');
execute pa_almacenarAlumno (91,232020005,'Nadia Ivonne','Mendoza','García','Ing. gastronomía','4G24','4','G','86');
execute pa_almacenarAlumno (92,196020043, 'Axel','Rodrigues', 'Molan','Ing. gastronomía','2c24','2','C','86');
execute pa_almacenarAlumno (93,232010018,'Diego Gabriel', 'Pinal', 'Ortiz','Ing. gastronomía','2c24','2','C','86');
execute pa_almacenarAlumno (94,203010014,'Juan de Dios','Sanchez', 'Duran','Contador Publico','3c24','3','I','97');
execute pa_almacenarAlumno (95,203010006,'Jocobo','Rosales', 'Pinzon','Contador Publico','3c24','3','I','86');
execute pa_almacenarAlumno (96,203010013,'Karen','Juarez', 'Medina','Contador Publico','3c24','3','I','76');
execute pa_almacenarAlumno (97,220030025,'Patricia','Escobar', 'Leon','Contador Publico','3c24','3','I','93');
execute pa_almacenarAlumno (98,210010034,'Dennis','Gusman', 'Crus','Contador Publico','3c24','3','I','90');
execute pa_almacenarAlumno (99,232010003,'Fernanda','Escobar', 'Garcia','Contador Publico','3c24','3','I','85');
execute pa_almacenarAlumno (100,203010084,'Vania','Galicia', 'Gonsales','Contador Publico','3c24','3','I','82');








/********becas alumnos*******/
create table t_becaAlumno (
    matricula_alu number(10) unique,
    nombre varchar2 (100),
    promedio_pasado varchar(5),
    beca varchar2 (60),
    CONSTRAINT chk_beca CHECK(beca in ('no apto','10%','30%','50%','100%'))
);
select * from t_becaAlumno;
delete from t_becaAlumno where beca!='no apto';


CREATE OR REPLACE PROCEDURE determinar_apto_beca_all IS
    CURSOR c_alumnos IS
        SELECT matricula_alu, nombre,primer_apellido,segundo_apellido , promedio_pasado
        FROM t_alumnos;
    v_matricula_alu t_becaAlumno.matricula_alu%TYPE;
    v_nombre t_becaAlumno.nombre%TYPE;
    v_apellido_p t_becaAlumno.nombre%TYPE;
    v_apellido_m t_becaAlumno.nombre%TYPE;
    v_promedio t_alumnos.promedio_pasado%TYPE;
    v_beca t_becaAlumno.beca%TYPE;
BEGIN
    -- Abrir el cursor y recorrer los registros
    OPEN c_alumnos;
    LOOP
        FETCH c_alumnos INTO v_matricula_alu, v_nombre,v_apellido_p,v_apellido_m, v_promedio;
        EXIT WHEN c_alumnos%NOTFOUND;
        
        -- Determinar la beca
        IF v_promedio > 90 THEN
            v_beca := '100%';
        ELSIF v_promedio > 80 THEN
            v_beca := '50%';
        ELSIF v_promedio > 70 THEN
            v_beca := '30%';
        ELSIF v_promedio > 60 THEN
            v_beca := '10%';
        ELSE
            v_beca := 'no apto';
        END IF;
        
        -- Insertar en la tabla beca_alu_T
        INSERT INTO t_becaAlumno (matricula_alu, nombre, promedio_pasado, beca)
        VALUES (v_matricula_alu, v_nombre || ' ' || v_apellido_p || ' ' || v_apellido_m, v_promedio, v_beca);
    END LOOP;|
    -- Cerrar el cursor
    CLOSE c_alumnos;
END;
execute determinar_apto_beca_all; -- Ejemplo con id_alu = 1
/********fin becas alumnos*******/

/*ejercicio 2 maestros*/


/*********tablas profesores ********/
create table t_profesores(
    id_prof number(10) primary key,
    numero_empleado number(6),
    nombre nvarchar2(60),
    apellido_p nvarchar2(60),
    apellido_m nvarchar2(60),
    carrera_imparte nvarchar2(50),
    CONSTRAINT chk_carrera_imparte CHECK(carrera_imparte in ('Ing. Sistemas C','Ing. Sistemas A','Lic. Gastronomia','Contador Publico','Ing. Administracion','Ing. en ER','Ing. Indrustrial','Ing. Tics')),
    nombre_classe nvarchar2(50),
    grupo varchar(9)
);

create table t_iscP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table t_adminP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table t_gastroP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table t_industrialP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table t_energiasP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table t_contaP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table t_automotrizP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table t_ticsP (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
/***************/

SELECT * FROM t_profesores; 
drop table t_profesores;
delete from t_profesores;

create or replace procedure pa_almacenarMaestro 
    (id_prof in number, numero_empleado in number,nombre in nvarchar2,apellido_p in nvarchar2,apellido_m in  nvarchar2,carrera_imparte in nvarchar2,nombre_classe in nvarchar2,grupo in nvarchar2) 
as
begin
    insert into t_profesores values (id_prof, numero_empleado,nombre,apellido_p,apellido_m,carrera_imparte,nombre_classe,grupo);
    if carrera_imparte = 'Ing. Sistemas C' then 
        insert into t_iscP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Sistemas A' then 
        insert into t_automotrizP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Lic. Gastronomia' then 
        insert into t_gastroP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Contador Publico' then 
        insert into t_contaP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Administracion' then 
        insert into t_adminP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. en ER' then 
        insert into t_energiasP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Indrustrial' then 
        insert into t_industrialP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Tics' then 
        insert into t_ticsP values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
end;

EXECUTE pa_almacenarMaestro(1,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Sistemas C'  ,'S.O'   , '5s11');
EXECUTE pa_almacenarMaestro(2,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Sistemas C'  ,'S.O'   , '5s12');
EXECUTE pa_almacenarMaestro(3,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Sistemas C'  ,'TallerS.O' ,   '6s11');
EXECUTE pa_almacenarMaestro(4,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Sistemas C'  ,'TallerS.O' ,   '6s12');
EXECUTE pa_almacenarMaestro(5,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Tics' , 'S.O 1'  , '5T11');
EXECUTE pa_almacenarMaestro(6,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Tics' , 'S.O 2' ,  '6T11');
EXECUTE pa_almacenarMaestro(7,212 ,'Gustavo Moises',  'Romero',  'Gonzales',    'Ing. Tics' ,'Base de Datos',  '7T11');
EXECUTE pa_almacenarMaestro(8,147  ,'Gerardo', 'Nava','Hernandez','Ing. Sistemas C', 'Graficacion','5s11');
EXECUTE pa_almacenarMaestro(9,147  ,'Gerardo', 'Nava','Hernandez','Ing. Sistemas C', 'Graficacion','5s12');
EXECUTE pa_almacenarMaestro(10,147 ,'Gerardo', 'Nava','Hernandez','Ing. Sistemas C', 'Graficacion','6s11');
EXECUTE pa_almacenarMaestro(11,147 ,'Gerardo', 'Nava','Hernandez','Ing. Sistemas C', 'Graficacion','6s12');
EXECUTE pa_almacenarMaestro(12,681 ,'Francisco Raul' ,'Salvador' ,'Ginez' ,'Ing. Sistemas C', 'Redes' ,'6s11');
EXECUTE pa_almacenarMaestro(13,681 ,'Francisco Raul' ,'Salvador' ,'Ginez' ,'Ing. Sistemas C', 'Redes' ,'6s12');
EXECUTE pa_almacenarMaestro(14,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Sistemas C','Arquitectura de computadoras ','5S11');
EXECUTE pa_almacenarMaestro(15,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Sistemas C','Telecomunicaciones ','5S11');
EXECUTE pa_almacenarMaestro(16,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Tics',' Electrisidad y Magnetismo ','3T11');
EXECUTE pa_almacenarMaestro(17,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Tics',' Analisis de señales ','5T11');
EXECUTE pa_almacenarMaestro(18,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Tics',' Telecomunicaciones ','6T11');
EXECUTE pa_almacenarMaestro(19,348, 'Jose Luis', 'Villareal', 'Lopes', 'Ing. Tics',' Administracion de Redes ','8T11');
EXECUTE pa_almacenarMaestro(20,283, 'Albertossi',  'Landeros',    'Rojas',   'Ing. Sistemas C', 'Sistemas Programables  ','7s11');
EXECUTE pa_almacenarMaestro(21,283, 'Albertossi',  'Landeros',    'Rojas',   'Ing. Sistemas C', 'Principios Electricos y Aplicaciones Dijitales  ','4S11');
EXECUTE pa_almacenarMaestro(22,283, 'Albertossi',  'Landeros',    'Rojas',   'Ing. Sistemas C', 'Principios Electricos y Aplicaciones Dijitales  ','4S12');
EXECUTE pa_almacenarMaestro(23,283, 'Albertossi',  'Landeros',    'Rojas',   'Ing. Sistemas C', 'Principios Electricos y Aplicaciones Dijitales  ','4S21');
EXECUTE pa_almacenarMaestro(24,283, 'Albertossi',  'Landeros',    'Rojas',   'Ing. Tics', 'Circuitos Electronicos y Electricos ','4T11');

