Para Melhorar automação e usar seu Script de qualquer diretório adicione seu ShellScript ao Bash.
# Edite o Bash
martins@myserver:~$nano ~/.bashrc
#Adicione na ultima linha:
  
  #MeusComandos
  alias <ambiente_git>='/home/martins/ShellScript/ambiente_git.sh'

# recarregue os comandos:
martins@myserver:~$ source ~/.bashrc
