import axios from 'axios';

const state = {
  all: []
}

const getters = {
  all: state => state.all,
  orderDesc: state => state.all.concat().sort((a, b) => a.id < b.id)
}

const actions = {
  fetch({ commit }) {
    axios.get('/api/v1/places').then(response => {
      commit('setPlaces', { places: response.data })
    })
  },

  search({ commit }, searchWord) {
    axios.get('/api/v1/places', { params: { q: searchWord } }).then(response => {
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
