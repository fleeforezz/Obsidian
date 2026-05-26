---
tags:
  - homelab
  - network
  - firewall
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/pfsense_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# pfSense Firewall & Router

## Purpose
pfSense is an open-source firewall and routing platform based on FreeBSD. It is used as the primary network gateway in the homelab to handle VLAN routing, DNS resolution, VPN servers, DHCP leases, and network traffic filtering.

## Core Features & Concepts

### Interfaces
- **WAN**: Wide Area Network. Connects to your ISP modem.
- **LAN**: Local Area Network. Connects to your internal switches.
- **VLANs**: Virtual Local Area Networks. Segment the network (e.g. Management, LAN, IoT, Guest) to isolate devices.

### DNS Resolver (Unbound)
pfSense uses Unbound for DNS resolution. Custom DNS overrides can be configured directly in the DNS Resolver settings, allowing local domains (like `*.local` or `*.home`) to map to internal servers.

### Firewall Rules
Rules are processed in order from top to bottom (first match wins):
- **Default Deny**: Traffic that does not match an explicit allow rule is blocked.
- **IoT Isolation**: IoT VLANs should be blocked from reaching the management/LAN VLANs but allowed to access the Internet.

## Setup & configuration guides
- [Cấu hình pf-sense đơn giản nhất (OpenVPN)](https://vietnix.vn/cau-hinh-openvpn-tren-pfsense/?gad=1) — Step-by-step guide for setting up OpenVPN server on pfSense.

## Gotchas
- **Hardware NIC Compatibility**: pfSense is based on FreeBSD, which has limited support for newer Realtek NICs. Intel NICs (like i225/i226 or i350) are highly recommended for pfSense hosts.
- **Lockouts**: If you modify the firewall rules on the management interface and lose access to the WebGUI, use the pfSense console (via physical screen or serial port) to temporarily disable the firewall rules or reset the interface IPs.
