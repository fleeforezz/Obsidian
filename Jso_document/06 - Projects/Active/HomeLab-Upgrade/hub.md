---
tags:
  - project
status: active
started: 2026-05-12
deadline:
next-action:
---
# Upgrade infrastructure

## Goal
+ The system must be scalable when services grow.
+ The system must be reliable while using, zero downtime when scale or migrate.
+ The system must have backups so if there are any lost, the backup server can recover old data.
+ The system must have a dashboard for monitoring system like usage, temperature, docker logs, system logs, access logs.

## Why this matters
+ After a period of time, i add more services to our server so its keep getting messy and unorganize, so i have to ensure that newer services have enough space to work without setup again. 
+ While migration processing, i have to turn off or remove the old one in order to fire up a new version of a service. It force the user to wait a couple of minutes in order to see a service online again.
+ Since the system still missing backup job, Truenas replication hasn't tested yet so the data backup job not fully functional.
+ For a long term using the system, i have to make sure everything working correctly and consistency, by logging all the system temperature, collect metrics from every single server and centralize it with promethues, a Grafana dashboard will display all the metrics.

## Status
active

## Tasks
- [ ] 
- [ ] 
- [ ] 

## Blocked on
Anything stopping progress right now. Delete if nothing.

## Notes & decisions
→ 

## Resources
- [[]]

## Progress log
- 2026-05-12 — project started