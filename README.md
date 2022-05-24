# dotfiles
Dotfiles Backup


**dotfiles** 字面意思就是「点文件」，就是以`.`开头的文件，常见的如.bash_profile,.vimrc,.zshrc等等。在linux,osx等系统中，这些dotfiles默认都是隐藏的，在shell下要看到这些文件得用 `ls -a` 命令。常用到vim, iterm ,zsh ,sublime text2等等相关的工具和开发环境，为了用得顺手，也会根据个人习惯和喜好改改不同工具、环境的配置。

用法：

```bash
cd ~
git clone git@github.com:cuiqingwei/dotfiles.git dotfiles
rm -rf .gitconfig
ln -s dotfiles/.gitconfig .gitconfig
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

1. Vbundle插件管理 (Launch **vim** and run **:PluginInstall**)
   [https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
   ```bash
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```
2. VimAwesome
   [https://vimawesome.com/](https://vimawesome.com/)
3. 目录树NERDTree
   ```bash
   let NERDTreeHighlightCursorline = 1       " 高亮当前行
   let NERDTreeShowLineNumbers     = 1       " 显示行号
   " 忽略列表中的文件
   let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
   " 关闭 NERDTree，当没有文件打开的时候
   autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   
   " <leader>nt 打开 nerdtree 窗口，在左侧栏显示
   map <leader>nt :NERDTreeToggle<CR>
   " <leader>tc 关闭当前的 tab
   map <leader>tc :tabc<CR>
   " <leader>to 关闭所有其他的 tab
   map <leader>to :tabo<CR>
   " <leader>ts 查看所有打开的 tab
   map <leader>ts :tabs<CR>
   " <leader>tp 前一个 tab
   map <leader>tp :tabp<CR>
   ```
## 参考

[Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

[Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)

[VIM 实用插件整理](http://t.csdn.cn/wqDry)

[vimawesome](https://vimawesome.com/)

[Mackup](https://github.com/lra/mackup) : osx系统下管理工具