<?php require('conexao.php'); ?>

<html lang="pt-br">
    <head>
        <title>DETALHES</title>
        <meta charset="utf-8"/>
        
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <style>
          /* Always set the map height explicitly to define the size of the div
           * element that contains the map. */
          #map {
            height: 100%;
          }
          /* Optional: Makes the sample page fill the window. */
          html, body {
            height: 100%;
            margin: 0;
            padding: 0;
          }
        </style>
        
        
        
        
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <?php require('header.php'); ?>
        <div class="containerBody">
            <?php   
            $sql = "select * from view_detalhes_jogo where id=".$_GET['idJogo'];
            echo $sql;
            //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
            $select = mysqli_query($conexao, $sql);

            //COLOCAR NA ARRAY $RSJOGOS DADOS DO BANCO;
            while($rsJogo=mysqli_fetch_array($select)){
            ?>
            <div class="col-md-6 detalhesLeft">
                <img src="images/capaJogos/<?php echo($rsJogo['nomeCapa']);?>" />
            </div>
            <div class="col-md-6 detalhesRight">
                <h1 class="nomeJogo"><?php echo($rsJogo['nome']); ?></h1>
                <div class="col-md-5" id="detalhesLabel">
                    <h2>PLATAFORMA:</h2>
                    <h2>DESENVOLVEDORA:</h2>
                    <h2>CATEGORIA:</h2>
                    <h2>ANO LANÇAMENTO:</h2>
                    <h1>PREÇO:</h1>
                </div>
                <div class="col-md-7" id="detalhesResult">
                    <h2><?php echo($rsJogo['nomePlataforma']); ?></h2>
                    <h2><?php echo($rsJogo['nomeDistribuidora']); ?></h2>
                    <h2><?php echo($rsJogo['nomeCategoria']); ?></h2>
                    <h2><?php echo($rsJogo['lancamento']); ?></h2>
                    <h1>R$ <?php echo($rsJogo['preco']); ?></h1>
                </div>
                <h1>Descrição:</h1>
                <div id="boxDetalhesDesc">
                    <h3><?php echo($rsJogo['desc']); ?></h3>
                </div>
            </div>
            <?php } ?>
            <div id="detalhesFiliais">
                <h1>ONDE COMPRAR?</h1>
                <?php   
                $sql = "select * from view_filial_jogo where idJogo=".$_GET['idJogo'];
                
                //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                $select = mysqli_query($conexao, $sql);

                //COLOCAR NA ARRAY $RSJOGOS DADOS DO BANCO;
                while($rsFilial=mysqli_fetch_array($select)){
                ?><a href="?idJogo=<?php echo $_GET['idJogo'] ?>&idLoja=<?php echo $rsFilial['idFilial']; ?>&lat=<?php echo $rsFilial['lat'] ?>&lgt=<?php echo $rsFilial['lgt'] ?>"><img src="images/filiais/<?php echo($rsFilial['dir_imagem']); ?>" onclick=""></a><?php } ?>
                    <!--
                    <img src="images/filiais/smartgames01.jpg">
                    <img src="images/teste200x200.png">
                    <img src="images/teste200x200.png">
                    -->
                
            </div>
            <h2 id="endereco"><?php
                    
                if(isset($_GET['idLoja'])){
                    $sql = "select * from view_filial_jogo where idJogo=".$_GET['idJogo']." AND idFilial=".$_GET['idLoja'];
                    $select = mysqli_query($conexao, $sql);
                    while($rsFilial=mysqli_fetch_array($select)){
                        echo($rsFilial['enderecoFilial']);
                    }

                }else{
                    echo 'Selecione uma loja para ver o endereço.';
                }

                ?>    
            </h2>
            <h2 id="contato"><?php
                if(isset($_GET['idLoja'])){
                    $sql = "select * from view_filial_jogo where idJogo=".$_GET['idJogo']." AND idFilial=".$_GET['idLoja'];
                    $select = mysqli_query($conexao, $sql);
                    while($rsFilial=mysqli_fetch_array($select)){
                        echo("E-mail: ".$rsFilial['emailFilial']."<br>Telefone: ".$rsFilial['telefoneFilial']);
                    }

                }
            ?>    
            </h2>
            
            <div class="boxGoogleMaps">
                <?php require('maps/index.php'); ?>
            </div>
            
        </div>
        <div>
            <?php require('footer.php'); ?>
        </div>
    </body>
</html>