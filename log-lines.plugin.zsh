# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Standardized $0 Handling
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Functions directory
# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# Binaries directory
# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]]; then
  path+=( "${0:h}/bin" )
fi

## Autoload functions
typeset to_load; to_load=(${0:h}/functions/*)
to_load=(${to_load#*functions/*})
autoload $to_load
unset to_load
