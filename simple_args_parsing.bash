#!/bin/bash

function parseArgs()
{
    source usage.bash

    echo ''

    if [[ $# -lt 1 ]]
    then
        echo 'ERROR : missing version number'
        usage
        exit -1
    fi

    if [[ "$1" =~ -h|--help ]]
    then
        usage
        exit
    elif ! [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
    then
        echo 'ERROR : version format does not match X.Y.Z (Major.Minor.Patch)'
        usage
        exit -1
    fi

    while [ "$2" != "" ]; do
        PARAM=$2
        VALUE=$3
        case $PARAM in
            -c)
                bash make.$VALUE.bash
                ;;
        esac
        shift 2
    done

}
