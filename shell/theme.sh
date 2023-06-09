#!/bin/bash

# echo '[theme.sh]'

export TYPEWRITTEN_PROMPT_LAYOUT="pure_verbose"

export FZF_DEFAULT_OPTS=" \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export BEMENU_BACKEND="wayland"
export BEMENU_OPTS="\
  --center\
  --list 10\
  --width-factor 0.2\
  --accept-single\
  --fixed-height 35\
  --binding vim\
  --border 1\
  --border-radius 10\
  --bdr \"#89b4fa\"\
  --fb \"#1e1e2e\"\
  --ff \"#94e2d5\"\
  --nb \"#1e1e2e\"\
  --nf \"#f5e0dc\"\
  --tb \"#1e1e2e\"\
  --hb \"#1e1e2e\"\
  --tf \"#cba6f7\"\
  --hf \"#89b4fa\"\
  --nf \"#f5e0dc\"\
  --af \"#f5e0dc\"\
  --ab \"#1e1e2e\""
