# VIMFRESH
### allows an easy -hopefully- customization for *shell* **and** *vim* users.

![bash](http://i65.tinypic.com/2mebnk.png)

![vim](http://i66.tinypic.com/ve3b7.png)

## New Features!
  - Added and sourced bash_aliases.
  - Removed and merged several scripts into one, now `fresh.sh` does all this tool needs.
  - Added this awesome MD with useful information.


### Installation
> **Note:**
>
> This script **WILL** overwrite or remove the following files: `~/.vim/`, `~/.bash_aliases`, `~/.bash_logout`, `~/.bash_profile`, `~/.bashrc`, `~/.screenrc` and `~/.vimrc`. If you want to keep your existing set-up as is, **BACKUP THESE FILES** before running this script.

```sh
$ git clone git@github.com:estebanmurchio/vimfresh.git
$ cd vimfresh
$ git submodule update --init --recursive

# install any patched font from vim/bundle/powerline-fonts/
# set the patched font as your terminal font
# alternatively, you could import a terminal profile included in `config/`

$ . fresh.sh --install

# enjoy!
```

### Help
```sh
$ . fresh.sh --help
```

### Plugins
VIMFRESH uses these **awesome** vim plugins:

* [vim-pathogen] - "Manage your 'runtimepath' with ease."
* [vim-fugitive] - "the best Git wrapper of all time."
* [vim-syntastic] - "a syntax checking plugin."
* [vim-colors-solarized] - "Precision colors for machines and people."
* [vim-airline] - "Lean & mean status/tabline for vim that's light as air."
* [vim-airline-themes] - "the official theme repository for [vim-airline]."
* [powerline-fonts] - "pre-patched and adjusted fonts for usage with the ~~Powerline~~ [vim-airline] statusline plugin."

### Todos
 - Implement `-force` option.
 - Stop procrastinating.

### License
[![GPLv3](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl.html)
###### https://www.gnu.org/licenses/gpl.html

   [powerline-fonts]: <https://github.com/powerline/fonts.git>
   [vim-airline]: <https://github.com/vim-airline/vim-airline>
   [vim-airline-themes]: <https://github.com/vim-airline/vim-airline-themes>
   [vim-colors-solarized]: <https://github.com/altercation/vim-colors-solarized>
   [vim-fugitive]: <http://github.com/tpope/vim-fugitive>
   [vim-pathogen]: <https://github.com/tpope/vim-pathogen>
   [vim-syntastic]: <https://github.com/vim-syntastic/syntastic>
