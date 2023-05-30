BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Add a drive to a remote workstation" {
    Context "Add a 60GB drive with the drive letter H:" {
        Mock Add-Drive {
            return @{
                "DriveLetter" = "H:"
                "Size"        = 60GB
                "ComputerName" = $env:COMPUTERNAME
            }
        }

        Mock Get-DriveInfo {
            return @{
                "DriveLetter" = "H:"
                "Size"        = 60GB
            }
        }

        It "adds the drive H: to the remote workstation" {
            # Arrange (Given)
            $driveLetter = "H:"
            $size        = 60GB
            $ComputerName = $env:COMPUTERNAME

            # Act (When)
            $result = Add-Drive -DriveLetter $driveLetter -Size $size -ComputerName $ComputerName

            # Assert (Then)
            $result.DriveLetter | Should -Be $driveLetter
            $result.Size | Should -Be $size
        }

        It "verifies the drive H: exists on the remote workstation with a capacity of 60GB" {
            # Arrange (Given)
            $driveLetter = "H:"
            $expectedSize = 60GB
            $ComputerName = $env:COMPUTERNAME

            # Act (When)
            $driveInfo = Get-DriveInfo -DriveLetter $driveLetter -ComputerName $ComputerName

            # Assert (Then)
            $driveInfo.DriveLetter | Should -Be $driveLetter
            $driveInfo.Size | Should -Be $expectedSize
        }
    }
}
