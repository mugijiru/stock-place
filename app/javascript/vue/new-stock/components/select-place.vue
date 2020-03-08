<template lang='pug'>
section.v-select-place
  .p-content-header
    h3.p-content-header__title 場所はどこ?
    button.c-button(@click='showNewPlaceModal') 新規登録

  .p-selectable-places
    .p-selectable-places__header
      span この中にある?
      form.p-selectable-places__search
        input.p-selectable-places__search-input(placeholder='検索')
    ul.p-selectable-places__list
      li.p-selectable-places__item(v-for='place in sortedPlaces' :key='place.id')
        button.p-selectable-places__select-button(@click='set(place.id)') {{ place.name }}
  modal(name='new-place-modal')
    add-place( @fetch-places='fetchPlaces()')
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'
import 'vue-thin-modal/dist/vue-thin-modal.css'
import AddPlace from './add-place'

export default {
  components: {
    AddPlace
  },

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
      this.$emit('scroll-next')
    },

    showNewPlaceModal() {
      this.$modal.push('new-place-modal')
    }
  }
};
</script>

<style lang='scss' scoped>
.v-select-place {
  display: grid;
  grid-template-columns: 1fr;
  grid-row-gap: 20px;
}

.p-selectable-places {
  &__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 40px;
    padding: 0 10px;
    line-height: 40px;
    color: #fff;
    background-color: #5288bc;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
  }

  &__search-input {
    width: 180px;
    height: 24px;
    padding: 0 15px;
    font-size: 14px;
    color: #111;
    background-color: #fff;
    border-radius: 24px;

    &::placeholder {
      color: #999;
    }
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
