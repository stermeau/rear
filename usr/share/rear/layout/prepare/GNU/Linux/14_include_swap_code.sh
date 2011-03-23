# Code to recreate a swap volume

create_swap() {
    read swap device uuid label junk < $1
    
    if [ -n "${uuid#uuid=}" ] ; then
        uuid="-U ${uuid#uuid=} "
    else
        uuid=""
    fi
    
    if [ -n "${label#label=}" ] ; then
        label="-L ${label#label=} "
    else
        label=""
    fi
    
    (
    echo "LogPrint \"Creating swap on $device\""
    echo "mkswap ${uuid}${label}${device} 1>&2" 
    ) >> $LAYOUT_CODE
}