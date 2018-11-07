# AlexeyKondratyev_infra
AlexeyKondratyev Infra repository

# Подключение через bastion к серверу внутри сети
# Внешний адрес транзитного узла 35.205.219.184
# Внутренний адрес транзитного узла 10.132.0.3
# Внутренний адрес второго сервера, недоступного извне

ssh -i ~/.ssh/alx_kond_gcp_test -A -t alx_kond_gcp_test@35.205.219.184 ssh 10.132.0.3

bastion_IP = 35.205.219.184
someinternalhost_IP = 10.156.0.3

