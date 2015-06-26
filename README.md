Vimfiles
========

My .vim directory redone from scratch, using Vundle. See vimrc for plugins used.

Usage
-----

1. Clone the repo to $HOME/.vim

`$ git clone git://github.com/maharifu/vimfiles.git ~/.vim --recursive`

2. Create a .vimrc file

`$ echo "source ~/.vim/vimrc" > ~/.vimrc`

And .gvimrc: `$ echo "source ~/.vim/gvimrc" > ~/.gvimrc`

3. Run vim with Vundle to install missing plugins

`$ vim +PluginInstall +qall`

4. Install the Powerline fonts

`$ ln -s .vim/fonts/*.otf $HOME/.fonts/`

5. Compile vimproc

`$ cd bundle/vimproc; make -f make_unix.mak`

Caveat Emptor
-------------

I only tested this on my own PC, running Arch Linux, VIM 7.4, and never on any
major holiday, so use at your own risk!

Credits
-------

* Original project and most of the heavy lifting: @scrooloose
* My version based on [@punnie](https://github.com/punnie/vimfiles)
