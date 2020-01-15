<template lang='pug'>
section
  h3 これでいい?
  button(@click='submit') OK
</template>

<script>
export default {
  methods: {
    submit() {
      this.$parent.submit().then(_ => {
        location.href = '/stocks'
      })
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
