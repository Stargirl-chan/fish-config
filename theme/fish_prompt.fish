function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char '>'
    end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l white (set_color white)
  set -l purple (set_color ea0a8e)
  # set -l purple (set_color c5005c)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color white
  set -g __fish_git_prompt_color_flags red
  set -g __fish_git_prompt_color_prefix ea0a8e
  set -g __fish_git_prompt_color_suffix ea0a8e
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true

  # Line 1
  echo -n $purple'┌['$white$USER$purple'@'$white$__fish_prompt_hostname$purple']'$white'-'$purple'('$white(prompt_pwd)$purple')'
  #set BIG_REPOS pkgsrc (cat ~/pkgsrclist.txt | cut -d: -f1) xf86-input-synaptics libinput darling _build
    if not contains (basename $PWD) #$BIG_REPOS
      __fish_git_prompt "-[git://%s]-"
    end
  echo

  # Line 2
  echo -n $purple'└'$__fish_prompt_char $normal
end
