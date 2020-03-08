<template lang='pug'>
  form.p-search-places(@submit.prevent='search')
    input.p-search-places__input(v-model='searchWord' placeholder='検索')
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return { searchWord: '' }
  },

  methods: {
    ...mapActions('places', { searchPlaces: 'search' }),

    search() {
      this.searchPlaces(this.searchWord)
    }
  }
};
</script>

<style lang='scss' scoped>
.p-search-places {
  &__input {
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
}
</style>
