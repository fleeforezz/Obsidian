---
cssclasses:
  - dashboard
banner: https://img.notionusercontent.com/ext/https%3A%2F%2Fi.imgur.com%2FT4TdY8g.gif/size/?exp=1738655907&sig=wP_5QuxzKRZ-vPfQHPBPPLIBNX3SVz2qfaIYLxbCoX0
content-start: "270"
banner-display: cover
banner-fade: "-2"
banner-height: "310"
---
---
+ [<svg xmlns="http://www.w3.org/2000/svg" color="#f2cb84" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-book-text"><path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H19a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20"/><path d="M8 11h8"/><path d="M8 7h6"/></svg><span style="color:#f2cb84"> Library</span>](🔖%20Library.md)
+ [<svg xmlns="http://www.w3.org/2000/svg" color="#d85554" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-book-open-check"><path d="M12 21V7"/><path d="m16 12 2 2 4-4"/><path d="M22 6V4a1 1 0 0 0-1-1h-5a4 4 0 0 0-4 4 4 4 0 0 0-4-4H3a1 1 0 0 0-1 1v13a1 1 0 0 0 1 1h6a3 3 0 0 1 3 3 3 3 0 0 1 3-3h6a1 1 0 0 0 1-1v-1.3"/></svg><span style="color:#d85554"> Moc Test</span>](03%20-%20Study/FPTU/MOC%20Test)
+  [<svg xmlns="http://www.w3.org/2000/svg" color="#b4f4f6" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-check"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/><path d="m9 16 2 2 4-4"/></svg><span style="color:#b4f4f6"> Tasks Board</span>](04%20-%20Tasks%20Board/FPTU%20board)
---
<iframe src="https://flocus.com/online-flip-clock/" width="100%" height="300px"></iframe>

---
+ #### <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-notebook-pen"><path d="M13.4 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-7.4"/><path d="M2 6h4"/><path d="M2 10h4"/><path d="M2 14h4"/><path d="M2 18h4"/><path d="M21.378 5.626a1 1 0 1 0-3.004-3.004l-5.01 5.012a2 2 0 0 0-.506.854l-.837 2.87a.5.5 0 0 0 .62.62l2.87-.837a2 2 0 0 0 .854-.506z"/></svg> notebook 
`$=dv.list(dv.pages('"00 - Notes"').filter(f => f.file.path.startsWith("00 - Notes/") && !f.file.path.startsWith("00 - Notes/Quick Note/")).sort(f => f.file.mtime.ts, "desc").limit(10).file.link)`
`button-notebook`

---
+ #### <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-percent"><line x1="19" x2="5" y1="5" y2="19"/><circle cx="6.5" cy="6.5" r="2.5"/><circle cx="17.5" cy="17.5" r="2.5"/></svg> recent file updated
`$=dv.list(dv.pages('"03 - Study/FPTU"').sort(f=> f.file.mtime.ts,"desc").limit(5).file.link)` 

+ #### <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chart-area"><path d="M3 3v16a2 2 0 0 0 2 2h16"/><path d="M7 11.207a.5.5 0 0 1 .146-.353l2-2a.5.5 0 0 1 .708 0l3.292 3.292a.5.5 0 0 0 .708 0l4.292-4.292a.5.5 0 0 1 .854.353V16a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1z"/></svg> stats
	+ File count: `$=dv.pages('"03 - Study/FPTU"').length` 
+ 
+ <iframe src="https://i.pinimg.com/originals/dd/42/ec/dd42ec4afcd65452b9d17e47cb5fae2a.gif" width="300px" height="300px"></iframe>
---
+ #### 🚨<span style="color:d12544">Do not delete this</span>🚨
```button
name 📝 Add
type note(New Note, split) template
action NoteTemplate
templater true
class add-btns
```
^button-notebook