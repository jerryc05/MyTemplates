#!/usr/bin/env zsh

# Load Antigen
if [ -f "~/antigen.zsh" ]; then
  source "~/antigen.zsh"
elif [ -f "/usr/share/zsh-antigen/antigen.zsh" ]; then
  source "/usr/share/zsh-antigen/antigen.zsh"
elif [ -f "/usr/local/share/antigen/antigen.zsh" ]; then
  source "/usr/local/share/antigen/antigen.zsh"
elif [ -f "/usr/share/zsh/share/antigen.zsh" ]; then
  source "/usr/share/zsh/share/antigen.zsh"
elif [ -f "$HOME/antigen.zsh" ]; then
  source "$HOME/antigen.zsh"
else
  __ok=0
  antigen_zsh_cache_path="$HOME/.antigen/.antigen_zsh_path"
  if [ -f "$antigen_zsh_cache_path" ]; then
    __antigen_zsh_path=$(cat "$antigen_zsh_cache_path")

    # Path from cache is valid
    if [ -f "$__antigen_zsh_path" ]; then
      source "$__antigen_zsh_path"
      __ok=1
    fi
  fi

  if [ $__ok -eq 0 ]; then
    echo "Finding \`antigen.zsh\` ..."
    __antigen_zsh_path=$(find /usr -name antigen.zsh 2> /dev/null)

    # Update cache of path
    if [ -f "$__antigen_zsh_path" ]; then
      mkdir -p "$HOME/.antigen"
      echo $__antigen_zsh_path > "$antigen_zsh_cache_path"
      source "$__antigen_zsh_path"

    # We lost this file
    else
      echo -e '\e[5m\e[1;31mERROR:\e[0m \e[1;33mantigen.zsh\e[0m not found!'
      return
    fi
  fi

  unset __ok
  unset __antigen_zsh_path
fi

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Bundles
export ZSH_AUTOSUGGEST_USE_ASYNC=1 && antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle safe-paste
antigen bundle z
antigen bundle command-not-found
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle supercrabtree/k && command -v numfmt >/dev/null || { command -v brew >/dev/null && brew install coreutils }
antigen bundle pip
antigen bundle zsh-256color

# Syntax highlighting bundle (MUST BE THE LAST BUNBDLE)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done
antigen apply