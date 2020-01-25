import { shallowMount } from '@vue/test-utils'
import AddPlace from 'vue/new-stock/components/add-place'

describe('AddPlace', () => {
  const wrapper = shallowMount(AddPlace)

  it('has a button', () => {
    expect(wrapper.contains('button')).to.equal(true)
  })
})
