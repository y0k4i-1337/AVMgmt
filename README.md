# AVMgmt
Collection of functions to manage common Antivirus services

## Example usage of functions:

### Adding exclusions to Windows Defender

```powershell
Defender-AddExclusion -Path "C:\Windows\System32"
```

### Removing exclusions from Windows Defender

```powershell
Defender-RemoveExclusion -Path "C:\Windows\System32"
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
Norton-AddExclusion -Path "C:\example\path"
McAfee-AddExclusion -Path "C:\example\path"
Bitdefender-AddExclusion -Path "C:\example\path"
Kaspersky-AddExclusion -Path "C:\example\path"
Sophos-AddExclusion -Path "C:\example\path"
TrendMicro-AddExclusion -Path "C:\example\path"
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
