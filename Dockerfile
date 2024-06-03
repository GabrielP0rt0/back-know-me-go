# Use a imagem base do Debian para maior controle sobre a instalação do Go
FROM debian:latest

# Instale dependências necessárias
RUN apt-get update && apt-get install -y wget tar

# Baixe e instale a versão específica do Go (1.21.1)
RUN wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
RUN rm go1.21.1.linux-amd64.tar.gz

# Configure o PATH para usar a nova versão do Go
ENV PATH="/usr/local/go/bin:${PATH}"

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo go.mod e go.sum e instale as dependências
COPY go.mod go.sum /app/
RUN go mod download

# Copie o código fonte
COPY . /app

# Compile o aplicativo
RUN go build -o main .

# Defina o comando de inicialização do contêiner
CMD ["./main"]

# Exponha a porta que o aplicativo usará
EXPOSE 8080
