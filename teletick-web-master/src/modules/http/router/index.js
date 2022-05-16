import Vue       from 'vue';
import VueRouter from 'vue-router';
import routes    from './routes';

import store             from '@/modules/core/store'
import { RouterService } from '@/modules/http/service/router';

Vue.use(VueRouter);

/**
 * The Router instance containing all the routes for the application.
 */
const router = new VueRouter({
    base: '/',
    scrollBehavior() {
        return { x: 0, y: 0 };
    },
    mode  : 'history', // <-- uncomment to turn on history mode (preferred)
    routes: routes.map((route) => ({
        name     : route.name,
        path     : route.path,
        component: route.component,
        children : route.children,
        /**
         * Run this callback before resolve the routing
         */
        beforeEnter: (to, from, next) => {
            const routerService = new RouterService(router.app.$options.store, router);

            // routerService.route = route;

            routerService.updateTitle(route.title).updateLayout(route.layout);

            // const Auth = store.getters["app/auth/Auth"];
            let requiresAuth = route.meta?.requiresAuth || false;

            const isClientRoute = route.path.includes('client');

            const isSpecialistRoute = route.path.includes('specialist');

            routerService.setRequireAuth(requiresAuth);

            console.log('route.path.includes(\'login\')', route.path.includes('login'))
            if (route.path.includes('login') && routerService.isAuthenticated()) {
                router.push({ name: `${ routerService.getters.userType }.dashboard` })
            }
            // console.log('isTokenInit', isTokenInit)
            // console.log('isUserInit', isUserInit)

            // if (isTokenInit === false) {
            //     store.dispatch('app/auth/clearAuthData');
            // }

            if (requiresAuth === true) {

            }

            // if (isTokenInit === true && isUserInit === true) {
            // }

            // if ((isSpecialistRoute || isClientRoute) && requiresAuth === true) {
            //     if (isTokenInit === true) {
            //         if (isUserInit === false) {
            //             store.dispatch('app/auth/initUser');
            //         }
            //
            //         return router.push({ name: `${Auth.user.type}.dashboard` })
            //     } else {
            //         store.dispatch('app/auth/clearAuthData')
            //         return router.push({ name: 'login' })
            //     }
            // }
            // router.app.$options.store.dispatch('updateTitle', route.title);
            // router.app.$options.store.dispatch('app/layout/updateLayout', route.layout);

            /**
             * Comment if login check disable
             */
            // if (Auth.token?.length > 0 && requiresAuth === true) {
            //     return next('/login');
            // }
            next();
        },
    })),
});

// const routerService = new RouterService(router.app.$options.store);

router.beforeEach((to, from, next) => {
    console.log('BEFORE___EACH_ROUTE')

    store.dispatch('app/pageLoading', true);

    next();
});
router.afterEach((to, from) => {
    setTimeout(() => {
        console.log('AFTER_EACH_ROUTE')
        store.dispatch('app/pageLoading', false);
    }, 750);
});

// Handle not found routes
// router.redirect({ '*' : '/' })
console.log('router.getMatchedComponents()', router.getMatchedComponents())

export default router;
