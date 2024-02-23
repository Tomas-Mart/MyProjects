"""

GET - функция для получения списка заметок из API приложения для заметок.

POST - функция для добавления новой заметки в приложении для заметок.

PUT - функция для внесения изменений в уже существующую заметку в приложении.

DELETE - функция для удаления заметки из базы данных приложения для заметок.

HTTP GET http://site.ru/page.php?name=dima&age=27
http-протокол   ru-суффикс      ?name=dima-параметр1
site-домен      /page.php-путь   &age=27-параметр2

HTTP GET http://www.appdomain.com/users?size=20&page=5
http-протокол     com-суффикс      ?size=20-параметр1
www-система       /users-путь       &page=5-параметр2
appdomain-домен

HTTP DELETE http://www.appdomain.com/users/123/accounts/456
http-протокол     com-суффикс
www-система       /users/123/accounts/456-путь
appdomain-домен

Components:        Components:                  Components:
scheme = "http"    scheme = "http"              scheme = "http"
host = "site.ru"   host = "www.appdomain.com"   host = "www.appdomain.com"
path = "page.php"  path = "users"               path = "users/123/accounts/456"
                                
Items:             Items:
name=dima          size=20
age=27             page=5

"""




