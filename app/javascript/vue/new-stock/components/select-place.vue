<template lang='pug'>
section
  h3 場所はどこ?
  ul
    li(v-for='place in sortedPlaces' :key='place.id')
      button(@click='setPlaceId(place.id)') {{ place.name }}
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  created() {
    this.fetchPlaces()
  },

  computed: {
    ...mapGetters('places', { places:  'all' }),

    sortedPlaces() {
      const tmp = this.places.concat();
      tmp.sort((a, b) => a.id < b.id)
      return tmp
    }
  },

  methods: {
    ...mapActions('places', { fetchPlaces: 'fetch' }),

    setPlaceId(placeId) {
      this.$parent.placeId = placeId
      this.$router.push('select-visited-on')
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
