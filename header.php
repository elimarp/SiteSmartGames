<?php require('conexao.php'); ?>

<header id="containerHeader">
    <nav id="containerNav">
        
        <div class="col-md-1 logo" onclick="location.href='index.php';">
            
        </div>
        <div class="col-md-5">
            <div id="containerSearch">
                <form name="frmContatos" method="get" action="index.php">
                    <input type="search" name="schJogo" id="schProdutos" list="completar"/>                <datalist id="completar">
                        <?php

                        //COMANDO SQL;
                        $sql =  "select * from view_nome_plataforma order by rand()";

                        //EXECUTA O SCRIPT NO BANCO E ARMAZENA EM $SELECT;
                        $select = mysqli_query($conexao, $sql);

                        //COLOCAR NA ARRAY $RSOPTIONS DADOS DO BANCO;
                        while($rsOptions=mysqli_fetch_array($select)){
                        ?>

                        <option value="<?php echo($rsOptions['nomeJogo']); ?>">
                            <?php //echo($rsOptions['nomePlataforma']); ?>
                        </option>

                        <?php } ?>
                    </datalist>
<!--                    <img src="images/btnSearch.png" id="imgSearch" alt="Pesquisar" onclick="teste();"/>-->
                    <input type="submit" value="" id="btnSearch"/>
                </form>
            </div>
        </div>
        <div class="col-md-3 containerHeaderLink">
            <a href="sobrenos.php">SOBRE NÓS</a>
            
        </div>
        <div class="col-md-3 containerHeaderLink">
            <a href="faleconosco.php">FALE CONOSCO</a>
        </div>
        
    </nav>
</header>
<div id="containerHeaderSpace">&nbsp;</div>