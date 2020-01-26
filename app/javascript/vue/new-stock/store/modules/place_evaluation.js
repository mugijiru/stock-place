import axios from 'libs/axios';

const state = {
  placeId: null,
  visitedOn: null,
  point: null
}

const getters = {
  getPlaceId:   state => state.placeId,
  getVisitedOn: state => state.visitedOn,
  getPoint:     state => state.point
}

const actions = {
  register({state}) {
    return axios.post('/api/v1/place_evaluations', { place_evaluation: { place_id: state.placeId, visited_on: state.visitedOn, point: state.point }})
  }
}

const mutations = {
  setPlaceId(state, payload)   { state.placeId = payload.placeId },
  setVisitedOn(state, payload) { state.visitedOn = payload.visitedOn },
  setPoint(state, payload)     { state.point = payload.point }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
