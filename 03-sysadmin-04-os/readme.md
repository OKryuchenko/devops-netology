##1. 
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
```--2022-01-13 19:15:08--  https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
Resolving github.com (github.com)... 140.82.121.4
Connecting to github.com (github.com)|140.82.121.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/9524057/7c60f6f9-7b41-446c-be81-a6c24a9d0383?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220113T191416Z&X-Amz-Expires=300&X-Amz-Signature=00c688ff8b7d9a3891ec6f6b8bde837a77776b5bdd6ddc0b55646dd7444a68e0&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=9524057&response-content-disposition=attachment%3B%20filename%3Dnode_exporter-1.3.1.linux-amd64.tar.gz&response-content-type=application%2Foctet-stream [following]
--2022-01-13 19:15:08--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/9524057/7c60f6f9-7
b41-446c-be81-a6c24a9d0383?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220113T191416Z&X-Amz-Expires=300&X-Amz-Signature=00c688ff8b7d9a3891ec6f6b8bde837a77776b5bdd6ddc0b55646dd7444a68e0&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=9524057&response-content-disposition=attachment%3B%20filename%3Dnode_exporter-1.3.1.linux-amd64.tar.gz&response-content-type=application%2Foctet-stream
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 9033415 (8.6M) [application/octet-stream]
Saving to: ‘node_exporter-1.3.1.linux-amd64.tar.gz’

node_exporter-1.3.1.linux-amd 100%[=================================================>]   8.61M  3.61MB/s    in 2.4s

2022-01-13 19:15:11 (3.61 MB/s) - ‘node_exporter-1.3.1.linux-amd64.tar.gz’ saved [9033415/9033415]
```
tar zxvf node_exporter-1.3.1.linux-amd64.tar.gz
```
node_exporter-1.3.1.linux-amd64/
node_exporter-1.3.1.linux-amd64/LICENSE
node_exporter-1.3.1.linux-amd64/NOTICE
node_exporter-1.3.1.linux-amd64/node_exporter
```
dir  
node_exporter-1.3.1.linux-amd64  node_exporter-1.3.1.linux-amd64.tar.gz  
cd node_exporter-1.3.1.linux-amd64/  
sudo useradd -r -M -s /bin/false node_exporter    
sudo cp node_exporter /usr/local/bin  
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter  
sudo nano /etc/systemd/system/node_exporter.service
```
GNU nano 5.4                            /etc/systemd/system/node_exporter.service                                     [Unit]
Description=Prometheus Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$ sudo systemctl daemon-reload   
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$ sudo systemctl enable --now node_exporter   
```
Created symlink /etc/systemd/system/multi-user.target.wants/node_exporter.service → /etc/systemd/system/node_exporter.service.
```
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$  sudo systemctl status node_exporter
```
● node_exporter.service - Prometheus Node Exporter
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2022-01-13 19:20:02 UTC; 6s ago
   Main PID: 5698 (node_exporter)
      Tasks: 5 (limit: 1120)
     Memory: 2.3M
     CGroup: /system.slice/node_exporter.service
             └─5698 /usr/local/bin/node_exporter

Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.819Z caller=node_exporter.go:115 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.822Z caller=node_exporter.go:199 level=info >
Jan 13 19:20:02 ubuntu-hirsute node_exporter[5698]: ts=2022-01-13T19:20:02.824Z caller=tls_config.go:195 level=info msg>
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$  sudo ss -pnltu | grep 9100
tcp   LISTEN 0      4096                  *:9100            *:*    users:(("node_exporter",pid=5698,fd=3))
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$ curl http://localhost:9100/metrics
# HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 0
go_gc_duration_seconds{quantile="0.25"} 0
go_gc_duration_seconds{quantile="0.5"} 0
go_gc_duration_seconds{quantile="0.75"} 0
go_gc_duration_seconds{quantile="1"} 0
go_gc_duration_seconds_sum 0
go_gc_duration_seconds_count 0
# HELP go_goroutines Number of goroutines that currently exist.
# TYPE go_goroutines gauge
go_goroutines 7
# HELP go_info Information about the Go environment.
# TYPE go_info gauge
go_info{version="go1.17.3"} 1
# HELP go_memstats_alloc_bytes Number of bytes allocated and still in use.
# TYPE go_memstats_alloc_bytes gauge
go_memstats_alloc_bytes 1.378696e+06
# HELP go_memstats_alloc_bytes_total Total number of bytes allocated, even if freed.
# TYPE go_memstats_alloc_bytes_total counter
go_memstats_alloc_bytes_total 1.378696e+06
# HELP go_memstats_buck_hash_sys_bytes Number of bytes used by the profiling bucket hash table.
# TYPE go_memstats_buck_hash_sys_bytes gauge
go_memstats_buck_hash_sys_bytes 1.446135e+06
# HELP go_memstats_frees_total Total number of frees.
# TYPE go_memstats_frees_total counter
go_memstats_frees_total 757
# HELP go_memstats_gc_cpu_fraction The fraction of this program's available CPU time used by the GC since the program started.
# TYPE go_memstats_gc_cpu_fraction gauge
go_memstats_gc_cpu_fraction 0
# HELP go_memstats_gc_sys_bytes Number of bytes used for garbage collection system metadata.
# TYPE go_memstats_gc_sys_bytes gauge
go_memstats_gc_sys_bytes 4.184192e+06
# HELP go_memstats_heap_alloc_bytes Number of heap bytes allocated and still in use.
# TYPE go_memstats_heap_alloc_bytes gauge
go_memstats_heap_alloc_bytes 1.378696e+06
# HELP go_memstats_heap_idle_bytes Number of heap bytes waiting to be used.
# TYPE go_memstats_heap_idle_bytes gauge
go_memstats_heap_idle_bytes 1.482752e+06
# HELP go_memstats_heap_inuse_bytes Number of heap bytes that are in use.
# TYPE go_memstats_heap_inuse_bytes gauge
go_memstats_heap_inuse_bytes 2.383872e+06
# HELP go_memstats_heap_objects Number of allocated objects.
# TYPE go_memstats_heap_objects gauge
go_memstats_heap_objects 9456
# HELP go_memstats_heap_released_bytes Number of heap bytes released to OS.
# TYPE go_memstats_heap_released_bytes gauge
go_memstats_heap_released_bytes 1.482752e+06
# HELP go_memstats_heap_sys_bytes Number of heap bytes obtained from system.
# TYPE go_memstats_heap_sys_bytes gauge
go_memstats_heap_sys_bytes 3.866624e+06
# HELP go_memstats_last_gc_time_seconds Number of seconds since 1970 of last garbage collection.
# TYPE go_memstats_last_gc_time_seconds gauge
go_memstats_last_gc_time_seconds 0
# HELP go_memstats_lookups_total Total number of pointer lookups.
# TYPE go_memstats_lookups_total counter
go_memstats_lookups_total 0
# HELP go_memstats_mallocs_total Total number of mallocs.
# TYPE go_memstats_mallocs_total counter
go_memstats_mallocs_total 10213
# HELP go_memstats_mcache_inuse_bytes Number of bytes in use by mcache structures.
# TYPE go_memstats_mcache_inuse_bytes gauge
go_memstats_mcache_inuse_bytes 2400
# HELP go_memstats_mcache_sys_bytes Number of bytes used for mcache structures obtained from system.
# TYPE go_memstats_mcache_sys_bytes gauge
go_memstats_mcache_sys_bytes 16384
# HELP go_memstats_mspan_inuse_bytes Number of bytes in use by mspan structures.
# TYPE go_memstats_mspan_inuse_bytes gauge
go_memstats_mspan_inuse_bytes 36720
# HELP go_memstats_mspan_sys_bytes Number of bytes used for mspan structures obtained from system.
# TYPE go_memstats_mspan_sys_bytes gauge
go_memstats_mspan_sys_bytes 49152
# HELP go_memstats_next_gc_bytes Number of heap bytes when next garbage collection will take place.
# TYPE go_memstats_next_gc_bytes gauge
go_memstats_next_gc_bytes 4.473924e+06
# HELP go_memstats_other_sys_bytes Number of bytes used for other system allocations.
# TYPE go_memstats_other_sys_bytes gauge
go_memstats_other_sys_bytes 809873
# HELP go_memstats_stack_inuse_bytes Number of bytes in use by the stack allocator.
# TYPE go_memstats_stack_inuse_bytes gauge
go_memstats_stack_inuse_bytes 327680
# HELP go_memstats_stack_sys_bytes Number of bytes obtained from system for stack allocator.
# TYPE go_memstats_stack_sys_bytes gauge
go_memstats_stack_sys_bytes 327680
# HELP go_memstats_sys_bytes Number of bytes obtained from system.
# TYPE go_memstats_sys_bytes gauge
go_memstats_sys_bytes 1.070004e+07
# HELP go_threads Number of OS threads created.
# TYPE go_threads gauge
go_threads 5
# HELP node_arp_entries ARP entries by device
# TYPE node_arp_entries gauge
node_arp_entries{device="enp0s3"} 2
# HELP node_boot_time_seconds Node boot time, in unixtime.
# TYPE node_boot_time_seconds gauge
node_boot_time_seconds 1.642096278e+09
# HELP node_context_switches_total Total number of context switches.
# TYPE node_context_switches_total counter
node_context_switches_total 426248
# HELP node_cooling_device_cur_state Current throttle state of the cooling device
# TYPE node_cooling_device_cur_state gauge
node_cooling_device_cur_state{name="0",type="Processor"} 0
node_cooling_device_cur_state{name="1",type="Processor"} 0
# HELP node_cooling_device_max_state Maximum throttle state of the cooling device
# TYPE node_cooling_device_max_state gauge
node_cooling_device_max_state{name="0",type="Processor"} 0
node_cooling_device_max_state{name="1",type="Processor"} 0
# HELP node_cpu_guest_seconds_total Seconds the CPUs spent in guests (VMs) for each mode.
# TYPE node_cpu_guest_seconds_total counter
node_cpu_guest_seconds_total{cpu="0",mode="nice"} 0
node_cpu_guest_seconds_total{cpu="0",mode="user"} 0
node_cpu_guest_seconds_total{cpu="1",mode="nice"} 0
node_cpu_guest_seconds_total{cpu="1",mode="user"} 0
# HELP node_cpu_seconds_total Seconds the CPUs spent in each mode.
# TYPE node_cpu_seconds_total counter
node_cpu_seconds_total{cpu="0",mode="idle"} 5321.22
node_cpu_seconds_total{cpu="0",mode="iowait"} 10.4
node_cpu_seconds_total{cpu="0",mode="irq"} 0
node_cpu_seconds_total{cpu="0",mode="nice"} 0.12
node_cpu_seconds_total{cpu="0",mode="softirq"} 2.8
node_cpu_seconds_total{cpu="0",mode="steal"} 0
node_cpu_seconds_total{cpu="0",mode="system"} 21.2
node_cpu_seconds_total{cpu="0",mode="user"} 12.09
node_cpu_seconds_total{cpu="1",mode="idle"} 5070.51
node_cpu_seconds_total{cpu="1",mode="iowait"} 6.48
node_cpu_seconds_total{cpu="1",mode="irq"} 0
node_cpu_seconds_total{cpu="1",mode="nice"} 0.08
node_cpu_seconds_total{cpu="1",mode="softirq"} 11.55
node_cpu_seconds_total{cpu="1",mode="steal"} 0
node_cpu_seconds_total{cpu="1",mode="system"} 17.72
node_cpu_seconds_total{cpu="1",mode="user"} 4.2
# HELP node_disk_discard_time_seconds_total This is the total number of seconds spent by all discards.
# TYPE node_disk_discard_time_seconds_total counter
node_disk_discard_time_seconds_total{device="sda"} 0
node_disk_discard_time_seconds_total{device="sdb"} 0
# HELP node_disk_discarded_sectors_total The total number of sectors discarded successfully.
# TYPE node_disk_discarded_sectors_total counter
node_disk_discarded_sectors_total{device="sda"} 0
node_disk_discarded_sectors_total{device="sdb"} 0
# HELP node_disk_discards_completed_total The total number of discards completed successfully.
# TYPE node_disk_discards_completed_total counter
node_disk_discards_completed_total{device="sda"} 0
node_disk_discards_completed_total{device="sdb"} 0
# HELP node_disk_discards_merged_total The total number of discards merged.
# TYPE node_disk_discards_merged_total counter
node_disk_discards_merged_total{device="sda"} 0
node_disk_discards_merged_total{device="sdb"} 0
# HELP node_disk_flush_requests_time_seconds_total This is the total number of seconds spent by all flush requests.
# TYPE node_disk_flush_requests_time_seconds_total counter
node_disk_flush_requests_time_seconds_total{device="sda"} 0
node_disk_flush_requests_time_seconds_total{device="sdb"} 0
# HELP node_disk_flush_requests_total The total number of flush requests completed successfully
# TYPE node_disk_flush_requests_total counter
node_disk_flush_requests_total{device="sda"} 0
node_disk_flush_requests_total{device="sdb"} 0
# HELP node_disk_info Info of /sys/block/<block_device>.
# TYPE node_disk_info gauge
node_disk_info{device="sda",major="8",minor="0"} 1
node_disk_info{device="sdb",major="8",minor="16"} 1
# HELP node_disk_io_now The number of I/Os currently in progress.
# TYPE node_disk_io_now gauge
node_disk_io_now{device="sda"} 0
node_disk_io_now{device="sdb"} 0
# HELP node_disk_io_time_seconds_total Total seconds spent doing I/Os.
# TYPE node_disk_io_time_seconds_total counter
node_disk_io_time_seconds_total{device="sda"} 41.068
node_disk_io_time_seconds_total{device="sdb"} 8.724
# HELP node_disk_io_time_weighted_seconds_total The weighted # of seconds spent doing I/Os.
# TYPE node_disk_io_time_weighted_seconds_total counter
node_disk_io_time_weighted_seconds_total{device="sda"} 114.214
node_disk_io_time_weighted_seconds_total{device="sdb"} 2.629
# HELP node_disk_read_bytes_total The total number of bytes read successfully.
# TYPE node_disk_read_bytes_total counter
node_disk_read_bytes_total{device="sda"} 3.45251328e+08
node_disk_read_bytes_total{device="sdb"} 3.250176e+06
# HELP node_disk_read_time_seconds_total The total number of seconds spent by all reads.
# TYPE node_disk_read_time_seconds_total counter
node_disk_read_time_seconds_total{device="sda"} 58.427
node_disk_read_time_seconds_total{device="sdb"} 2.629
# HELP node_disk_reads_completed_total The total number of reads completed successfully.
# TYPE node_disk_reads_completed_total counter
node_disk_reads_completed_total{device="sda"} 11507
node_disk_reads_completed_total{device="sdb"} 3879
# HELP node_disk_reads_merged_total The total number of reads merged.
# TYPE node_disk_reads_merged_total counter
node_disk_reads_merged_total{device="sda"} 1960
node_disk_reads_merged_total{device="sdb"} 0
# HELP node_disk_write_time_seconds_total This is the total number of seconds spent by all writes.
# TYPE node_disk_write_time_seconds_total counter
node_disk_write_time_seconds_total{device="sda"} 55.786
node_disk_write_time_seconds_total{device="sdb"} 0
# HELP node_disk_writes_completed_total The total number of writes completed successfully.
# TYPE node_disk_writes_completed_total counter
node_disk_writes_completed_total{device="sda"} 13686
node_disk_writes_completed_total{device="sdb"} 0
# HELP node_disk_writes_merged_total The number of writes merged.
# TYPE node_disk_writes_merged_total counter
node_disk_writes_merged_total{device="sda"} 8817
node_disk_writes_merged_total{device="sdb"} 0
# HELP node_disk_written_bytes_total The total number of bytes written successfully.
# TYPE node_disk_written_bytes_total counter
node_disk_written_bytes_total{device="sda"} 2.91995648e+08
node_disk_written_bytes_total{device="sdb"} 0
# HELP node_dmi_info A metric with a constant '1' value labeled by bios_date, bios_release, bios_vendor, bios_version, board_asset_tag, board_name, board_serial, board_vendor, board_version, chassis_asset_tag, chassis_serial, chassis_vendor, chassis_version, product_family, product_name, product_serial, product_sku, product_uuid, product_version, system_vendor if provided by DMI.
# TYPE node_dmi_info gauge
node_dmi_info{bios_date="12/01/2006",bios_vendor="innotek GmbH",bios_version="VirtualBox",board_asset_tag="",board_name="VirtualBox",board_vendor="Oracle Corporation",board_version="1.2",chassis_asset_tag="",chassis_vendor="Oracle Corporation",chassis_version="",product_family="Virtual Machine",product_name="VirtualBox",product_sku="",product_version="1.2",system_vendor="innotek GmbH"} 1
# HELP node_entropy_available_bits Bits of available entropy.
# TYPE node_entropy_available_bits gauge
node_entropy_available_bits 3206
# HELP node_entropy_pool_size_bits Bits of entropy pool.
# TYPE node_entropy_pool_size_bits gauge
node_entropy_pool_size_bits 4096
# HELP node_exporter_build_info A metric with a constant '1' value labeled by version, revision, branch, and goversion from which node_exporter was built.
# TYPE node_exporter_build_info gauge
node_exporter_build_info{branch="HEAD",goversion="go1.17.3",revision="a2321e7b940ddcff26873612bccdf7cd4c42b6b6",version="1.3.1"} 1
# HELP node_filefd_allocated File descriptor statistics: allocated.
# TYPE node_filefd_allocated gauge
node_filefd_allocated 1184
# HELP node_filefd_maximum File descriptor statistics: maximum.
# TYPE node_filefd_maximum gauge
node_filefd_maximum 9.223372036854776e+18
# HELP node_filesystem_avail_bytes Filesystem space available to non-root users in bytes.
# TYPE node_filesystem_avail_bytes gauge
node_filesystem_avail_bytes{device="/dev/sda1",fstype="ext4",mountpoint="/"} 3.9494926336e+10
node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 1.00913152e+08
node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 5.24288e+06
node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 1.00913152e+08
node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 1.01883904e+08
node_filesystem_avail_bytes{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 3.066687488e+10
# HELP node_filesystem_device_error Whether an error occurred while getting statistics for the given device.
# TYPE node_filesystem_device_error gauge
node_filesystem_device_error{device="/dev/sda1",fstype="ext4",mountpoint="/"} 0
node_filesystem_device_error{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 0
node_filesystem_device_error{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 0
node_filesystem_device_error{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 0
node_filesystem_device_error{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 0
node_filesystem_device_error{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 0
# HELP node_filesystem_files Filesystem total file nodes.
# TYPE node_filesystem_files gauge
node_filesystem_files{device="/dev/sda1",fstype="ext4",mountpoint="/"} 5.12e+06
node_filesystem_files{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 124375
node_filesystem_files{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 124375
node_filesystem_files{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 124375
node_filesystem_files{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 24875
node_filesystem_files{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 1000
# HELP node_filesystem_files_free Filesystem total free file nodes.
# TYPE node_filesystem_files_free gauge
node_filesystem_files_free{device="/dev/sda1",fstype="ext4",mountpoint="/"} 5.044721e+06
node_filesystem_files_free{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 123754
node_filesystem_files_free{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 124372
node_filesystem_files_free{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 123754
node_filesystem_files_free{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 24852
node_filesystem_files_free{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 1e+06
# HELP node_filesystem_free_bytes Filesystem free space in bytes.
# TYPE node_filesystem_free_bytes gauge
node_filesystem_free_bytes{device="/dev/sda1",fstype="ext4",mountpoint="/"} 3.9511703552e+10
node_filesystem_free_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 1.00913152e+08
node_filesystem_free_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 5.24288e+06
node_filesystem_free_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 1.00913152e+08
node_filesystem_free_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 1.01883904e+08
node_filesystem_free_bytes{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 3.066687488e+10
# HELP node_filesystem_readonly Filesystem read-only status.
# TYPE node_filesystem_readonly gauge
node_filesystem_readonly{device="/dev/sda1",fstype="ext4",mountpoint="/"} 0
node_filesystem_readonly{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 0
node_filesystem_readonly{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 0
node_filesystem_readonly{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 0
node_filesystem_readonly{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 0
node_filesystem_readonly{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 0
# HELP node_filesystem_size_bytes Filesystem size in bytes.
# TYPE node_filesystem_size_bytes gauge
node_filesystem_size_bytes{device="/dev/sda1",fstype="ext4",mountpoint="/"} 4.1567858688e+10
node_filesystem_size_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 1.01888e+08
node_filesystem_size_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 5.24288e+06
node_filesystem_size_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 1.01888e+08
node_filesystem_size_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 1.01888e+08
node_filesystem_size_bytes{device="vagrant",fstype="vboxsf",mountpoint="/vagrant"} 2.38959890432e+11
# HELP node_forks_total Total number of forks.
# TYPE node_forks_total counter
node_forks_total 5760
# HELP node_hwmon_chip_names Annotation metric for human-readable chip names
# TYPE node_hwmon_chip_names gauge
node_hwmon_chip_names{chip="power_supply_ac",chip_name="ac"} 1
# HELP node_intr_total Total number of interrupts serviced.
# TYPE node_intr_total counter
node_intr_total 2.062882e+06
# HELP node_load1 1m load average.
# TYPE node_load1 gauge
node_load1 0.08
# HELP node_load15 15m load average.
# TYPE node_load15 gauge
node_load15 0.01
# HELP node_load5 5m load average.
# TYPE node_load5 gauge
node_load5 0.05
# HELP node_memory_Active_anon_bytes Memory information field Active_anon_bytes.
# TYPE node_memory_Active_anon_bytes gauge
node_memory_Active_anon_bytes 937984
# HELP node_memory_Active_bytes Memory information field Active_bytes.
# TYPE node_memory_Active_bytes gauge
node_memory_Active_bytes 2.87379456e+08
# HELP node_memory_Active_file_bytes Memory information field Active_file_bytes.
# TYPE node_memory_Active_file_bytes gauge
node_memory_Active_file_bytes 2.86441472e+08
# HELP node_memory_AnonHugePages_bytes Memory information field AnonHugePages_bytes.
# TYPE node_memory_AnonHugePages_bytes gauge
node_memory_AnonHugePages_bytes 2.097152e+06
# HELP node_memory_AnonPages_bytes Memory information field AnonPages_bytes.
# TYPE node_memory_AnonPages_bytes gauge
node_memory_AnonPages_bytes 9.107456e+07
# HELP node_memory_Bounce_bytes Memory information field Bounce_bytes.
# TYPE node_memory_Bounce_bytes gauge
node_memory_Bounce_bytes 0
# HELP node_memory_Buffers_bytes Memory information field Buffers_bytes.
# TYPE node_memory_Buffers_bytes gauge
node_memory_Buffers_bytes 3.5078144e+07
# HELP node_memory_Cached_bytes Memory information field Cached_bytes.
# TYPE node_memory_Cached_bytes gauge
node_memory_Cached_bytes 5.33086208e+08
# HELP node_memory_CommitLimit_bytes Memory information field CommitLimit_bytes.
# TYPE node_memory_CommitLimit_bytes gauge
node_memory_CommitLimit_bytes 5.0944e+08
# HELP node_memory_Committed_AS_bytes Memory information field Committed_AS_bytes.
# TYPE node_memory_Committed_AS_bytes gauge
node_memory_Committed_AS_bytes 5.34745088e+08
# HELP node_memory_DirectMap2M_bytes Memory information field DirectMap2M_bytes.
# TYPE node_memory_DirectMap2M_bytes gauge
node_memory_DirectMap2M_bytes 9.83564288e+08
# HELP node_memory_DirectMap4k_bytes Memory information field DirectMap4k_bytes.
# TYPE node_memory_DirectMap4k_bytes gauge
node_memory_DirectMap4k_bytes 9.0112e+07
# HELP node_memory_Dirty_bytes Memory information field Dirty_bytes.
# TYPE node_memory_Dirty_bytes gauge
node_memory_Dirty_bytes 192512
# HELP node_memory_FileHugePages_bytes Memory information field FileHugePages_bytes.
# TYPE node_memory_FileHugePages_bytes gauge
node_memory_FileHugePages_bytes 0
# HELP node_memory_FilePmdMapped_bytes Memory information field FilePmdMapped_bytes.
# TYPE node_memory_FilePmdMapped_bytes gauge
node_memory_FilePmdMapped_bytes 0
# HELP node_memory_HardwareCorrupted_bytes Memory information field HardwareCorrupted_bytes.
# TYPE node_memory_HardwareCorrupted_bytes gauge
node_memory_HardwareCorrupted_bytes 0
# HELP node_memory_HugePages_Free Memory information field HugePages_Free.
# TYPE node_memory_HugePages_Free gauge
node_memory_HugePages_Free 0
# HELP node_memory_HugePages_Rsvd Memory information field HugePages_Rsvd.
# TYPE node_memory_HugePages_Rsvd gauge
node_memory_HugePages_Rsvd 0
# HELP node_memory_HugePages_Surp Memory information field HugePages_Surp.
# TYPE node_memory_HugePages_Surp gauge
node_memory_HugePages_Surp 0
# HELP node_memory_HugePages_Total Memory information field HugePages_Total.
# TYPE node_memory_HugePages_Total gauge
node_memory_HugePages_Total 0
# HELP node_memory_Hugepagesize_bytes Memory information field Hugepagesize_bytes.
# TYPE node_memory_Hugepagesize_bytes gauge
node_memory_Hugepagesize_bytes 2.097152e+06
# HELP node_memory_Hugetlb_bytes Memory information field Hugetlb_bytes.
# TYPE node_memory_Hugetlb_bytes gauge
node_memory_Hugetlb_bytes 0
# HELP node_memory_Inactive_anon_bytes Memory information field Inactive_anon_bytes.
# TYPE node_memory_Inactive_anon_bytes gauge
node_memory_Inactive_anon_bytes 7.2609792e+07
# HELP node_memory_Inactive_bytes Memory information field Inactive_bytes.
# TYPE node_memory_Inactive_bytes gauge
node_memory_Inactive_bytes 3.51617024e+08
# HELP node_memory_Inactive_file_bytes Memory information field Inactive_file_bytes.
# TYPE node_memory_Inactive_file_bytes gauge
node_memory_Inactive_file_bytes 2.79007232e+08
# HELP node_memory_KReclaimable_bytes Memory information field KReclaimable_bytes.
# TYPE node_memory_KReclaimable_bytes gauge
node_memory_KReclaimable_bytes 3.9477248e+07
# HELP node_memory_KernelStack_bytes Memory information field KernelStack_bytes.
# TYPE node_memory_KernelStack_bytes gauge
node_memory_KernelStack_bytes 2.392064e+06
# HELP node_memory_Mapped_bytes Memory information field Mapped_bytes.
# TYPE node_memory_Mapped_bytes gauge
node_memory_Mapped_bytes 8.7977984e+07
# HELP node_memory_MemAvailable_bytes Memory information field MemAvailable_bytes.
# TYPE node_memory_MemAvailable_bytes gauge
node_memory_MemAvailable_bytes 7.11532544e+08
# HELP node_memory_MemFree_bytes Memory information field MemFree_bytes.
# TYPE node_memory_MemFree_bytes gauge
node_memory_MemFree_bytes 2.56958464e+08
# HELP node_memory_MemTotal_bytes Memory information field MemTotal_bytes.
# TYPE node_memory_MemTotal_bytes gauge
node_memory_MemTotal_bytes 1.01888e+09
# HELP node_memory_Mlocked_bytes Memory information field Mlocked_bytes.
# TYPE node_memory_Mlocked_bytes gauge
node_memory_Mlocked_bytes 2.0094976e+07
# HELP node_memory_NFS_Unstable_bytes Memory information field NFS_Unstable_bytes.
# TYPE node_memory_NFS_Unstable_bytes gauge
node_memory_NFS_Unstable_bytes 0
# HELP node_memory_PageTables_bytes Memory information field PageTables_bytes.
# TYPE node_memory_PageTables_bytes gauge
node_memory_PageTables_bytes 2.240512e+06
# HELP node_memory_Percpu_bytes Memory information field Percpu_bytes.
# TYPE node_memory_Percpu_bytes gauge
node_memory_Percpu_bytes 1.695744e+06
# HELP node_memory_SReclaimable_bytes Memory information field SReclaimable_bytes.
# TYPE node_memory_SReclaimable_bytes gauge
node_memory_SReclaimable_bytes 3.9477248e+07
# HELP node_memory_SUnreclaim_bytes Memory information field SUnreclaim_bytes.
# TYPE node_memory_SUnreclaim_bytes gauge
node_memory_SUnreclaim_bytes 3.6634624e+07
# HELP node_memory_ShmemHugePages_bytes Memory information field ShmemHugePages_bytes.
# TYPE node_memory_ShmemHugePages_bytes gauge
node_memory_ShmemHugePages_bytes 0
# HELP node_memory_ShmemPmdMapped_bytes Memory information field ShmemPmdMapped_bytes.
# TYPE node_memory_ShmemPmdMapped_bytes gauge
node_memory_ShmemPmdMapped_bytes 0
# HELP node_memory_Shmem_bytes Memory information field Shmem_bytes.
# TYPE node_memory_Shmem_bytes gauge
node_memory_Shmem_bytes 978944
# HELP node_memory_Slab_bytes Memory information field Slab_bytes.
# TYPE node_memory_Slab_bytes gauge
node_memory_Slab_bytes 7.6111872e+07
# HELP node_memory_SwapCached_bytes Memory information field SwapCached_bytes.
# TYPE node_memory_SwapCached_bytes gauge
node_memory_SwapCached_bytes 0
# HELP node_memory_SwapFree_bytes Memory information field SwapFree_bytes.
# TYPE node_memory_SwapFree_bytes gauge
node_memory_SwapFree_bytes 0
# HELP node_memory_SwapTotal_bytes Memory information field SwapTotal_bytes.
# TYPE node_memory_SwapTotal_bytes gauge
node_memory_SwapTotal_bytes 0
# HELP node_memory_Unevictable_bytes Memory information field Unevictable_bytes.
# TYPE node_memory_Unevictable_bytes gauge
node_memory_Unevictable_bytes 2.0094976e+07
# HELP node_memory_VmallocChunk_bytes Memory information field VmallocChunk_bytes.
# TYPE node_memory_VmallocChunk_bytes gauge
node_memory_VmallocChunk_bytes 0
# HELP node_memory_VmallocTotal_bytes Memory information field VmallocTotal_bytes.
# TYPE node_memory_VmallocTotal_bytes gauge
node_memory_VmallocTotal_bytes 3.5184372087808e+13
# HELP node_memory_VmallocUsed_bytes Memory information field VmallocUsed_bytes.
# TYPE node_memory_VmallocUsed_bytes gauge
node_memory_VmallocUsed_bytes 1.5106048e+07
# HELP node_memory_WritebackTmp_bytes Memory information field WritebackTmp_bytes.
# TYPE node_memory_WritebackTmp_bytes gauge
node_memory_WritebackTmp_bytes 0
# HELP node_memory_Writeback_bytes Memory information field Writeback_bytes.
# TYPE node_memory_Writeback_bytes gauge
node_memory_Writeback_bytes 0
# HELP node_netstat_Icmp6_InErrors Statistic Icmp6InErrors.
# TYPE node_netstat_Icmp6_InErrors untyped
node_netstat_Icmp6_InErrors 0
# HELP node_netstat_Icmp6_InMsgs Statistic Icmp6InMsgs.
# TYPE node_netstat_Icmp6_InMsgs untyped
node_netstat_Icmp6_InMsgs 0
# HELP node_netstat_Icmp6_OutMsgs Statistic Icmp6OutMsgs.
# TYPE node_netstat_Icmp6_OutMsgs untyped
node_netstat_Icmp6_OutMsgs 24
# HELP node_netstat_Icmp_InErrors Statistic IcmpInErrors.
# TYPE node_netstat_Icmp_InErrors untyped
node_netstat_Icmp_InErrors 0
# HELP node_netstat_Icmp_InMsgs Statistic IcmpInMsgs.
# TYPE node_netstat_Icmp_InMsgs untyped
node_netstat_Icmp_InMsgs 40
# HELP node_netstat_Icmp_OutMsgs Statistic IcmpOutMsgs.
# TYPE node_netstat_Icmp_OutMsgs untyped
node_netstat_Icmp_OutMsgs 40
# HELP node_netstat_Ip6_InOctets Statistic Ip6InOctets.
# TYPE node_netstat_Ip6_InOctets untyped
node_netstat_Ip6_InOctets 0
# HELP node_netstat_Ip6_OutOctets Statistic Ip6OutOctets.
# TYPE node_netstat_Ip6_OutOctets untyped
node_netstat_Ip6_OutOctets 1480
# HELP node_netstat_IpExt_InOctets Statistic IpExtInOctets.
# TYPE node_netstat_IpExt_InOctets untyped
node_netstat_IpExt_InOctets 6.3373817e+07
# HELP node_netstat_IpExt_OutOctets Statistic IpExtOutOctets.
# TYPE node_netstat_IpExt_OutOctets untyped
node_netstat_IpExt_OutOctets 353541
# HELP node_netstat_Ip_Forwarding Statistic IpForwarding.
# TYPE node_netstat_Ip_Forwarding untyped
node_netstat_Ip_Forwarding 2
# HELP node_netstat_TcpExt_ListenDrops Statistic TcpExtListenDrops.
# TYPE node_netstat_TcpExt_ListenDrops untyped
node_netstat_TcpExt_ListenDrops 0
# HELP node_netstat_TcpExt_ListenOverflows Statistic TcpExtListenOverflows.
# TYPE node_netstat_TcpExt_ListenOverflows untyped
node_netstat_TcpExt_ListenOverflows 0
# HELP node_netstat_TcpExt_SyncookiesFailed Statistic TcpExtSyncookiesFailed.
# TYPE node_netstat_TcpExt_SyncookiesFailed untyped
node_netstat_TcpExt_SyncookiesFailed 0
# HELP node_netstat_TcpExt_SyncookiesRecv Statistic TcpExtSyncookiesRecv.
# TYPE node_netstat_TcpExt_SyncookiesRecv untyped
node_netstat_TcpExt_SyncookiesRecv 0
# HELP node_netstat_TcpExt_SyncookiesSent Statistic TcpExtSyncookiesSent.
# TYPE node_netstat_TcpExt_SyncookiesSent untyped
node_netstat_TcpExt_SyncookiesSent 0
# HELP node_netstat_TcpExt_TCPSynRetrans Statistic TcpExtTCPSynRetrans.
# TYPE node_netstat_TcpExt_TCPSynRetrans untyped
node_netstat_TcpExt_TCPSynRetrans 0
# HELP node_netstat_TcpExt_TCPTimeouts Statistic TcpExtTCPTimeouts.
# TYPE node_netstat_TcpExt_TCPTimeouts untyped
node_netstat_TcpExt_TCPTimeouts 0
# HELP node_netstat_Tcp_ActiveOpens Statistic TcpActiveOpens.
# TYPE node_netstat_Tcp_ActiveOpens untyped
node_netstat_Tcp_ActiveOpens 14
# HELP node_netstat_Tcp_CurrEstab Statistic TcpCurrEstab.
# TYPE node_netstat_Tcp_CurrEstab untyped
node_netstat_Tcp_CurrEstab 4
# HELP node_netstat_Tcp_InErrs Statistic TcpInErrs.
# TYPE node_netstat_Tcp_InErrs untyped
node_netstat_Tcp_InErrs 0
# HELP node_netstat_Tcp_InSegs Statistic TcpInSegs.
# TYPE node_netstat_Tcp_InSegs untyped
node_netstat_Tcp_InSegs 13265
# HELP node_netstat_Tcp_OutRsts Statistic TcpOutRsts.
# TYPE node_netstat_Tcp_OutRsts untyped
node_netstat_Tcp_OutRsts 3
# HELP node_netstat_Tcp_OutSegs Statistic TcpOutSegs.
# TYPE node_netstat_Tcp_OutSegs untyped
node_netstat_Tcp_OutSegs 5675
# HELP node_netstat_Tcp_PassiveOpens Statistic TcpPassiveOpens.
# TYPE node_netstat_Tcp_PassiveOpens untyped
node_netstat_Tcp_PassiveOpens 7
# HELP node_netstat_Tcp_RetransSegs Statistic TcpRetransSegs.
# TYPE node_netstat_Tcp_RetransSegs untyped
node_netstat_Tcp_RetransSegs 0
# HELP node_netstat_Udp6_InDatagrams Statistic Udp6InDatagrams.
# TYPE node_netstat_Udp6_InDatagrams untyped
node_netstat_Udp6_InDatagrams 0
# HELP node_netstat_Udp6_InErrors Statistic Udp6InErrors.
# TYPE node_netstat_Udp6_InErrors untyped
node_netstat_Udp6_InErrors 0
# HELP node_netstat_Udp6_NoPorts Statistic Udp6NoPorts.
# TYPE node_netstat_Udp6_NoPorts untyped
node_netstat_Udp6_NoPorts 0
# HELP node_netstat_Udp6_OutDatagrams Statistic Udp6OutDatagrams.
# TYPE node_netstat_Udp6_OutDatagrams untyped
node_netstat_Udp6_OutDatagrams 0
# HELP node_netstat_Udp6_RcvbufErrors Statistic Udp6RcvbufErrors.
# TYPE node_netstat_Udp6_RcvbufErrors untyped
node_netstat_Udp6_RcvbufErrors 0
# HELP node_netstat_Udp6_SndbufErrors Statistic Udp6SndbufErrors.
# TYPE node_netstat_Udp6_SndbufErrors untyped
node_netstat_Udp6_SndbufErrors 0
# HELP node_netstat_UdpLite6_InErrors Statistic UdpLite6InErrors.
# TYPE node_netstat_UdpLite6_InErrors untyped
node_netstat_UdpLite6_InErrors 0
# HELP node_netstat_UdpLite_InErrors Statistic UdpLiteInErrors.
# TYPE node_netstat_UdpLite_InErrors untyped
node_netstat_UdpLite_InErrors 0
# HELP node_netstat_Udp_InDatagrams Statistic UdpInDatagrams.
# TYPE node_netstat_Udp_InDatagrams untyped
node_netstat_Udp_InDatagrams 96
# HELP node_netstat_Udp_InErrors Statistic UdpInErrors.
# TYPE node_netstat_Udp_InErrors untyped
node_netstat_Udp_InErrors 0
# HELP node_netstat_Udp_NoPorts Statistic UdpNoPorts.
# TYPE node_netstat_Udp_NoPorts untyped
node_netstat_Udp_NoPorts 40
# HELP node_netstat_Udp_OutDatagrams Statistic UdpOutDatagrams.
# TYPE node_netstat_Udp_OutDatagrams untyped
node_netstat_Udp_OutDatagrams 138
# HELP node_netstat_Udp_RcvbufErrors Statistic UdpRcvbufErrors.
# TYPE node_netstat_Udp_RcvbufErrors untyped
node_netstat_Udp_RcvbufErrors 0
# HELP node_netstat_Udp_SndbufErrors Statistic UdpSndbufErrors.
# TYPE node_netstat_Udp_SndbufErrors untyped
node_netstat_Udp_SndbufErrors 0
# HELP node_network_address_assign_type address_assign_type value of /sys/class/net/<iface>.
# TYPE node_network_address_assign_type gauge
node_network_address_assign_type{device="enp0s3"} 0
node_network_address_assign_type{device="lo"} 0
# HELP node_network_carrier carrier value of /sys/class/net/<iface>.
# TYPE node_network_carrier gauge
node_network_carrier{device="enp0s3"} 1
node_network_carrier{device="lo"} 1
# HELP node_network_carrier_changes_total carrier_changes_total value of /sys/class/net/<iface>.
# TYPE node_network_carrier_changes_total counter
node_network_carrier_changes_total{device="enp0s3"} 4
node_network_carrier_changes_total{device="lo"} 0
# HELP node_network_carrier_down_changes_total carrier_down_changes_total value of /sys/class/net/<iface>.
# TYPE node_network_carrier_down_changes_total counter
node_network_carrier_down_changes_total{device="enp0s3"} 2
node_network_carrier_down_changes_total{device="lo"} 0
# HELP node_network_carrier_up_changes_total carrier_up_changes_total value of /sys/class/net/<iface>.
# TYPE node_network_carrier_up_changes_total counter
node_network_carrier_up_changes_total{device="enp0s3"} 2
node_network_carrier_up_changes_total{device="lo"} 0
# HELP node_network_device_id device_id value of /sys/class/net/<iface>.
# TYPE node_network_device_id gauge
node_network_device_id{device="enp0s3"} 0
node_network_device_id{device="lo"} 0
# HELP node_network_dormant dormant value of /sys/class/net/<iface>.
# TYPE node_network_dormant gauge
node_network_dormant{device="enp0s3"} 0
node_network_dormant{device="lo"} 0
# HELP node_network_flags flags value of /sys/class/net/<iface>.
# TYPE node_network_flags gauge
node_network_flags{device="enp0s3"} 4099
node_network_flags{device="lo"} 9
# HELP node_network_iface_id iface_id value of /sys/class/net/<iface>.
# TYPE node_network_iface_id gauge
node_network_iface_id{device="enp0s3"} 2
node_network_iface_id{device="lo"} 1
# HELP node_network_iface_link iface_link value of /sys/class/net/<iface>.
# TYPE node_network_iface_link gauge
node_network_iface_link{device="enp0s3"} 2
node_network_iface_link{device="lo"} 1
# HELP node_network_iface_link_mode iface_link_mode value of /sys/class/net/<iface>.
# TYPE node_network_iface_link_mode gauge
node_network_iface_link_mode{device="enp0s3"} 0
node_network_iface_link_mode{device="lo"} 0
# HELP node_network_info Non-numeric data from /sys/class/net/<iface>, value is always 1.
# TYPE node_network_info gauge
node_network_info{address="00:00:00:00:00:00",broadcast="00:00:00:00:00:00",device="lo",duplex="",ifalias="",operstate="unknown"} 1
node_network_info{address="02:82:b2:df:b0:58",broadcast="ff:ff:ff:ff:ff:ff",device="enp0s3",duplex="full",ifalias="",operstate="up"} 1
# HELP node_network_mtu_bytes mtu_bytes value of /sys/class/net/<iface>.
# TYPE node_network_mtu_bytes gauge
node_network_mtu_bytes{device="enp0s3"} 1500
node_network_mtu_bytes{device="lo"} 65536
# HELP node_network_name_assign_type name_assign_type value of /sys/class/net/<iface>.
# TYPE node_network_name_assign_type gauge
node_network_name_assign_type{device="enp0s3"} 4
# HELP node_network_net_dev_group net_dev_group value of /sys/class/net/<iface>.
# TYPE node_network_net_dev_group gauge
node_network_net_dev_group{device="enp0s3"} 0
node_network_net_dev_group{device="lo"} 0
# HELP node_network_protocol_type protocol_type value of /sys/class/net/<iface>.
# TYPE node_network_protocol_type gauge
node_network_protocol_type{device="enp0s3"} 1
node_network_protocol_type{device="lo"} 772
# HELP node_network_receive_bytes_total Network device statistic receive_bytes.
# TYPE node_network_receive_bytes_total counter
node_network_receive_bytes_total{device="enp0s3"} 6.5258196e+07
node_network_receive_bytes_total{device="lo"} 12053
# HELP node_network_receive_compressed_total Network device statistic receive_compressed.
# TYPE node_network_receive_compressed_total counter
node_network_receive_compressed_total{device="enp0s3"} 0
node_network_receive_compressed_total{device="lo"} 0
# HELP node_network_receive_drop_total Network device statistic receive_drop.
# TYPE node_network_receive_drop_total counter
node_network_receive_drop_total{device="enp0s3"} 0
node_network_receive_drop_total{device="lo"} 0
# HELP node_network_receive_errs_total Network device statistic receive_errs.
# TYPE node_network_receive_errs_total counter
node_network_receive_errs_total{device="enp0s3"} 0
node_network_receive_errs_total{device="lo"} 0
# HELP node_network_receive_fifo_total Network device statistic receive_fifo.
# TYPE node_network_receive_fifo_total counter
node_network_receive_fifo_total{device="enp0s3"} 0
node_network_receive_fifo_total{device="lo"} 0
# HELP node_network_receive_frame_total Network device statistic receive_frame.
# TYPE node_network_receive_frame_total counter
node_network_receive_frame_total{device="enp0s3"} 0
node_network_receive_frame_total{device="lo"} 0
# HELP node_network_receive_multicast_total Network device statistic receive_multicast.
# TYPE node_network_receive_multicast_total counter
node_network_receive_multicast_total{device="enp0s3"} 0
node_network_receive_multicast_total{device="lo"} 0
# HELP node_network_receive_packets_total Network device statistic receive_packets.
# TYPE node_network_receive_packets_total counter
node_network_receive_packets_total{device="enp0s3"} 44968
node_network_receive_packets_total{device="lo"} 145
# HELP node_network_speed_bytes speed_bytes value of /sys/class/net/<iface>.
# TYPE node_network_speed_bytes gauge
node_network_speed_bytes{device="enp0s3"} 1.25e+08
# HELP node_network_transmit_bytes_total Network device statistic transmit_bytes.
# TYPE node_network_transmit_bytes_total counter
node_network_transmit_bytes_total{device="enp0s3"} 454329
node_network_transmit_bytes_total{device="lo"} 12053
# HELP node_network_transmit_carrier_total Network device statistic transmit_carrier.
# TYPE node_network_transmit_carrier_total counter
node_network_transmit_carrier_total{device="enp0s3"} 0
node_network_transmit_carrier_total{device="lo"} 0
# HELP node_network_transmit_colls_total Network device statistic transmit_colls.
# TYPE node_network_transmit_colls_total counter
node_network_transmit_colls_total{device="enp0s3"} 0
node_network_transmit_colls_total{device="lo"} 0
# HELP node_network_transmit_compressed_total Network device statistic transmit_compressed.
# TYPE node_network_transmit_compressed_total counter
node_network_transmit_compressed_total{device="enp0s3"} 0
node_network_transmit_compressed_total{device="lo"} 0
# HELP node_network_transmit_drop_total Network device statistic transmit_drop.
# TYPE node_network_transmit_drop_total counter
node_network_transmit_drop_total{device="enp0s3"} 0
node_network_transmit_drop_total{device="lo"} 0
# HELP node_network_transmit_errs_total Network device statistic transmit_errs.
# TYPE node_network_transmit_errs_total counter
node_network_transmit_errs_total{device="enp0s3"} 0
node_network_transmit_errs_total{device="lo"} 0
# HELP node_network_transmit_fifo_total Network device statistic transmit_fifo.
# TYPE node_network_transmit_fifo_total counter
node_network_transmit_fifo_total{device="enp0s3"} 0
node_network_transmit_fifo_total{device="lo"} 0
# HELP node_network_transmit_packets_total Network device statistic transmit_packets.
# TYPE node_network_transmit_packets_total counter
node_network_transmit_packets_total{device="enp0s3"} 5748
node_network_transmit_packets_total{device="lo"} 145
# HELP node_network_transmit_queue_length transmit_queue_length value of /sys/class/net/<iface>.
# TYPE node_network_transmit_queue_length gauge
node_network_transmit_queue_length{device="enp0s3"} 1000
node_network_transmit_queue_length{device="lo"} 1000
# HELP node_network_up Value is 1 if operstate is 'up', 0 otherwise.
# TYPE node_network_up gauge
node_network_up{device="enp0s3"} 1
node_network_up{device="lo"} 0
# HELP node_os_info A metric with a constant '1' value labeled by build_id, id, id_like, image_id, image_version, name, pretty_name, variant, variant_id, version, version_codename, version_id.
# TYPE node_os_info gauge
node_os_info{build_id="",id="ubuntu",id_like="debian",image_id="",image_version="",name="Ubuntu",pretty_name="Ubuntu 21.04",variant="",variant_id="",version="21.04 (Hirsute Hippo)",version_codename="hirsute",version_id="21.04"} 1
# HELP node_os_version Metric containing the major.minor part of the OS version.
# TYPE node_os_version gauge
node_os_version{id="ubuntu",id_like="debian",name="Ubuntu"} 21.04
# HELP node_power_supply_info info of /sys/class/power_supply/<power_supply>.
# TYPE node_power_supply_info gauge
node_power_supply_info{power_supply="AC",type="Mains"} 1
# HELP node_power_supply_online online value of /sys/class/power_supply/<power_supply>.
# TYPE node_power_supply_online gauge
node_power_supply_online{power_supply="AC"} 1
# HELP node_pressure_cpu_waiting_seconds_total Total time in seconds that processes have waited for CPU time
# TYPE node_pressure_cpu_waiting_seconds_total counter
node_pressure_cpu_waiting_seconds_total 20.263882000000002
# HELP node_pressure_io_stalled_seconds_total Total time in seconds no process could make progress due to IO congestion
# TYPE node_pressure_io_stalled_seconds_total counter
node_pressure_io_stalled_seconds_total 11.706211
# HELP node_pressure_io_waiting_seconds_total Total time in seconds that processes have waited due to IO congestion
# TYPE node_pressure_io_waiting_seconds_total counter
node_pressure_io_waiting_seconds_total 17.006989
# HELP node_pressure_memory_stalled_seconds_total Total time in seconds no process could make progress due to memory congestion
# TYPE node_pressure_memory_stalled_seconds_total counter
node_pressure_memory_stalled_seconds_total 0
# HELP node_pressure_memory_waiting_seconds_total Total time in seconds that processes have waited for memory
# TYPE node_pressure_memory_waiting_seconds_total counter
node_pressure_memory_waiting_seconds_total 0
# HELP node_procs_blocked Number of processes blocked waiting for I/O to complete.
# TYPE node_procs_blocked gauge
node_procs_blocked 0
# HELP node_procs_running Number of processes in runnable state.
# TYPE node_procs_running gauge
node_procs_running 2
# HELP node_schedstat_running_seconds_total Number of seconds CPU spent running a process.
# TYPE node_schedstat_running_seconds_total counter
node_schedstat_running_seconds_total{cpu="0"} 51.214556399
node_schedstat_running_seconds_total{cpu="1"} 38.927333373
# HELP node_schedstat_timeslices_total Number of timeslices executed by CPU.
# TYPE node_schedstat_timeslices_total counter
node_schedstat_timeslices_total{cpu="0"} 161718
node_schedstat_timeslices_total{cpu="1"} 126929
# HELP node_schedstat_waiting_seconds_total Number of seconds spent by processing waiting for this CPU.
# TYPE node_schedstat_waiting_seconds_total counter
node_schedstat_waiting_seconds_total{cpu="0"} 27.192708554
node_schedstat_waiting_seconds_total{cpu="1"} 25.745411641
# HELP node_scrape_collector_duration_seconds node_exporter: Duration of a collector scrape.
# TYPE node_scrape_collector_duration_seconds gauge
node_scrape_collector_duration_seconds{collector="arp"} 0.000377444
node_scrape_collector_duration_seconds{collector="bcache"} 1.8012e-05
node_scrape_collector_duration_seconds{collector="bonding"} 1.6083e-05
node_scrape_collector_duration_seconds{collector="btrfs"} 4.0213e-05
node_scrape_collector_duration_seconds{collector="conntrack"} 0.000374718
node_scrape_collector_duration_seconds{collector="cpu"} 0.000849184
node_scrape_collector_duration_seconds{collector="cpufreq"} 6.1396e-05
node_scrape_collector_duration_seconds{collector="diskstats"} 0.005274604
node_scrape_collector_duration_seconds{collector="dmi"} 1.4367e-05
node_scrape_collector_duration_seconds{collector="edac"} 4.1637e-05
node_scrape_collector_duration_seconds{collector="entropy"} 0.000308722
node_scrape_collector_duration_seconds{collector="fibrechannel"} 2.5506e-05
node_scrape_collector_duration_seconds{collector="filefd"} 0.000106569
node_scrape_collector_duration_seconds{collector="filesystem"} 0.006381141
node_scrape_collector_duration_seconds{collector="hwmon"} 0.000935627
node_scrape_collector_duration_seconds{collector="infiniband"} 2.6559e-05
node_scrape_collector_duration_seconds{collector="ipvs"} 1.8141e-05
node_scrape_collector_duration_seconds{collector="loadavg"} 4.8358e-05
node_scrape_collector_duration_seconds{collector="mdadm"} 5.4655e-05
node_scrape_collector_duration_seconds{collector="meminfo"} 0.000947027
node_scrape_collector_duration_seconds{collector="netclass"} 0.007289328
node_scrape_collector_duration_seconds{collector="netdev"} 0.000226636
node_scrape_collector_duration_seconds{collector="netstat"} 0.008047058
node_scrape_collector_duration_seconds{collector="nfs"} 2.6611e-05
node_scrape_collector_duration_seconds{collector="nfsd"} 0.000186292
node_scrape_collector_duration_seconds{collector="nvme"} 0.000327317
node_scrape_collector_duration_seconds{collector="os"} 0.000313576
node_scrape_collector_duration_seconds{collector="powersupplyclass"} 0.001635619
node_scrape_collector_duration_seconds{collector="pressure"} 0.000357814
node_scrape_collector_duration_seconds{collector="rapl"} 2.8258e-05
node_scrape_collector_duration_seconds{collector="schedstat"} 6.9335e-05
node_scrape_collector_duration_seconds{collector="sockstat"} 0.000341214
node_scrape_collector_duration_seconds{collector="softnet"} 6.1793e-05
node_scrape_collector_duration_seconds{collector="stat"} 0.000148921
node_scrape_collector_duration_seconds{collector="tapestats"} 2.5891e-05
node_scrape_collector_duration_seconds{collector="textfile"} 1.5795e-05
node_scrape_collector_duration_seconds{collector="thermal_zone"} 0.00039385
node_scrape_collector_duration_seconds{collector="time"} 0.00015127
node_scrape_collector_duration_seconds{collector="timex"} 1.2524e-05
node_scrape_collector_duration_seconds{collector="udp_queues"} 0.000147269
node_scrape_collector_duration_seconds{collector="uname"} 1.1354e-05
node_scrape_collector_duration_seconds{collector="vmstat"} 0.000155974
node_scrape_collector_duration_seconds{collector="xfs"} 2.2047e-05
node_scrape_collector_duration_seconds{collector="zfs"} 0.000298446
# HELP node_scrape_collector_success node_exporter: Whether a collector succeeded.
# TYPE node_scrape_collector_success gauge
node_scrape_collector_success{collector="arp"} 1
node_scrape_collector_success{collector="bcache"} 1
node_scrape_collector_success{collector="bonding"} 0
node_scrape_collector_success{collector="btrfs"} 1
node_scrape_collector_success{collector="conntrack"} 0
node_scrape_collector_success{collector="cpu"} 1
node_scrape_collector_success{collector="cpufreq"} 1
node_scrape_collector_success{collector="diskstats"} 1
node_scrape_collector_success{collector="dmi"} 1
node_scrape_collector_success{collector="edac"} 1
node_scrape_collector_success{collector="entropy"} 1
node_scrape_collector_success{collector="fibrechannel"} 0
node_scrape_collector_success{collector="filefd"} 1
node_scrape_collector_success{collector="filesystem"} 1
node_scrape_collector_success{collector="hwmon"} 1
node_scrape_collector_success{collector="infiniband"} 0
node_scrape_collector_success{collector="ipvs"} 0
node_scrape_collector_success{collector="loadavg"} 1
node_scrape_collector_success{collector="mdadm"} 1
node_scrape_collector_success{collector="meminfo"} 1
node_scrape_collector_success{collector="netclass"} 1
node_scrape_collector_success{collector="netdev"} 1
node_scrape_collector_success{collector="netstat"} 1
node_scrape_collector_success{collector="nfs"} 0
node_scrape_collector_success{collector="nfsd"} 0
node_scrape_collector_success{collector="nvme"} 0
node_scrape_collector_success{collector="os"} 1
node_scrape_collector_success{collector="powersupplyclass"} 1
node_scrape_collector_success{collector="pressure"} 1
node_scrape_collector_success{collector="rapl"} 1
node_scrape_collector_success{collector="schedstat"} 1
node_scrape_collector_success{collector="sockstat"} 1
node_scrape_collector_success{collector="softnet"} 1
node_scrape_collector_success{collector="stat"} 1
node_scrape_collector_success{collector="tapestats"} 0
node_scrape_collector_success{collector="textfile"} 1
node_scrape_collector_success{collector="thermal_zone"} 1
node_scrape_collector_success{collector="time"} 1
node_scrape_collector_success{collector="timex"} 1
node_scrape_collector_success{collector="udp_queues"} 1
node_scrape_collector_success{collector="uname"} 1
node_scrape_collector_success{collector="vmstat"} 1
node_scrape_collector_success{collector="xfs"} 1
node_scrape_collector_success{collector="zfs"} 0
# HELP node_sockstat_FRAG6_inuse Number of FRAG6 sockets in state inuse.
# TYPE node_sockstat_FRAG6_inuse gauge
node_sockstat_FRAG6_inuse 0
# HELP node_sockstat_FRAG6_memory Number of FRAG6 sockets in state memory.
# TYPE node_sockstat_FRAG6_memory gauge
node_sockstat_FRAG6_memory 0
# HELP node_sockstat_FRAG_inuse Number of FRAG sockets in state inuse.
# TYPE node_sockstat_FRAG_inuse gauge
node_sockstat_FRAG_inuse 0
# HELP node_sockstat_FRAG_memory Number of FRAG sockets in state memory.
# TYPE node_sockstat_FRAG_memory gauge
node_sockstat_FRAG_memory 0
# HELP node_sockstat_RAW6_inuse Number of RAW6 sockets in state inuse.
# TYPE node_sockstat_RAW6_inuse gauge
node_sockstat_RAW6_inuse 1
# HELP node_sockstat_RAW_inuse Number of RAW sockets in state inuse.
# TYPE node_sockstat_RAW_inuse gauge
node_sockstat_RAW_inuse 0
# HELP node_sockstat_TCP6_inuse Number of TCP6 sockets in state inuse.
# TYPE node_sockstat_TCP6_inuse gauge
node_sockstat_TCP6_inuse 3
# HELP node_sockstat_TCP_alloc Number of TCP sockets in state alloc.
# TYPE node_sockstat_TCP_alloc gauge
node_sockstat_TCP_alloc 8
# HELP node_sockstat_TCP_inuse Number of TCP sockets in state inuse.
# TYPE node_sockstat_TCP_inuse gauge
node_sockstat_TCP_inuse 5
# HELP node_sockstat_TCP_mem Number of TCP sockets in state mem.
# TYPE node_sockstat_TCP_mem gauge
node_sockstat_TCP_mem 3
# HELP node_sockstat_TCP_mem_bytes Number of TCP sockets in state mem_bytes.
# TYPE node_sockstat_TCP_mem_bytes gauge
node_sockstat_TCP_mem_bytes 12288
# HELP node_sockstat_TCP_orphan Number of TCP sockets in state orphan.
# TYPE node_sockstat_TCP_orphan gauge
node_sockstat_TCP_orphan 0
# HELP node_sockstat_TCP_tw Number of TCP sockets in state tw.
# TYPE node_sockstat_TCP_tw gauge
node_sockstat_TCP_tw 0
# HELP node_sockstat_UDP6_inuse Number of UDP6 sockets in state inuse.
# TYPE node_sockstat_UDP6_inuse gauge
node_sockstat_UDP6_inuse 0
# HELP node_sockstat_UDPLITE6_inuse Number of UDPLITE6 sockets in state inuse.
# TYPE node_sockstat_UDPLITE6_inuse gauge
node_sockstat_UDPLITE6_inuse 0
# HELP node_sockstat_UDPLITE_inuse Number of UDPLITE sockets in state inuse.
# TYPE node_sockstat_UDPLITE_inuse gauge
node_sockstat_UDPLITE_inuse 0
# HELP node_sockstat_UDP_inuse Number of UDP sockets in state inuse.
# TYPE node_sockstat_UDP_inuse gauge
node_sockstat_UDP_inuse 2
# HELP node_sockstat_UDP_mem Number of UDP sockets in state mem.
# TYPE node_sockstat_UDP_mem gauge
node_sockstat_UDP_mem 1
# HELP node_sockstat_UDP_mem_bytes Number of UDP sockets in state mem_bytes.
# TYPE node_sockstat_UDP_mem_bytes gauge
node_sockstat_UDP_mem_bytes 4096
# HELP node_sockstat_sockets_used Number of IPv4 sockets in use.
# TYPE node_sockstat_sockets_used gauge
node_sockstat_sockets_used 163
# HELP node_softnet_dropped_total Number of dropped packets
# TYPE node_softnet_dropped_total counter
node_softnet_dropped_total{cpu="0"} 0
node_softnet_dropped_total{cpu="1"} 0
# HELP node_softnet_processed_total Number of processed packets
# TYPE node_softnet_processed_total counter
node_softnet_processed_total{cpu="0"} 281
node_softnet_processed_total{cpu="1"} 13183
# HELP node_softnet_times_squeezed_total Number of times processing packets ran out of quota
# TYPE node_softnet_times_squeezed_total counter
node_softnet_times_squeezed_total{cpu="0"} 0
node_softnet_times_squeezed_total{cpu="1"} 0
# HELP node_textfile_scrape_error 1 if there was an error opening or reading a file, 0 otherwise
# TYPE node_textfile_scrape_error gauge
node_textfile_scrape_error 0
# HELP node_time_clocksource_available_info Available clocksources read from '/sys/devices/system/clocksource'.
# TYPE node_time_clocksource_available_info gauge
node_time_clocksource_available_info{clocksource="acpi_pm",device="0"} 1
node_time_clocksource_available_info{clocksource="kvm-clock",device="0"} 1
# HELP node_time_clocksource_current_info Current clocksource read from '/sys/devices/system/clocksource'.
# TYPE node_time_clocksource_current_info gauge
node_time_clocksource_current_info{clocksource="kvm-clock",device="0"} 1
# HELP node_time_seconds System time in seconds since epoch (1970).
# TYPE node_time_seconds gauge
node_time_seconds 1.6421016734466708e+09
# HELP node_time_zone_offset_seconds System time zone offset in seconds.
# TYPE node_time_zone_offset_seconds gauge
node_time_zone_offset_seconds{time_zone="UTC"} 0
# HELP node_timex_estimated_error_seconds Estimated error in seconds.
# TYPE node_timex_estimated_error_seconds gauge
node_timex_estimated_error_seconds 0
# HELP node_timex_frequency_adjustment_ratio Local clock frequency adjustment.
# TYPE node_timex_frequency_adjustment_ratio gauge
node_timex_frequency_adjustment_ratio 1.0000117667541504
# HELP node_timex_loop_time_constant Phase-locked loop time constant.
# TYPE node_timex_loop_time_constant gauge
node_timex_loop_time_constant 7
# HELP node_timex_maxerror_seconds Maximum error in seconds.
# TYPE node_timex_maxerror_seconds gauge
node_timex_maxerror_seconds 0.5755
# HELP node_timex_offset_seconds Time offset in between local system and reference clock.
# TYPE node_timex_offset_seconds gauge
node_timex_offset_seconds 0.000475728
# HELP node_timex_pps_calibration_total Pulse per second count of calibration intervals.
# TYPE node_timex_pps_calibration_total counter
node_timex_pps_calibration_total 0
# HELP node_timex_pps_error_total Pulse per second count of calibration errors.
# TYPE node_timex_pps_error_total counter
node_timex_pps_error_total 0
# HELP node_timex_pps_frequency_hertz Pulse per second frequency.
# TYPE node_timex_pps_frequency_hertz gauge
node_timex_pps_frequency_hertz 0
# HELP node_timex_pps_jitter_seconds Pulse per second jitter.
# TYPE node_timex_pps_jitter_seconds gauge
node_timex_pps_jitter_seconds 0
# HELP node_timex_pps_jitter_total Pulse per second count of jitter limit exceeded events.
# TYPE node_timex_pps_jitter_total counter
node_timex_pps_jitter_total 0
# HELP node_timex_pps_shift_seconds Pulse per second interval duration.
# TYPE node_timex_pps_shift_seconds gauge
node_timex_pps_shift_seconds 0
# HELP node_timex_pps_stability_exceeded_total Pulse per second count of stability limit exceeded events.
# TYPE node_timex_pps_stability_exceeded_total counter
node_timex_pps_stability_exceeded_total 0
# HELP node_timex_pps_stability_hertz Pulse per second stability, average of recent frequency changes.
# TYPE node_timex_pps_stability_hertz gauge
node_timex_pps_stability_hertz 0
# HELP node_timex_status Value of the status array bits.
# TYPE node_timex_status gauge
node_timex_status 24577
# HELP node_timex_sync_status Is clock synchronized to a reliable server (1 = yes, 0 = no).
# TYPE node_timex_sync_status gauge
node_timex_sync_status 1
# HELP node_timex_tai_offset_seconds International Atomic Time (TAI) offset.
# TYPE node_timex_tai_offset_seconds gauge
node_timex_tai_offset_seconds 0
# HELP node_timex_tick_seconds Seconds between clock ticks.
# TYPE node_timex_tick_seconds gauge
node_timex_tick_seconds 0.01
# HELP node_udp_queues Number of allocated memory in the kernel for UDP datagrams in bytes.
# TYPE node_udp_queues gauge
node_udp_queues{ip="v4",queue="rx"} 0
node_udp_queues{ip="v4",queue="tx"} 0
node_udp_queues{ip="v6",queue="rx"} 0
node_udp_queues{ip="v6",queue="tx"} 0
# HELP node_uname_info Labeled system information as provided by the uname system call.
# TYPE node_uname_info gauge
node_uname_info{domainname="(none)",machine="x86_64",nodename="ubuntu-hirsute",release="5.11.0-41-generic",sysname="Linux",version="#45-Ubuntu SMP Fri Nov 5 11:37:01 UTC 2021"} 1
# HELP node_vmstat_oom_kill /proc/vmstat information field oom_kill.
# TYPE node_vmstat_oom_kill untyped
node_vmstat_oom_kill 0
# HELP node_vmstat_pgfault /proc/vmstat information field pgfault.
# TYPE node_vmstat_pgfault untyped
node_vmstat_pgfault 761697
# HELP node_vmstat_pgmajfault /proc/vmstat information field pgmajfault.
# TYPE node_vmstat_pgmajfault untyped
node_vmstat_pgmajfault 1419
# HELP node_vmstat_pgpgin /proc/vmstat information field pgpgin.
# TYPE node_vmstat_pgpgin untyped
node_vmstat_pgpgin 372056
# HELP node_vmstat_pgpgout /proc/vmstat information field pgpgout.
# TYPE node_vmstat_pgpgout untyped
node_vmstat_pgpgout 285152
# HELP node_vmstat_pswpin /proc/vmstat information field pswpin.
# TYPE node_vmstat_pswpin untyped
node_vmstat_pswpin 0
# HELP node_vmstat_pswpout /proc/vmstat information field pswpout.
# TYPE node_vmstat_pswpout untyped
node_vmstat_pswpout 0
# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
# TYPE process_cpu_seconds_total counter
process_cpu_seconds_total 0.02
# HELP process_max_fds Maximum number of open file descriptors.
# TYPE process_max_fds gauge
process_max_fds 1024
# HELP process_open_fds Number of open file descriptors.
# TYPE process_open_fds gauge
process_open_fds 9
# HELP process_resident_memory_bytes Resident memory size in bytes.
# TYPE process_resident_memory_bytes gauge
process_resident_memory_bytes 1.191936e+07
# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.
# TYPE process_start_time_seconds gauge
process_start_time_seconds 1.64210160269e+09
# HELP process_virtual_memory_bytes Virtual memory size in bytes.
# TYPE process_virtual_memory_bytes gauge
process_virtual_memory_bytes 7.33417472e+08
# HELP process_virtual_memory_max_bytes Maximum amount of virtual memory available in bytes.
# TYPE process_virtual_memory_max_bytes gauge
process_virtual_memory_max_bytes 1.8446744073709552e+19
# HELP promhttp_metric_handler_errors_total Total number of internal errors encountered by the promhttp metric handler.
# TYPE promhttp_metric_handler_errors_total counter
promhttp_metric_handler_errors_total{cause="encoding"} 0
promhttp_metric_handler_errors_total{cause="gathering"} 0
# HELP promhttp_metric_handler_requests_in_flight Current number of scrapes being served.
# TYPE promhttp_metric_handler_requests_in_flight gauge
promhttp_metric_handler_requests_in_flight 1
# HELP promhttp_metric_handler_requests_total Total number of scrapes by HTTP status code.
# TYPE promhttp_metric_handler_requests_total counter
promhttp_metric_handler_requests_total{code="200"} 0
promhttp_metric_handler_requests_total{code="500"} 0
promhttp_metric_handler_requests_total{code="503"} 0
vagrant@ubuntu-hirsute:~/node_exporter-1.3.1.linux-amd64$
```
sudo reboot  
sudo systemctl status node_exporter
```
● node_exporter.service - Prometheus Node Exporter
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2022-01-13 19:30:44 UTC; 3min 20s ago
   Main PID: 603 (node_exporter)
      Tasks: 5 (limit: 1120)
     Memory: 14.4M
     CGroup: /system.slice/node_exporter.service
             └─603 /usr/local/bin/node_exporter

Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:115 level=info c>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.304Z caller=node_exporter.go:199 level=info m>
Jan 13 19:30:48 ubuntu-hirsute node_exporter[603]: ts=2022-01-13T19:30:48.305Z caller=tls_config.go:195 level=info msg=>
lines 1-19/19 (END)
```
##Метрики
##2.
curl http://localhost:9100/metrics     
curl http://localhost:9100/metrics | grep "TYPE node_memory"
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0# TYPE node_memory_Active_anon_bytes gauge
# TYPE node_memory_Active_bytes gauge
# TYPE node_memory_Active_file_bytes gauge
# TYPE node_memory_AnonHugePages_bytes gauge
# TYPE node_memory_AnonPages_bytes gauge
# TYPE node_memory_Bounce_bytes gauge
# TYPE node_memory_Buffers_bytes gauge
# TYPE node_memory_Cached_bytes gauge
# TYPE node_memory_CommitLimit_bytes gauge
# TYPE node_memory_Committed_AS_bytes gauge
# TYPE node_memory_DirectMap2M_bytes gauge
# TYPE node_memory_DirectMap4k_bytes gauge
# TYPE node_memory_Dirty_bytes gauge
# TYPE node_memory_FileHugePages_bytes gauge
# TYPE node_memory_FilePmdMapped_bytes gauge
# TYPE node_memory_HardwareCorrupted_bytes gauge
# TYPE node_memory_HugePages_Free gauge
# TYPE node_memory_HugePages_Rsvd gauge
# TYPE node_memory_HugePages_Surp gauge
# TYPE node_memory_HugePages_Total gauge
# TYPE node_memory_Hugepagesize_bytes gauge
# TYPE node_memory_Hugetlb_bytes gauge
# TYPE node_memory_Inactive_anon_bytes gauge
# TYPE node_memory_Inactive_bytes gauge
# TYPE node_memory_Inactive_file_bytes gauge
# TYPE node_memory_KReclaimable_bytes gauge
# TYPE node_memory_KernelStack_bytes gauge
# TYPE node_memory_Mapped_bytes gauge
# TYPE node_memory_MemAvailable_bytes gauge
# TYPE node_memory_MemFree_bytes gauge
# TYPE node_memory_MemTotal_bytes gauge
# TYPE node_memory_Mlocked_bytes gauge
# TYPE node_memory_NFS_Unstable_bytes gauge
# TYPE node_memory_PageTables_bytes gauge
# TYPE node_memory_Percpu_bytes gauge
# TYPE node_memory_SReclaimable_bytes gauge
# TYPE node_memory_SUnreclaim_bytes gauge
# TYPE node_memory_ShmemHugePages_bytes gauge
# TYPE node_memory_ShmemPmdMapped_bytes gauge
# TYPE node_memory_Shmem_bytes gauge
# TYPE node_memory_Slab_bytes gauge
# TYPE node_memory_SwapCached_bytes gauge
# TYPE node_memory_SwapFree_bytes gauge
# TYPE node_memory_SwapTotal_bytes gauge
# TYPE node_memory_Unevictable_bytes gauge
# TYPE node_memory_VmallocChunk_bytes gauge
# TYPE node_memory_VmallocTotal_bytes gauge
# TYPE node_memory_VmallocUsed_bytes gauge
# TYPE node_memory_WritebackTmp_bytes gauge
# TYPE node_memory_Writeback_bytes gauge
```
curl http://localhost:9100/metrics | grep "TYPE node_network"
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0# TYPE node_network_address_assign_type gauge
# TYPE node_network_carrier gauge
# TYPE node_network_carrier_changes_total counter
# TYPE node_network_carrier_down_changes_total counter
# TYPE node_network_carrier_up_changes_total counter
# TYPE node_network_device_id gauge
# TYPE node_network_dormant gauge
# TYPE node_network_flags gauge
# TYPE node_network_iface_id gauge
# TYPE node_network_iface_link gauge
# TYPE node_network_iface_link_mode gauge
# TYPE node_network_info gauge
# TYPE node_network_mtu_bytes gauge
# TYPE node_network_name_assign_type gauge
# TYPE node_network_net_dev_group gauge
# TYPE node_network_protocol_type gauge
# TYPE node_network_receive_bytes_total counter
# TYPE node_network_receive_compressed_total counter
# TYPE node_network_receive_drop_total counter
# TYPE node_network_receive_errs_total counter
# TYPE node_network_receive_fifo_total counter
# TYPE node_network_receive_frame_total counter
# TYPE node_network_receive_multicast_total counter
# TYPE node_network_receive_packets_total counter
# TYPE node_network_speed_bytes gauge
# TYPE node_network_transmit_bytes_total counter
# TYPE node_network_transmit_carrier_total counter
# TYPE node_network_transmit_colls_total counter
# TYPE node_network_transmit_compressed_total counter
# TYPE node_network_transmit_drop_total counter
# TYPE node_network_transmit_errs_total counter
# TYPE node_network_transmit_fifo_total counter
# TYPE node_network_transmit_packets_total counter
# TYPE node_network_transmit_queue_length gauge
# TYPE node_network_up gauge
```
curl http://localhost:9100/metrics | grep "TYPE node_cpu"
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 57479    0 57479    0     0  3301k      0 --:--:-- --:--:-- --:--:-- 35# TYPE node_cpu_guest_seconds_total counter
08k# TYPE node_cpu_seconds_total counter
```

curl http://localhost:9100/metrics | grep "TYPE node_disk"
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0# TYPE node_disk_discard_time_seconds_total counter
# TYPE node_disk_discarded_sectors_total counter
# TYPE node_disk_discards_completed_total counter
# TYPE node_disk_discards_merged_total counter
# TYPE node_disk_flush_requests_time_seconds_total counter
# TYPE node_disk_flush_requests_total counter
# TYPE node_disk_info gauge
# TYPE node_disk_io_now gauge
# TYPE node_disk_io_time_seconds_total counter
# TYPE node_disk_io_time_weighted_seconds_total counter
# TYPE node_disk_read_bytes_total counter
# TYPE node_disk_read_time_seconds_total counter
# TYPE node_disk_reads_completed_total counter
# TYPE node_disk_reads_merged_total counter
# TYPE node_disk_write_time_seconds_total counter
# TYPE node_disk_writes_completed_total counter
# TYPE node_disk_writes_merged_total counter
# TYPE node_disk_written_bytes_total counter
100 57495    0 57495    0     0  1811k      0 --:--:-- --:--:-- --:--:-- 1811k
```

##3.   
sudo apt install -y netdata   
```Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  fonts-font-awesome fonts-glyphicons-halflings javascript-common libc-ares2 libjs-bootstrap libjs-highlight.js
  libjudydebian1 libnetfilter-acct1 libnode72 libprotobuf23 libsnappy1v5 netdata-core netdata-plugins-bash
  netdata-plugins-nodejs netdata-plugins-python netdata-web nodejs nodejs-doc
Suggested packages:
Unpacking nodejs-doc (12.21.0~dfsg-3ubuntu1) ...
Selecting previously unselected package nodejs.
Preparing to unpack .../18-nodejs_12.21.0~dfsg-3ubuntu1_amd64.deb ...
Unpacking nodejs (12.21.0~dfsg-3ubuntu1) ...
Setting up javascript-common (11+nmu1) ...
Setting up fonts-glyphicons-halflings (1.009~3.4.1+dfsg-2) ...
Setting up libprotobuf23:amd64 (3.12.4-1ubuntu2) ...
Setting up libc-ares2:amd64 (1.17.1-1ubuntu0.1) ...
Setting up libnode72:amd64 (12.21.0~dfsg-3ubuntu1) ...

Setting up libjudydebian1 (1.0.5-5) ...
Setting up libsnappy1v5:amd64 (1.1.8-1build1) ...
Setting up libnetfilter-acct1:amd64 (1.0.3-3) ...
Setting up libjs-highlight.js (9.18.5+dfsg1-1) ...
Setting up fonts-font-awesome (5.0.10+really4.7.0~dfsg-4) ...
Setting up libjs-bootstrap (3.4.1+dfsg-2) ...
Setting up netdata-core (1.29.3-2) ...
Created symlink /etc/systemd/system/multi-user.target.wants/netdata.service → /lib/systemd/system/netdata.service.
Setting up netdata-plugins-bash (1.29.3-2) ...
Setting up netdata-plugins-python (1.29.3-2) ...
Setting up netdata-plugins-nodejs (1.29.3-2) ...
Setting up nodejs (12.21.0~dfsg-3ubuntu1) ...
update-alternatives: using /usr/bin/nodejs to provide /usr/bin/js (js) in auto mode
Setting up netdata-web (1.29.3-2) ...
Setting up nodejs-doc (12.21.0~dfsg-3ubuntu1) ...
Setting up netdata (1.29.3-2) ...
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for libc-bin (2.33-0ubuntu5) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.
```
sudo nano /etc/netdata/netdata.conf

```
# NetData Configuration

# The current full configuration can be retrieved from the running
# server at the URL
#
#   http://localhost:19999/netdata.conf
#
# for example:
#
#   wget -O /etc/netdata/netdata.conf http://localhost:19999/netdata.conf
#

[global]
        run as user = netdata
        web files owner = root
        web files group = root
        # Netdata is not designed to be exposed to potentially hostile
        # networks. See https://github.com/netdata/netdata/issues/164
        #bind socket to IP = 127.0.0.1
         bind socket to IP = 0.0.0.0
```
PS C:\git\devops-netology\03-sysadmin-01-terminal\vagrant2> vagrant reload   
PS C:\git\devops-netology\03-sysadmin-01-terminal\vagrant2> vagrant ssh   
![img.png](img.png)
##4.   
Думаю можно по параметру DMI и Hypervisor detected: KVM 
![img_5.png](img_5.png)
##5.   
этот параметр ядра показывает максимально возможное число открытых файлов в системе (максимальное количество дескрипторов открытых файлов - 1048576). 
Но другой лимит не позволит достичь такого большого числа: команда ulimit -n отображает ограничение максимум в 1024 открытых файловых дескриптора
![img_6.png](img_6.png)
##6.   
![img_7.png](img_7.png)

второй терминал открыл через консоль virtualbox
увидел спящий процесс с параллельного сеанса

![img_8.png](img_8.png)

##7. 
:(){ :|:& };:

```
Команда :(){ :|:& };:
В действительности эта команда является логической бомбой. Она оперирует определением функции с именем ‘:‘, которая вызывает сама себя дважды: 
один раз на переднем плане и один раз в фоне. Она продолжает своё выполнение снова и снова, пока система не зависнет.
```
![img_1.png](img_1.png)

![img_2.png](img_2.png)







