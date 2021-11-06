AUREUS_DIR=~/projects/aureus-software
RG_DIR=${AUREUS_DIR}"/packages/reactiongate"
DG_DIR=${AUREUS_DIR}"/packages/debugtiongate"
HR_DIR=${AUREUS_DIR}"/packages/hermes"
SPI_DIR=${AUREUS_DIR}"/packages/spi"
UMS_DIR=${AUREUS_DIR}"/packages/ums"
CM_DIR=${AUREUS_DIR}"/packages/cm"


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

# Projects
alias rg="cd ${RG_DIR}"
alias dg="cd ${DG_DIR}"
alias hr="cd ${HR_DIR}"
alias spi="cd ${SPI_DIR}"
alias ums="cd ${UMS_DIR}"
alias cm="cd ${CM_DIR}"

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

# Etc
alias cdtmp="cd `mktemp -d`"
alias utar="tar -zcvf"
alias untar="tar -xzvf"

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

    grep -IRlw $find_pattern | xargs sed -i "s/\<$find_pattern\>/$replace_pattern/g"
}

function rsp_ssh ()
{
    rsp_number=$1
    sshpass -p raspberry ssh -o "ServerAliveInterval 60" pi@10.100.10.${rsp_number}
}

function rsp_deploy ()
{
    rsp_name=$1
    ./run-docker-compose.sh deploy -st -dd work/udim $rsp_name
}

function run_cdb() {
    package_name=$1
    arch=$2
    package_dir=${AUREUS_DIR}/packages/${package_name}
    convert_cdb ${AUREUS_DIR} ${package_dir}/target/${arch}/cmake/compile_commands.json ${package_dir}/compile_commands.json
}

function ba() {
    ./build_arm.sh

    current_workdir=`pwd`
    package_name=`basename $current_workdir`
    run_cdb $package_name arm
    rc -J .
}

function bl() {
    ./build_localhost.sh

    current_workdir=`pwd`
    package_name=`basename $current_workdir`
    run_cdb $package_name x86_64
    rc -J .
}
