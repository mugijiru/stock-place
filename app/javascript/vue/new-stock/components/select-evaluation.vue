<template lang='pug'>
section.v-select-evaluation
  .p-content-header
    h3.p-content-header__title どうだった?
  ul.p-fieldset__list
    li.p-fieldset__list-item(v-for='(value, key) in evaluationOptions')
      label.c-radio-label(@click='set(key)')
        input.c-radio-label__radio-button(type='radio' :value='key')
        span.c-radio-label__text {{ value }}
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'

export default {
  computed: {
    ...mapGetters('report', ['evaluationOptions'])
  },

  methods: {
    ...mapMutations('report', ['setEvaluation']),

    set(evaluation) {
      this.setEvaluation({evaluation})
    }
  }
};
</script>

<style lang='scss' scoped>
.v-select-evaluation {
  display: grid;
  grid-template-columns: 1fr;
  grid-row-gap: 20px;
}
</style>
