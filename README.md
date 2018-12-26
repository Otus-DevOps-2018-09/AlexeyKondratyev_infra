# AlexeyKondratyev_infra
AlexeyKondratyev Infra repository

- Подключение через bastion к серверу внутри сети
- Внешний адрес транзитного узла 35.205.219.184
- Внутренний адрес транзитного узла 10.132.0.2
- Внутренний адрес второго сервера, недоступного извне 10.132.0.2

ssh -i ~/.ssh/alx_kond_gcp_test -A -t alx_kond_gcp_test@35.205.219.184 ssh 10.132.0.3

bastion_IP = 35.240.97.62
someinternalhost_IP = 10.132.0.3

## Данные для подключения к приложению puma по домашнему заданию №4

testapp_IP = 35.240.97.62
testapp_port = 9292 

## Доп задание к ДЗ №4
- Пример добалвение startup скрипта при создании инстанса
-  gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family=ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=f1-micro --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup_script.sh
- Пример создания правила через gcloud
-  gcloud compute firewall-rules create puma-server-rules --allow=TCP:9292 --target-tags=puma-server

#№ Домашняя работ №5
- Установил packer версии 1.3.2 на локальную систему
- Разрешил пакеру управление GCP ресурсами чрез ADC с помощью команды  gcloud auth application-default login
- Создал папку packer и шаблон packer под свой проект - packer/ubuntu16.json
- В файле шаблона описал билдер и провижионеры под свой шаблон
- Скрипты для провижинера install_ruby.sh и install_mongodb.sh выложены в отдельную папку packer/scripts
- Запущено создание backed-образа командой packer build ubuntu16.json
- Проверил созданные образ через gcloud 
- Параметризировал параметры ID проекта, source_image_family и machine_type, вынес их в отдельный файл variables.json
- Добавил variables.json в файл .gitignore 
- Создал файл variables.json.examples с примерами использования параметров
- Заккомитил файлы проекта:
- Файл шаблона пакера ubuntu16.json
- Файл пользовательских переменных variables.json
- Файл с примерами пользовательских перменных variables.json.examples
- Баш скрипт установки mongodb scripts/install_mongodb.sh
- Баш скрипт установки ruby scripts/install_ruby.sh
- Файл исключений .gitignore
- Описание проекта README.md
- Описание PR PULL_REQUEST_TEMPLATE.md

## Домашняя работа №6
- Создан файл main.tf под инициализацию ресурсов в модуле GCP
- Создан файл выходных переменных outputs.tf для вывода необходиммых данных (внешний ip)
- В файл main.tf добавленные провижинеры для установки приложения puma
- Добавлен файл variables.tf для параметризации конфигурационных файлов 
- Добавлен файл terraform.tfvars для определения переменных, данные о которых не нужно загружать в СКВ
- Добавлен файл terraform.tfvars.example где есть образец использования файла переменных
## Задачи с *
- Создан файл lb.tf для реализации системы балансировки на ВМ и балансера в GCP

## Домашния работа №7

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

## Домашняя работа №8 (ansible-1)

- Подготовил локальное окружение для работы с anisble (Windows10+vagrant+vm-ubuntu)
- Попробовал работать с anisble через Win10+WSL(не работает)
- Переподнял stage на terraform
- Ознакомился с работой inventory
- Создал конфиг для ansible в ansible.cfg
- Добавил группы в inventory
- Создал inventory.yml 
- СОздал плейбул для копирования репозитория clone.yml
- При запуске плейбука clone.yml если репозиторий существует плейбук будет возвращать 
```
appserver : ok=2 changed=0
```
если не существует, то
```
appserver : ok=2 changed=1
```
- Для выполнения задачи со звездочкой была попытка самостоятоельно написать скрипт которая закончилась неудачно, в итоге подсмотрел как сделаго у as-anatoliy-u
- Сделал два скрипта по аналогии dynamic-inventory.sh* и gce-list-parser.py*

## Домашняя работы №9 (ansible-2)

- Создан playbook `ansible/reddit_app.yml` (позже переименована в `reddit_app_one_play.yml`)
- Добавлен в `.gitignore` `*.retry`
- В файл добавлне задача копирования параметризированного конфига `mongodb` `mongod.conf.j2`
- в конфигурацию добавлен хэндлер для перезапуска mongodb
- Подготовлен unit файл `ansible/files/puma.service`
- Добавлен хэндлер для рестарта сервиса `puma`
- Добавлена переменная для с ip адресом mongodb для подключения приложения
- Добавление в конфигурацию задачи деплоя
- Переделана конфигурация на мультисценарную в одном плейбуке `reddit_app2.yml` (позже переименована в `reddit_app_multiple_play.yml`)
- Переделана конфигурация на мультиплейбучную (`app.yml` ,`db.yml` , `deploy.yml`, `site.yml`)
- Изменены провижинонеры в packer, вместо скриптов прописаны плейбууки

## Домашняя работа №10 (ansible-3)

- Использовал `ansible-galaxy init` для формирования структуры ролей app db
- Перенес секции `tasks` в файлы `roles/../tasks/main.yml`
- Тоже самое сделал с шаблонами и файлами
- Отметил для себя что необязательно указывать `templates` и `files` в пути
- Отдельно вынес хэндлеры в `roles/../handlers/main.yml`
- Сделал папки для окружений с отдельными инвентори `enviroments/../inventory`
- Попробовал задеплоить приложение с определенным окружением `ansible-playbook -i environments/prod/inventory deploy.yml`
- Добавил Community-роль `jdauphant.nginx`
- Добавил ноый Playbook и зашифровал данные с помощью `ansible vault`

## Домашняя работа №11 (ansible-4)

- Установлен Vagrant  на локальную машину
- Проверена установка `vagrant -v`
- В файл `.gitignore` добавлены исключения для молекулы, вагранта
- Создан `Vagrantfile` для двух ВМ, приложения и БД
- Проверено что бокс скачался `vagrant box list`
- Проверен статус ВМ `vagrant status`
- Добавлен провижин для ansible
- Добавлен playbook `base.yml` для предварительной установки python
- Доработка ролей app и db, плейбуки разделены на установку приложения и настройку приложения
- Переопределены переменные через extra_vars в Vagrantfile
- Установлены molecule, testinfra, python-vagrant
- Созданые файлы молекулы
