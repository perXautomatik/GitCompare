# GitCompare
Powershell script to coppy each file in provided filelist into a single local repo,
used to overview files lacking version control


#idea
input: take arbitary number of files as array

then
 for each file entry
    create a commit
        and replace if already exsisting.
    commit with filepath,modification,size, date as message

