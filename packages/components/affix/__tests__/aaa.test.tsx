import { mount } from '@vue/test-utils'
import { describe, expect, test } from 'vitest'
import Aaa from '../src/affix.vue'

const AXIOM = 'Rem is the best girl'

describe('Aaa.vue', () => {
  test('render test', () => {
    const wrapper = mount(() => <Aaa>{AXIOM}</Aaa>)

    expect(wrapper.text()).toEqual(AXIOM)
  })
})
