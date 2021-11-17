// requerisiones

const express = require('express');
const mysql = require('mysql');
const bodyparser = require('body-parser');
require('dotenv').config();

// init

var app = express();
var conn= mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
})

// config
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({
    extended: false
}))
// rut

// requiere todo las columnas de la tabal usuario
app.get('/',(req,res)=>{
    conn.connect((err)=>{
        if(err) throw err;
        conn.query('SELECT * FROM usuario',(err,resul)=>{
            if(err) throw err;
            if(resul.length > 0){
                res.json(resul);
            }
            else{
                res.send(' nada en la base de datos')
            }
        })
    })
});
// require todas las columnas de la tabla usuario don el id sea igual

app.get('/buscar/:id',(req,res)=>{
    let id = req.params.id;
    conn.connect((err)=>{
        if(err) throw err;
        conn.query(`SELECT * FROM usuario WHERE id = ${id}`,(err,resul)=>{
            if(err) throw err;
            if(resul.length > 0){
                res.json(resul);
            }
            else{
                res.send('NO existe Usuarion con ese ID')
            }
        })
    })
})
app.post('registrar/',(req,res)=>{
    let {nombre, apellido, edad} = req.params;
    let error;
    if(nombre === ''){
        error='debe escribir el nombre'
    }else{
        if(apellido ===''){
            error='escribe un apellido'
        }
        else{
            if(edad===null){
                error= 'escribe tu edad'
            }
        }
    }
    if(error){
        res.send(error)
    }
    else{
        conn.connect((err)=>{
            if(err) throw err;
            let sql=`INSERT INTO usuario(nombre,apellido,edad) VALUES (${nombre},${apellido},${edad})`;
            conn.query(sql,(err,resul)=>{
                if(err) throw err;
                res.status(200).send({nombre,apellido,edad});
            })
        })
    }
})
// servidor en marcha
app.listen(process.env.PORT,()=>console.log('marcha en el puerto '+ process.env.PORT));