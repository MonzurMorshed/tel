export default {
    updateTitle: {
        root: true,
        handler({ commit }, title) {
            commit('updateTitle', title);
        },
    },
    scrollTop: {
        root: true,
        handler({ commit }) {
            window.scroll(0, 0)
        }
    },
    pageLoading({ commit }, bool) {
        commit('UPDATE_LOADER', bool);
    },
}
