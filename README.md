# Introduction to Linux Memory Forensics

## Lab setup

### Using a VM

You can opt for VMs that already have the packages installed, some examples are: 
- REMnux: https://docs.remnux.org/install-distro/get-virtual-appliance
- Tsurugi (use the Tsurugi Linux, not the Acquire): https://tsurugi-linux.org/downloads.php 

### Using Docker

Build the Docker image by running this command in the same folder as the Dockerfile:
```bash
sudo docker build -t forensics .
```

Run the container and give it access to the memory dumps to analyse:
```bash  
local_dumps_folder="$(pwd)/dumps" # Or whatever path yours is

sudo docker run --rm -it \
  --mount type=bind,source="$local_dumps_folder",target=/home/ubuntu/dumps,readonly
```

If you want to add custom Linux symbols files, you can put them in the `./linux` folder of this repository and bind the folder to the `linux` symbols folder in the container: 
```bash
local_dumps_folder="$(pwd)/dumps" # Or whatever path yours is

sudo docker run --rm -it \
  --mount type=bind,source="$local_dumps_folder",target=/home/ubuntu/dumps,readonly \
  --mount type=bind,source="$(pwd)/linux",target=/home/ubuntu/.local/share/pipx/venvs/volatility3/lib/python3.12/site-packages/volatility3/symbols/linux,readonly \
  forensics
```

### Install on your own machine

```bash
sudo apt install pipx strace sqlite3

pipx install volatility3
pipx inject volatility3 capstone pefile yara-python pycryptodome 
pipx ensurepath 

source ~/.bashrc # Or whatever shell rc file you use (this is to reload the terminal to apply the modifications made to the PATH with pipx)
```

## Test your setup

The volatility binary should be found: 

```
ubuntu@eea869a3f8b0:~$ vol -h

✅️
usage: vol [-h] [-c CONFIG] ... <displays the rest of the help>

❌
bash: vol: command not found
```

If you have mounted any symbols file, the plugin `isfinfo.IsfInfo` should list them:

```
ubuntu@c75cf8a59606:~$ vol isfinfo.IsfInfo

✅️ 
URI     Valid   Number of base_types    Number of types Number of symbols       Number of enums Identifying information

file:///home/ubuntu/...      Unknown 18      7460    120911  1236    b'Linux version 4.4.0-142-generic (buildd@lcy01-amd64-006) (gcc version 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.4) ) #168~14.04.1-Ubuntu SMP Sat Jan 19 11:26:28 UTC 2019 (Ubuntu 4.4.0-142.168~14.04.1-generic 4.4.167)\n\x00'

❌ 
URI     Valid   Number of base_types    Number of types Number of symbols       Number of enums Identifying information
```

`strace` should work:
```
ubuntu@c75cf8a59606:~$ strace whoami

✅️ 
execve("/usr/bin/whoami", ["whoami"], 0x7ffcc9407790 /* 10 vars */) = 0
brk(NULL)                               = 0x55b29ad79000
...

❌ 
bash: strace: command not found
```

`sqlite3` should work:
```
ubuntu@c75cf8a59606:~$ sqlite3

✅️ 
SQLite version 3.45.1 2024-01-30 16:01:20
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> 

❌ 
bash: sqlite3: command not found
```