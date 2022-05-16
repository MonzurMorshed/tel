export default {
  apiInitDispatch: {
    root: true,
    handler({ commit, dispatch }) {
    },
  },

  isDropMenuActive({ commit }, active) {
    commit('updateDropMenu', { isActive: active });
  },
};
