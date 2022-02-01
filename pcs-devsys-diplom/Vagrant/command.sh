sudo ufw allow 22
sudo ufw allow 443
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vault
vault server -dev -dev-root-token-id root

другой терминал
export VAULT_ADDR=http://127.0.0.1:8200
vault status
    Генерация сертификата

vault secrets enable pki
vault secrets tune -max-lease-ttl=720h pki
vault write -field=certificate pki/root/generate/internal \
common_name="example.com" \
ttl=720h > CA_cert.crt
vault write pki/config/urls \
issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
crl_distribution_points="$VAULT_ADDR/v1/pki/crl"

vault secrets enable -path=pki_int pki
vault secrets tune -max-lease-ttl=720h pki_int
vault write -format=json pki_int/intermediate/generate/internal \
common_name="example.com Intermediate Authority" \
| jq -r '.data.csr' > pki_intermediate.csr

vault write -format=json pki/root/sign-intermediate csr=@pki_intermediate.csr \
format=pem_bundle ttl="720h" | jq -r '.data.certificate' > intermediate.cert.pem
vault write pki_int/intermediate/set-signed certificate=@intermediate.cert.pem
vault write pki_int/roles/example-dot-com \
allowed_domains="example.com" \
allow_subdomains=true \
max_ttl="720h"
vault write pki_int/issue/example-dot-com common_name="test.example.com" ttl="24h"
8. Установите nginx.
9. По инструкции ([ссылка](https://nginx.org/en/docs/http/configuring_https_servers.html)) настройте nginx на https, используя ранее подготовленный сертификат:
- можно использовать стандартную стартовую страницу nginx для демонстрации работы сервера;
- можно использовать и другой html файл, сделанный вами;
```
sudo nano /etc/nginx/nginx.conf
...
http {
...
  server {
      listen              443 ssl;
      server_name         test.example.com;
      ssl_certificate     /etc/ssl/example.crt;
      ssl_certificate_key /etc/ssl/example.key;

sudo nginx -t
```