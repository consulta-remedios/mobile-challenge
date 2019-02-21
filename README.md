## Consulta Remedios Mobile Challenge

A arquitetura escolhida foi MVVM sem two way data binding por possibilitar isolar as regras de negócio da aplicação e componentes de fuma forma simples. A aplicação se divide em:
- DOMAIN: Comporta todas as regras de negócio, rede e repositórios possibilitando que qualquer target utilize seus recursos comportalhando as regras de negócios já validadas.
- SHARED: Compartilha recursos visuais e componentes com qualquer target
- CRMobileChallenge: Aplicação em si.

### MUITO IMPORTANTE!!!
Esse projeto possui 3 targets separados com isso o XCode pode em alguns momentos se perder como acontece com diversos outros projetos, então deixo aqui a orientação que a solução e simples, basta dar um clean e em seguinda um run ou no pior caso limpar o derived data.

### Recursos
- JGProgessHUD: Load e espera
- Kingfisher: Load de imagens com cache
- SwiftMessages: Alertas bacanas =)
- EmptyState: Framework próprio para exibição e mensagens de erro e ausência de conteúdo

##### Pontos não aplicados
* Formlário de endereço
* Formlário de forma de pagamento
