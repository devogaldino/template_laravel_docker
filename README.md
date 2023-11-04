# Setup Docker Para Projetos Laravel

### Passo a passo
Clone Repositório
```sh
git clone https://github.com/galdino01/template-laravel-docker.git
```

Copie os arquivos docker-compose.yml, Dockerfile e o diretório docker/ para o seu projeto
```sh
cp -rf template-laravel-docker/* app_name/
```
```sh
cd app_name/
```


Crie o Arquivo .env
```sh
cp .env.example .env
```


Atualize as variáveis de ambiente do arquivo .env
```dosini
APP_NAME="APP NAME"
APP_URL=http://localhost:8082

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root

CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379
```


Suba os containers do projeto
```sh
docker-compose up -d
```


Acessar o container
```sh
docker-compose exec app bash
```


Instalar as dependências do projeto
```sh
composer install
```


Gerar a key do projeto Laravel
```sh
php artisan key:generate
```

Rodar os comandos artisan para limpar qualquer cache
```sh
php artisan optimize
```


Acessar o projeto
[http://localhost:8082](http://localhost:8082)
