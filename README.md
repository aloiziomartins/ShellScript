#Facilitando sua vida!!
Crie um diretório onde irá deixar todos os seus scripts ex: /home/seunome/shellscripts
edite arquivo ~/.bashrc, acrescente ao final do arquivo
uma função com nome do comando e caminho do script, Ex:

functions executa_script() {
  source ~/ShellScript/ambiente_git.sh
}
Salve as alterações e execute: 
  source ~/.bashrc
