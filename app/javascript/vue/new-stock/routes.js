import VueRouter from 'vue-router'
import SelectPlace from './components/select-place'
import SelectVisitedOn from './components/select-visited-on'
import PlaceEvaluationForm from './components/place-evaluation-form'
import ConfirmScreen from './components/confirm-screen'

const routes = [
  { path: '/', redirect: '/select-place' },
  { path: '/select-place', component: SelectPlace },
  { path: '/select-visited-on', component: SelectVisitedOn },
  { path: '/place-evaluation-form', component: PlaceEvaluationForm },
  { path: '/confirm-screen', component: ConfirmScreen }
]

const router = new VueRouter({ routes })

export default router
