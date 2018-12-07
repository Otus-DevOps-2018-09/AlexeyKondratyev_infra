
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

# Домашняя работ №5
# Установил packer версии 1.3.2 на локальную систему
# Разрешил пакеру управление GCP ресурсами чрез ADC с помощью команды  gcloud auth application-default login
# Создал папку packer и шаблон packer под свой проект - packer/ubuntu16.json
# В файле шаблона описал билдер и провижионеры под свой шаблон
# Скрипты для провижинера install_ruby.sh и install_mongodb.sh выложены в отдельную папку packer/scripts
# Запущено создание backed-образа командой packer build ubuntu16.json
# Проверил созданные образ через gcloud 
# Параметризировал параметры ID проекта, source_image_family и machine_type, вынес их в отдельный файл variables.json
# Добавил variables.json в файл .gitignore 
# Создал файл variables.json.examples с примерами использования параметров
# Заккомитил файлы проекта:
# Файл шаблона пакера ubuntu16.json
# Файл пользовательских переменных variables.json
# Файл с примерами пользовательских перменных variables.json.examples
# Баш скрипт установки mongodb scripts/install_mongodb.sh
# Баш скрипт установки ruby scripts/install_ruby.sh
# Файл исключений .gitignore
# Описание проекта README.md
# Описание PR PULL_REQUEST_TEMPLATE.md

# Домашняя работа №6
# Создан файл main.tf под инициализацию ресурсов в модуле GCP
# Создан файл выходных переменных outputs.tf для вывода необходиммых данных (внешний ip)
# В файл main.tf добавленные провижинеры для установки приложения puma
# Добавлен файл variables.tf для параметризации конфигурационных файлов 
# Добавлен файл terraform.tfvars для определения переменных, данные о которых не нужно загружать в СКВ
# Добавлен файл terraform.tfvars.example где есть образец использования файла переменных
# Задачи с *
# Создан файл lb.tf для реализации системы балансировки на ВМ и балансера в GCP

# Домашния работа №7

 - Импортировал текущие параметры инфраструктуры в стейт файл terrafrom import
 - Создан IP для экземпляра с приложением в виде внешнего ресурса 
 - Созданные отдельные шаблоны пакера для приложения и БД db.json и app.json
 - Конфиг main.tf разбит на app.tf и db.tf для приложения и БД
 - Создал файл vpc.tf для правила файервола ssh
 - Конфигурации разбиты на модули modules/db, modules/app
 - Модели импортированы через terraform get
 - Параметризовал модули
 - Конфигурация инфраструктуры  разбита на prod и stage окружения
 - Создан модуль storage-bucket для создания бакета в сервисе Storage
 - 