# Games

Para este projeto foi utilizado o Cocoapods, para gerenciar as bibliotecas utilizadas.
No projeto foram utilizadas as seguintes bibliotecas:

  - Alamofire - Biblioteca para realizar de forma simples e elegante as chamas do  webservice
  - AlamofireObjectMapper - Biblioteca para realizar o mapeamento do json que vem do webservice
  - AlamofireImage - Biblioteca para realizar o download das imagens do webservice
  - RealmSwift - Banco de dados
  
# Instrução

Para executar a aplicação é necessário instalar o cocoapods com o seguinte comando  :

  sudo gem install cocoapods

Após a instalação, acessar a pasta do projeto através do terminal e executar o seguinte comando
  
  pod install

Com isso as bibliotecas serão instaladas.

Após a instalação abra o xcode -> File -> Open -> Selecione a pasta onde o projeto foi salvo -> Abra o arquivo ConsultaRemedio.xcworkspace

Após o projeto aberto é só executar.

# Breve descrição

Ao abrir o app os jogos apareçam na tela. Nesta primeira tela o usuário poderá realizar a busca pelo nome do 
jogo e pode ir para a tela do carrinho de compras. O usuário pode clicar em qualquer jogo, quando fizer isso será mostrada algumas informações do jogo. Na tela dos detalhes o usuário poderá adicionar o jogo no carrinho de compras ou ir para a tela do carrinho de compras.
Na tela de do carrinho o usuário poderá finalizar a sua comprar.

# Teste 

Foram criados testes unitários para as regras do carrinho.
Para rodar os testes é só dar o comando cmd + u.

# Melhorias
- Tentei deixar o layout mais parecido possível com as telas que foram passadas, mas não tinha as dimensões exatas e nem as fontes e seus tamanhos;

# Implentação do webservice;
- No checkout do carrinho o webservice não retorna o número do pedido, deve ser implementado;
- Não consegui testar a aplicação funcionando 100%, pois o webservice não estava mais no ar, no domingo dia 16/06
