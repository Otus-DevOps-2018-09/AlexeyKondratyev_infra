# Выполнено ДЗ №3

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:
 - Настроен gcloud (настроена учетка через gcloud auth list )
 - Создан новый инстанс через gcloud compute
 - На инстанс установлен ruby и mongodb через шел
 - Устанвлено приложение puma через шел
 - Открыт порт 9292 в вебконсоли
 - Созданы и и проверены в работе скрипты install_ruby.sh install_mongodb.sh deploy.sh
 - Создан стартап скрипт для автоматической установки приложения startup-script.sh
 - Удалил инстанс и сразу пересозадал его через gcloud 
 - Так же заново прокинул порт через gcloud

## Как запустить проект:
 - Пример запуска проекта gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family=ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=f1-micro --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup_script.sh

## Как проверить работоспособность:
 - Например, перейти по ссылке http://35.203.53.138:9292/

## PR checklist
 - [+] Выставил label с номером домашнего задания
 - [+] Выставил label с темой домашнего задания
