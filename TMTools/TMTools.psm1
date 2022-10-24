function Get-TMRemoteListeningConfiguration {
    [CmdletBinding()]
    param (

        [Parameter(ValueFromPipeline = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("CN")]
        [string[]]$ComputerName,

        [string]$ErrorLog
    )
    Begin {
        #not used
    }

    process {

        $ports = 22, 5985, 5986
        foreach ($computer in $ComputerName) {
            foreach ($port in $ports) {
                Test-NetConnection -port $port -ComputerName $computer |
                Select-Object ComputerName, RemotePort, TCPTestSucceeded
            } #foreach
        } #foreach
        #TODO
        #better output
        #error handling and logging

    } #process

    End {
        #not used
    }

} #function Get-TMRemoteListeningConfiguration