import fetchSpecialist from '@/modules/app/modules/specialist/http/api/initProfile'
import state from './state';

const defaults = state;

export default {
    // updateMultisearch({ commit, state }, data) {
    //     commit('SET_SEARCH_SPECIALIST_STATE', { multisearch: { ...state.SearchSpecialist.multisearch, ...data } })
    // },
    //
    // updatePaginationAction({ commit, state }, pagination) {
    //     commit('SET_SEARCH_SPECIALIST_STATE', { pagination: { ...state.SearchSpecialist.pagination, ...pagination }})
    // }

    updateFromTime({ commit }, from) {
        console.log('FORM FETHCHCHCH', from)
        commit('SET_BOOK_SPECIALIST_STATE', { from });
    },

    updateSelectedReason({ commit }, reason) {
        commit('SET_BOOK_SPECIALIST_STATE', { reason });
    },

    updateProfile({ commit }, profile) {
        commit('SET_BOOK_SPECIALIST_STATE', { profile })
    },

    updateSchedule({ commit }, schedule) {
        commit('SET_BOOK_SPECIALIST_STATE', { schedule })
    },

    fetchSpecialistAction({ commit, state }, specialistId) {
        return fetchSpecialist(specialistId).then((response) => {
            console.log('BOOK_SPEC_RESPONSE::', response)
            commit('SET_BOOK_SPECIALIST_STATE', { specialist: response })
            return response;
        })
    }
};
