import { parse } from "https://deno.land/x/plist/mod.ts";

async function readInfoPlist(filePath: string): Promise<void> {
    try {
        const data = await Deno.readTextFile(filePath);
        const plistData = parse(data);
        console.log(plistData['CFBundleIdentifier']);
    } catch (e) {
        console.error(`Error reading the Info.plist file: ${e}`);
    }
}

const filePath = '/Applications/Cursor.app/Contents/Info.plist';  
const result = await readInfoPlist(filePath);
