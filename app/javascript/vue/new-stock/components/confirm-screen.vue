<template lang='pug'>
section
  h3 これでいい?
  button(@click='submit') OK
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
