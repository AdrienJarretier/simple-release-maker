inputFiles=(
    "./make.bash"
    "./make.js.bash"
    "./make.copy.bash"
)

releaseVersionedName=$1
releasedExtension=$2
outputDirName=$3

for filePath in ${inputFiles[@]}
do
    cp
    cat $filePath >> $outputDirName/$outputFileName
    echo '' >> $outputDirName/$outputFileName
done