MFSTest

MFS IO Performance Test

## 大文件100MB（block＝1M byte）

* 写命令：

```bash
time dd if=/dev/zero of=100m.img bs=1M count=100
```

* 读命令：

```bash
time dd if=100m.img of=/dev/null bs=1M
```

## 大文件50MB（block＝1M byte）

* 写命令：

```bash
time dd if=/dev/zero of=50m.img bs=1M count=50
```

* 读命令：

```bash
time dd if=50m.img of=/dev/null bs=1M
```

## 大文件10MB（block＝1M byte）

* 写命令：

```bash
time dd if=/dev/zero of=10m.img bs=1M count=10
```

* 读命令：

```bash
time dd if=10m.img of=/dev/null bs=1M
```

## 小文件

* 写入：

```bash
time path_to_write_n_thread.sh ${thread_count} ${folder_count} ${file_count_per_folder} ${block_size} ${block_count}
```

* 列表：

```bash
time find ./ | nl
```

* 删除：

```bash
time rm -rf *
```
