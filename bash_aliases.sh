if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g=grep
alias t=tail
alias l=less
alias h=head

alias weather="curl wttr.in/wroclaw"
alias simple_http="python2 -m SimpleHTTPServer"
alias yt-mp3="youtube-dl --extract-audio --audio-format mp3"

alias curl_perff='curl -w "namelookup:\t%{time_namelookup}\nconnect:\t%{time_connect}\nppconnect:\t%{time_appconnect}\nretransfer:\t%{time_pretransfer}\nedirect:\t%{time_redirect}\nstarttransfer:\t%{time_starttransfer}\n\t\t----------\ntotal:\t\t%{time_total}\n" -o /dev/null -s '

alias encrypt="gpg --verbose --cipher-algo AES256 --symmetric"
alias decrypt="gpg --use-embedded-filename --decrypt"

alias mdv=$HOME/.virtualenvs/scrape/bin/mdv

alias b64dec="base64 -d - <<< "

alias git='LC_ALL=en_GB git'

alias k=kubectl
complete -o default -F __start_kubectl k

alias kg='kubectl get'
complete -F _complete_alias kg

alias kgp='kubectl get pod'
complete -F _complete_alias kgp

alias kd='kubectl describe'
complete -F _complete_alias kd
