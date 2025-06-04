## Dica: criar usuário e permissões
Se quiser um setup mais seguro e profissional, crie um usuário dedicado:
```sh
CREATE USER kyc_user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE kyc_monolith TO kyc_user;
```