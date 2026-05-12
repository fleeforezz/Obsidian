---
tags: [project]
status: active
started: <% tp.date.now("YYYY-MM-DD") %>
deadline: 
next-action: 
---
# <% tp.file.title %>

## Goal
One sentence: what does done look like?

## Why this matters
Why are you doing this? What problem does it solve?

## Status
<% await tp.system.suggester(
  ["Active — in progress", "Waiting — blocked", "Paused — on hold"],
  ["active", "waiting", "paused"]
) %>

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
- <% tp.date.now("YYYY-MM-DD") %> — project started