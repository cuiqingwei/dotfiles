# 屏蔽 punycode 弃用警告（必须放在最顶部）
export NODE_NO_WARNINGS=1

# 用 zprof 做性能剖析（需要时取消注释）
#zmodload zsh/zprof

# ── oh-my-zsh 基础配置 ────────────────────────────────────────────────────────
export ZSH="/Users/gary/.oh-my-zsh"
ZSH_THEME="ys"

# 限制 oh-my-zsh 每日一次自动更新检查
zstyle ':omz:update' mode disabled

# ── 最强 compinit 启动优化 ──────────────────────────────────────────────────
# 不让 omz 每次都跑 compaudit（安全检查耗时最长）
ZSH_DISABLE_COMPFIX="true"
# 指定 zcompdump 缓存路径（复用之前的缓存）
export ZSH_COMPDUMP="$HOME/.zcompdump-$HOST-$ZSH_VERSION"


# 补全等待时显示红点（oh-my-zsh 在 source 前读取此变量）
COMPLETION_WAITING_DOTS="true"

# 优先配置 fpath（确保 Homebrew 补全文件被识别）
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
  fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
elif [[ -d "/usr/local/share/zsh/site-functions" ]]; then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

# ── 插件列表 ──────────────────────────────────────────────────────────────────
plugins=(
  git
  autojump
  zsh-syntax-highlighting
  zsh-autosuggestions
  thefuck
)

source $ZSH/oh-my-zsh.sh

# ── 补全配置（必须在 oh-my-zsh 加载后，否则会被覆盖）───────────────────────
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# ── Tab 键 widget：有 autosuggestion 时接受建议，否则触发菜单补全 ────────────
# 直接操作 ZLE 底层变量，最可靠，不依赖 autosuggest-accept widget
_zsh_tab_accept_or_complete() {
  if [[ -n "$POSTDISPLAY" ]]; then
    BUFFER="${BUFFER}${POSTDISPLAY}"
    POSTDISPLAY=""
    CURSOR=${#BUFFER}
  else
    zle expand-or-complete
  fi
}
zle -N _zsh_tab_accept_or_complete
# 注意：bindkey 语句放在文件最末尾（source ~/.fzf.zsh 之后），防止被 fzf 覆盖

# ── 编译标志 & PATH ────────────────────────────────────────────────────────────
export ARCHFLAGS="-arch x86_64"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# 集中合并所有 PATH 变量，减少启动解析时间
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$HOME/.local/bin:/Users/gary/.codeium/windsurf/bin:/Users/gary/.lmstudio/bin:/Users/gary/.opencode/bin:/Users/gary/.antigravity/antigravity/bin:$PATH"

# ── 工具配置（API Keys）────────────────────────────────────────────────────────
export OLLAMA_API_BASE="http://127.0.0.1:11434"
export GOOGLE_CLOUD_PROJECT="igcp-272409"

# ── TheFuck 懒加载 ─────────────────────────────────────────────────────────────
# 拦截第一次输入 fuck，按需初始化，避免启动时调用 Python 带来的 150ms 延迟
fuck() {
  eval $(thefuck --alias)
  fuck "$@"
}

# ── 自定义别名（按需取消注释）────────────────────────────────────────────────
#alias ls="/opt/homebrew/bin/exa"
#alias ll="/opt/homebrew/bin/exa -alh"
#alias tree="/opt/homebrew/bin/exa --tree"

# ── iTerm2 集成 ───────────────────────────────────────────────────────────────
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ── Tabby 配置 ────────────────────────────────────────────────────────────────
tabby_precmd() { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }
add-zsh-hook precmd tabby_precmd

# ── fzf 配置 ──────────────────────────────────────────────────────────────────
function vf() { vim $(fzf) }
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# ── nvm 懒加载 ────────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f nvm node npm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }

# ── fzf 加载 ──────────────────────────────────────────────────────────────────
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ── 必须最后执行：覆盖 fzf 对 Tab 键的绑定 ───────────────────────────────────
# fzf 会将 ^I 绑定到 fzf-completion，以下语句将其恢复为我们的 widget
bindkey '^I'    _zsh_tab_accept_or_complete  # 标准终端 (iTerm2 等)
bindkey '\e[9u' _zsh_tab_accept_or_complete  # Kitty keyboard protocol

# 用 zprof 做性能剖析（需要时取消注释）
#zprof