import VueRouter from 'vue-router'
import SelectPlace from './components/select-place'
import PlaceEvaluationForm from './components/place-evaluation-form'

const routes = [
  { path: '/', redirect: '/select-place' },
  { path: '/select-place', component: SelectPlace },
  { path: '/place-evaluation-form', component: PlaceEvaluationForm }
]

const router = new VueRouter({ routes })

export default router
