<%*
const fullPath = tp.file.path();  // e.g. "root-folder/subfolder/file.md"
const parts = fullPath.split("/");
const rootFolder = parts.length > 1 ? parts[0] : "(root)";
tR += rootFolder;
%>

