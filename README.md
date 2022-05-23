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
## 参考

[Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

[Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)

[Mackup](https://github.com/lra/mackup) : osx系统下管理工具