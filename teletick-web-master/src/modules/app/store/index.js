import appModules from '@/modules/app/modules';

import state     from './state';
import actions   from './actions';
import mutations from './mutations';
import getters   from './getters';


const store = {
    namespaced: true,
    state    : { ...state },
    modules  : { ...appModules },
    mutations: {
        ...mutations,
    },
    actions  : {
        ...actions,
    },
    getters  : {
        ...getters
    },
    plugins  : []
};

export default store;
