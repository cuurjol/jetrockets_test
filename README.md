# Тестовое задание для компании [Jetrockets](https://jetrockets.pro/)

#### Предметная область:

1. Есть игроки, которые играют за команду, принимая участие в матчах.
2. Есть показатели ("пробежал 10+ км", "сделал 70+ % точных передач").
3. Игроки в каждом матче какие-то показатели выполняют, а какие-то нет.

**Задание:** создать модели к данной предметной области.

#### Написать методы, которые позволяют:

1. Отметить, что игрок выполнил такой-то показатель в матче
2. Проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды
3. Выбрать Top-5 игроков по конкретному показателю в конкретной команде и по всем командам в целом

**P.S.** Полный набор атрибутов в моделях не принципиален, так что можно обойтись минимально достаточным.

# Запуск приложения

Для того, чтобы запустить приложение, выполните следующие команды у себя в окне терминала:

* Склонируйте репозиторий с GitHub и перейдите в папку приложения:
```
git clone https://github.com/cuurjol/jetrockets_test.git
cd jetrockets_test
```

* Установите необходимые гемы приложения, указанные в файле `Gemfile`:
```
bundle install
```

* Создайте базу данных, запустите миграции для базы данных и файл `seeds.rb` для создания записей в базу данных:
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

В приложении, согласно ТЗ, не требовалось создавать полноценное приложение на ROR (с моделями, контроллерами, 
представлениями и т.д.), а только создать объектную модель предметной области. Поэтому, решение данного ТЗ находится в 
моделях. Тестирование происходит в rails консоле. Чтобы это сделать, нужно в терминале ввести следующую команду:
```
bundle exec rails console
``` 