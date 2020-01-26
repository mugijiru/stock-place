<template lang='pug'>
section
  .p-content-header
    h3.p-content-header__title これでいい?
  button.c-button(@click='submit') OK
</template>

<script>
import { mapActions } from 'vuex'

export default {
  methods: {
    ...mapActions('placeEvaluation', { registerEvaluation: 'register' }),

    submit() {
      this.registerEvaluation().then(_ => {
        location.href = '/stocks'
      })
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
