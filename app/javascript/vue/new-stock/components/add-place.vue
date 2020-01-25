<template lang='pug'>
  section
    h3 場所の登録
    form
      label.c-label
        span 名称
        input.c-input(name='name' v-model='name')
      label.c-label
        span 住所
        input.c-input(name='address' v-model='address')
      button.c-button(type='submit' @click.stop.prevent='save') 保存

</template>

<script>
import axios from 'axios';
if (process.env.RAILS_ENV !== 'test') {
  axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('[name="csrf-token"]').getAttribute('content')
}

import { mapActions } from 'vuex'

export default {
  data() {
    return {
      name: '',
      address: ''
    }
  },

  methods: {
    ...mapActions('places', { fetchPlace: 'fetch' }),

    save() {
      const params = { name: this.name, address: this.address }
      axios.post('/api/v1/places', { place: params }).then(_ => {
        this.fetchPlace()
        this.$router.push({ path: '/' })
      })
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
