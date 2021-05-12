# JoNz94's dotfiles

- [Pre-Requirements](#pre-requirements)
    - [Linux or WSL](#linux-or-wsl)
    - [macOS](#macos)
    - [Windows](#windows)
    - [Note for Ubuntu/Linux to install latest git](#note-for-ubuntulinux-to-install-latest-git)
    - [Note for WSL 1 (Windows Subsystem for Linux version 1)](#note-for-wsl-1-windows-subsystem-for-linux-version-1)
- [Usage](#usage)
    - [For Linux and macOS](#for-linux-and-macos)
    - [For WSL 1](#for-wsl-1)
    - [PowerShell setup](#powershell-setup)
    - [CMD (Command Prompt) setup](#cmd-command-prompt-setup)

## Pre-Requirements

### Linux or WSL

* Install `git` and `curl` via package manager

### macOS

* Install `Homebrew` via terminal
    * https://brew.sh/
    * https://docs.brew.sh/Installation

```bash
$ xcode-select --install
# or just install entire Xcode from Apple App Store

$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Then install `git` and `curl` via `Homebrew`

```bash
$ brew install git curl
```

### Windows

* Install `scoop` via powershell
    * https://scoop.sh/

```powershell
PS> Set-ExecutionPolicy RemoteSigned -scope CurrentUser
PS> iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

* Install `openssh`
    * [Install Windows 10's OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)
    * Or install `openssh` via `scoop`
    ```powershell
    PS> scoop install openssh
    ```

* Install `git` and `curl`

```powershell
PS> scoop install git curl
```

### Note for Ubuntu/Linux to install latest git

* Latest `git` can be installed via **git-core ppa**
* https://launchpad.net/~git-core/+archive/ubuntu/ppa

```bash
$ sudo add-apt-repository ppa:git-core/ppa
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install -y git
```

### Note for WSL 1 (Windows Subsystem for Linux version 1)

* Create `/etc/wsl.conf` inside the WSL system

* Copy the content of [wsl.conf](wsl/wsl.conf) into `/etc/wsl.conf`

* Restart WSL via this powershell (with Administrator permissoin) command:

```powershell
# make sure you have Administrator permission
PS> net stop LxssManager
```

* Or use [sudo](https://github.com/lukesampson/psutils/blob/master/sudo.ps1), made by author of `scoop`.

```powershell
# install sudo
PS> scoop install sudo
# or install psutils (including sudo, with other cool utilities)
PS> scoop install psutils

# use sudo to get Administrator permission
PS> sudo net stop LxssManager
```

## Usage

### For Linux and macOS

* Clone this repo to your `~/dotfiles`

```bash
# via https
$ git clone --depth 1 https://gitlab.com/jonz94/dotfiles.git ~/dotfiles

# via ssh
$ git clone --depth 1 git@gitlab.com:jonz94/dotfiles.git ~/dotfiles
```

* run `bootstrap.sh` via `bash`

```
$ cd ~/dotfiles && bash bootstrap.sh
```

* DONE!

### For WSL 1

>NOTE: ALL STEP SHOULD BE DONE INSIDE WSL 1!

* set umask to 0022

```bash
$ umask 0022
```

* clone this repo to `/c/Users/<WindowsUserName>/dotfiles`, this will make sure that all the files are save in **Windows file system**, also make sure that all files are using `LF` as EOL.

```bash
# via https
PS> git clone --depth 1 https://gitlab.com/jonz94/dotfiles.git /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles

# via ssh
PS> git clone --depth 1 git@gitlab.com:jonz94/dotfiles.git /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles
```

* **In WSL 1**, create a symbolic link via following command:

```bash
$ ln -s /c/Users/$(powershell.exe '$env:UserName' | tr -d $'\r')/dotfiles ~/dotfiles
```

>These step are important! And the reason is [Do not change Linux files using Windows apps and tools](https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/)
>
> If you want to use **both Windows Tools and Linux Tools** to changing some files or directories in WSL. The solution I found is:
> * Put those thing in Windows file system. (This makes Windows Tools happy.)
> * In WSL, **create a symbolic link** which points to file/directory in Windows file system. (This makes Linux Tools happy.)

* run `bootstrap.sh` via `bash` to settting up WSL.

```bash
$ cd ~/dotfiles && bash bootstrap.sh
```

* DONE!

### PowerShell setup

* Clone this repo to `$HOME\dotflies`

```powershell
# via https
PS> git clone --depth 1 https://gitlab.com/jonz94/dotfiles.git $HOME\dotfiles
```

* Run or double-click `bootstrap.ps1` script

```powershell
# for powershell version < 7
PS> cd \dotfiles; .\bootstrap.ps1

# for powershell version >= 7
PS> cd ~\dotfiles && .\bootstrap.ps1
```

### CMD (Command Prompt) setup

1. Press `Win` + `r`
2. Type `regedit` and press `Enter`
3. Find `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor`
4. Add a new Key named `AUTORUN` (Type: String)
5. Set `AUTORUN`'s value to `%USERPROFILE%\dotfiles\cmd\jonz94.cmd`
