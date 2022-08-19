import { assert, describe, expect, it } from 'vitest'
import { hello } from '../src/index'

describe('hello', () => {
    it('should respond world', () => {
        assert.equal(hello("hello"), "world");
        assert.equal(1, 1);
    })
})