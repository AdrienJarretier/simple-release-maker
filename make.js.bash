inputFiles=(
    "./testsFiles/jsInput/input1.js"
    "./testsFiles/jsInput/input2.js"
)

releaseVersionedName=$1
releasedExtension=$2
outputDirName=$3

outputFileName=$releaseVersionedName.$releasedExtension

for filePath in ${inputFiles[@]}
do
    cat $filePath >> $outputDirName/$outputFileName
    echo '' >> $outputDirName/$outputFileName
done

git add $outputDirName/$outputFileName