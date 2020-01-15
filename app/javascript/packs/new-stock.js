import Vue from 'vue'
import VueRouter from 'vue-router'
import App from '../vue/new-stock/application.vue'
import router from '../vue/new-stock/routes'

Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    router,
    render: h => h(App)
  })
})
