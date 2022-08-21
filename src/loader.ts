import fs from 'fs'
import path from 'path'

const paths = [
    `../../../build/Release`,
    `../../build/Release`,
    `../build/Release`,
]

export const load = <T>(name: string) => {
    const bindingPath = paths
        .map((p) => path.resolve(__dirname, p, name))
        .filter(p => fs.existsSync(`${p}.node`))[0]
    console.log(`bindingPath: ${bindingPath}`)
    const module = require(bindingPath);
    return module as T;
}