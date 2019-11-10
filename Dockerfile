# Pegar a ultime versão do node, o alpine especifica que não usaremos nenhuma funcionalidade do sistema operacional
# Ex: Não haverá sudo no container
FROM node:alpine

# diretório da máquina onde vamos trabalhar
WORKDIR /usr/app 

# Copiamos todos os arquivos de extensão json, assim podemos rodar o npm na máquina docker que estamos criando
COPY package*json ./
RUN npm install

# Até aqui, estamos copiando os arquivos package.json para dentro da pasta /usr/app setada por nós para dentro do container docker 
# rodamos o npm install


# Após o npm install, podemos copiar o restante dos arquivos para o nosso docker , menos o node_modules que será ignoradO(.dockerignore)
COPY . .

# Qual a porta que o servidor deve expor para o docker acessar 
EXPOSE 3000

#CMD Indica qual comando o servidor deve rodar para o mesmo iniciar
#Separamos o comando em array 
CMD ["yarn", "start"]

# por fim, para construir uma imagem docker, rodamos docker build -t [nome] [caminho da pasta dockerfile]
# Após construida  a imagem node, rodamos o comando docker run -p [PORTA QUE FOI EXPOSTA]:[PORTA QUE QUEREMOS ACESSAR DO DOCKER] -d [nome]
