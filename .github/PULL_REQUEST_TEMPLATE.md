# Выполнено ДЗ №5

 - [+] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
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

## Как запустить проект:
 - Пример запуска проекта gcloud compute instances create reddit-full --boot-disk-size=10GB --image-family=reddit-base --machine-type=f1-micro --tags puma-server --restart-on-failure

# Как проверить работоспособность:
- Например, перейти по ссылке http://35.187.72.170:9292/

## PR checklist
 - [+] Выставил label с номером домашнего задания
 - [+] Выставил label с темой домашнего задания