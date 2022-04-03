#!/bin/bash

releasedName='releasedName'

source simple_args_parsing.bash

parseArgs $@

echo 'mamaamamama'

exit

version=$1
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