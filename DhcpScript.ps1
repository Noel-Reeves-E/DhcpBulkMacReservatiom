
do {
    Write-Host "=============================="
    Write-Host " DHCP Reservation Management"
    Write-Host "=============================="
    Write-Host "1. Add Reservation"
    Write-Host "2. Delete Reservation MAC"
    Write-Host "3. Delete all the Reservation in Scope"
    Write-Host "4. Exit"
    Write-Host "=============================="
    $choice = Read-Host "Enter your choice"
    Write-Host ""

    switch ($choice) {
        "1" {
            $File = "C:\Script\MacList.csv"
            $DhcpServer = Read-Host "Enter the DHCP Server name or IP"
            Write-Host ""
            $ScopeID    = Read-Host "Enter the DHCP Scope ID"
            Write-Host ""

            try {
                $y = Import-Csv -Path $File
            } catch {
                Write-Host "Failed to read CSV file" 
                Write-Host ""
                Write-Host ""
                exit
            }
            foreach ($x in $y) {
                $Mac = ($x.MacAddress.ToLower() -replace '(.{2})(?!$)', '$1-')
                try {
                    Add-DhcpServerv4Reservation -ComputerName $DhcpServer -ScopeId $ScopeID -IPAddress $x.IpAddress -ClientId $Mac -Name $x.Name -Description $x.Description
                    Write-Host "Successfully added the $Mac to $($x.IpAddress)"
                }
                catch {
                    Write-Host ""
                    Write-Host "Cant able to add the $Mac to $x.IpAddress"
                    Write-Host ""
                }
            }
            Write-Host ""
            Write-Host ""
        }
        "2" {
            $File = "C:\Script\MacList.csv"
            $DhcpServer = Read-Host "Enter the DHCP Server name or IP"
            Write-Host ""
            $ScopeID    = Read-Host "Enter the DHCP Scope ID"
            Write-Host ""
            try {
                $y = Import-Csv -Path $File
            } catch {
                Write-Host "Failed to read CSV file" 
                Write-Host ""
                Write-Host ""
                exit
            }
            foreach ($x in $y) {
                $Mac = ($x.DeleteMac.ToLower() -replace '(.{2})(?!$)', '$1-')
                try {
                    Remove-DhcpServerv4Reservation -ComputerName $DhcpServer -ScopeId $ScopeId -ClientId $Mac
                    Write-Host "Deleted the $Mac"
                }
                catch {
                    Write-Host ""
                    Write-Host "Failed to delete $Mac"
                    Write-Host ""
                }
            }
            Write-Host ""
            Write-Host ""
        }
        "3" {
            $File = "C:\Script\MacList.csv"
            $DhcpServer = Read-Host "Enter the DHCP Server name or IP"
            Write-Host ""
            $ScopeID    = Read-Host "Enter the DHCP Scope ID"
            Write-Host ""
            try {
                $y = Import-Csv -Path $File
            } catch {
                Write-Host "Failed to read CSV file" 
                Write-Host ""
                Write-Host ""
                exit
            }
            try {
                Remove-DhcpServerv4Reservation -ComputerName $DhcpServer -ScopeId $ScopeID
                Write-Host "Deleted all the reservation in the scope $ScopeID"
                Write-Host ""
                Write-Host ""
            }
            catch {
               Write-Host "Failed to delete the scope $ScopeID"
               Write-Host ""
               Write-Host ""
            }
        }
        "4" {
            Write-Host "Done."
            Write-Host ""
            Write-Host ""
        }
        Default {
            Write-Host "Invalid choice"
            Write-Host ""
            Write-Host ""
        }
    }
} while ($choice -ne "4")
