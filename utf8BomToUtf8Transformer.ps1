<#This file should be run as a sibling of the directory/subdirectories it is trying to duplicate and convert.
for example in some folder there should be:
- utf8BomToUtf8Transformer.ps1
- folderAndSubfoldersWithFilesToConvert


Example of calling script
.\utf8BomToUtf8Transformer.ps1 folderAndSubfoldersWithFilesToConvert convertedFolderAndSubfolders



#>

Param ( 
    [Parameter(Mandatory=$True)][String]$SourcePath,
    [Parameter(Mandatory=$True)][String]$DestinationPath
) 
     
$Files = Get-ChildItem $SourcePath -Recurse -File 

If ($Files.Count -gt 0)
{ 
    ForEach($File in $Files) 
    {
        $Destination = $File.Directory.Fullname.Replace($SourcePath, $DestinationPath) + "\"
        If (!(Test-Path -Path $Destination)) {New-Item -ItemType Directory -Path $Destination | Out-Null} 
        Write-Host "Read and Convert $($File.Name)" -ForegroundColor Cyan 
        $MyFile = Get-Content $File.FullName
        $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
        [System.IO.File]::WriteAllLines(($Destination + $File.Name), $MyFile, $Utf8NoBomEncoding)
    } 

    Write-Host "Conversion of $($Files.Count) Files to $Encoding in $DestinationPath completed" -ForegroundColor Green 
} 
Else 
{ 
        Write-Host "Source-Directory empty or invalid SourcePath." -ForegroundColor Red 
}
