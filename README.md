# rep-lulc-versions

Teste para verificar os impactos causados pelas diferentes versões de software na geração de mapas de uso e cobertura da terra. Os testes foram feitos utilizando [R SITS](https://github.com/e-sensing/sits) e [Python scikit-learn](https://scikit-learn.org/).

> Por favor, perceba que esses testes são apenas para verificar se diferentes versões influenciam o resultado de classificações de uso e cobertura da terra. Assim, isso não server para verificar qual software "é melhor". Os softwares estão sempre evoluindo, então, não faz sentido assumir que mesmo com diferentes versões o mesmo resultado será produzido!

## Descrição dos testes

Os testes foram realizados utilizando dois pacotes de software, para investigar para retirar o viés de análise. Abaixo, são apresentadas informações de cada um dos pacotes e versões analisadas

**SITS**

Para a execução dos testes no pacote SITS, foram selecionadas três versões do pacote. A escolha foi feita considerando o período de 06/2020 à 12/2020. Datas anteriores não foram consideradas já que problemas com pacotes mais antigos foram identificados, nesses, algumas dependências, como `EOCubes`, são necessárias no pacote mas não estão mais disponíveis para download.

- [Ambiente base](sits/base): Ambiente Docker com a dependências base para a instalação do pacote SITS. Todas as versões do SITS são instaladas com base nesse ambiente

- [SITS (03-06-2020)](sits/03-06-2020)
- [SITS (02-12-2020)](sits/02-12-2020)
