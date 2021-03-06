
# Домашнее задание к занятию "5.1. Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения."
---

## Задача 1

Опишите кратко, как вы поняли: в чем основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.
```
Основное отличие паравиртуализации от остальных типов виртуализации - необходимость модификации ядра гостевой ОС.
Полная виртуализация - Не требуется ОС. Гипервизор связывает гостувую ОС с физический оборудованием сервера.
Паравиртуализация - Для паравиртуалтизации требуется ОС. Виртуальные машины могут быть с ядром отличным ох хотовой ОС.
Виртуализации на основе ОС - контейнеры. Используются на базе ОС. Делят ядро ОС. Виртуальные машины не могут быть с ядром отличным ох хотовой ОС.
```
## Задача 2

Выберите один из вариантов использования организации физических серверов, в зависимости от условий использования.

Организация серверов:
- физические сервера,
- паравиртуализация,
- виртуализация уровня ОС.

Условия использования:
- Высоконагруженная база данных, чувствительная к отказу.
- Различные web-приложения.
- Windows системы для использования бухгалтерским отделом.
- Системы, выполняющие высокопроизводительные расчеты на GPU.

Опишите, почему вы выбрали к каждому целевому использованию такую организацию.
```
физические сервера:
    - Системы, выполняющие высокопроизводительные расчеты на GPU. - Думаю гипервизор будет лишним. Он будет задерживать операции, так как является посреднирком между оборудованием и оборудованием и гостевой ОС. Если задержки не критичны, то я все-таки выбрал аппаратную виртуализацию.
    

паравиртуализация:
    - Паравиртуализация хорошо подходит для тестовой среды. - Возможно на рабочей станции разработчика или администратора запускать в тестовой среде различные ОС.Производить тесты.
    - Windows системы для использования бухгалтерским отделом. (или аппаратная виртуализация) -  Если нет явной причины использовать физические сервера, то все нужно виртуализировать. Виртуальную машину легче обслуживать, разварачивать, делать резервное копирование. В случае отказа физического оборудования возможно быстро восстановить работоспособность на другом сервере.
    - Высоконагруженная база данных, чувствительная к отказу. (или аппаратная виртуализация) - С помошью виртуализации можно построить отказоустойчевый кластер. Меньше проблем при выходе из строя оборудования. Возможна миграция без прерывания работы базы данных.
виртуализация уровня ОС    
    - Различные web-приложения. - Возможно быстро масштабировать при возрастающей нагрузке. 
           
```

## Задача 3
Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

Сценарии:

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
2. Требуется наиболее производительное бесплатное open source решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры.
4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

```
1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based инфраструктура,
требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
    - Hyper-v. Работает с машинами  Linux и Windows. Поддерживает репликацию, кластеризацию, живую миграцию. ВМ с Linux не требуют лицензий.
    - wm ware ESXI - Работает с машинами  Linux и Windows. В беспланой версии не поддерживает живую миграцию. Я бы отдал предпочтение Hyper-v
    - VMware vSphere - Работает с машинами  Linux и Windows. Из минусов - стоимость продукта. 

2. Требуется наиболее производительное бесплатное open source решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
    - KVM бесплатное, высокопроизводительное  решение
    
3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры.
    Hyper-v Server - бесплатный гипервизор от Microsoft, максимально совместивое решение для виртуализации Windows инфраструктуры
4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.
   VirtualBox - Если нет больших нагрузок идеально подходит. На рабочей станции разработчика возможно заскать различные ОС. Включая Docker c различными дистрибутивами Linux.
   Docker - если хостовая ОС Linux. Либо инфраструктура у облачного провайдера.
```
## Задача 4

Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. 
Если бы у вас был выбор, то создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.
```
- необходимость поддерживать белее одной системы виртуализации. Возрвстает стоимость поддержки. Либо стоимость спецалистов либо количество увеличивется.
- нет возможности перемещения серверов либо сервисов между гипервизорами. 
- чтобы минимизировать риски необходимо вести подробную документацию и описание сервисов и инфраструктутр. Хороший способ минимизировать риски описать инфраструктуру как код.

Возможно использовать гетерогенную виртуализацию для получения плюсов от различных систем витруализации. 
часть тяжелых серсивов можно размещать на своих серверех. Нагрузка на которые не колеблится сильно. А сервисы которые на которые может нагрузка расти в x100, x1000 желательно размещать в облаке. Особенно если это пиковые и не регелярные нагрузки.
Например количесто посетителей на сайт в черную пятницу или новый год у крупного интернет магазина. Облако позволяет как увеличивать, так и сокращать серверные мощьности.
Физические сервера так быстро не купить.
```
