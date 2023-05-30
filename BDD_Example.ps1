
function Add-Drive {
    param(
        [Parameter(Mandatory = $true)]
        [string]$DriveLetter,

        [Parameter(Mandatory = $true)]
        [int64]$Size,

        [Parameter(Mandatory = $true)]
        [string]$ComputerName
    )

    # Here, we would usually add the drive to the remote workstation.
    # This would likely involve a series of commands, possibly involving diskpart or similar tools,
    # and would also likely need to be run with administrative privileges.
    # For the sake of this example, we'll simulate the operation with a simple output.

    return @{
        "DriveLetter" = $DriveLetter
        "Size"        = $Size
    }
}

function Get-DriveInfo {
    param(
        [Parameter(Mandatory = $true)]
        [string]$DriveLetter,

        [Parameter(Mandatory = $true)]
        [string]$ComputerName
    )

    # Here, we would usually fetch the drive information from the remote workstation.
    # This could be done with Get-WmiObject, Get-CimInstance, or similar.
    # Again, for the sake of this example, we'll simulate the operation with a simple output.

    return @{
        "DriveLetter" = $DriveLetter
        "Size"        = 60GB
    }
}
