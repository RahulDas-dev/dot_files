
![neovim](https://www.vectorlogo.zone/logos/neovimio/neovimio-ar21.svg)
# This Repo Contain neovim config files 

### First things first
* Install NVM + Node , Kindly follow the installation [instruction](https://gist.github.com/d2s/372b5943bce17b964a79#file-installing-node-with-nvm-md)
 

### After Cloning the repo, Kinldy do the following changes
* copy the init.vim, coc-settings.json to $HOME/.config/nvim directory 
* Then install the [vimplug](https://github.com/junegunn/vim-plug)
* Then open $HOME/.config/init.vim using ``` nvim $HOME/.config/nvim/init.vim``` and run ```:PlugInstall``` , this will install the plugins
* once all the plugin installation is done, Install  [nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation) , or directly download the font from [nerd fornt release page](https://github.com/ryanoasis/nerd-fonts/releases) , take **DejaVuSansMono.zip** ,unzip it and click to install buttons.

* Install coc plugins using command 
    * ``` :CocInstall coc-explorer```
    * ``` :CocInstall coc-json coc-tsserver ```
    * ``` :CocInstall coc-python coc-pyright ```



* change the line no 178 in init.vim ```let g:python3_host_prog = '/usr/bin/python3'``` set proper value for the Python Path .
* install python neovim Support ``` python3 -m pip install --user --upgrade pynvim neovim```

* install node support using ```npm install -g neovim```

* close the nvim and current terminal

* open a new terminal open nvim run :checkhealth

