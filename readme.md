# simple-release-maker

usage

```Shell
usage: bash make.bash <X.Y.Z> [-h | --help] [-c <fileType>] [--copy]

  -h --help
  -c <fileType>          If option is given, compile files using make.<fileType>.bash
  --copy         If given, copy files from array in make.copy.bash to release dir
```

edit `releasedName` in [make.bash](./make.bash) to fit your own project.

1. Creates a new dir `dist/releasedName-X.Y.Z` with at least a `releaseNotes.txt` file inside
1. Opens `nano` to edit the content
1. Adds and commits this new file
1. Creates a new annoted tag `vX.Y.Z` using the content of `releaseNotes.txt` as message
