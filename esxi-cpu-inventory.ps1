
param(
    [Parameter(Mandatory=$true)][string]$server
)
Connect-VIServer -Server $server -Protocol https -WarningAction 0 | out-null;
$cpuTotalAssigned=0;
$cpuTotalAssignedPowered=0;
$cpuTotalAvailable=0;
foreach($cpu in (Get-VM | Select PowerState, NumCPU))
{
    $cpuTotalAssigned += [convert]::ToInt32($cpu.NumCpu);
    if($cpu.PowerState -eq "PoweredOn")
    {
        $cpuTotalAssignedPowered += [convert]::ToInt32($cpu.NumCpu);
    }

}
$hostDetail=(get-vmhost | select NumCPU, HyperthreadingActive);
if($hostDetail.HyperthreadingActive)
{
    $cpuTotalAvailable = $hostDetail.NumCpu * 2; 

}
else
{
    $cpuTotalAvailable = $hostDetail.NumCpu;
}

Write-Host "Host $server has $cpuTotalAssignedPowered vCPU's assigned to running VM's, out of $cpuTotalAvailable cores available. The number of total vCPU's assigned is $cpuTotalAssigned."

Disconnect-VIServer -Confirm:$false