function get_kube_info() {
  if [ -z "${KUBE_CONTEXT}" ]; then
    echo ""
  else
    if [ -f "$HOME/.kube/config" ]; then
      # echo "$(grep -m 1 'current-context:' ~/.kube/config | cut -d ' ' -f 2)"
      # echo "$(kubectl config view --minify --output 'jsonpath={range .contexts[*]}{.context.cluster}{": "}{.context.namespace}{end}')"
      echo "$(kubectl config get-contexts | grep '*' | awk '{ print $3 ": " $5 }')"
    else
      echo "no-conf"
    fi
  fi
}

local dtime="$(date -u +'%F %TZ')"
local kube_info="$(get_kube_info)"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[blue]%}${dtime}%  %{$fg_bold[green]%}$(get_kube_info)%  %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
