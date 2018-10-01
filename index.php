<?php

// CANDIDATO: Elimar Domingos Pereira;
// TELEFONES: 11 97773-9941 / 11 98315-6952;
// E-MAIL: epproducoes2015@gmail.com ;
//
// NOTAS: ////////////////////////////
//
// TROCAR $user E $password EM conexao.php PARA ACESSAR O BANCO;
// 
//////////////////////////////////////



require('conexao.php');

//HABILITAR VARIÁVEIS DE SESSÃO;
session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
<!--    PADRÃO DE LINGUAGEM PT-BR -->
        <meta charset="UTF-8" />
<!--    LINKAR CSS -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <title>SmartGames LTDA</title>
        <script>
            //FUNÇÃO PARA CONTROLAR O 'ABRIR' E 'FECHAR' DO MENU LATERAL DE CATEGORIAS E PLATAFORMAS
            function mostrarCategorias(action){
                //PEGAR ELEMENTOS DO HTML PELO ID
                menu = document.getElementById("containerMenuCategorias");
                imgAbrirMenu = document.getElementById("imgOpenMenu");
                imgFecharMenu = document.getElementById("imgCloseMenu");
                
                if(action == 'abrir'){
                    //SE A AÇÃO FOR 'ABRIR', ESCONDER O BOTÃO 'ABRIRMENU' E TORNAR VISIVEL O MENU E O BOTÃO 'FECHARMENU'
                    menu.style = "display: block; visibility: visible;";
                    imgFecharMenu.style = "";
                    imgAbrirMenu.style = "visibility: hidden;";

                } else if(action == 'fechar'){
                    //SE A AÇÃO FOR 'FECHAR', ESCONDER O MENU E O BOTAO 'FECHARMENU' E MOSTRAR O BOTÃO 'ABRIRMENU'
                    menu.style = "display: none; visibility: hidden;";
                    imgFecharMenu.style = "display: none; visibility: hidden;";
                    imgAbrirMenu.style = "";
                }

            }
        </script>
<!--    IMPORTAR BIBLIOTECA DO JQUERY -->
<!--        <script src="js/jquery.js"></script>-->
    </head>
    <body>
<!--        IMPORTAR CABEÇALHO (HEADER)-->
        <?php require('header.php'); ?>
<!--    CONTAINER DO CORPO DO SITE -->
        <section class="containerBody">
            <div class="col-md-12">
<!--            BOTAO PARA ABRIR MENU LATERAL 'CATEGORIAS / PLATAFORMAS' -->
                <img src="images/btnCloseMenu.png" alt="Abrir menu" id="imgOpenMenu" onclick="mostrarCategorias('abrir');" />
<!--            CONTAINER DO MENU LATERAL -->
                <div class="col-md-3 bodyLeftSide" id="containerMenuCategorias">
                    <h1 id="titleCategorias">CATEGORIAS</h1>
<!--                BOTÃO PARA FECHAR MENU -->
                    <img src="images/btnCloseMenu.png" alt="Fechar menu" id="imgCloseMenu" onclick="mostrarCategorias('fechar')" />
<!--                LISTA DE CATEGORIAS (PUXADAS DO BANCO) -->
                    <ul id="ulCategorias">
                        <li><p><a href="index.php<?php
                            //COLOCAR VARIAVEIS 'PLATAFORMA' E 'CATEGORIA' NA URL
                            
                            //SE EXISTIR A VARIÁVEL 'PLATAFORMA' NA URL, MANTER SEU VALOR E SETAR VALOR 'ALL' PARA 'CATEGORIA'
                            if(isset($_GET['plataforma'])){
                                $str = "?plataforma=".$_GET['plataforma']."&categoria=all";
                            }else{
                                //SE NÃO EXISTIR A VARIÁVEL 'PLATAFORMA' NA URL, DEFINIR VALOR 'ALL' PARA 'PLATAFORMA' E 'CATEGORIA'
                                $str = "?plataforma=all&categoria=all";
                            }
                            //ESCREVER A VARIÁVEL $str EM FRENTE A 'href="index.php'
                            echo($str);
                            ?>
                            ">
                                <!-- &nbsp; = (ESPAÇO): PARA O TEXTO NÃO QUEBRAR EM 2 LINHAS, POIS O ELEMENTO PAI DA TAG 'a', a tag 'p', TEM SEU WIDTH INICIAL DE APENAS 20px(SOMENTE QUANDO O USUÁRIO PARA O MOUSE SOBRE A TAG(HOVER) ELA RECEBE 100% DE LARGURA). SENDO ASSIM, A CADA " "(espaço) O HTML QUEBRARIA O TEXTO EM OUTRA LINHA. -->
                                TODAS&nbsp;CATEGORIAS
                            </a></p></li>
                        
                        <?php
                    
                        //CARREGAR LISTA DE CATEGORIAS DO BANCO
                        //COMANDO SQL;
                        $sql =  "select * from tb_categoria order by nome asc";

                        //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                        $select = mysqli_query($conexao, $sql);

                        //COLOCAR NA ARRAY $RSCATEGORIAS DADOS DO BANCO;
                        while($rsCategorias=mysqli_fetch_array($select)){
                        ?>
                        <li><p><a href="index.php<?php
                            //COLOCAR VARIAVEIS 'PLATAFORMA' E 'CATEGORIA' NA URL
                            
                            //SE EXISTIR A VARIÁVEL 'PLATAFORMA' NA URL, MANTER SEU VALOR E SETAR VALOR EQUIVALENTE AO ID DESTE ITEM NA VARIÁVEL 'CATEGORIA';
                            if(isset($_GET['plataforma'])){
                                $str1 = "?plataforma=".$_GET['plataforma']."&categoria=".$rsCategorias['id'];
                            }else{
                                //SE NÃO EXISTIR A VARIÁVEL 'CATEGORIA' NA URL, DEFINIR VALOR 'ALL' PARA 'PLATAFORMA' E SETAR VALOR EQUIVALENTE AO ID DESTE ITEM PARA A VARIÁVEL 'CATEGORIA' 
                                $str1 = "?plataforma=all&categoria=".$rsCategorias['id'];
                            }
                            //ESCREVER A VARIÁVEL $str EM FRENTE A 'href="index.php'
                            echo($str1);
                            ?>">
                            <?php
                                //PEGAR 'NOME' DA CATEGORIA NO BANCO E SETAR EM $str EM CAIXA ALTA
                                $str = strtoupper($rsCategorias['nome']);
                                //SETAR NO HTML O NOME DA CATEGORIA TROCANDO ESPAÇOS POR &nbsp; (NON-BREAKING-SPACE)
                                echo(str_replace(" ","&nbsp;",$str));
                            ?>
                            
                        </a></p></li>
                        
<!--                    FECHANDO O 'WHILE' -->
                        <?php } ?>
                        
                    </ul>
                    <h1 id="titlePlataformas">PLATAFORMAS</h1>
                    <ul id="ulPlataformas">
                        <li><p><a href="
                            <?php
                            //SE EXISTIR A VARIÁVEL 'CATEGORIA' NA URL, MANTER SEU VALOR E SETAR VALOR 'ALL' PARA 'PLATAFORMA'
                            if(isset($_GET['categoria'])){
                                $str1 = "?plataforma=all&categoria=".$_GET['categoria'];
                            }else{
                                //SE NÃO EXISTIR A VARIÁVEL 'PLATAFORMA' NA URL, DEFINIR VALOR 'ALL' PARA 'PLATAFORMA' E 'CATEGORIA'
                                $str1 = "?plataforma=all&categoria=all";
                            }
                            //ESCREVER A VARIÁVEL $str EM FRENTE A 'href="index.php'
                            echo($str1);
                            ?>">
                                TODAS&nbsp;PLATAFORMAS
                            </a></p></li>
                        <?php
                    
                        //COMANDO SQL;
                        $sql =  "select * from tb_plataforma order by nome asc";

                        //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                        $select = mysqli_query($conexao, $sql);

                        //COLOCAR NA ARRAY $RSPLATAFORMAS DADOS DO BANCO;
                        while($rsPlataformas=mysqli_fetch_array($select)){
                        ?>
                        
                        <li><p><a href="index.php<?php
                            //COLOCAR VARIAVEIS 'PLATAFORMA' E 'CATEGORIA' NA URL
                            
                            //SE EXISTIR A VARIÁVEL 'CATEGORIA' NA URL, MANTER SEU VALOR E SETAR VALOR EQUIVALENTE AO ID DESTE ITEM NA VARIÁVEL 'PLATAFORMA'
                            if(isset($_GET['categoria'])){
                                $str1 = "?plataforma=".$rsPlataformas['id']."&categoria=".$_GET['categoria'];
                            }else{
                                //SE NÃO EXISTIR A VARIÁVEL 'CATEGORIA' NA URL, DEFINIR VALOR 'ALL' PARA 'CATEGORIA' E SETAR VALOR EQUIVALENTE AO ID DESTE ITEM PARA A VARIÁVEL 'PLATAFORMA' 
                                $str1 = "?plataforma=".$rsPlataformas['id']."&categoria=all";
                            }
                            echo($str1);
                            ?>">
                            <?php
                                //PEGAR 'NOME' DA PLATAFORMA NO BANCO E SETAR EM $str EM CAIXA ALTA
                                $str = strtoupper($rsPlataformas['nome']);
                                //SETAR NO HTML O NOME DA PLATAFORMA TROCANDO ESPAÇOS POR &nbsp; (NON-BREAKING-SPACE)
                                echo(str_replace(" ","&nbsp;",$str));
                            ?>
                        </a></p></li>
<!--                    FECHANDO O 'WHILE' -->
                        <?php } ?>
                    </ul>
                </div>
                
                <div id="titleConteudo">
<!--                    <h1>TODAS PLATAFORMAS > TODAS CATEGORIAS</h1>-->
                    <h1><?php 
                        if(isset($_GET['plataforma'])){
                            if($_GET['plataforma'] == 'all'){
                                $titlePlataforma = "TODAS PLATAFORMAS";
                                echo ($titlePlataforma);
                            }else{
                                $titlePlataforma = $_GET['plataforma'];
                                
                                $sql = "select * from tb_plataforma where id=".$titlePlataforma;
                                
                                //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                                $select = mysqli_query($conexao, $sql);

                                //COLOCAR NA ARRAY $RSJOGOS DADOS DO BANCO;
                                while($rsPlataformas=mysqli_fetch_array($select)){
                                    $titlePlataforma = $rsPlataformas['nome'];
                                }
                                echo(strtoupper($titlePlataforma));
                            }
                            
                        }else{
                            echo("TODAS PLATAFORMAS");
                        }
                        ?> 
                        > <?php 
                        if(isset($_GET['categoria'])){
                            if($_GET['categoria'] == 'all'){
                                $titleCategoria = "TODAS CATEGORIAS";
                                echo ($titleCategoria);
                            }else{
                                $titleCategoria = $_GET['categoria'];
                                
                                $sql = "select * from tb_categoria where id=".$titleCategoria;
                                
                                //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                                $select = mysqli_query($conexao, $sql);

                                //COLOCAR NA ARRAY $RSJOGOS DADOS DO BANCO;
                                while($rsCategorias=mysqli_fetch_array($select)){
                                    $titleCategoria = $rsCategorias['nome'];
                                }
                                echo(strtoupper($titleCategoria));
                            }
                            
                        }else{
                            echo("TODAS PLATAFORMAS");
                        }
                        ?> 
                        </h1>
                </div>
                
                <?php
                //GERAR PRODUTOS
                
                //COMANDO SQL;
                
                //SE EXISTIR VARIAVEL 'PLATAFORMA' OU 'CATEGORIA' NA URL
                if(isset($_GET['plataforma']) || isset($_GET['categoria'])){
                    
                    //SE VARIAVEIS 'PLATAFORMA' E 'CATEGORIA' FOREM 'ALL'
                    if($_GET['plataforma'] == "all" && $_GET['categoria'] == "all"){
                        //SELECIONAR TODOS OS JOGOS DO BANCO;
                        $sql =  "select * from view_previewjogo order by rand()";
                        
                    //SENAO SE VARIAVEL 'PLATAFORMA' FOR 'ALL'
                    }else if($_GET['plataforma'] == "all"){
                        
                        //SELECIONAR JOGOS CORRESPONDENTES A CATEGORIA DESEJADA
                        $sql =  "select * from view_previewjogo where idCategoria=".$_GET['categoria']." order by rand()";
                        
                    //SENAO SE VARIAVEL 'CATEGORIA' FOR 'ALL'
                    }else if($_GET['categoria'] == "all"){
                        
                        //SELECIONAR JOGOS CORRESPONDENTES A PLATAFORMA DESEJADA
                        $sql =  "select * from view_previewjogo where idPlataforma=".$_GET['plataforma']." order by rand()";
                        
                    //SE FOI SELECIONADO UMA PLATAFORMA E UMA CATEGORIA
                    }else{
                        //SELECIONAR JOGOS CORRESPONDENTES A PLATAFORMA E CATEGORIA DESEJADA
                        $sql =  "select * from view_previewjogo where idCategoria=".$_GET['categoria']." and idPlataforma=".$_GET['plataforma']." order by rand()";
                    }
                
                }else if(isset($_GET['schJogo'])){
                    
                    $sql =  "select * from view_previewjogo where nomeJogo='".$_GET['schJogo']."'";
                
                //SE NAO EXISTIR VARIAVEIS NA URL
                }else{
                    //SELECIONAR TODOS OS JOGOS DO BANCO
                    $sql =  "select * from view_previewjogo order by rand()";
                }

                //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                $select = mysqli_query($conexao, $sql);
                
                //COLOCAR NA ARRAY $RSJOGOS DADOS DO BANCO;
                while($rsJogos=mysqli_fetch_array($select)){
                ?>
                <div class="boxProduto">
<!--                ESCREVER NOME DA ARQUIVO (exemplo.jpg) EM 'SRC' E ESCREVER O NOME DO JOGO EM 'ALT' -->
                    <img src="images/capaJogos/<?php echo($rsJogos['nomeCapa']); ?>" alt="<?php echo($rsJogos['nomeJogo']); ?>" />
<!--                ESCREVER NOME DO JOGO NA TAG 'H1' -->
                    <h1><?php echo($rsJogos['nomeJogo']); ?></h1>
                    <h2>Categoria: <?php
                                    //ESCREVER NOME DA DESENVOLVEDORA NA TAG 'H2'
                                    $str = strtoupper($rsJogos['categoria']);
                                    echo($str);
                                    ?>
                    </h2>
                    <h2>Plataforma: <?php 
                        //ESCREVER NOME DA PLATAFORMA NA TAG 'H2'
                        echo($rsJogos['plataforma']); ?>
                    </h2>
                    <p>R$ <?php 
                        //ESCREVER PREÇO NA TAG 'P'
                        echo($rsJogos['precoJogo']);
                        ?>
                    </p>
                    
                    <a href="detalhes-jogo.php?idJogo=<?php echo($rsJogos['id']);?>"><button class="btnDetalhes">DETALHES</button></a>
                </div>
                
<!--            FECHANDO O 'WHILE' -->
                <?php } ?>
                
            </div>
        </section>
        
<!--        IMPORTAR RODAPÉ -->
        <?php require('footer.php')?>
    </body>

</html>