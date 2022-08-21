import { assert, describe, expect, it } from 'vitest'
import { DashUtils } from '../src/index';

describe('can load multiple', () => {
    it('should respond world', () => {

        assert.equal(DashUtils.increment(), 41)
        assert.equal(DashUtils.increment(), 42)
        assert.equal(DashUtils.subobject.decrement(), 41)
        // assert.equal(1, 1);
    })
})