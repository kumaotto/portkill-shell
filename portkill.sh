function portkill() {
    pid=`lsof -i:"$1" -t`
    # Wait for the process completed
    wait
    # z option return true if var length is 0
    if [ -z $pid ]; then
        tput bel
        # tput setaf command change char color
        echo "$(tut setaf 3) No Process on Port $1$(tput sgr 0)"
    else
        # signal 9 is to kill processes forcibly. trap command is not working.
        kill -9 $pid
        lsof -i:"$1" -t 2>/dev/null > /dev/null || echo "$(tput setaf 2) Killed Processes on Port $1$(tput sgr 0)"
}
