Vimfiles
========

My .vim directory redone from scratch, using Vundle.
Old version is still available [here](https://github.com/maharifu/vimfiles-old).

See vimrc for plugins used.

Usage
-----

1. Clone the repo to $HOME/.vim

  `$ git clone git://github.com/maharifu/vimfiles.git $HOME/.vim --recursive`

2. Create a .vimrc file

  `$ echo "source $HOME/.vim/vimrc" > $HOME/.vimrc`

3. Run vim with Vundle to install missing plugins

  `$ vim +PluginInstall +qall`

4. Install the Powerline fonts

  `$ mkdir $HOME/.fonts`
  `$ ln -s $HOME/.vim/fonts/*.otf $HOME/.fonts/`

5. (optional) Compile vimproc

  Everything works fine without vimproc, however, you should install it so
  unite can use 'async' methods. This increases performance when searching for
  files in directories with a large number of files.

  `$ cd $HOME/.vim/bundle/vimproc.vim; make -f make_unix.mak`

Caveat Emptor
-------------

I only tested this on my own PC, running Arch Linux, VIM 7.4, and never on any
major holiday, so use at your own risk!

Credits
-------

* Original project and idea from @scrooloose
* My version based on [@punnie](https://github.com/punnie/vimfiles)
