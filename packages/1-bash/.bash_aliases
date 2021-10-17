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
alias cdb='create_cdb "./tools/build_tools/build.sh --dry-run" `pwd`/src && rc -J .'

# Overrides
alias vi="emacsclient -nw"
alias rm="trash"

# Anyconnect
alias anyconnectvpn="/opt/cisco/anyconnect/bin/vpn -s < ~/.vpn-creds connect ra-vcadsv.cadence.com"
alias anydisconnectvpn="/opt/cisco/anyconnect/bin/vpn disconnect ra-vcadsv.cadence.com"
alias anyconnect="sshpass -p cadence ssh pi@172.29.149.99"
alias scp_rp="sshpass -p cadence scp /home/udim/projects/reactiongate/package/reactiongate/target/arm/reaction_gate pi@172.29.149.99:~/work/udim/rg"
alias scp_hr="sshpass -p cadence scp /home/udim/projects/hermes/package/hermes/target/arm/tests pi@172.29.149.99:~/work/udim/hermes"


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
