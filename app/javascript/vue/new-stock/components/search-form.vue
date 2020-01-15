<template lang='pug'>
  label.c-label
    | {{ title }}
    input.c-input
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: false,
      default: ''
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
