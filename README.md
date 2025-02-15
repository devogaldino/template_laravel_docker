# Setup Docker Para Projetos PHP + Laravel

## Techs

- PHP: Aplicação WEB
- Laravel: Framework PHP
- MySQL: Banco de Dados
- DBeaver: Ferramenta gráfica (GUI) para gerenciar bancos de dados
- RedisInsight: Interface gráfica para visualizar e gerenciar dados armazenados no Redis
- Redis: Banco de dados NoSQL baseado em chave-valor
- MailHog: Ferramenta que simula um servidor de e-mail para testes locais
- MinIO: Sistema de armazenamento de objetos compatível com Amazon S3

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
APP_URL=http://localhost:8080/

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=database_name
DB_USERNAME=root
DB_PASSWORD=root

CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="email@email.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=bucket-key
AWS_SECRET_ACCESS_KEY=bucket-secret
AWS_DEFAULT_REGION=sa-east-1
AWS_BUCKET=bucket-name
AWS_USE_PATH_STYLE_ENDPOINT=true
AWS_URL=http://minio:9000/
AWS_ENDPOINT=http://minio:9000/
```

Caso precise alterar a versão do PHP, altere a linha seguinte no arquivo Dockerfile em *.docker/dev/Dockerfile*:

```bash
FROM php:7.4.33-fpm
```

> #### Atenção! Após rodar o projeto, você precisará configurar o bucket do MINIO se for lidar com arquivos.
>
> - Acesse a interface em: [Minio Docker Service](http://localhost:9001);
> - Autentique com as credenciais configuradas no .env;
> - Após logar, clique em **Create a Bucket.**, na aba: **Object Browser**;
> - De um nome ao bucket, crie e atualize o .env em: *AWS_BUCKET*;
> - Após criar o bucket, vá para a aba: **Access Key**, e crie as chaves de acesso;
> - Após criar as chaves, atribua corretamente no arquivo .env em: *AWS_ACCESS_KEY_ID* e *AWS_SECRET_ACCESS_KEY*;
> - Se achar necessário, configure a região do bucket na aba: **Configuration** e atualize o .env em: *AWS_DEFAULT_REGION*;


O arquivo: ***setup***, agiliza os processos seguintes e mostra as url's locais, execute-o se preferir.

```bash
./setup
```

### - Se você optou por **NÃO** utilizar o arquivo: ***setup***, prossiga:


Suba os containers do projeto:

```bash
docker-compose up -dV --build
```

Acessar o container:

```bash
docker-compose exec php bash
```

Instalar as dependências do projeto:

```bash
composer install --no-scripts
```

Zerar o banco

```bash
php artisan migrate:fresh
```

Rodar os seeders
```bash
php artisan db:seed
```

Gerar a key do projeto:

```bash
php artisan key:generate
```

Rodar os comandos artisan para limpar qualquer cache:

```bash
php artisan optimize
```
