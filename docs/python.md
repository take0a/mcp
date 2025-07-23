# Python
## Windows
### デフォルト

- python と打つと、Microsoft Store へ行ってしまう。

```bash
$ which python
/c/Users/araki/AppData/Local/Microsoft/WindowsApps/python
$ ls -al /c/Users/araki/AppData/Local/Microsoft/WindowsApps/python
lrwxrwxrwx 1 araki 197609 121  7月 20 10:46 /c/Users/araki/AppData/Local/Microsoft/WindowsApps/python -> '/c/Program Files/WindowsApps/Microsoft.DesktopAppInstaller_1.26.400.0_x64__8wekyb3d8bbwe/AppInstallerPythonRedirector.exe'*
```

- Microsoft Store から Python 3.13 をインストールする

```bash
$ which python
/c/Users/araki/AppData/Local/Microsoft/WindowsApps/python
$ ls -al /c/Users/araki/AppData/Local/Microsoft/WindowsApps/python
lrwxrwxrwx 1 araki 197609 111  7月 23 16:45 /c/Users/araki/AppData/Local/Microsoft/WindowsApps/python -> '/c/Program Files/WindowsApps/PythonSoftwareFoundation.Python.3.13_3.13.1520.0_x64__qbz5n2kfra8p0/python3.13.exe'*
$ python
Python 3.13.5 (tags/v3.13.5:6cb20a2, Jun 11 2025, 16:15:46) [MSC v.1943 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

- これを Windows のデフォルトの Python とする。

### uv

- 当然、インストールされていない

```bash
$ which uv
which: no uv in ()
```

- https://github.com/astral-sh/uv?tab=readme-ov-file#installation

```pwsh
PS C:\work> powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
Downloading uv 0.8.2
(x86_64-pc-windows-msvc)
Installing to C:\Users\araki\.local\bin
  uv.exe
  uvx.exe
  uvw.exe
everything's installed!

To add C:\Users\araki\.local\bin to your PATH, either restart your shell or run:

    set Path=C:\Users\araki\.local\bin;%Path%   (cmd)
    $env:Path = "C:\Users\araki\.local\bin;$env:Path"   (powershell)
```

```bash
$ which uv
/c/Users/araki/.local/bin/uv
$ uv --version
uv 0.8.2 (21fadbcc1 2025-07-22)
```

## WSL

- RHEL10 で ~/.local/bin にインストールされ、~/.bashrc の共有により、PATH も共有されているため

```bash
[araki@gmk work]$ which python3
/usr/bin/python3
[araki@gmk work]$ python3 --version
Python 3.12.9
[araki@gmk work]$ which uv
~/.local/bin/uv
[araki@gmk work]$ uv --version
uv 0.8.2
```

## RHEL10

```bash
araki@localhost:~/work$ which python
/usr/bin/python
araki@localhost:~/work$ python --version
Python 3.12.9
araki@localhost:~/work$ which uv
/usr/bin/which: no uv in (/home/araki/.local/bin:/home/araki/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin)
```

- https://github.com/astral-sh/uv?tab=readme-ov-file#installation

```bash
araki@localhost:~/work$ curl -LsSf https://astral.sh/uv/install.sh | sh
downloading uv 0.8.2 x86_64-unknown-linux-gnu
no checksums to verify
installing to /home/araki/.local/bin
  uv
  uvx
everything's installed!
araki@localhost:~/work$ which uv
~/.local/bin/uv
araki@localhost:~/work$ uv --version
uv 0.8.2
```