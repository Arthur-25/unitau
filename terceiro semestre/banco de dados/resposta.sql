select * from diretoria 
select * from funcionario
select * from secao

select descricao from diretoria 
select count(*) as total_funcionarios from funcionario 
select avg(salario) as salario_medio from funcionario 

select descricao from secao

select avg(salario) as salario_medio from funcionario 
join secao 
on funcionario.secao = secao.codigo 

select * from funcionario order by secao 

SELECT  secao.descricao, 
funcionario.salario FROM secao FULL JOIN
funcionario ON secao.codigo = funcionario.secao;

select secao, avg(salario) as salario_medio  from funcionario group by secao 

select distinct secao.codigo, funcionario.salario 
from secao
full join funcionario 
on secao.codigo = funcionario.secao group by secao.codigo, funcionario.salario 

SELECT venda.data,venda.valor,automovel.modelo,
SUM(valor) OVER( ORDER BY data ) AS saldo FROM
venda,automovel WHERE automovel.codigo=venda.automovel;
--certo por enquanto
select diretoria.descricao, count(funcionario.matricula), sum(salario)
from diretoria, funcionario,secao where secao.codigo = funcionario.secao group by diretoria.descricao 

select distinct diretoria.descricao, count(funcionario.matricula) over(partition by funcionario.nome), sum(salario) 
from diretoria, funcionario,secao where secao.codigo = funcionario.secao and funcionario.salario >2600 group by diretoria.descricao, funcionario.matricula, secao.codigo
-- mais certo da 1 até agora
select diretoria.descricao, count(funcionario), sum(salario)  as salarios
from diretoria, funcionario,secao where secao.codigo = funcionario.secao and diretoria.codigo  = secao.diretoria    group by diretoria.descricao 

-- RESPOSTA 1
select distinct diretoria.descricao, count(funcionario), sum(salario)  as salarios
from diretoria, funcionario,secao where secao.codigo = funcionario.secao and diretoria.codigo  = secao.diretoria   group by diretoria.descricao 
having avg(salario)>2600 order by count(funcionario)

--TENTATIVAS DA 2

select * from fabricante
select * from automovel 
select * from venda 

--melhor tentativa do 2
select fabricante.nome, sum(venda.valor) as nacional
from fabricante,venda, automovel 
where  fabricante.codigo = automovel.fabricante and venda.automovel = automovel.codigo and automovel.pais = 'Brasil'
group by fabricante.nome



SELECT modelo,cor,ano,compra FROM automovel WHERE
pais='Brasil';

select fabricante.nome, sum(venda.valor) as total, automovel.pais
from fabricante,venda, automovel 
where  fabricante.codigo = automovel.fabricante and venda.automovel = automovel.codigo 
group by fabricante.nome, automovel.pais
