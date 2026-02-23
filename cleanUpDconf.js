import fs from "fs/promises"

const original = await fs.readFile("./dconf.settings", {encoding: "utf-8"})

let cleanedLines = []

original.split("\n").forEach((line) => {
    if(!line.startsWith("app-picker-layout")) {
        cleanedLines.push(line)
    }
})

await fs.writeFile("./dconf.settings",  cleanedLines.join("\n"), "utf-8")