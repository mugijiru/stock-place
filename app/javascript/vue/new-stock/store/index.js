import Vue from 'vue'
import Vuex from 'vuex'
import places from './modules/places'
import placeEvaluation from './modules/place_evaluation'
import errors from './modules/errors'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    places,
    placeEvaluation,
    errors
  },
  strict: debug
})
