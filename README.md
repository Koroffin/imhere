# Поле того, как сделал пул (к тебе пришли новые данные):
Запускаешь у себя в терминале (ты должен находиться в папке imhere):

```sh
npm install
grunt start
```

Первая команда скачивает новые библиотеки, вторая - запускает локальный сервер

# Как происходит деплой:

## Шаг 1
Запускаешь у себя в терминале (ты должен находиться в папке imhere):

```sh
git add .
git commit -m 'Commit message'
git push origin master
```

или пользуешься git-клиентом.

## Шаг 2
Заходишь на http://heroku.com.

Логин - wlords@yandex.ru
Пароль - nickandpete

Выбираешь приложение morning-tundra-5050 и переходишь на вкладку "Deploy" (она сверху, под названием)
Листаешь вниз до раздела "Manual deploy", жмёшь кнопку "Deploy Branch".
Ждёшь, билд обычно долгий, хватит на кружку чая или сигарету :).
