# jonz94's dotfiles

- [Pre-Requirements](#pre-requirements)
    - [Linux or WSL](#linux-or-wsl)
    - [macOS](#macos)
    - [Windows](#windows)
    - [Note for Ubuntu/Linux to install latest git](#note-for-ubuntulinux-to-install-latest-git)
    - [Note for WSL 1](#note-for-wsl-1)
- [Bootstrap](#bootstrap)
    - [Linux, macOS, and WSL 2](#linux-macos-and-wsl-2)
    - [PowerShell on Windows](#powershell-on-windows)
    - [WSL 1](#wsl-1)
    - [CMD (Command Prompt) on Windows](#cmd-command-prompt-on-windows)

## Pre-Requirements

### Linux or WSL

- Install `git` via package manager

### macOS

- Install `Homebrew`
    - https://brew.sh/
    - https://docs.brew.sh/Installation

```bash
xcode-select --install
# or just install entire Xcode from Apple App Store

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Then install `git` via `brew`

```bash
brew install git
```

### Windows

- Install `scoop` via powershell
    - https://scoop.sh/

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

- Install `mingit` or `git` via `scoop`

    - `mingit`: minimal git for Windows

    ```powershell
    scoop install mingit
    ```

    - `git`: standard git

    ```powershell
    scoop install git
    ```

### Note for Ubuntu/Linux to install latest git

- Latest `git` can be installed via **git-core ppa**
    - https://launchpad.net/~git-core/+archive/ubuntu/ppa

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y
sudo apt install -y git
```

### Note for WSL 1

<details>

- Create `/etc/wsl.conf` inside the WSL system

- Copy the content of [wsl.conf](wsl/wsl.conf) into `/etc/wsl.conf`

- Restart WSL via the following powershell command (Administrator permissoin is required):

```powershell
net stop LxssManager
```

- Or use [gsudo](https://github.com/gerardog/gsudo)

    - Install `gsudo`

    ```powershell
    scoop install gsudo
    ```

    - Use `sudo` to get Administrator permission

    ```powershell
    sudo net stop LxssManager
    ```

</details>

## Bootstrap

### Linux, macOS, and WSL 2

- Clone this repo to your `~/dotfiles`

    - via https

    ```bash
    git clone https://github.com/jonz94/dotfiles.git ~/dotfiles
    ```

    - or via ssh

    ```bash
    git clone git@github.com:jonz94/dotfiles.git ~/dotfiles
    ```

- Execute `bootstrap.sh` via `bash`

```
cd ~/dotfiles && bash bootstrap.sh
```

- Done 🎉

### PowerShell on Windows

- Clone this repo to `$HOME\dotflies`

    - via https

    ```powershell
    git clone https://github.com/jonz94/dotfiles.git $HOME\dotfiles
    ```

    - or via ssh

    ```powershell
    git clone git@github.com:jonz94/dotfiles.git $HOME\dotfiles
    ```

- Execute `bootstrap.ps1` script

    - for powershell version < 7

    ```powershell
    cd \dotfiles; .\bootstrap.ps1
    ```

    - for powershell version >= 7

    ```powershell
    cd ~\dotfiles && .\bootstrap.ps1
    ```

- Done 🎉

### WSL 1

<details>

> NOTE: ALL STEP SHOULD BE DONE INSIDE WSL 1!

- Set `umask` to 0022

```bash
umask 0022
```

- Clone this repo to `/c/Users/<WindowsUserName>/dotfiles`, this will make sure that all the files are save in **Windows file system**, also make sure that all files are using `LF` as EOL.

    - via https

    ```bash
    git clone https://github.com/jonz94/dotfiles.git /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles
    ```

    - or via ssh

    ```bash
    git clone git@github.com:jonz94/dotfiles.git /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles
    ```

- **In WSL 1**, create a symbolic link via following command:

```bash
ln -s /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles ~/dotfiles
```

> These step are important! And the reason is [Do not change Linux files using Windows apps and tools](https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/)
>
> If you want to use **both Windows Tools and Linux Tools** to changing some files or directories in WSL. The solution I found is:
> - Put those thing in Windows file system. (This makes Windows Tools happy.)
> - In WSL, **create a symbolic link** which points to file/directory in Windows file system. (This makes Linux Tools happy.)

- Execute `bootstrap.sh` via `bash` to settting up WSL.

```bash
cd ~/dotfiles && bash bootstrap.sh
```

- Done 🎉

</details>

### CMD (Command Prompt) on Windows

1. Press `Win` + `r`
2. Type `regedit` and press `Enter`
3. Find `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor`
4. Add a new Key named `AUTORUN` (Type: String)
5. Set `AUTORUN`'s value to `%USERPROFILE%\dotfiles\cmd\jonz94.cmd`
