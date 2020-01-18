<template lang='pug'>
section
  h3 いついった?
  input#place_evaluation_visited_on.c-input(type='date' @change='set($event)')
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  methods: {
    ...mapMutations('placeEvaluation', ['setVisitedOn']),

    set(event) {
      this.setVisitedOn({visitedOn: event.target.value})
      this.$router.push('place-evaluation-form')
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
