import Vue from 'vue'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import App from '../vue/new-stock/application.vue'
import router from '../vue/new-stock/routes'
import store from '../vue/new-stock/store'

Vue.use(Vuex)
Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    router,
    store,
    render: h => h(App)
  })
})
