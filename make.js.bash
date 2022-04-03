inputFiles=(
    "./testsFiles/jsInput/input1.js"
    "./testsFiles/jsInput/input2.js"
)

outputDirName=$1

for filePath in ${inputFiles[@]}
do
    cp $filePath "$outputDirName/"
done