? какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?
Ответ: HISTSIZE, строка 862

? что делает директива ignoreboth в bash?
ignoreboth — не записывать команду, которая начинается с пробела, либо команду, которая дублирует предыдущую.

?В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?
Строка 257
То, что находится между круглыми скобками, выполняется в отдельном подпроцессе. А то, что находится между фигурными скобками — выполняется в контексте текущей оболочки.
              list is simply executed in the current shell environment.  list must be terminated with  a  newline  or
              semicolon.  This is known as a group command.  The return status is the exit status of list.  Note that
              unlike the metacharacters ( and ), { and } are reserved words and must occur where a reserved  word  is
              permitted  to be recognized.  Since they do not cause a word break, they must be separated from list by
              whitespace or another shell metacharacter.

? С учётом ответа на предыдущий вопрос, как создать однократным вызовом touch 100000 файлов? Получится ли аналогичным образом создать 300000? Если нет, то почему?
touch file_{1..100000}

touch file_{1..300000} получаем ошибку
-bash: /usr/bin/touch: Argument list too long
для решение проблемы необходимо измененить максимального размера стека, например:
$ ulimit -s 65536

? В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]] 
Проверяет есть ли файл /tmp
-d file     True if file exists and is a directory. 
? Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы
рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:
PATH=/tmp/new_path_directory/:$PATH
