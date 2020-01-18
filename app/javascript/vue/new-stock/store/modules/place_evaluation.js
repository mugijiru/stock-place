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

const actions = {}

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
