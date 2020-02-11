<template lang='pug'>
section.p-select-place
  .p-content-header
    h3.p-content-header__title 場所はどこ?

  .p-selectable-places
    .p-selectable-places__header この中にある?
    ul.p-selectable-places__list
      li.p-selectable-places__item(v-for='place in sortedPlaces' :key='place.id')
        button.p-selectable-places__select-button(@click='set(place.id)') {{ place.name }}
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'

export default {
  created() {
    this.fetchPlaces()
  },

  computed: {
    ...mapGetters('places', { places: 'all', sortedPlaces: 'orderDesc' })
  },

  methods: {
    ...mapActions('places', { fetchPlaces: 'fetch' }),
    ...mapMutations('placeEvaluation', ['setVisitedPlaceId']),

    set(visitedPlaceId) {
      this.setVisitedPlaceId({visitedPlaceId})
    }
  }
};
</script>

<style lang='scss' scoped>
.p-selectable-places {
  margin-top: 20px;

  &__header {
    width: 100%;
    height: 40px;
    padding-left: 10px;
    line-height: 40px;
    color: #fff;
    background-color: #5288bc;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
  }

  &__item {
    height: 40px;
    font-size: 13px;
    font-weight: bold;
    background: linear-gradient(180deg, #ffffff 0%, rgba(255, 255, 255, 0) 100%), #f6f6f6;
  }

  &__select-button {
    width: 100%;
    height: 100%;
    padding-left: 10px;
    text-align: left;
  }
}
</style>
