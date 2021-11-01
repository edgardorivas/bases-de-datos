DROP DATABASE IF EXISTS proyecto;
CREATE DATABASE proyecto;
USE proyecto;
/*-----------------------------------------*/

CREATE TABLE usuario (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    clave  VARCHAR(10) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    rol  ENUM('ADMI','USUARIO') DEFAULT 'USUARIO',
    fecha_creacion DATETIME NOT NULL
    
)ENGINE=innoDB;

/*-----------------------------------------*/
CREATE TABLE cuenta_instagram(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cantidad_post int UNSIGNED,
    numero_historia int UNSIGNED,
    cantidad_like int UNSIGNED,
    cantidad_comentario int UNSIGNED,
    veces_guardados int UNSIGNED,
    veces_compartidas int UNSIGNED,
    cantidad_impresiones int UNSIGNED,
    seguidores int UNSIGNED,
    usuarios_ID int UNSIGNED,

    CONSTRAINT id_usuarios
    FOREIGN KEY(usuarios_ID)
    REFERENCES usuario(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE

    
    
)ENGINE=innoDB;
/*-----------------------------------------*/
CREATE TABLE publicaciones(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    visitas_perfil int UNSIGNED,
    descubrimiento varchar (100),
    impresiones_hashtaghs varchar(100),
    impresione_perfil varchar(100),
    nuevos_seguidores int UNSIGNED,
    reacciones int UNSIGNED,
    comentarios int UNSIGNED,
    guardados int UNSIGNED,
    direct varchar (100)not null,
    cuenta_instagram_publicaciones_ID int UNSIGNED,

    CONSTRAINT id_cuenta_instagram_publicaciones_ID
    FOREIGN KEY(cuenta_instagram_publicaciones_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE cascade


)ENGINE=innoDB;


/*-----------------------------------------*/

CREATE TABLE hashtag(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(20) NOT NULL,
    descripcion varchar(100)
    /*categoria:no la veo necesaria ya que esta seria 
    la references de la tabla categoria,
    no se a que se refiere con ir*/
)ENGINE=innoDB;
/*-----------------------------------------*/

CREATE TABLE categoria(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT

)ENGINE=innoDB;


CREATE TABLE categoria_hashtag(
    id int UNSIGNED PRIMARY key AUTO_INCREMENT,
    categoria_ID TINYINT UNSIGNED,
    hashtag_piv_ID int  UNSIGNED,

    CONSTRAINT id_categoria_ID
    FOREIGN KEY(categoria_ID)
    REFERENCES categoria(id)
    ON UPDATE CASCADE
    ON DELETE restrict,

    CONSTRAINT id_hashtag_piv_ID
    FOREIGN KEY(hashtag_piv_ID)
    REFERENCES hashtag(id)
    ON UPDATE CASCADE
    ON DELETE restrict


)ENGINE=innoDB;
/*-----------------------------------------*/

CREATE TABLE plantilla(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caption VARCHAR(100) ,
    imagen_url VARCHAR (150),/*borre hashtag por innecesario esperar respuesta de francis*/
    cuenta_instagram_plantilla_ID int UNSIGNED,

    CONSTRAINT id_cuenta_instagram_plantilla_ID
    FOREIGN KEY(cuenta_instagram_plantilla_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE restrict

)ENGINE=innoDB;
/*-----------------------------------------*/

CREATE TABLE hashtag_plantilla(
    id int UNSIGNED PRIMARY key AUTO_INCREMENT,
    plantilla_ID int UNSIGNED,
    hashtag_ID int  UNSIGNED,

    CONSTRAINT id_plantilla_ID
    FOREIGN KEY(plantilla_ID)
    REFERENCES plantilla(id)
    ON UPDATE CASCADE
    ON DELETE restrict,

    CONSTRAINT id_hashtag_ID
    FOREIGN KEY(hashtag_ID)
    REFERENCES hashtag(id)
    ON UPDATE CASCADE
    ON DELETE restrict


)ENGINE=innoDB;
/*-----------------------------------------*/
CREATE TABLE resultados_comparacion(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    puntuacion_total int NOT NULL,
    cuenta_instagram_com_ID  int UNSIGNED,/*relacion*/

    CONSTRAINT id_cuenta_instagram_com_ID
    FOREIGN KEY(cuenta_instagram_com_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE restrict
)ENGINE=innoDB;
/*-----------------------------------------*/
CREATE TABLE comparacion_cuentas(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cuenta_instagram_pivot_ID  int UNSIGNED,/*relacion*/
    resultados_comparacion_pivot_ID int UNSIGNED,

    CONSTRAINT id_cuenta_instagram_pivot
    FOREIGN KEY(cuenta_instagram_pivot_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE restrict,

    CONSTRAINT id_resultados_comparacion_pivot_ID
    FOREIGN KEY(resultados_comparacion_pivot_ID)
    REFERENCES resultados_comparacion(id)
    ON UPDATE CASCADE
    ON DELETE restrict
)ENGINE=innoDB;


