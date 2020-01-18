import Vue from 'vue'
import Vuex from 'vuex'
import places from './modules/places'
import placeEvaluation from './modules/place_evaluation'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    places,
    placeEvaluation
  },
  strict: debug
})
