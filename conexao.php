<?php

//DEFININDO VARIAVEIS DE CONEXAO
$host = "localhost";
$database = 'db_smartgames_elimar';
$user = "root";
$password = "bcd127";



//ESTABELECE A CONEXAO COM O BD MYSQL, USANDO A BIBLIOTECA MSQLI;
//SE NÃO CONECTAR, EXIBIR MENSAGEM 'CONEXAO FALHOU';
if(!$conexao = mysqli_connect($host,$user,$password,$database)){
    echo("Conexão com o Banco de Dados Falhou!");    
}

?>