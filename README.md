# Marvel's Characters
App responsável por realizar a busca de personagens da Marvel e apresentá-los ao usuário.

# Descrição
App composto por uma única tela, na qual o usuário pode navegar pela(s) página(s) contendo os personagens da Marvel.
Cada página é formada por, no máximo, 4 personagens. Entretanto, é permitida a navegação entre as páginas, por meio de um PageControl, aumentando a quantidade de personagens contidos na tela.
Existe uma barra de pesquisa no topo da página, responsável por filtrar os personagens nas páginas ou, se não houver nenhum resultado para a busca, pesquisando na API utilizada no desenvolvimento.

# Solução Adotada
Para a criação do app foram consideradas as seguintes soluções:

## Extração de Dados
Os dados utilizados neste app foram extraídos da API da Marvel (https://developer.marvel.com/).
Para a execução desta tarefa, foi utilizado o Pod Alamofire, a fim de facilitar a extração, validação e decodificação dos dados para as estruturas adotadas no programa.

## Arquitetura
A arquitetura adotada foi a MVVM, segmentada em:
### Model
Composto pelos modelos de dados para decodificação dos dados extraídos da API.
### View
Composto pela tela e seu respectivo controlador, onde são feitas as configurações e comunicação com o ViewModel.
### View Model
Composto pelas classes que realizam a comunicação entre o modelo e a respectiva View.

Ainda existem outros arquivos de suporte, utilizados para extração dos dados da API. Eles conectam o app aos serviços (Services), bem como contém informações sobre os caminhos da API (Endpoints).
Também existem arquivos para monitoramento de rede para realização dos testes unitários.

## Testes
Foram desenvolvidos alguns testes para verificar a conexão com a API, criação da hash e extração, validação e decodificação dos dados, bem como das imagens utilizadas no app.
