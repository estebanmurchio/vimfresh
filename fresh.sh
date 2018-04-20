#!/bin/bash

# VIMFRESH: an easy -hopefully- customization for shell and vim users.
# Copyright (C) 2017  Esteban Murchio
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

fresh_initialize() {
    fresh_sh_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    fresh_parse_command_parameters $@
}

fresh_parse_command_parameters() {
    local operation="$1"
    local force=0
    if ! [[ $operation =~ "--" ]]; then
        fresh_show_help
        return
    fi
    if [[ $@ =~ "-force" ]]; then
        local force=1
    fi
    printf "
    VIMFRESH  Copyright (C) 2017  Esteban Murchio
    This program comes with ABSOLUTELY NO WARRANTY.
    This is free software, and you are welcome to redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.\n"
    case $operation in
        --h|--help)
            fresh_show_help
        ;;
        --i|--install)
            printf "\nInstalling..."
            fresh_install $force
            printf "Done.\n"
        ;;
        --u|--update)
            printf "\nUpdating..."
            fresh_update $force
            printf "Done.\n"
        ;;
        --s|--source)
            printf "\nSourcing..."
            fresh_source $force
            printf "Done.\n"
        ;;
        --r|--remove)
            printf "\nRemoving..."
            fresh_remove $force
            printf "Done.\n"
        ;;
        *)
            fresh_show_help
        ;;
    esac
}

fresh_show_help() {
    printf "SYNOPSIS
     fresh [--h | --i | --u | --s | --r] [-force]

DESCRIPTION
     It would be nice to have a nice description about this tool.

     The options are as follows:

     --h         Displays vimfresh help message, yes, this message.

     --i         Installs vimfresh into current user's home directory.

     --u         Updates vimfresh in current user's home directory.

     --s         Sources vimfresh from the current user's home directory.

     --r         Removes vimfresh from the current user's home directory.

     -force      If using --i, --u, --r, causes vimfresh not to ask for
                 confirmation when overwriting and/or removing files.

NOTE
     Be careful: force option is not implemented, force option is IMPLIED.

     Any resemblance to a man page is pure coincidence.
\n"
}

fresh_install() {
    for file in $fresh_sh_path/dots/*; do
        cp $fresh_sh_path/dots/$(basename $file) ~/.$(basename $file)
    done
    cp -r $fresh_sh_path/vim ~/.vim
    fresh_source
}

fresh_update() {
    fresh_remove
    fresh_install
}

fresh_source() {
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    else
        printf "Error! ~/.bashrc file not found.\n"
    fi
}

fresh_remove() {
    if [ -d ~/.vim ]; then
        rm -r ~/.vim
    fi
    if [ -f ~/.bash_aliases ]; then
        rm ~/.bash_aliases
    fi
    if [ -f ~/.bash_logout ]; then
        rm ~/.bash_logout
    fi
    if [ -f ~/.bash_profile ]; then
        rm ~/.bash_profile
    fi
    if [ -f ~/.bashrc ]; then
        rm ~/.bashrc
    fi
    if [ -f ~/.screenrc ]; then
        rm ~/.screenrc
    fi
    if [ -f ~/.vimrc ]; then
        rm ~/.vimrc
    fi
}

fresh_initialize $@

unset fresh_sh_path

unset -f fresh_initialize
unset -f fresh_parse_command_parameters
unset -f fresh_show_help
unset -f fresh_install
unset -f fresh_update
unset -f fresh_source
unset -f fresh_remove
