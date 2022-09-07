Vimfiles
========

My .vim directory redone from scratch, using Vundle.
Old version is still available [here](https://github.com/maharifu/vimfiles-old).

See vimrc for plugins used.

Usage
-----

1. Clone the repo to $HOME/.vim

  `$ git clone git@github.com:maharifu/vimfiles.git $HOME/.vim --recursive`

2. Create a .vimrc file

  `$ echo "source $HOME/.vim/vimrc" > $HOME/.vimrc`

3. Run vim with Vundle to install missing plugins

  `$ vim +PluginInstall +qall`

4. Install the Powerline fonts

  `$ mkdir $HOME/.fonts; ln -s $HOME/.vim/fonts/*.otf $HOME/.fonts/`

5. Install denite python dependencies

  `$ pip3 install --user pynvim`

Credits
-------

* Original project and idea from @scrooloose
* My version based on [@punnie](https://github.com/punnie/vimfiles)
