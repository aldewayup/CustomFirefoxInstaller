
$manifest = @"
<?xml version='1.0' encoding='UTF-8' standalone='yes'?>
<assembly xmlns='urn:schemas-microsoft-com:asm.v1' manifestVersion='1.0'>
  <trustInfo xmlns='urn:schemas-microsoft-com:asm.v3'>
    <security>
      <requestedPrivileges>
        <requestedExecutionLevel level='requireAdministrator' uiAccess='false' />
      </requestedPrivileges>
    </security>
  </trustInfo>
</assembly>
"@

$bytes = [System.Text.Encoding]::Unicode.GetBytes($manifest)
Add-Type -TypeDefinition $bytes -ReferencedAssemblies System.Runtime.InteropServices


Write-Host "Installing Firefox..."
Start-Process -FilePath "FirefoxSetup.exe" -ArgumentList "/S" -Wait
Write-Host "Firefox installation completed."

Write-Host "Downloading additional files..."
Invoke-WebRequest -Uri "https://mirror.rasanegar.com/videolan/vlc/3.0.18/win64/vlc-3.0.18-win64.msi" -OutFile "additionalfile.msi"
Write-Host "Additional files downloaded."

Write-Host "Installing additional files..."
Start-Process -FilePath "additionalfile.msi" -Wait
Write-Host "Additional files installation completed."

Write-Host "Installation process finished."
Read-Host "Press Enter to exit"
