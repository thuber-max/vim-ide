#! /bin/bash

echo -e "\nConfiguring vim\n"

if [ ! -e "~/.vim/autoload" ] || [ ! -e "~/.vim/bundle"]; then
    mkdir ~/.vim/{autoload,bundle}
fi

git submodule add https://github.com/tpope/vim-pathogen bundle/vim-pathogen
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
git submodule add https://github.com/tpope/vim-git.git bundle/git
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/fholgado/minibufexpl.vim bundle/minibufexpl
git submodule add https://github.com/wincent/Command-T.git bundle/command-t
git submodule add https://github.com/mitechie/pyflakes-pathogen.git bundle/pyflakes-pathogen
git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add https://github.com/python-rope/ropevim bundle/ropevim
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update


file=~/.vimrc
echo -e "\n\nSubmodules configured.\nTime to setup $file\n\n"
#   various tests for file existence
#   [ -f $file ] && [ ! -L $file ] && echo "$file exists and is not a symlink"
#   [ -L $file ] && echo "$file is a symlink and exists"
#   [ -h $file ] && echo "$file is a symlink"
#   [ -e $file ] && echo "$file exists"


if [ -f $file ]; then
    echo "$file already exists"

    if grep -q "runtime bundle/vim-pathogen/autoload/pathogen.vim" "$file"; 
    then
        echo "$file already configured for pathogen"
    else
        echo "Adding pathogen config to $file"
        echo "runtime bundle/vim-pathogen/autoload/pathogen.vim" >> "$file"
    fi
else
    echo "$file does not exist -> linking to the default"
    ln -s ~/.vim/vimrc "$file"
fi

echo -e "\nvim configured\n"


