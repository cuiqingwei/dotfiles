# dotfiles
Dotfiles Backup

**dotfiles** 字面意思就是「点文件」，就是以`.`开头的文件，常见的如.bash_profile,.vimrc,.zshrc等等。在linux,osx等系统中，这些dotfiles默认都是隐藏的，在shell下要看到这些文件得用 `ls -a` 命令。常用到vim, iterm ,zsh ,sublime text2等等相关的工具和开发环境，为了用得顺手，也会根据个人习惯和喜好改改不同工具、环境的配置。

用法：

```bash
cd ~
git clone git@github.com:cuiqingwei/dotfiles.git .dotfiles
rm -rf .gitconfig
ln -s .dotfiles/.gitconfig .gitconfig
```

## zsh

1. Oh-My-Zsh
   [https://ohmyz.sh/](https://ohmyz.sh/)
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. plug：autojump
   [https://github.com/wting/autojump](https://github.com/wting/autojump)

3. plug：zsh-syntax-highlighting
   [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   ```bash
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```
4. plug：zsh-autosuggestions
   [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   ```
5. themes
   [https://github.com/ohmyzsh/ohmyzsh/wiki/themes](https://github.com/ohmyzsh/ohmyzsh/wiki/themes)

## vim

1. vim-plug插件管理 (Launch **vim** and run **:PluginInstall**)
   [https://github.com/VundleVim/Vundle.vim](https://github.com/junegunn/vim-plug)
   
2. VimAwesome
   [https://vimawesome.com/](https://vimawesome.com/)
   
3. **.vimrc** 快捷复制

```bash
" Author: Gary <cuiqingwei@gmail.com>
" Repository: https://github.com/cuiqingwei/dotfiles
" Create Date: 2016-03-23

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","                  " 定义<leader>键
set nocompatible                     " 设置不兼容原始vi模式
filetype on                          " 设置开启文件类型侦测
filetype plugin on                   " 设置加载对应文件类型的插件
syntax enable                        " 开启语法高亮功能
syntax on                            " 自动语法高亮

let mapleader = ","                  " 定义<leader>键
imap jj <Esc>
nmap <space> :

set number                           " 开启行号显示
set cursorline                       " 高亮显示当前行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                         " 高亮显示搜索结果
set incsearch                        " 开启实时搜索功能
set ignorecase                       " 搜索时大小写不敏感

set path+=**                         " 递归查找子文件,配合 :find *filename* 使用
set wildmenu                         " 展示匹配的文件列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'preservim/nerdtree'            " 文件浏览器,快捷键 ,n
Plug 'tpope/vim-commentary'          " 快速注释，常用快捷键 gcc
call plug#end()

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>
```

## .tmux
   [Oh my tmux](https://github.com/gpakosz/.tmux)

   ```bash
   cd ~
   git clone https://github.com/gpakosz/.tmux.git
   ln -s -f .tmux/.tmux.conf
   cp .tmux/.tmux.conf.local .
   tmux source-file .tmux.conf
   ```
   
## 参考

[Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

[Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)

[VIM 实用插件整理](http://t.csdn.cn/wqDry)

[vimawesome](https://vimawesome.com/)

[Mackup](https://github.com/lra/mackup) : osx系统下管理工具

[tmux使用](http://t.csdn.cn/2omNJ)
