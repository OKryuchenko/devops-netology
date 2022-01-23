# Домашнее задание к занятию "3.7. Компьютерные сети, лекция 2"

1. Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?
```
#Linux
ifconfig -a
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.174  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fd01::3444:c18d:20a9:54cf  prefixlen 64  scopeid 0x0<global>
        inet6 fd01::506a:81ea:2271:64a8  prefixlen 128  scopeid 0x0<global>
        inet6 fe80::3444:c18d:20a9:54cf  prefixlen 64  scopeid 0xfd<compat,link,site,host>
        ether c8:60:00:9a:0f:dc  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.1  netmask 255.255.255.0  broadcast 192.168.56.255
        inet6 fe80::f58d:c590:119d:bd8a  prefixlen 64  scopeid 0xfd<compat,link,site,host>
        ether 0a:00:27:00:00:0c  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth2: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.23.16.1  netmask 255.255.240.0  broadcast 172.23.31.255
        inet6 fe80::35b0:e91d:3f2:efee  prefixlen 64  scopeid 0xfd<compat,link,site,host>
        ether 00:15:5d:df:12:9f  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.31.240.1  netmask 255.255.240.0  broadcast 172.31.255.255
        inet6 fe80::88a7:137b:a8cf:67e5  prefixlen 64  scopeid 0xfd<compat,link,site,host>
        ether 00:15:5d:cc:e0:d4  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 1500
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0xfe<compat,link,site,host>
        loop  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
---
ip -c -br link
eth0             c8:60:00:9a:0f:dc <BROADCAST,MULTICAST,UP>
eth1             0a:00:27:00:00:0c <BROADCAST,MULTICAST,UP>
eth2             00:15:5d:df:12:9f <BROADCAST,MULTICAST,UP>
eth3             00:15:5d:cc:e0:d4 <BROADCAST,MULTICAST,UP>
lo               00:00:00:00:00:00 <LOOPBACK,UP>
---
#Windows
ipconfig

Windows IP Configuration
Ethernet adapter vEthernet (Default Switch):
   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::35b0:e91d:3f2:efee%14
   IPv4 Address. . . . . . . . . . . : 172.23.16.1
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   Default Gateway . . . . . . . . . :

Ethernet adapter vEthernet (WSL):
   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::88a7:137b:a8cf:67e5%33
   IPv4 Address. . . . . . . . . . . : 172.31.240.1
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   Default Gateway . . . . . . . . . :
Ethernet adapter Ethernet:
   Connection-specific DNS Suffix  . : Dlink
   IPv6 Address. . . . . . . . . . . : fd01::3444:c18d:20a9:54cf
   Temporary IPv6 Address. . . . . . : fd01::506a:81ea:2271:64a8
   Link-local IPv6 Address . . . . . : fe80::3444:c18d:20a9:54cf%4
   IPv4 Address. . . . . . . . . . . : 192.168.0.174
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : fe80::1e5f:2bff:fed9:aaba%4
                                      192.168.0.1
Ethernet adapter VirtualBox Host-Only Network:
   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::f58d:c590:119d:bd8a%12
   IPv4 Address. . . . . . . . . . . : 192.168.56.1
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . :
```
2. Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого?
```
LLDP – протокол для обмена информацией между соседними устройствами,
позволяет определить к какому порту коммутатора подключен сервер.
apt install lldpd
systemctl enable lldpd && systemctl start lldpd
```
3. Какая технология используется для разделения L2 коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига.
```
VLAN
apt install vlan
nano /etc/network/interfaces
auto vlan1400
iface vlan1400 inet static
 address 192.168.1.1
 netmask 255.255.255.0
 vlan_raw_device eth0
auto eth0.1400
iface eth0.1400 inet static
 address 192.168.1.1
 netmask 255.255.255.0
 vlan_raw_device eth0

```
4. Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига.
```
LAG – агрегация портов  

LAG в Linux – бондинг
apt install ifenslave
bonding 
опции модуля bonding
balance-rr       или 0	Политика round-robin. Пакеты отправляются последовательно, начиная с первого доступного интерфейса и заканчивая последним. Эта политика применяется для балансировки нагрузки и отказоустойчивости   
active-backup    или 1 	Политика активный-резервный. Только один сетевой интерфейс из объединённых будет активным. Другой интерфейс может стать активным, только в том случае, когда упадёт текущий активный интерфейс. При такой политике MAC адрес bond интерфейса виден снаружи только через один сетевой порт, во избежание появления проблем с коммутатором. Эта политика применяется для отказоустойчивости.   
balance-xor      или 2 	Политика XOR. Передача распределяется между сетевыми картами используя формулу: [( «MAC адрес источника» XOR «MAC адрес назначения») по модулю «число интерфейсов»]. Получается одна и та же сетевая карта передаёт пакеты одним и тем же получателям. Опционально распределение передачи может быть основано и на политике «xmit_hash».  Политика XOR применяется для балансировки нагрузки и отказоустойчивости.   
broadcast        или 3  Широковещательная политика. Передает всё на все сетевые интерфейсы. Эта политика применяется для отказоустойчивости.   
802.3ad          или 4 	Политика агрегирования каналов по стандарту IEEE 802.3ad. Создаются агрегированные группы сетевых карт с одинаковой скоростью и дуплексом. При таком объединении передача задействует все каналы в активной агрегации, согласно стандарту IEEE 802.3ad. Выбор через какой интерфейс отправлять пакет определяется политикой, по умолчанию XOR политика, можно использовать «xmit_hash» политику.    
balance-tlb      или 5	Политика адаптивной балансировки нагрузки передачи. Исходящий трафик распределяется в зависимости от загруженности каждой сетевой карты (определяется скоростью загрузки). Не требует дополнительной настройки на коммутаторе. Входящий трафик приходит на текущую сетевую карту. Если она выходит из строя, то другая сетевая карта берёт себе MAC адрес вышедшей из строя карты.
balance-alb      или 6	Политика адаптивной балансировки нагрузки. Включает в себя политику balance-tlb плюс осуществляет балансировку входящего трафика.    

#пример конфигурации
nano /etc/network/interfaces
auto bond0
iface bond0 inet static
    address 192.168.1.10
    netmask 255.255.255.0
    network 192.168.1.0
    gateway 192.168.1.254
    slaves eth0 eth1
    # jumbo frame support
    mtu 9000
    # Load balancing and fault tolerance
    bond-mode balance-rr
    bond-miimon 100
    bond-downdelay 200
    bond-updelay 200
    dns-nameservers 192.168.1.254
    dns-search nixcraft.net.in
```
5. Сколько IP адресов в сети с маской /29 ? Сколько /29 подсетей можно получить из сети с маской /24. Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.
```
 sudo apt install ipcalc
 ipcalc 10.10.10.0/29
 Hosts/Net: 6
Сколько /29 подсетей можно получить из сети с маской /24 - 32

Примеры подсетей с маской /29, полученных из сети 10.10.10.0/24:   
10.10.10.0/29   
10.10.10.8/29   
10.10.10.16/29   

```
6. Задача: вас попросили организовать стык между 2-мя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP адреса? Маску выберите из расчета максимум 40-50 хостов внутри подсети.
```
100.64.0.0/26
```
7. Как проверить ARP таблицу в Linux, Windows? Как очистить ARP кеш полностью? Как из ARP таблицы удалить только один нужный IP?
```
 Windows 
    arp -a
    arp -d 192.168.100.25 - Deletes the host specified by inet_addr.
    netsh interface ip delete arpcache - очиска кеша
    
    
 Linux 
    arp
    arp -i eth1 -d 10.0.0.1 - delete a specified entry
    ip link set arp off dev eth0; ip link set arp on dev eth0 - очистка кеша
```
 ---
## Задание для самостоятельной отработки (необязательно к выполнению)

8*. Установите эмулятор EVE-ng.

Инструкция по установке - https://github.com/svmyasnikov/eve-ng

Выполните задания на lldp, vlan, bonding в эмуляторе EVE-ng.
```

``` 
 ---

