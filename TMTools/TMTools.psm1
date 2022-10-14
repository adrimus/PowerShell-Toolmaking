function Get-TMRemoteListeningConfiguration {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(ValueFromPipeline)]
        [string[]]
        $ComputerName="localhost",

        # Parameter help description
        [Parameter(AttributeValues)]
        [string]
        $ErrorLog
    )
        
    process {
        foreach ($computer in $ComputerName) {

            $cimsession = New-CimSession sysw10m40
            Get-NetTCPConnection -CimSession $cimsession -State Listen -LocalPort 5985,5986,22 | Select-Object pscomputername,localport,state
        } #foreach
        #TODO
        #better output
        #error handling and logging
    } #process

} #function Get-TMRemoteListeningConfiguration