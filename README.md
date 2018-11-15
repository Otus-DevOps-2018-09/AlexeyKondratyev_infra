# AlexeyKondratyev_infra
AlexeyKondratyev Infra repository

# Подключение через bastion к серверу внутри сети
# Внешний адрес транзитного узла 35.205.219.184
# Внутренний адрес транзитного узла 10.132.0.2
# Внутренний адрес второго сервера, недоступного извне 10.132.0.2

ssh -i ~/.ssh/alx_kond_gcp_test -A -t alx_kond_gcp_test@35.205.219.184 ssh 10.132.0.3

bastion_IP = 35.205.219.184
someinternalhost_IP = 10.132.0.3

# Данные для подключения к приложению puma
# по домашнему заданию №4

testapp_IP = 35.203.53.138
testapp_port = 9292 

# Доп задание
# Пример добалвение startup скрипта при создании инстанса
#  gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family=ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=f1-micro --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup_script.sh
# Пример создания правила через gcloud
#  gcloud compute firewall-rules create puma-server-rules --allow=TCP:9292 --target-tags=puma-server