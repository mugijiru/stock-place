<template lang='pug'>
section.v-select-visited-on
  .p-content-header
    h3.p-content-header__title いついった?

  input#place_evaluation_visited_on.c-input(type='date' :max='today' @change='set($event)')
</template>

<script>
import dayjs from 'dayjs'
import { mapMutations } from 'vuex'

export default {
  computed: {
    today() {
      return dayjs().format('YYYY-MM-DD')
    }
  },

  methods: {
    ...mapMutations('placeEvaluation', ['setVisitedOn']),

    set(event) {
      this.setVisitedOn({visitedOn: event.target.value})
      this.$emit('scroll-next')
    }
  }
};
</script>

<style lang='scss' scoped>
.v-select-visited-on {
  display: grid;
  grid-template-columns: 1fr;
  grid-row-gap: 20px;
}
</style>
