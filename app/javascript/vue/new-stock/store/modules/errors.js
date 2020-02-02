const state = {
  all: []
}

const getters = {
  all: state => state.all
}

const actions = {
}

const mutations = {
  setErrors (state, payload) {
    state.all = payload.errors
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
