<template lang='pug'>
section.p-section-card
  .p-section-card__header.p-content-header
    h2.p-content-header__title New stock
  .p-section-card__content.a-2-columns
    router-view
    section.current-data-section
      .p-content-header
        h3.p-content-header__title 入力内容
      dl.current-data
        dt.current-data__title 場所
        dd.current-data__definition {{ placeName }}
        dt.current-data__title 訪問日
        dd.current-data__definition {{ visitedOn }}
        dt.current-data__title 評価
        dd.current-data__definition {{ point }}
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('placeEvaluation', {
      placeName: 'getPlaceName',
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

.current-data-section {
  padding-left: 30px;
  margin-left: 30px;
  border-left: 1px solid #000;
}

.current-data {
  display: grid;
  grid-template-columns: auto 1fr;
  grid-gap: 5px 10px;
  align-items: center;
  margin-top: 20px;

  &__title {
    font-size: 12px;
    font-weight: bold;
    color: #111;
  }

  &__definition {
    font-size: 14px;
  }
}


</style>
