# Setup Docker Para Projetos PHP + Laravel

## Techs

- PHP
- Laravel
- Mysql
- Phpmyadmin
- Redis
- Mailhog

##

### Passo a passo

Clone Repositório:

```bash
git clone https://github.com/galdino01/template_laravel_docker.git --branch=main
```

Copie os arquivos do template para o seu projeto:

```bash
cp -rf template-laravel-docker/* app_name/
```

```bash
cd app_name/
```

Crie o Arquivo .env:

```bash
cp .env.example .env
```

Atualize as variáveis de ambiente do arquivo .env:

```dosini
APP_NAME="APP NAME"
APP_URL=http://localhost:8989/

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

Caso precise alterar a versão do PHP, altere a linha seguinte no arquivo Dockerfile:

```bash
FROM php:7.4.33-fpm
```

Suba os containers do projeto:

```bash
docker-compose up -d
```

Acessar o container:

```bash
docker-compose exec app bash
```

Instalar as dependências do projeto:

```bash
composer install
```

Gerar a key do projeto:

```bash
php artisan key:generate
```

Rodar os comandos artisan para limpar qualquer cache:

```bash
php artisan optimize
```
