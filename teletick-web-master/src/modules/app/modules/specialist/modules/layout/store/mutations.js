import state from "./state";

const defaults = { ...state };

export default {
    updateFooter(state, footer) {
        state.footer = { ...state.footer, ...footer };
    },
    updateHeader(state, header) {
        state.header = { ...state.header, ...header };
    },

    error(state, options) {
        state.error = { ...defaults.error };
    },

    clear(state) {
        state = { ...defaults };
    },
}
