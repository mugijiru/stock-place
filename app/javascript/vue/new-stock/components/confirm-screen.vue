<template lang='pug'>
section
  .p-content-header
    h3.p-content-header__title これでいい?
  button.c-button(@click='submit') OK
</template>

<script>
import { mapMutations, mapActions } from 'vuex'

export default {
  methods: {
    ...mapActions('placeEvaluation', { registerEvaluation: 'register' }),
    ...mapMutations('errors', ['setErrors']),

    submit() {
      this.registerEvaluation().then(_ => {
        location.href = '/stocks'
      }).catch(error => {
        this.setErrors(error.response.data)
        this.$router.push({ path: '/' })
      })
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
