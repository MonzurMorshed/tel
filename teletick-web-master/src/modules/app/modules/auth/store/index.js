import state                  from './state';
import actions                from './actions';
import mutations              from './mutations';
import getters                from './getters';
import { localStoragePlugin } from "@/modules/core/store/plugins/localStorage";


const store = {
    namespaced: true,
    state    : { ...state },
    mutations: {
        ...mutations,
    },
    actions  : {
        ...actions,
    },
    getters  : {
        ...getters
    },
};

export default store;
