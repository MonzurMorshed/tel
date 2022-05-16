export default {
    updateLayout({ commit }, layout) {
        commit('updateLayout', layout);
    },

    scrollToTop() {
        window.scrollTo(0, 0);
    },
    updateFooter({ commit }, footer) {
        commit('updateFooter', footer);
    },

    updateHeader({ commit }, header) {
        commit('updateHeader', header);
    },
}
