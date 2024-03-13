AUREUS_DIR=~/projects/aureus-software
EMBEDDED_CORE=${AUREUS_DIR}"/packages/embedded/core"
RG_DIR=${EMBEDDED_CORE}"/reactiongate"
DG_DIR=${EMBEDDED_CORE}"/debugtiongate"
HR_DIR=${EMBEDDED_CORE}"/hermes"
SPI_DIR=${EMBEDDED_CORE}"/spi"
UMS_DIR=${EMBEDDED_CORE}"/ums"
CM_DIR=${EMBEDDED_CORE}"/cm"
MON_DIR=${AUREUS_DIR}"/packages/full-stack/moneta"


# Navigate
alias q="cd ../"
alias qq="cd ../../"
alias qqq="cd ../../../"
alias qqqq="cd ../../../../"
alias qqqqq="cd ../../../../../"

# Grep
alias grep_py="grep --include '*.py'"
alias grep_c="grep --include '*.h' --include '*c'"
alias grep_cpp="grep --include '*.h' --include '*cpp'"

function grep_includes() {
    grep -IR "^#include .*$1.*"
}

function grep_mono() {
    grep -IR --exclude-dir=target --exclude-dir=extras --exclude=compile_commands.json $@
}

function grep_core() {
    grep -IR --exclude-dir=target --exclude-dir=build --exclude=compile_commands.json $@
}

# Projects
alias core="cd ${EMBEDDED_CORE}"
alias rg="cd ${RG_DIR}"
alias dg="cd ${DG_DIR}"
alias hr="cd ${HR_DIR}"
alias spi="cd ${SPI_DIR}"
alias ums="cd ${UMS_DIR}"
alias cm="cd ${CM_DIR}"
alias mon="cd ${MON_DIR}"

# Rtags
alias rdmEmacs="rdm --error-limit 50000"


# Overrides
alias vi="emacsclient -nw"
alias rm="trash"

# OpenConnect
alias rg_scp="sshpass -p cadence scp ${RG_DIR}/target/arm-palladium/reactiongate pi@172.29.149.99:~/work/udim/rg"
alias hr_scp="sshpass -p cadence scp ${HR_DIR}/target/arm-palladium/reactiongate pi@172.29.149.99:~/work/udim/hr"

# TLV rapsperry
alias tlv_ssh="sshpass -p raspberry ssh -o \"ServerAliveInterval 60\" pi@192.168.17.105"
alias tlv_build_cp="./build_arm.sh && sshpass -p raspberry scp target/arm/{device_driver_tests,PSU_G1501.ino.with_bootloader.hex} pi@192.168.17.105:~/udim/rg/reactiongate && md5sum target/arm/{device_driver_tests,PSU_G1501.ino.with_bootloader.hex}"

# protium-f
alias protium_f_ssh="sshpass -p raspberry ssh -o \"ServerAliveInterval 60\" pi@10.100.10.72"
alias protium_f_deploy="./run-docker-compose.sh deploy -st -dd work/udim protium-f"

# fpga-62
alias fpga_62_ssh="sshpass -p raspberry ssh -o \"ServerAliveInterval 60\" pi@10.100.10.62"

# Connect remote
alias connect_remote='sshpass -p Udi123\$5 ssh -X -o "ServerAliveInterval 60" 10.100.24.94'

# Etc
alias cdtmp="cd `mktemp -d`"
alias utar="tar -zcvf"
alias untar="tar -xzvf"
alias tar_watch="tar -tvf"
alias emacs="emacs -nw"
alias headphones_connect="bluetoothctl connect 28:6F:40:8A:DD:08"

# Fucntions
function findReplace()
{
    find_pattern=$1
    replace_pattern=$2

    grep -IRl --exclude-dir=target --exclude-dir=cgminer $find_pattern | xargs sed -i "s/$find_pattern/$replace_pattern/g"
}

function findReplaceExact()
{
    find_pattern=$1
    replace_pattern=$2

    grep -IRlw --exclude-dir=target --exclude-dir=extras --exclude=compile_commands.json $find_pattern | xargs sed -i "s/\<$find_pattern\>/$replace_pattern/g"
}

function rsp_ssh ()
{
    rsp_number=$1
    sshpass -p raspberry ssh -o "ServerAliveInterval 60" pi@10.100.10.${rsp_number} -t 'cd ~/work/udim; ps -fu $USER; bash --login'
}

function rsp_deploy ()
{
    ./run-docker.sh deploy -st -dd work/udim $@
}

function run_cdb() {
    convert_cdb ${AUREUS_DIR} ${EMBEDDED_CORE}/target/compile_commands.json ${EMBEDDED_CORE}/compile_commands.json
}

function ba() {
    ./build_arm.sh

    run_cdb
    rc -J .
}

function bl() {
    ./build_localhost.sh

    run_cdb
    rc -J .
}

function get_includes() {
    file_path=$1
    for path in `grep -o '#include ".*"' $file_path  | awk -F'"' '{print $2}' `; do
        echo `basename $path`
    done
}

function build_graph() {
    for file in `find -type f`; do
        includes=`get_includes $file`

        file=`basename $file`

        for i in $includes; do
            echo "graph.add_edge(\"$file\", \"$i\")"
        done
    done
}
