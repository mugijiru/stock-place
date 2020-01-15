<template lang='pug'>
section.p-section-card
  .p-section-card__header.p-content-header
    h2.p-content-header__title New stock
  .p-section-card__content
    router-view
</template>

<script>
export default {
  data() {
    return {
      placeId: null
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
