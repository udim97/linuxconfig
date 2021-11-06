# Navigate
alias q="cd ../"
alias qq="cd ../../"
alias qqq="cd ../../../"
alias qqqq="cd ../../../../"
alias qqqqq="cd ../../../../../"

# Grep
alias grepp="grep --include '*.py'"
alias grepc="grep --include '*.h' --include '*c'"
alias grepcpp="grep --include '*.h' --include '*cpp'"

# Projects
alias cg="cd ~/projects/cgminer"
alias mt="cd ~/projects/moneta"
alias rg="cd ~/projects/reactiongate"
alias hr="cd ~/projects/hermes"
alias bb="/home/udim/projects/reactiongate/run-docker-compose.sh -st --skip-build-arm"

# Rtags
alias rdmEmacs="rdm --error-limit 50000"
alias hr_cdb='convert_cdb `pwd` ~/projects/hermes/package/hermes/target/x86_64/cmake/compile_commands.json ~/projects/hermes/compile_commands.json'


# Overrides
alias vi="emacsclient -nw"
alias rm="trash"

# Anyconnect
alias openconnectvpn="sudo openconnect --passwd-on-stdin --non-inter --background ra-vcadsv.cadence.com < ~/.vpncreds"
alias opendisconnectvpn="sudo kill $(pidof openconnect)"
alias openconnect="sshpass -p cadence ssh pi@172.29.149.99"
alias scp_rp="sshpass -p cadence scp /home/udim/projects/reactiongate/package/reactiongate/target/arm/reaction_gate pi@172.29.149.99:~/work/udim/rg"
alias scp_hr="sshpass -p cadence scp /home/udim/projects/hermes/package/hermes/target/arm/tests pi@172.29.149.99:~/work/udim/hermes"

# Etc
alias cdtmp="cd `mktemp -d`"

# Fucntions
function findReplace()
{
    find_pattern=$1
    replace_pattern=$2

    grep -IRl $find_pattern | xargs sed -i "s/$find_pattern/$replace_pattern/g"
}

function findReplaceExact()
{
    find_pattern=$1
    replace_pattern=$2

    grep -IRlw $find_pattern | xargs sed -i "s/$find_pattern/$replace_pattern/g"
}

pldm_deploy ()
{
    pushd ~/projects/reactiongate;
    ./run-docker-compose.sh deploy -st -dd work/udim/rg palladium;
    popd
}
