if status is-interactive
	set -x MANPAGER 'nvim +Man!'
	alias cat 'bat'
	alias ls 'eza --icons auto'
	alias cd 'z'
	alias cf 'cd (fzf --walker=dir,hidden)'
	alias vim 'nvim'
	alias v 'nvim'
	alias vi 'nvim (fzf)'
	alias vo 'set file (fzf) && cd (dirname $file) && nvim (basename $file)'
	alias ch 'cd (fzf --walker=dir,hidden --walker-root=$HOME)'
	alias mkdir 'mkdir -p'

	starship init fish | source
	zoxide init fish | source
end
