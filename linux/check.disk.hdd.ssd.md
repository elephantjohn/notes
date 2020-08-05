check disk of ssd or hdd

```bash
cat /sys/block/sda/queue/rotational
cat /sys/block/sdb/queue/rotational

@return:
0: SSD
1: HDD
```