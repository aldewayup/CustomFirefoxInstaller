#define MyAppName "Firefox Installer"
#define MyAppVersion "1.0"
#define MyAppExeName "installer.ps1"
#define MyOutputBaseName "FirefoxInstallerSetup"

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={pf}\{#MyAppName}
OutputBaseFilename={#MyOutputBaseName}
Compression=lzma2/ultra64
SolidCompression=yes
PrivilegesRequired=admin

[Files]
Source: "{#MyAppExeName}"; DestDir: "{app}"

[Code]
function NextButtonClick(CurPage: Integer): Boolean;
var
  ResultCode: Integer;
begin
  if CurPage = wpReady then
  begin
    Exec(ExpandConstant('powershell'), '-ExecutionPolicy Bypass -NoProfile -File "{app}\{#MyAppExeName}"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Result := False;
  end
  else
    Result := True;
end;
