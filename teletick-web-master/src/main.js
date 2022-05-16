import Vue   from 'vue';
import App   from './modules/app/App.vue';
import store from './modules/core/store';

import { sync } from 'vuex-router-sync';
import { router } from './modules/http';


// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';


Vue.config.productionTip = false;
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';

import VueMeta from 'vue-meta'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import AppLoader from "@/modules/app/modules/layout/components/AppLoader";


// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

Vue.use(VueMeta)
Vue.component('AppLoader', AppLoader);

import moment from 'moment';

import 'leaflet/dist/leaflet.css';

//styles
import '@/assets/scss/style.scss';
import '@/assets/scss/fontawesome-all.min.css';
import '@/assets/scss/custom-clipboard.css';
import '@/assets/scss/switches.css';
import '@/assets/scss/theme-checkbox-radio.css';
import '@/assets/scss/specialist_res.css';

import $ from 'jquery';
window.jQuery = window.$ = $;


sync(store, router);

Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('DD MMM Y')
  }
});

Vue.filter('formatDateTime', function(value) {
  if (value) {
    return moment(String(value)).format('H : m A')
  }
});

new Vue({
  store,
  router,
  render: (h) => h(App),
}).$mount('#app');
