
This code basically came 100% from: https://gallery.technet.microsoft.com/scriptcenter/Convert-Files-To-UTF-8-5c58db5e

This file should be run as a sibling of the directory/subdirectories it is trying to duplicate and convert.
for example in some folder there should be:
- utf8BomToUtf8Transformer.ps1
- folderAndSubfoldersWithFilesToConvert
Example of calling script
.\utf8BomToUtf8Transformer.ps1 folderAndSubfoldersWithFilesToConvert convertedFolderAndSubfolders




To run on a computer that is giving an execution error, instead this line could be run on a cmd line
```
powershell -ExecutionPolicy ByPass -File script.ps1
```
