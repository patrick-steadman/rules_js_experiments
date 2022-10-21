import { readFileSync } from "node:fs"
import { generate } from "@graphql-codegen/cli"

async function runCodeGen() {
    try {
        const contents = readFileSync(process.argv[2], { encoding: "utf8" })
        const { schemas, target, config } = JSON.parse(contents)
        await generate({
            overwrite: true,
            schema: schemas,
            generates: {
                [target]: config,
            },
        })
    } catch (e) {
        console.error(e)
        process.exit(1)
    }
}

runCodeGen()
