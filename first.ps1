cd (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
. .\Forks\0cc040af9e7d768f13c998cde8dc414d\temporary-directory.ps1
. .\Forks\7ca47b54d66abde42192471c53bbadcd\checking-for-null.ps1

function GitCommitEach{

param
(
 
[Parameter(ValueFromPipeline=$true)]
$params
)
     
    if ($params.length -gt 0) {
    
        $folderPath = New-TemporaryDirectory
        cd $folderpath
        
        git init
    
        For ($i=0; $i -lt $params.length; $ii) 
        {
        
        $file = $params[$i]
        
    
            If( Test-Path -Path $file )
            {
            
                Copy-Item $file -Destination $folderPath
                      
                $message = "$file.fullName $file.creationdate $file.modificationDate $file.size"
                $message

                git commit $message
                
            }
            else {
                $file
            }
        }
        ii $folderPath
    
    
    }
    else {
        $params
        }
    
}


$csv = import-csv "D:\Project Shelf\PowerShellProjectFolder\Todo\GeneralSourceCompare\fileList.txt" -raw 
$csv | GitCommitEach 