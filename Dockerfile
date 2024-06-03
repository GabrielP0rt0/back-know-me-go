# Use a imagem base do Golang
FROM golang:1.20

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
