<template lang='pug'>
section
  h3 いついった?
  input.c-input(type='date' @change='setVisitedOn($event)')
</template>

<script>
export default {
  methods: {
    setVisitedOn(event) {
      this.$parent.visitedOn = event.target.value
      this.$router.push('place-evaluation-form')
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
