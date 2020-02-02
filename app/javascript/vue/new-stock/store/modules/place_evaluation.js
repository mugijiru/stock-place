import axios from 'libs/axios';

const state = {
  placeId: null,
  visitedOn: null,
  point: null,
  pointOptions: {
    no_good: 'もう行かない',
    no_comment: 'ノーコメント',
    not_bad: 'たまにはいいかも',
    good: 'また行きたい'
  }
}

const getters = {
  getPlaceId:   state => state.placeId,
  getVisitedOn: state => state.visitedOn,
  getPoint:     state => state.point,
  getPointText: state => state.point ? state.pointOptions[state.point] : '',
  getPlaceName: (state, getters, rootState, rootGetters) => {
    const place = rootGetters['places/all'].find(element => element["id"] === getters.getPlaceId)
    return place ? place.name : '指定なし'
  },
  pointOptions: state => state.pointOptions
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
