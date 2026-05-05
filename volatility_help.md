## System

| Plugin Name                   | Description                                |
| ----------------------------- | ------------------------------------------ |
| `linux.bash.Bash`             | Recovers bash command history from memory. |
| `linux.boottime.Boottime`     | Shows system boot time.                    |
| `linux.envars.Envars`         | Lists process environment variables.       |
| `linux.kmsg.Kmsg`             | Reads kernel log buffer.                   |
| `linux.kallsyms.Kallsyms`     | Enumerates kernel symbols.                 |
| `linux.vmcoreinfo.VMCoreInfo` | Enumerates VMCoreInfo tables.              |

---

## Kernel

| Plugin Name                                  | Description                                                 |
| -------------------------------------------- | ----------------------------------------------------------- |
| `linux.capabilities.Capabilities`            | Lists process capabilities.                                 |
| `linux.ebpf.EBPF`                            | Enumerates eBPF programs.                                   |
| `linux.elfs.Elfs`                            | Lists memory-mapped ELF files.                              |
| `linux.graphics.fbdev.Fbdev`                 | Extracts framebuffer memory.                                |
| `linux.iomem.IOMem`                          | Reconstructs `/proc/iomem` from memory.                     |
| `linux.kthreads.Kthreads`                    | Enumerates kernel threads.                                  |
| `linux.lsmod.Lsmod`                          | Lists loaded kernel modules.                                |
| `linux.module_extract.ModuleExtract`         | Reconstructs kernel modules from memory.                    |
| `linux.modxview.Modxview`                    | Correlates module sources to detect hidden/tainted modules. |
| `linux.mountinfo.MountInfo`                  | Lists mount points per namespace.                           |
| `linux.tracing.ftrace.CheckFtrace`           | Detects ftrace hooking.                                     |
| `linux.tracing.perf_events.PerfEvents`       | Lists process performance events.                           |
| `linux.tracing.tracepoints.CheckTracepoints` | Detects tracepoint hooking.                                 |

---

## Processes

| Plugin Name                       | Description                              |
| --------------------------------- | ---------------------------------------- |
| `linux.pslist.PsList`             | Lists processes in memory.               |
| `linux.psscan.PsScan`             | Scans memory for process structures.     |
| `linux.pstree.PsTree`             | Shows process hierarchy.                 |
| `linux.psaux.PsAux`               | Shows processes with command lines.      |
| `linux.pscallstack.PsCallStack`   | Extracts process call stacks.            |
| `linux.proc.Maps`                 | Lists process memory maps.               |
| `linux.pidhashtable.PIDHashTable` | Enumerates processes via PID hash table. |
| `linux.ptrace.Ptrace`             | Shows ptrace relationships.              |
| `linux.lsof.Lsof`                 | Lists open files per process.            |
| `linux.library_list.LibraryList`  | Lists loaded libraries.                  |

---

## Network

| Plugin Name               | Description                             |
| ------------------------- | --------------------------------------- |
| `linux.ip.Addr`           | Lists network interfaces and addresses. |
| `linux.ip.Link`           | Lists network interface links.          |
| `linux.sockscan.Sockscan` | Scans memory for sockets.               |
| `linux.sockstat.Sockstat` | Lists network connections.              |

---

## Filesystem & Memory

| Plugin Name                       | Description                       |
| --------------------------------- | --------------------------------- |
| `linux.pagecache.Files`           | Lists file objects from memory.   |
| `linux.pagecache.InodePages`      | Extracts cached inode pages.      |
| `linux.pagecache.RecoverFs`       | Recovers filesystem into archive. |
| `linux.vmaregexscan.VmaRegExScan` | Regex scanning of process memory. |
| `linux.vmayarascan.VmaYaraScan`   | YARA scanning of process memory.  |

---

# Malware Detection Plugins

| Plugin Name                                                                                         | Description                                                   |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `linux.check_afinfo.Check_afinfo / linux.malware.check_afinfo.Check_afinfo`                         | Detects network protocol function pointer hooks.              |
| `linux.check_creds.Check_creds / linux.malware.check_creds.Check_creds`                             | Detects credential structure sharing or manipulation.         |
| `linux.check_idt.Check_idt / linux.malware.check_idt.Check_idt`                                     | Detects IDT modification.                                     |
| `linux.check_modules.Check_modules / linux.malware.check_modules.Check_modules`                     | Compares module lists to detect hidden modules.               |
| `linux.check_syscall.Check_syscall / linux.malware.check_syscall.Check_syscall`                     | Detects syscall table hooking.                                |
| `linux.hidden_modules.Hidden_modules / linux.malware.hidden_modules.Hidden_modules`                 | Finds hidden kernel modules via memory carving.               |
| `linux.keyboard_notifiers.Keyboard_notifiers / linux.malware.keyboard_notifiers.Keyboard_notifiers` | Detects keyboard notifier chain tampering.                    |
| `linux.malfind.Malfind / linux.malware.malfind.Malfind`                                             | Detects injected or suspicious memory regions.                |
| `linux.modxview.Modxview / linux.malware.modxview.Modxview`                                         | Correlates module enumeration techniques to detect tampering. |
| `linux.netfilter.Netfilter / linux.malware.netfilter.Netfilter`                                     | Enumerates Netfilter hooks to detect manipulation.            |
| `linux.tty_check.tty_check / linux.malware.tty_check.Tty_Check`                                     | Detects TTY subsystem hooks.                                  |
