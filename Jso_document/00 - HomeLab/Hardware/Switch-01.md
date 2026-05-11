---
tags:
  - homelab
  - hardware
  - network
type: switch
status: active
location: rack-u3
last-updated: 2026-05-11
---

# TP-Link Switch

## Identity
- Manufacturer: TP-Link
- Model: TL-SG1005D
- Serial number: no info
- Purchase date: no info
- Warranty expires: no info
- Purchased from: no info

## Specs
- Ports: x5 RJ45 Gigabit 
- Management: unmanaged
- VLan Support: no support
- Power: none |  no Poe

## Port map
+ Port position start next to the power plug  

| Port | Device      | Speed | Notes                     |
| ---- | ----------- | ----- | ------------------------- |
| 1    | router-main | 1Gbps | Uplink to                 |
| 2    | server-main | 1Gbps | Uplink to [[Server-Main]] |
| 3    | -- empty -- | --    | --                        |
| 4    | -- empty -- | --    | --                        |
| 5    | -- empty -- | --    | --                        |
## Physical
- Location: metal rack, top of the rack
- Mounted: self mount
- Power: plugged into [[PDU]] socket 1

## Access
- SSH: `ssh user@192.168.x.x`
- Web UI: 
- IPMI / iDRAC / iLO: 

## Maintenance log
| Date | Action |
|------|--------|
| 2026-05-11 | Added to HomeLab |

## Notes
Quirks, known issues, things to watch.