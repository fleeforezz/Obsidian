---
tags: [projects, moc]
---
# Projects dashboard

## Active

```dataview
TABLE next-action, deadline, status
FROM "06 - Projects/Active"
WHERE contains(tags, "project") AND status = "active"
SORT deadline ASC
```

## Recently archived

```dataview
TABLE started, file.mtime as completed
FROM "06 - Projects/Archive"
SORT file.mtime DESC
LIMIT 5
```
