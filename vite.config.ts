/// <reference types="vitest" />
// Configure Vitest (https://vitest.dev/config/)

import { configDefaults, defineConfig } from 'vitest/config'

export default defineConfig({
    test: {
        exclude: [
            ...configDefaults.exclude,
            '**/build/**',
        ],
    },
})