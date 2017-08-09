# esxi-cpu-inventory
Check the total number of vCPU's assigned to virtual machines.

To use this script you have to install **_VMware vSphere PowerCLI_**.

## Usage
1. Start VMware vSphere PowerCLI
2. Navigate to the directory where you saved the script
3. Run `.\esxi-cpu-inventory.ps1 -server <server-ip>`


## Example
`PowerCLI> .\esxi_cpu_inventory.ps1 -server my-esxi.local`

`Host my-esxi.local has 1 vCPU's assigned to running VM's, out of 16 cores available. The number of total vCPU's assigned is 22.`
