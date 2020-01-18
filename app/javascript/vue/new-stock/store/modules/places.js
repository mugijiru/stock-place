import axios from 'axios';

const state = {
  all: []
}

const getters = {
  all: state => state.all
}

const actions = {
  fetch({ commit }) {
    axios.get('/api/v1/places').then(response => {
      commit('setPlaces', { places: response.data })
    })
  }
}

const mutations = {
  setPlaces (state, payload) {
    state.all = payload.places
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
