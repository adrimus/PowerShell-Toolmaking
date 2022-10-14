function Get-TMRemoteListeningConfiguration {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(ValueFromPipeline)]
        [string[]]
        $ComputerName="localhost",

        # Parameter help description
        [Parameter()]
        [string]
        $ErrorLog
    )
        
    process {
        $ports = 22,5985,5986
        foreach ($computer in $ComputerName) {
            foreach ($port in $ports) {
                Test-NetConnection -port $port -ComputerName $computer |
                Select-Object ComputerName,RemotePort,TCPTestSucceeded
            } #foreach
        } #foreach
        #TODO
        #better output
        #error handling and logging
    } #process

} #function Get-TMRemoteListeningConfiguration