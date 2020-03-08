<template lang='pug'>
section.p-section-card
  .p-section-card__header.p-content-header
    h2.p-content-header__title New stock
  .p-section-card__content.new-stock-content
    .a-2-columns
      section.form-section
        SelectPlace(@scroll-next='scrollTo("select-visited-on")')
        SelectVisitedOn#select-visited-on(@scroll-next='scrollTo("set-point")')
        PlaceEvaluationForm#set-point
      section.current-data-section
        .p-content-header
          h3.p-content-header__title 入力内容
        dl.current-data
          dt.current-data__title 場所
          dd.current-data__definition {{ placeName }}
          dt.current-data__title 訪問日
          dd.current-data__definition {{ visitedOn }}
          dt.current-data__title 評価
          dd.current-data__definition {{ evaluationText }}

        section(v-if='errors.length > 0')
          h4 入力エラーがありました
          ul.errors
            li(v-for='error in errors') {{ error }}
    ul.p-button-group
      li
        a.c-button(href='/stocks') キャンセル
      li
        button.c-button.c-button--primary(type='submit' @click='submit') 保存する
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'
import SelectPlace from './components/select-place'
import SelectVisitedOn from './components/select-visited-on'
import PlaceEvaluationForm from './components/place-evaluation-form'

export default {
  components: {
    SelectPlace,
    SelectVisitedOn,
    PlaceEvaluationForm
  },

  computed: {
    ...mapGetters('placeEvaluation', {
      placeName: 'getPlaceName',
      visitedOn: 'getVisitedOn',
      evaluationText: 'getEvaluationText'
    }),

    ...mapGetters('errors', { errors: 'all' })
  },

  methods: {
    ...mapActions('placeEvaluation', { registerEvaluation: 'register' }),
    ...mapMutations('errors', ['setErrors']),

    submit() {
      this.registerEvaluation().then(_ => {
        location.href = '/stocks'
      }).catch(error => {
        this.setErrors(error.response.data)
        window.scrollTo(0, 0)
      })
    },

    scrollTo(anchor) {
      window.location.hash = anchor
    }
  }
};
</script>

<style lang='scss' scoped>
.new-stock-content {
  display: grid;
  grid-template-columns: 1fr;
  grid-row-gap: 30px;
}

.a-2-columns {
  display: grid;
  grid-template-columns: 2fr 1fr;
}

.form-section {
  display: grid;
  grid-template-columns: 1fr;
  grid-row-gap: 30px;
}

.current-data-section {
  padding-left: 30px;
  margin-left: 30px;
  border-left: 1px solid #000;
}

.current-data {
  display: grid;
  grid-template-columns: auto 1fr;
  grid-gap: 5px 10px;
  align-items: center;
  margin-top: 20px;

  &__title {
    font-size: 12px;
    font-weight: bold;
    color: #111;
  }

  &__definition {
    font-size: 14px;
  }
}

.errors {
  font-size: 12px;
  color: #f00;
}


</style>
