## Consulta Remedios Mobile Challenge

A arquitetura escolhida foi MVVM sem two way data binding por possibilitar isolar as regras de negócio da aplicação e componentes de fuma forma simples. A aplicação se divide em:
- DOMAIN: Comporta todas as regras de negócio, rede e repositórios possibilitando que qualquer target utilize seus recursos comportalhando as regras de negócios já validadas.
- CRMobileChallenge: Aplicação em si.

### Recursos
- JGProgessHUD: Load e espera
- Kingfisher: Load de imagens com cache
- SwiftMessages: Alertas bacanas =)
- EmptyState: Framework próprio para exibição e mensagens de erro e ausência de conteúdo

##### Pontos não aplicados
* Formulário de endereço
* Formulário de forma de pagamento
