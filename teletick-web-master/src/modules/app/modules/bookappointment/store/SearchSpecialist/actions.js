import paginateApiRequest from '@/modules/http/api/specialist/bookappointment/paginateSpecialists';
import searchSpecialist           from "@/modules/app/modules/specialist/http/api/search";

import state              from './state';

const defaults = state;

export default {
    paginateAction({ commit, state }, { name = '', address =    '', page = 1, video = [0], perPage = 5 }) {
        // return paginateApiRequest(name, address, page, type, perPage).then((response) => {
        //     console.log('response', response);
        //     const res = {  pagination: response.pager, list: response.list };
        //
        //     commit('SET_SEARCH_SPECIALIST_STATE', res );
        //     return res
        // })
        return searchSpecialist(name, address, video, page, perPage).then(response => {
            return response
        });
    },

    updateMultisearch({ commit, state }, data) {
        commit('SET_SEARCH_SPECIALIST_STATE', { multisearch: { ...state.SearchSpecialist.multisearch, ...data } })
    },

    updatePaginationAction({ commit, state }, pagination) {
        commit('SET_SEARCH_SPECIALIST_STATE', { pagination: { ...state.SearchSpecialist.pagination, ...pagination }})
    }
};
