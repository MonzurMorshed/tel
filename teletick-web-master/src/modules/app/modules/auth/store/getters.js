export default {
    Auth(state) {
        return state.Auth;
    },
    isUserInit(state) {
        return !!state.Auth.user.firstname;
    },
    isTokenInit(state) {
        return !!state.Auth.token.token;
    },
    getUserType(state) {
        return state.Auth.user.type;
    }
}
