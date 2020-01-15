<template lang='pug'>
section
  h3 場所はどこ?
  ul
    li(v-for='place in sortedPlaces' :key='place.id') {{ place.name }}

  section.p-button-group
    button.c-button 次へ
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      places: []
    }
  },

  created() {
    axios.get('/api/v1/places').then(response => { this.places = response.data })
  },

  computed: {
    sortedPlaces() {
      const tmp = this.places.concat();
      tmp.sort((a, b) => a.id < b.id)
      return tmp
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
