# name: Jacaetevha
function tbytes -d 'calculates the total size of the files in the current directory'
  set -l tBytes (ls -al | grep "^-" | awk 'BEGIN {i=0} { i += $5 } END { print i }')
  
  if test $tBytes -lt 1048576
    set -g total (echo -e "scale=3 \n$tBytes/1048 \nquit" | bc)
    set -g units " K"
  else
    set -g total (echo -e "scale=3 \n$tBytes/1048576 \nquit" | bc)
    set -g units " M"
  end
  echo -n "$total$units"
end

function fish_prompt
  set_color yellow
  printf '%s' (whoami)
  printf ' '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color magenta
  printf '%s' (__fish_git_prompt)

  # Line 2
  echo
  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '↪  '
  set_color normal
end
