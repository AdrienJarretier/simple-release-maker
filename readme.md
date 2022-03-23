# simple-release-maker

usage

```bash
bash make.bash <X.Y.Z>
```

1. Creates a new dir `dist/X.Y.Z` with at least a `releaseNotes.txt` file inside
1. Opens `nano` to edit the content
1. Adds and commits this new file
1. Creates a new annoted tag `vX.Y.Z` using the content of `releaseNotes.txt` as message