import loginRequest from '@/modules/http/api/auth/login'
import infoRequest  from '@/modules/http/api/auth/info'
import router       from "@/modules/http/router";
import state from './state'

export default {
    login({ commit, dispatch }, payload) {
        let data = {
            login   : payload.login,
            password: payload.password,
        }

        return loginRequest(data).then((responseLogin) => {
            const token = { ...responseLogin.data };
            console.log('responseLogin', responseLogin)
            console.log('token', token)

            if (token.token.length > 0) {
                commit('SET_AUTH_STATE', { token });
            } else {
                commit('SET_AUTH_STATE', state.Auth);
            }

            return responseLogin;
        }).catch(async ({ err, response }) => {
            console.log('RESPONSE_LOGIN_ERR::response, err', response, err);
            // dispatch('setError', response.data)

        })
    },

    initUser({ commit, dispatch,  }, token) {
        return infoRequest(token).then(async (response) => {
            console.log('INIT_USER_RESPONSE', response)

            if (!response.headers['content-length']) {
                commit('SET_AUTH_STATE', {
                    token: {
                        type  : '',
                        token : '',
                        expire: '',
                    },
                    user : {
                        id: '',
                        firstname: '',
                        lastname: '',
                        type: '',
                    },
                })
            } else {
                commit('SET_AUTH_STATE', { user: { ...response.data } });
            }

            return response;
        })
    },
    clearAuthData({ commit }) {
        return commit('CLEAR_AUTH');
    }

}
