import AddCalendarActions from './AddCalendar/actions';

import initProfile from "@/modules/app/modules/specialist/http/api/initProfile";

export default {
    ...AddCalendarActions,

    productsInit: async function ({ state, commit, getters }) {
        // getProducts().then((response) => {
        //     commit('SET_PRODUCT_LIST', response.resource);
        // }).finally(() => state.loading = true);
    },

    // initProfile: async function({ state, commit }, id) {
    //     initProfile(id).then(profile => {
    //         commit('INIT_PROFILE', profile);
    //     })
    // }
}
