#===============================================================
#
# ALIASES AND FUNCTIONS
#
##===============================================================

# Shortcuts
alias code='cd ~/Code'
alias reload='source ~/.bashrc'
alias path='echo -e ${PATH//:/\\n}'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# List all files colorized in long format
alias ll="ls -alF"

# List only directories
alias lsd='ll | grep "^d"'

# ----------------------------------------------------------------------
# Safeguards
# ----------------------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# ----------------------------------------------------------------------
# ls less With DIRCOLORS
# ----------------------------------------------------------------------

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
fi

alias fuuu="rm -rf package-lock.json && rm -rf node_modules && npm install --prefer-offline --no-audit"

alias nexttag='git tag -fa "nextjs-env-perf" -m "nextjs-env-perf" && git tag -fa "nextjs-env-perfz" -m "nextjs-env-perfz" && git tag -fa "nextjs-env-qe101" -m "nextjs-env-qe101" && git tag -fa "nextjs-env-qa" -m "nextjs-env-qa" && git tag -fa "nextjs-env-qaz" -m "nextjs-env-qaz" && git tag -fa "nextjs-env-production" -m "nextjs-env-production" && git tag -fa "nextjs-env-productionz" -m "nextjs-env-productionz"'

mcd () {
  mkdir "$1" && cd "$1"
}

gcd () {
  git clone "$1" && cd "$1"
}
