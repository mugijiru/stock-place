<template lang='pug'>
section
  h3 どうだった?
  fieldset.p-form-section__input-group.p-fieldset
    legend.p-fieldset__legend リピートあり?
    ul.p-fieldset__list
      li.p-fieldset__list-item(v-for='(value, key) in evaluationPoints')
        label.c-radio-label
          input.c-radio-label__radio-button(type='radio' :value='key')
          span.c-radio-label__text {{ value }}
</template>

<script>
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
  }
};
</script>

<style lang='scss' scoped>
</style>
