# Risuto

Risuto é um App que lista as informações do Studio Ghibli.

Studio Ghibli API - [Docs](https://ghibliapi.herokuapp.com/#section/Studio-Ghibli-API)

Projeto não possui nenhuma configuração necessária para pacotes internos, possui apenas o projeto principal e 3 modulos, sendo eles:

- Models: Modulo com as interfaces das modelos que vão ser usadas por outros modulos e pelo projeto principal.
- Network: Interface e implementação da comunicação HTTP para consumo da API
- ListModule: Modulo responsavel por fornecer um Composable de List, que é reutilizado para todas listagem do App.

Pontos a Melhorar
- Uma tela de detalhe, que seria feita no mesmo estilo da Lista, com um modulo unico que poderia ser utilizado atravez de Composition Types
- Higienização geral do Código
- Localização usando String File
- Customizar uma Cell para cada tipo de lista
