# lab.infra.app

HTTP-приложение на Go с пайплайном GitLab CI. По тегу пайплайн собирает Docker-образ и публикует его в Container Registry проекта.

## Быстрый старт

Локальный запуск

```bash
docker build --build-arg VERSION=dev -t app .
docker run --rm -p 8080:8080 app
curl localhost:8080
```

Сборка образа в GitLab

```bash
git remote add gitlab <адрес проекта GitLab>
git push gitlab main
git tag v1.0.0
git push gitlab v1.0.0
```

После успешного пайплайна образ появляется в Registry с тем же тегом, например `<registry>/<группа>/<проект>:v1.0.0`.

## Требования к GitLab

- Включённый Container Registry
- Runner с executor `docker` в привилегированном режиме и томом `/certs/client`, иначе не запустится сервис `docker:dind`
