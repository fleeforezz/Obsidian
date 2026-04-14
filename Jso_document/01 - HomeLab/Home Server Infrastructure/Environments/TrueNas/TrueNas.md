## 🗃️ Truenas Scale (Storage Server)

### SlowZ1
Storage Name: SlowZ1  
6x500GB HDD drives
Usable Capacity: 1.74TiB
Duty: Store Main Server data

|     | Size   | Tranfer Mode | Serial                 | Model                  | Rotation | Type | HDD Standby |
| --- | ------ | ------------ | ---------------------- | ---------------------- | -------- | ---- | ----------- |
| sda | 500GiB | Auto         | WD-WCC6Z6ZV948N        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdb | 500GiB | Auto         | WD-WCC2EEZ70231        | WDC_WD5000AAKX-60U6AA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdc | 500GiB | Auto         | WD-WCC6Z4DDXC7R        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdd | 500GiB | Auto         | WD-WCC6Z1AFFDVL        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sde | 500GiB | Auto         |                        |                        | 7200 RPM | HDD  | ALWAYS ON   |
| sdf | 500GiB | Auto         | WDC_WD5000AZLX-60K2TA0 | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |

### Slow3T
Storage Name: Slow3T
1x3TB HDD drives
Usable Capacity: 2.73TiB
Duty: Store backup files for SlowZ1 and Proxmox VMs/LXC

|     | Size | Tranfer Mode | Serial          | Model                | Rotation | Type | HDD Standby |
| --- | ---- | ------------ | --------------- | -------------------- | -------- | ---- | ----------- |
| sda | 3TB  | Auto         | WD-WCC4N7VCZXDJ | WDC_WD30PURX-64P6ZY0 | 5400 RPM | HDD  | ALWAYS ON   |

