import Vue from 'vue'
import Vuex from 'vuex'
import places from './modules/places'
import report from './modules/report'
import errors from './modules/errors'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    places,
    report,
    errors
  },
  strict: debug
})
