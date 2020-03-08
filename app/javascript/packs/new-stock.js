import Vue from 'vue'
import Vuex from 'vuex'
import VueThinModal from 'vue-thin-modal'
import App from '../vue/new-stock/application.vue'
import store from '../vue/new-stock/store'

Vue.use(Vuex)
Vue.use(VueThinModal)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    store,
    render: h => h(App)
  })
})
