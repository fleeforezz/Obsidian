<%*
const hasTitle = !tp.file.title.startsWith("New Note");
let noteName;

if (!hasTitle) {
    // Only prompt once and validate input
    noteName = await tp.system.prompt("Enter note name");
    
    if (noteName) {
        await tp.file.rename(noteName);
    } else {
        // Handle case when user cancels or enters empty string
        noteName = "Untitled";
        await tp.file.rename(noteName);
    }
} else {
    noteName = tp.file.title;
}

await tp.file.move("/00 - Notes/Quick Note/" + noteName)
_%>