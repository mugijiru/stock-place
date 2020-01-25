<template lang='pug'>
section
  h3 場所はどこ?
  button(@click='$router.push({ path: "/add-place" })') 場所を追加
  ul
    li(v-for='place in sortedPlaces' :key='place.id')
      button(@click='set(place.id)') {{ place.name }}
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'

export default {
  created() {
    this.fetchPlaces()
  },

  computed: {
    ...mapGetters('places', { places:  'all', sortedPlaces: 'orderDesc' })
  },

  methods: {
    ...mapActions('places', { fetchPlaces: 'fetch' }),
    ...mapMutations('placeEvaluation', ['setPlaceId']),

    set(placeId) {
      this.setPlaceId({placeId})
      this.$router.push('select-visited-on')
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
