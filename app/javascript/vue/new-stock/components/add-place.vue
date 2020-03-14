<template lang='pug'>
  section
    .p-content-header
      h3.p-content-header__title 場所の登録
    form.p-form
      section.p-form-section
        label.c-label
          span 名称
          input.c-input(name='name' v-model='name')
        label.c-label
          span 住所
          input.c-input(name='address' v-model='address')

      .p-button-group
        a.c-button(type='submit' @click.stop.prevent='close') キャンセル
        button.c-button.c-button--primary(type='submit' @click.stop.prevent='save') 保存

</template>

<script>
import axios from 'libs/axios';
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      name: '',
      address: ''
    }
  },

  methods: {
    close() {
      this.$modal.pop()
    },

    save() {
      const params = { name: this.name, address: this.address }
      axios.post('/api/v1/visited_places', { visited_place: params }).then(_ => {
        this.$emit('fetch-places')
        this.close()
      })
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
