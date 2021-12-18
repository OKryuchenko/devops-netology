# Домашнее задание к занятию «2.4. Инструменты Git»

Для выполнения заданий в этом разделе давайте склонируем репозиторий с исходным кодом 
терраформа https://github.com/hashicorp/terraform 

В виде результата напишите текстом ответы на вопросы и каким образом эти ответы были получены. 
___
1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.  
команда: git show aefea  
результат:  
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545  
___  
2. Какому тегу соответствует коммит `85024d3`?
команда:
git show 85024d3
результат  
tag: v0.12.23
___
3. Сколько родителей у коммита `b8d720`? Напишите их хеши.
команда:  git rev-list --parents -n 1 b8d720
2 родителей  56cd7859e05c36c06b56d013b55a252d0bb7e158 9ea88f22fc6269854151c571162c5bcf958bee2b
___
4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами  v0.12.23 и v0.12.24.
команда: 
git log --pretty=format:"%H %s" v0.12.23..v0.12.24  
8 коммитов  
Результат:
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
___
5. Найдите коммит в котором была создана функция `func providerSource`, ее определение в коде выглядит   
команда: git log -S "func providerSource(" --oneline    
результат:    
8c928e835 
___
6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.
команда: git log -S globalPluginDirs --oneline  
результат:
35a058fb3 main: configure credentials from the CLI config file  
c0b176109 prevent log output during init  
8364383c3 Push plugin discovery down into command package  
___
7. Кто автор функции `synchronizedWriters`?    
команда: git log -S synchronizedWriters    
результат:  
commit bdfea50cc85161dea41be0fe3381fd98731ff786  
Author: James Bardin <j.bardin@gmail.com>  


