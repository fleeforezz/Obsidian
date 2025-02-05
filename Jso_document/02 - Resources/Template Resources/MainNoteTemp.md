<%*
const timestamp = moment().format("YYYY-MM-DD");
const hasTitle = !tp.file.title.startsWith("New Note");
let noteName;

if (!hasTitle) {
    // Only prompt once and validate input
    noteName = await tp.system.prompt("Enter note name");
    
    if (noteName) {
        noteName = `${noteName} ${timestamp}`;
        await tp.file.rename(noteName);
    } else {
        // Handle case when user cancels or enters empty string
        noteName = `Untitled ${timestamp}`;
        await tp.file.rename(noteName);
    }
} else {
    noteName = tp.file.title;
}

await tp.file.move("/00 - Notes/L i f e 2.0/" + noteName)
_%>