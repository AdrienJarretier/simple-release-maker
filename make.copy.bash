inputFiles=(
    "./make.bash"
    "./make.js.bash"
    "./make.copy.bash"
)

outputDirName=$1

for filePath in ${inputFiles[@]}
do
    cp $filePath $outputDirName
done