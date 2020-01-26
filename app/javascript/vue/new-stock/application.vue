<template lang='pug'>
section.p-section-card
  .p-section-card__header.p-content-header
    h2.p-content-header__title New stock
  .p-section-card__content.a-2-columns
    router-view
    dl.current-data
      dt 場所ID
      dd {{ placeId }}
      dt 訪問日
      dd {{ visitedOn }}
      dt 評価
      dd {{ point }}
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('placeEvaluation', {
      placeId: 'getPlaceId',
      visitedOn: 'getVisitedOn',
      point: 'getPoint'
    })
  }
};
</script>

<style lang='scss' scoped>
.a-2-columns {
  display: grid;
  grid-template-columns: 2fr 1fr;
}

.current-data {
  padding-left: 30px;
  margin-left: 30px;
  border-left: 1px solid #000;
}
</style>
