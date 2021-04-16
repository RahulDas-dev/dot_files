
# This Repo Contain some basic Dot files , Like init.vim/.vimrc bash Prompt.sh 

### After Cloning the repo , Kinldy do the following 
* copy the init.vim, coc-settings.json to $HOME/.config/nvim directory 
* Then install the vim plug From [vimplug](https://github.com/junegunn/vim-plug)
* Then open $HOME/.config/init.vim using ``` nvim $HOME/.config/init.vim``` and run the following commands ```:PlugInstall```
* once all the installation is using ```PlugInstall```
* Install  [nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation) , or use directly download from the [nerd fornt release page](https://github.com/ryanoasis/nerd-fonts/releases) , take **DejaVuSansMono.zip**
* change the line no 178 in init.vim ```let g:python3_host_prog = '/usr/bin/python3'``` set proper value for the Python Path
* Install coc plugins using command 
    1. ``` :CocInstall coc-explorer```
    2. ``` :CocInstall coc-json coc-tsserver ```
    3. ``` :CocInstall coc-python coc-pyright ```

