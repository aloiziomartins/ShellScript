# Shell Script
Aqui pretendo agrupar alguns scripts que diariamente ou eventualmente faço uso nas minhas atividades. Recentemente, com a  leitura do Livro  "SHELL SCRIPT - Profissional. de  Aurelio Marinho Jargas" que me apresentou uma abordagem diferente sobre scripts, uma abordagem que pode transforma simples scripts em programas. Parte deste processo é documentar e aplicar uma melhoria continua de acordo com as necessidades e desafios, tudo isso aproveitando códigos.
## Dicas:
#### Facilitando sua vida!!
	Coloque seu diretírio de scripts no PATH
	ex: export PATH="Diretório:$PATH"
	export PATH="/home/martins/ShellScript:$PATH"
### Modo Hard
Crie um diretório onde irá deixar todos os seus scripts ex: /home/seunome/shellscripts
edite arquivo ~/.bashrc, acrescente ao final do arquivo
uma função com nome do comando e caminho do script, Ex:
```shell
	functions executa_script() {
	  source ~/ShellScript/ambiente_git.sh
	}
	#Salve as alterações e execute: 
	  source ~/.bashrc
```
