import state from "./state";

const defaults = { ...state };


export default {
    SET_AUTH_STATE(state, Auth) {
        state.Auth = { ...state.Auth, ...Auth }
    },
    LOGIN_SUCCESS(state, user) {
        state.user = user;
    },
    LOGIN_FAILURE(state) {
        state.api_token = '';
    },
    SET_API_TOKEN(state, payload) {
        state.api_token = payload;
    },
    SET_USER(state, payload) {
        state.user = payload
    },
    CLEAR_AUTH(state) {
        state.Auth = { ...state.Auth, ...defaults.Auth }
    }
}
