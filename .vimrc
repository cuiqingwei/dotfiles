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

" quickfix for cscope
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用quickfix窗口来显示cscope结果, :cw 打开窗口，:cclose 关闭窗口

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'preservim/nerdtree'            " 文件浏览器,快捷键 ,n
Plug 'tpope/vim-commentary'          " 快速注释，常用快捷键 gcc
Plug 'Yggdroot/LeaderF'              " 模糊查找器 :Leaderf <subcommand>
Plug 'preservim/tagbar'              " 函数列表
Plug 'junegunn/fzf'                  " fzf存储库
Plug 'junegunn/fzf.vim'              " 模糊查找
Plug 'vim-airline/vim-airline'       " 多种风格的状态栏
call plug#end()

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
" let g:NERDTreeDirArrowExpandable='▷'
" let g:NERDTreeDirArrowCollapsible='▼'

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

" FZF
nnoremap <leader>f :Files .<cr>

" ack
nnoremap <leader>F :Ag<space>

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

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p
