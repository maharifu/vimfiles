Vimfiles
========

My .vim directory redone from scratch, using [vim-plug](https://github.com/junegunn/vim-plug).
Old version is still available [here](https://github.com/maharifu/vimfiles-old).

See vimrc for plugins used.

Usage
-----

1. Clone the repo to $HOME/.vim

  `$ git clone git@github.com:maharifu/vimfiles.git $HOME/.vim --recursive`

2. Create a .vimrc file

  `$ echo "source $HOME/.vim/vimrc" > $HOME/.vimrc`

3. Install the Powerline fonts

  `$ mkdir $HOME/.fonts; ln -s $HOME/.vim/fonts/*.otf $HOME/.fonts/`

4. Install denite python dependencies

  `$ pip3 install --user pynvim`

vim-plug and all plugins will be automatically installed on the first run.

Credits
-------

* Original project and idea from @scrooloose
* My version based on [@punnie](https://github.com/punnie/vimfiles)
