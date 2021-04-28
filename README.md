# Experimento - Impacto das versões de software

Teste para verificar os impactos causados pelas diferentes versões de software na geração de mapas de uso e cobertura da Terra (LULC, do inglês *Land Use and Land Cover*). Os testes foram feitos utilizando o pacote [R SITS](https://github.com/e-sensing/sits).

> Por favor, perceba que esses testes são apenas para verificar se diferentes versões influenciam o resultado de classificações de uso e cobertura da Terra. Assim, isso não server como verificação de qualidade de *software*, pelo contrário! Os softwares estão sempre evoluindo, então, não faz sentido assumir que mesmo com diferentes versões o mesmo resultado será produzido!

## Descrição dos testes

Para a verificação do impacto causado nos resultados, fez-se o cálculo da diferença entre dois mapas de LULC. Cada um desses sendo gerado com uma versão do pacote. As versões foram determinadas com base em *commits* específicos. 

A escolha do *commit* utilizado foi feita de modo a considerar uma distância de tempo considerável. Foi considerado então, o intervalo de tempo de 06/2020 à 12/2020. Ao final, foram utilidas as versões dos *commits* nos dias 30-06-2020 e 02-12-2020.

> Versões mais antigas não foram consideradas por apresentar erros nas instalações por conta de pacotes dependentes que não estão mais disponíveis (e.g. `EOCubes`)

## Arquivos

Os experimentos estão organizados nos diretórios listados abaixo:

- [base](base): Ambiente base com as dependências mínimas para a instalação do pacote SITS (e.g. GDAL, units, sf);
- [verification](verification): *Scripts* para geração das figuras de comparação entre as versões;
- [sits/30-06-2020](sits/30-06-2020): Experimento de classificação com o *commit* da data 30-06-2020;
- [sits/02-12-2020](sits/02-12-2020): Experimento de classificação com o *commit* da data 02-12-2020.

## Construção dos experimentos

> A execução depende do [Docker](https://www.docker.com/). Para fazer a instalação, utilize a [documentação oficial](https://docs.docker.com/engine/install/)

Para reproduzir os testes realizados, pode-se utilizar o `Makefile`. Para a construção do ambiente base, com todas as dependências do pacote SITS, faz-se o uso do comando abaixo:

```shell
make environment
```

Após a construção do ambiente, os experimentos podem ser executados

*SITS na data 30/06/2020*
```shell
make experiment_01
```

*SITS na data 02/12/2020*
```shell
make experiment_02
```

Todos os passos acima podem ser resumidos através do comando:

```shell
make experiment
```

> **Nota**: Para acompanhar a execução, verifique o *status* de execução dos *Docker Containers* criados.

## Geração das figuras de comparação

Para gerar as figuras de verificação dos resultados pode-se utilizar o comando:

```shell
make validation
```

> Após finalizar as execuções, você pode excluir os *Docker Containers* criados utilizando `make clean`.
