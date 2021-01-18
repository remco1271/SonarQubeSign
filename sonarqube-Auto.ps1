$sonar_login = ''
$folder     = (Get-Item $PSScriptRoot)
$folderName = $folder.Name
$folderPath = $folder.FullName

$AnyCPU = New-Object System.Management.Automation.Host.ChoiceDescription '&AnyCPU', 'AnyCPU'
$x86 = New-Object System.Management.Automation.Host.ChoiceDescription 'x&86', 'x86 CPU'
$x64 = New-Object System.Management.Automation.Host.ChoiceDescription 'x&64', 'x64 CPU'

$platform = 'AnyCPU'
 
$options = [System.Management.Automation.Host.ChoiceDescription[]]($AnyCPU, $x86, $x64)

$title = 'Compile Platform'
$message = 'What platform do you want to use?'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)

switch ($result)
{
    0 { $platform = 'AnyCPU' }
    1 { $platform = 'x86' }
    2 { $platform = 'x64' }
}

SonarScanner.MSBuild.exe begin /k:$folderName /d:sonar.host.url="http://localhost:9000" /d:sonar.login="$sonar_login"
& 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe' /t:Rebuild /p:Configuration=Debug /p:Platform=$platform
SonarScanner.MSBuild.exe end /d:sonar.login="$sonar_login"
# SIG # Begin signature block
# SIG # End signature block
