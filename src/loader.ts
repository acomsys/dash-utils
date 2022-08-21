import fs from 'fs'
import path from 'path'

const paths = [
    `../../../build/Release`,
    `../build/Release`,
]

let module: any | undefined = undefined;
let bindingPath: string | undefined = undefined;

export const load = <T>(name: string) => {
    if (module === undefined) {
        if (bindingPath === undefined) {
            bindingPath = paths
                .map((p) => path.resolve(__dirname, p, name))
                .filter(p => fs.existsSync(`${p}.node`))[0]
        }
        if (bindingPath) {
            module = require(bindingPath);
            console.log(`Loaded: ${bindingPath}`)
        }
        else {
            throw new Error("Unable to load: no binding path!");
        }
    }
    return module as T;
}