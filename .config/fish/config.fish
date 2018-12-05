# Path to your oh-my-fish.
# set fish_path $HOME/.local/share/omf/

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
# . $fish_path/init.fish

set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home"
set -x HADOOP_PREFIX "/usr/local/Cellar/hadoop/2.8.0"
set -x HADOOP_LIBEXEC_DIR "/usr/local/Cellar/hadoop/2.8.0/libexec"
set -x ECLIPSE "/Applications/Eclipse.app/Contents/Eclipse"
set -x SPARK "/usr/local/spark-2.1.0-hadoop2.7"
set -x sparkbin "/usr/local/spark-2.1.0-hadoop2.7/bin"
set -x CLOSURE_LIBRARY "/Users/kevingan/libs/closure-library"
set -x CXX "/usr/local/opt/llvm/bin/clang++"
set -x CC "/usr/local/opt/llvm/bin/clang"

# eval "docker-machine env default"

function h_
  if test (count $argv) -gt 1
    set args $argv[2..-1]
  else
    set args
  end
  eval "hadoop/$argv[1] $args"  
end

function make_completion --argument alias command
    complete -c $alias -xa "(
        set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
        complete -C\"$command \$cmd\";
    )"
end
#
#reset path
set -g -x PATH
# This allows us to use Homebrew versions of things (like git) rather than the pre-installed or XCode installed versions.
# See http://blog.grayghostvisuals.com/git/how-to-keep-git-updated/ for reference.
set -g -x PATH $PATH /usr/local/bin

# Sets necessary PATH defaults
set -g -x PATH $PATH /usr/bin /bin /usr/sbin /sbin /Users/kevingan/libs/activator-dist-1.3.12/bin
# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/

# Emscripten paths
set -g -x PATH $PATH /Users/kevingan/libs/emsdk /Users/kevingan/libs/emsdk/clang/fastcomp/build_incoming_64/bin /Users/kevingan/libs/emsdk/node/4.1.1_64bit/bin /Users/kevingan/libs/emsdk/emscripten/incoming /Users/kevingan/libs/emsdk/binaryen/master
set -g -x PATH $PATH /Users/kevingan/libs/emsdk/binaryen/master_64bit_binaryen/bin
set -g -x PATH $PATH /Users/kevingan/.rvm/bin

function read_confirm
  while true
    echo "$argv"
    read -l -p 'echo "Continue? [y/N]"' confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

# hadoop
alias hstart="/usr/local/Cellar/hadoop/2.8.0/sbin/start-dfs.sh; and /usr/local/Cellar/hadoop/2.8.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.8.0/sbin/stop-dfs.sh; and /usr/local/Cellar/hadoop/2.8.0/sbin/stop-yarn.sh"

# git
alias gs='clear ;and git status'
alias gb='git branch'
alias gbhist='git reflog | grep checkout | grep -v \'rebase\''
alias gbranch='git rev-parse --abbrev-ref HEAD' 
alias gl="clear ;and git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr -a gdt="git diff-tree --no-commit-id --name-only -r "
alias gt='git tag'
alias grm='git rm'
alias gps='git push'
alias gbi='git bisect'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gca='git commit --amend'
abbr -a gco='git checkout'
alias gm='git merge'
alias gmt='git mergetool'
alias gdt='git difftool'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gup='git stash ;and git pull --rebase ;and git stash apply'
alias gr='git rebase'
alias gri='git rebase -i'
alias grcn='git rebase --continue'
alias grgm='git rebase -i gerrit/master'
alias gst='git stash'
alias gsta='git stash apply'
alias gunstage='git reset HEAD'
alias gfa='git fetch --all'

alias sr='screen -r'

alias ta='tmux attach -t'
alias ts='tmux new -s'
alias tn='tmux'

abbr -a brc='bazel run -c opt'

alias sourcetree='open -a SourceTree'

function gpup
  git push -u origin (gbranch)
end

# checkout pull request
function gcopr
  git fetch origin pull/$argv/head:pr-$argv ;and git checkout pr-$argv;
end

#commit
function gc
  git commit -m "$argv"
end

#cherry-pick
function gcp
  git cherry-pick $argv
end

# add
function ga
  git add $argv
end

# diff minus certain stuff
function gd_except
  git diff $argv[0]..$argv[1] --name-only | grep -v $argv[2] | xargs git $argv[3] $argv[0]..$argv[1] --
end

# difftool
function gd
  git difftool $argv
end

# publish branch to remote repo
function gpub
  git push -u origin (gbranch)
end

# open url to github repo
function gopen
  open (_getRemoteBranchUrl)
end

# publish branch to remote repo and open url to it in github
function gpubo
  gpub ;and gopen
end

# delete remote branch
function gunpub
  if read_confirm deletes the branch in remote origin
    git push origin :(gbranch)
  end
end

function _getRemote
  git config --get remote.origin.url
end

function _getRemoteBranchUrl
  set remote (_getRemoteUrl)
  set branch (gbranch)
  # remote
  echo $remote/tree/$branch
end

function _getRemoteUrl
  _getRemote | sed -e 's/\(\.git\)*$//g'
end

setenv SSH_ENV $HOME/.ssh/environment

function start_agent
  if [ -n "$SSH_AGENT_PID" ]
        ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
            test_identities
        end
  else
        if [ -f $SSH_ENV ]
            . $SSH_ENV > /dev/null
        end
      ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
      if [ $status -eq 0 ]
          test_identities
      else
        echo "Initializing new SSH agent ..."
          ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
        echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
        ssh-add
  end
  end
end

start_agent


function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end


function fish_title
    if [ $_ = 'fish' ]
  echo (prompt_pwd)
    else
        echo $_
    end
end
set -g fish_user_paths "/usr/local/opt/bison/bin" $fish_user_paths

