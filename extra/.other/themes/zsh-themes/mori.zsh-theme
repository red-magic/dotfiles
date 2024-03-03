function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

# PROMPT='[%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%}] '
# PROMPT='%{$fg_bold[red]%}[%n%{$fg_bold[blue]%}@%m %{$fg_bold[red]%}%(!.%1~.%~)]%{$reset_color%} '

# Human readable format
local host_name="%{$fg_bold[red]%}%n%{$fg_bold[blue]%}@%m"
local path_string="%{$fg_bold[red]%} %~"
PROMPT='%{$fg_bold[red]%}[${host_name}${path_string}%{$fg_bold[red]%}]$%{$reset_color%} '

#ZSH_THEME_GIT_PROMPT_PREFIX="("
#ZSH_THEME_GIT_PROMPT_SUFFIX=") "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
local cb=$(git_current_branch)
	if [ -n "$cb" ]; then
#	echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
}

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_RVM_PROMPT_SUFFIX="%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'
