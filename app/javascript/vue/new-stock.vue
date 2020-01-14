<template lang='pug'>
  section.p-section-card
    .p-section-card__header.p-content-header
      h2.p-content-header__title New stock

    .p-section-card__content
      .p-form
        section.p-form-sectino.p-form-section--2-columns
          h3.p-form-section__title 場所
          p.p-form-section__input-group
            label.c-label
              span.c-label__text 名称
              input.c-input
          p.p-form-section__input-group
            label.c-label
              span.c-label__text 住所
              input.c-input

        section.p-form-section.p-form-section--2-columns
          h3.p-form-section__title 訪問記録
          p.p-form-section__input-group
            label.c-label
              span.c-label__text 訪問日
              input.c-input
          fieldset.p-form-section__input-group.p-fieldset
            legend.p-fieldset__legend リピートあり?
            ul.p-fieldset__list
              li.p-fieldset__list-item(v-for='(value, key) in evaluationPoints')
                label.c-radio-label
                  input.c-radio-label__radio-button(type='radio' :value='key')
                  span.c-radio-label__text {{ value }}

        section.p-button-group
          a.c-button(href='/stocks') キャンセル
          button.c-button.c-button--primary(type='submit') 保存

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
