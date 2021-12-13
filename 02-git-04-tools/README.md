# Домашнее задание к занятию «2.4. Инструменты Git»

Для выполнения заданий в этом разделе давайте склонируем репозиторий с исходным кодом 
терраформа https://github.com/hashicorp/terraform 

В виде результата напишите текстом ответы на вопросы и каким образом эти ответы были получены. 

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.  
git show aefea
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545  
Update CHANGELOG.md  
2. Какому тегу соответствует коммит `85024d3`?
tag: v0.12.23

3. Сколько родителей у коммита `b8d720`? Напишите их хеши.
2 родителей  56cd7859e05c36c06b56d013b55a252d0bb7e158 9ea88f22fc6269854151c571162c5bcf958bee2b

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами  v0.12.23 и v0.12.24.
commit 85024d3100126de36331c6982bfaac02cdab9e76
commit 33ff1c03bb960b332be3af2e333462dde88b279e

5. Найдите коммит в котором была создана функция `func providerSource`, ее определение в коде выглядит 
так `func providerSource(...)` (вместо троеточего перечислены аргументы).
git log -S "func providerSource(" --oneline  
8c928e835
6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.
git log -S globalPluginDirs --oneline  
35a058fb3 main: configure credentials from the CLI config file  
c0b176109 prevent log output during init  
8364383c3 Push plugin discovery down into command package  
7. Кто автор функции `synchronizedWriters`?    
git log -S synchronizedWriters  
commit bdfea50cc85161dea41be0fe3381fd98731ff786  
Author: James Bardin <j.bardin@gmail.com>  


