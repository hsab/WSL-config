# Fresh WSL Install
Series of step for setting up a fresh installation of Windows Subsystem for Linux as a development environment for Python, Python 3, Node, Ruby, C, C++, Objective-C, Objective-C++, etc.


Update & Upgrade:
-------------
Update and upgrade the current installation before proceeding further:

    sudo apt-get update
    sudo apt-get upgrade

Installing Build Essentials & Cmake:
------------------------
The build-essentials is a reference for all the packages needed to compile a debian package. It generally includes the gcc/g++ compilers an libraries and some other utils. 

CMake is an extensible, open-source system that manages the build process in an operating system and in a compiler-independent manner. 

    sudo apt-get install build-essential cmake

Installing Python & Python 3:
--------------
Python is a widely used high-level programming language for general-purpose programming.

    sudo apt-get install python-dev python3-dev


Installing Node, NPM & Typescript:
--------------
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.

    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
    sudo apt-get install -y nodejs

TypeScript is a free and open-source programming language developed and maintained by Microsoft. It is a strict superset of JavaScript, and adds optional static typing and class-based object-oriented programming to the language.
    
    npm install -g typescript

Remove Vim:
--------------
Remove vim if you have it already:

    sudo apt-get remove vim vim-runtime gvim

Just to be safe remove these packages as well:

    sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox

Installing Vim & Ruby Dependencies:
--------------
Compiling Vim from source is actually not that difficult. Install all the prerequisite libraries including Git if you don't have it already. 

    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

Installing RVM and Ruby:
--------------
You can check if you have Ruby installed by doing `ruby -v` and `rvm -v`.
If you get a message saying *The program 'ruby' can be found in the following packages*, you need to install Ruby and rvm.

    curl -L https://get.rvm.io | bash -s stable --ruby
    rvm reinstall VERSION -C --enable-shared
    
Set .bashrc for rvm scripting:

    source "$HOME/.rvm/scripts/rvm"


Installing Clang:
--------------
Clang is an open-source compiler that can compile C/C++/Objective-C/Objective-C++. The `libclang` library it provides is used to power the YCM semantic completion engine for those languages.

    sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-VERSION  main"
    sudo apt-get update
    sudo apt-get install clang-VERSION  lldb-VERSION 

Installing Checkinstall:
--------------
If you want to be able to easily uninstall vim use `checkinstall`.

    sudo apt-get install checkinstall

Compiling Vim:
--------------
Once everything is installed, getting the source is easy. 
Note: If you are using Python, your config directory might have a machine-specific name (e.g. config-3.5m-x86_64-linux-gnu). Check in `/usr/lib/python[2/3/3.5]` to find yours, and change the `python-config-dir` and/or `python3-config-dir` arguments accordingly.

    cd ~
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-gui=gtk2 --enable-cscope --prefix=/usr

Make Vim

    make VIMRUNTIMEDIR=/usr/share/vim/vim80
And install:

    cd ~/vim
	sudo checkinstall
	
Setup Vundle:
--------------
Clone the [repository](https://github.com/VundleVim/Vundle.vim) into the appropriate `.vim` bundle folder.

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Vanilla .vimrc:
---------------
Put this at the top of your `.vimrc` to use [Vundle](https://github.com/VundleVim/Vundle.vim). Remove plugins you don't need, they are for illustration purposes.

    set nocompatible              " be iMproved, required
    filetype off                  " required
    
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    
    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    " Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    " Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Install L9 and avoid a Naming conflict if you've already installed a
    " different version somewhere else.
    " Plugin 'ascenator/L9', {'name': 'newL9'}
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

Installing YouCompleteMe:
-------------------------

`install.py` is the quickest way to install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe).

 - C# support: install Mono and add `--omnisharp-completer` when calling `./install.py`.
 - Go support: install Go and add `--gocode-completer` when
   calling `./install.py`.
 - TypeScript support: install Node.js and npm then install the TypeScript SDK with `npm install -g typescript`.
 - JavaScript support: install Node.js and npm and add `--tern-completer` when calling `./install.py`
 - Rust support: install Rust and add `--racer-completer` when calling `./install.py`.

Finally configure YCM:

    cd ~/.vim/bundle/YouCompleteMe 
    ./install.py --clang-completer --tern-completer

Installing Command-T:
---------------------
Add the following line to your `.vimrc` file:

    Plugin 'wincent/command-t'

Navigate to your Command-t bundle directory

    cd ~/.vim/bundle/command-t

Now that you are in your Command-T bundle directory. Do the following:

    rake make

That should recompile Command-T. 

Setting Vim as Default Editor:
------------------------------

Set vim as your default editor with `update-alternatives`.

    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim

Resources:
----------
Below is a list of original resources used to compile the steps above.
[Compile Vim from Source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
[Install Vim with Ruby Support and Command-t Plugin on Ubuntu](http://www.justinbar.net/post/install-vim-with-ruby-support-and-command-t-plugin-on-ubuntu)
[Installing Node.js via package manager](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
[YouCompleteMe Installation](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64)
[Vundle Installation](https://github.com/VundleVim/Vundle.vim#quick-start)
[Command-T Docs](https://github.com/wincent/command-t/blob/master/doc/command-t.txt)


