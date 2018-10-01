drop view if exists view_previewjogo;
drop view if exists view_filial_jogo;
drop view if exists view_nome_plataforma;
drop view if exists view_detalhes_jogo;

create view view_previewjogo as
select j.id, j.nome as nomeJogo, j.nomeCapa, p.nome as plataforma, c.nome as categoria, j.idCategoria as idCategoria, j.idPlataforma as idPlataforma , j.preco as precoJogo
from tb_jogo as j, tb_plataforma as p, tb_categoria as c
where j.idPlataforma = p.id and j.idCategoria = c.id and j.idCategoria = c.id;

create view view_filial_jogo as
select fj.id as idFilialJogo, j.id as idJogo, f.id as idFilial, f.nome as nomeFilial, f.telefone as telefoneFilial, f.email as emailFilial, f.latitude as lat, f.longitude as lgt, f.endereco as enderecoFilial, f.dir_imagem
from tb_filial_jogo as fj,  tb_jogo as j, tb_filial as f
where j.id = fj.idJogo and f.id = fj.idFilial;

create view view_nome_plataforma as
select j.nome as nomeJogo, p.nome as nomePlataforma
from tb_jogo as j, tb_plataforma as p
where j.idPlataforma = p.id;

create view view_detalhes_jogo as
select j.id, j.nome, j.nomeCapa, j.`desc`, j.lancamento, j.preco, c.id as idCategoria, c.nome as nomeCategoria, p.id as idPlataforma, p.nome as nomePlataforma, d.id as idDistribuidora, d.nome as nomeDistribuidora
from tb_jogo as j, tb_categoria as c, tb_plataforma as p, tb_distribuidora as d
where j.idCategoria = c.id and j.idPlataforma = p.id and j.idDistribuidora = d.id;

