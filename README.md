# AVMgmt
Collection of functions to manage common Antivirus services

## Example usage of functions:

### Adding exclusions to Windows Defender

```powershell
Defender-AddExclusion -Paths "C:\inetpub\wwwroot", "C:\Windows\System32", "C:\Windows\Tasks"
```

### Removing exclusions from Windows Defender

```powershell
Defender-RemoveExclusion -Paths "C:\Windows\System32"
```

### Killing Windows Defender (remove definitions and stop service)

```powershell
Defender-Kill
```

### Listing current exclusions for Windows Defender

```powershell
Defender-ListExclusions
```

### Adding exclusions (dummy for non-CLI solutions)

```powershell
Norton-AddExclusion -Paths "C:\example\path"
McAfee-AddExclusion -Paths "C:\example\path"
Bitdefender-AddExclusion -Paths "C:\example\path"
Kaspersky-AddExclusion -Paths "C:\example\path"
Sophos-AddExclusion -Paths "C:\example\path"
TrendMicro-AddExclusion -Paths "C:\example\path"
```

### Stopping services

```powershell
Norton-Kill
McAfee-Kill
Bitdefender-Kill
Kaspersky-Kill
Sophos-Kill
TrendMicro-Kill
```
