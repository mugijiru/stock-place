<template lang='pug'>
section
  .p-content-header
    h3.p-content-header__title どうだった?
  ul.p-fieldset__list
    li.p-fieldset__list-item(v-for='(value, key) in evaluationPoints')
      label.c-radio-label(@click='set(key)')
        input.c-radio-label__radio-button(type='radio' :value='key')
        span.c-radio-label__text {{ value }}
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  data() {
    return {
      evaluationPoints: {
        no_good: 'もう行かない',
        no_comment: 'ノーコメント',
        not_bad: 'たまにはいいかも',
        good: 'また行きたい'
      }
    }
  },

  methods: {
    ...mapMutations('placeEvaluation', ['setPoint']),

    set(point) {
      this.setPoint({point})
      this.$router.push('confirm-screen')
    }
  }
};
</script>

<style lang='scss' scoped>
</style>
