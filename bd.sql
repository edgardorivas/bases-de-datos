drop database if exists  profe ;
create database profe;
use profe;
/*------------------------------------------------------------*/

create table profesor(
    id int unsigned primary key auto_increment,
    nombre varchar(100) not null,
    grado varchar (50) not null,
    correo varchar(50) not null,
    telefono varchar(50) not null,
    cedula int not null
)engine=innoDB;
/*------------------------------------------------------------*/

create table materia(
 id int unsigned primary key auto_increment,
 nombre varchar(50) not null,
 grado varchar(50) not null,
 descripcion text,
 restricion enum("obligatoria","opcional") default "obligatoria",
 FKprofesor int unsigned not null,

 constraint Idfkprofesor
 foreign key (FKprofesor)
 references profesor(id)
 on delete restrict
 on update cascade
    
)engine=innoDB;
/*------------------------------------------------------------*/

create table clase(
    id int unsigned primary key auto_increment,
    grado varchar(50)not null,
    seccion varchar(50)not null
)engine=innoDB;
/*------------------------------------------------------------*/
create table estudiante(
    id bigint unsigned primary key auto_increment,
    nombre varchar(200) not null,
    edad int unsigned not null,
    correo varchar(100) not null,
    grado varchar(100)not null,
    repeticiones int ,
    FKclase int unsigned not null,

    constraint Idfkclase
    foreign key (FKclase)
    references clase(id)
    on delete restrict
    on update cascade

)engine=innoDB;
/*------------------------------------------------------------*/

create table materia_estudiante(
    id int unsigned primary key auto_increment,
    FKmateria int unsigned not null,
    FKestudiantes bigint unsigned not null,

    constraint Idfkmateria
    foreign key (FKmateria)
    references materia(id)
    on delete  restrict
    on update cascade,

    constraint Idfkestudiantes
    foreign key (FKestudiantes)
    references estudiante(id)
    on delete cascade
    on update cascade
)engine=innoDB;

/*------------------------------------------------------------*/

create table representante(
    id int unsigned primary key auto_increment,
    nombre varchar(100) not null,
    telefono varchar(100) not null,
    correo varchar (100) not null,
    direccion varchar(100)not null,
    cedula int not null
)engine=innoDB;
/*------------------------------------------------------------*/
create table estudiante_representante(
    id int unsigned primary key auto_increment,
    Fkrepresentante int unsigned not null,
    FKestudiante bigint unsigned not null,

    CONSTRAINT Idfkrepresentante
    foreign key (FKrepresentante)
    references representante(id)
    on delete cascade
    on update cascade,

    CONSTRAINT Idfkestudiante
    FOREIGN key (FKestudiante)
    references estudiante(id)
    on delete cascade
    on UPDATE cascade
)engine=innoDB;

/*------------------------insert datos------------------------------------*/

insert into profesor (nombre,grado,correo,telefono,cedula) 
values('juan','primero','elmacha@gmail.com','8848969554',224534)
,('maria','segundo','elpedo@gmail.com','8848969554',2345623) ,
('carlos','tercero','elmariquita@gmail.com','8848969554',5463432)
,('mandi','cuarto','elquetoma@gmail.com','8848969554',4532342) ,
('david','quinnto','elpepe@gmail.com','8848969554',4532342);

insert into representante(nombre,telefono,correo,direccion,cedula)
values ('aron','04126533015','el_malote@gmail.com','villa del pascua',78954658),
('meilza','0412346015','lamatratratae@gmail.com','maracay',795454658),
('luz','049656015','matraae@gmail.com','trumero',987455454658),
('sebas','044646015','lamate@gmail.com','maracay',8956148);

insert into clase(grado,seccion) 
values('primero','A'), ('primero','B'),('segundo','A'),
('segundo','b'),('tercero','A'), ('tercero','B'),('cuarto','A'),('cuarto','B')
('quinto','A'),('quinto','B'),('sexto','A'), ('sexto','B');
