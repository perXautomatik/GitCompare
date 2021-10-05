cd (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
. .\Forks\0cc040af9e7d768f13c998cde8dc414d\temporary-directory.ps1
. .\Forks\7ca47b54d66abde42192471c53bbadcd\checking-for-null.ps1

function GitCommitEach{

param
(
 
[Parameter(ValueFromPipeline=$true)]
$params
)
 

    $folderPath = ''
    $i = $true;


    $params | %{
        
        $file = $_
        if (IsNull($file)-neq) {

            if ($i)
            {
                $folderPath = New-TemporaryDirectory
                cd $folderpath
                git init
            }

            Copy-Item $file -Destination $folderPath

            
            $message = "$file.fullName $file.creationdate $file.modificationDate $file.size"

            git commit $message
            $i = $false
        }
    }

}

"D:\Project Shelf\PowerShellProjectFolder\Todo\GeneralSourceCompare\fileList.txt" | Get-Content | GitCommitEach 