import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';

import state from '@/modules/core/store/state';
import actions from '@/modules/core/store/actions';
import mutations from '@/modules/core/store/mutations';

/** Core modules imports here **/
import lang    from '@/modules/lang/store';

/** Project modules import here  **/
import app from '@/modules/app/store';

import { localStoragePlugin } from '@/modules/core/store/plugins/localStorage';

Vue.use(Vuex);
const dataState = createPersistedState({
  paths: ['app.auth','app.bookappointment'],
})
const store = new Vuex.Store({
  plugins: [dataState],
  state: { core: state },
  modules: {
    lang, app,
  },
  mutations: {
    ...mutations,
  },
  actions: {
    ...actions,
  },

});

export default store;
