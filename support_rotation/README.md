# Support Rotation

## Sobre esse Kata

Nesse Kata o objetivo é implementar um sistema de gerenciamento de escalas de operação dos times de Engenharia de uma startup.

## Descrição do problema

Você está construindo um sistema para gerenciar a escala de operação dos times de Engenharia de uma startup durante o período de férias coletivas. É preciso garantir que todos os times tenham pessoas na escala, para atuarem em possíveis cenários de emergência.

A lista com os dados dos times e as pessoas integrantes deve ser armazenada em algum lugar seguindo o padrão sugerido:

```
[
  {team: 'team A', members: ['person A', 'person B']},
  {team: 'team B', members: ['person C', 'person D', 'person E']},
  ...
]
```

## Regras

Comece pela primeira user-story e escreva pelo menos um teste para cada requisito. Tente não olhar para os requisitos futuros e siga estritamente o ciclo de TDD.

## User stories

1. Eu preciso cadastrar no sistema a lista de times e seus membros.
2. Eu preciso cadastrar no sistema o número de semanas que a escala da operação vai durar.
3. Eu preciso visualizar uma lista contendo os times e as pessoas que fazem parte de cada time.
4. Eu preciso visualizar uma lista contendo os times e as pessoas alocadas em cada semana da operação. As pessoas são alocadas semanalmente.
5. Se não houver pessoas para revezamento na escala da operação, a pessoa do time deve permanecer na escala em todas as semanas.
6. Cada pessoa de um time não pode estar na escala da operação por 2 ou mais semanas consecutivas, caso existam membros para revezamento no time.
7. As pessoas dos times precisam ser distribuídas entre as semanas da operação de maneira igualitária, sempre que possível.
8. Caso o número de membros de um time seja inferior ao número de semanas, a escala deve seguir reiniciando pela pessoa que foi alocada na primeira semana e seguir a mesma ordem do primeiro ciclo da escala.
9. A lista de escalas deve ser ordenada pelo nome dos times, assim consigo localizar um time mais facilmente e visualizar sua escala
10. Os nomes dos times devem aparecer capitalizados, para que eu consiga fazer a leitura de maneira mais fácil.
<!-- 11. Os nomes das pessoas devem aparecer capitalizados, para que eu consiga fazer a leitura de maneira mais fácil. -->

## Amostra de dados

Abaixo você encontra uma amostra de dados que pode ser utilizada como modelos de times:

```
[
  {team: 'pope', members: ['brentan', 'robert', 'raites', 'bruno', 'vitoria']},
  {team: 'automation', members: ['camila', 'marcos', 'otto', 'lucas']},
  {team: 'email', members: ['yuri', 'rogerio', 'gabriel', 'francis']},
  {team: 'cdp', members: ['jean g', 'jean m', 'vinicius', 'alessandro']},
  {team: 'rdb', members: ['marcela', 'antonio', 'bernardo', 'diego']},
  {team: 'shield', members: ['johan', 'lucas', 'torresani', 'guilherme', 'natalia', 'liz']},
  {team: 'vikings', members: ['amanda', 'augusto', 'bruno', 'jean', 'rafael', 'thiago']},
  {team: 'moteam', members: ['john', 'filipe', 'sergio', 'rafael']},
  {team: 'data lake', members: ['thiago', 'felipe', 'arthur', 'carla', 'luiz']},
  {team: 'trainee', members: ['bianca', 'luisa', 'bruna']}
]
```

## Sugestão de Interface do Sistema

O sistema de geração de escala de operação pode ser implementado como uma chamada de método seguindo o seguinte padrão:

```!ruby
support_rotation(
  teams: [
    {team: 'pope', members: ['brentan', 'robert', 'raites', 'bruno', 'vitoria']},
    {team: 'automation', members: ['camila', 'marcos', 'otto', 'lucas']},
  ],
  weeks: 4
)
```