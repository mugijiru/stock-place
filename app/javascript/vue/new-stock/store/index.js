import Vue from 'vue'
import Vuex from 'vuex'
import places from './modules/places'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    places
  },
  strict: debug
})
