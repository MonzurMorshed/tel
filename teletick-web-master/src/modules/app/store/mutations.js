import state from "./state";

const defaults = { ...state };


export default {
    updateTitle(state, title) {
        state.title = title;
    },
    UPDATE_LOADER(state, bool) {
        state.loading = bool;
    }
}
