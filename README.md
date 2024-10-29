# projeto-dweb
Sistema Web para agendamento de salão de festas.
### Frontend
HTML CSS JavaScript<br>
Framework para estilização: Bootstrap
### Backend
JSP
### Banco de dados
MySQL / PHPMyAdmin
## Funcionalidades
### Roles no sistema:
ADMIN:
- **cadastrar possíveis espaços, datas e horários para aluguel dos espaços do salão de festas.**
  - Só poderá alterar ou excluir, **se não tiver agendamentos.**
- **Dá a confirmação do uso do espaço.**
- **Faz o fechamento do aluguel.**
  - Se estiver tudo em ordem quanto ao uso, **faz uma rápida avaliação final após uso.**
  - Se houver irregularidades, **o aluguel ficará aberto com uma ocorrência pendente, até que ela seja solucionada.**
- Consultar os agendamentos por espaço ou por mês.
- **Senha padrão do ADMIN é 123456.**
  - No primeiro acesso, **o ADMIN deve alterar a senha.**

USER:
- **Alugar o espaço, considerando o acesso às informações acima.**
  - Só pode alugar novamente depois que o último aluguel seja fechado com a avaliação do ADMIN.
  - Só poderá alterar ou excluir se o ADMIN ainda não houver confirmado o agendamento.
- **Consultar os agendamentos que foram feitos.**
- **Deve fazer cadastro no sistema para ter acesso às funcionalidades do sistema.**
### Funcionalidades gerais:
FORMULÁRIOS:
- **Validação de dados**
- **Utilização de máscara nos campos**<br>
SEGURANÇA:
- **Session para segurança dos dados**
## Hospedagem
*A definir*
