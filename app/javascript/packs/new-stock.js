import Vue from 'vue'
import Vuex from 'vuex'
import App from '../vue/new-stock/application.vue'
import store from '../vue/new-stock/store'

Vue.use(Vuex)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    store,
    render: h => h(App)
  })
})
