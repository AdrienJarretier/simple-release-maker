#!/bin/bash

releasedName='releasedName'

function usage()
{
    echo ''
    echo "usage: bash make.bash <X.Y.Z> [-h | --help] [-c <fileType>]"
    echo ""
    echo "  -h --help"
    echo -e "  -c <fileType> \t If option is given, compile files using make.<fileType>.bash"
    echo ""
}

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
else
    version=$1
fi

while [ "$2" != "" ]; do
    PARAM=$2
    VALUE=$3
    case $PARAM in
        -c)
            compileOptionGiven=1
            releasedExtension=$VALUE
            ;;
    esac
    shift 2
done

releaseVersionedName=$releasedName-$version
outputDirName=dist/$releaseVersionedName

if [[ -d $outputDirName ]]
then
    echo "Release $outputDirName already exists"
    exit -1
else
    echo "Releasing $outputDirName"
fi

mkdir -p $outputDirName

if [[ -v compileOptionGiven && compileOptionGiven -eq 1 ]]
then
    bash make.$releasedExtension.bash $releaseVersionedName $releasedExtension $outputDirName
fi

last_tag=$(git describe --tags --abbrev=0 2>/dev/null)
git log $(
    if [[ -z $last_tag ]]
    then 
        echo HEAD
    else 
        echo $last_tag..HEAD
    fi
) --pretty=format:"- %s" > $outputDirName/releaseNotes.txt

nano $outputDirName/releaseNotes.txt

git add $outputDirName/releaseNotes.txt
git cm "releaseNotes version $version"

git tag -a -F $outputDirName/releaseNotes.txt v$version