# Desafio Nexaas para desenvolvedor(a) em Ruby

# Instalação
Utilizei o docker para subir o ambiente de desenvolvimento, para isso rode o comando
```
docker-compose up -d --build
```

# Utilização
A api ficará disponivel no endereço 
```
http://localhost:9090/
```

# Documentação
A documentação desenvolvida foi feita em SWAGGER e pode ser acessada pelo link
```
http://localhost:9090/api-docs
```

# Recursos
- Crud Product
- Crud Store
- Crud StoreItem

# Fila
- Criação de Update StoreItem por fila usando o Sidekiq
- Para rodar o worker use o comando
```
make sidekiq
```

# Heroku
- Para acessar o ambiente no heroku acesse o endereço:
```
https://desafio-backend-ruby.herokuapp.com/
```

# Rspec
- Para rodar o teste use o comando
```
make qa
```