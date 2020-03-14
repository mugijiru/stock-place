import axios from 'libs/axios';

const state = {
  visitedPlaceId: null,
  visitedOn: null,
  evaluation: null,
  evaluationOptions: {
    no_good: 'もう行かない',
    no_comment: 'ノーコメント',
    not_bad: 'たまにはいいかも',
    good: 'また行きたい'
  }
}

const getters = {
  getVisitedPlaceId: state => state.visitedPlaceId,
  getVisitedOn:      state => state.visitedOn,
  getEvaluation:     state => state.evaluation,
  getEvaluationText: state => state.evaluation ? state.evaluationOptions[state.evaluation] : '',
  getPlaceName:      (state, getters, rootState, rootGetters) => {
    const place = rootGetters['places/all'].find(element => element["id"] === getters.getVisitedPlaceId)
    return place ? place.name : '指定なし'
  },
  evaluationOptions: state => state.evaluationOptions
}

const actions = {
  register({state}) {
    return new Promise((resolve, reject) => {
      axios.post('/api/v1/visited_place_reports',
                 { visited_place_report: { visited_place_id: state.visitedPlaceId, visited_on: state.visitedOn, evaluation: state.evaluation }}).
        then(response => resolve(response.data)).
        catch(error => reject(error))
    })
  }
}

const mutations = {
  setVisitedPlaceId(state, payload) { state.visitedPlaceId = payload.visitedPlaceId },
  setVisitedOn(state, payload)      { state.visitedOn = payload.visitedOn },
  setEvaluation(state, payload)     { state.evaluation = payload.evaluation }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
