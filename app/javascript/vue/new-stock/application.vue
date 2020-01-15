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
import axios from 'axios';

if (process.env.RAILS_ENV !== 'test') {
  axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('[name="csrf-token"]').getAttribute('content')
}

export default {
  data() {
    return {
      placeId: null,
      visitedOn: null,
      point: null
    }
  },

  methods: {
    submit() {
      return new Promise((resolve, reject) => {
        axios.post('/api/v1/place_evaluations', { place_evaluation: { place_id: this.placeId, visited_on: this.visitedOn, point: this.point }}).then(response => {
          resolve(response.data);
        }).catch(error => {
          reject(error)
        })
      })
    }
  }
};
</script>

<style lang='scss' scoped>
.a-2-columns {
  display: grid;
  grid-template-columns: 2fr 1fr;
}

.current-data {
  border-left: 1px solid #000;
  padding-left: 20px;
}
</style>
