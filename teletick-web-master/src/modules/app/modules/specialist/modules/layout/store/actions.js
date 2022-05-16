export default {
    updateFooter({ commit }, footer) {
        commit('updateFooter', footer);
    },

    updateHeader({ commit }, header) {
        commit('updateHeader', header);
    },

    updateMenu({ commit }, module) {
        commit('updateMenu')
    }
}
