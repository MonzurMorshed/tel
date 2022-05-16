import store from "@/modules/core/store";

export class RouterService
{
    store;
    router;
    events = {
        initUser      : 'app/layout/initUser',
        updateTitle   : 'updateTitle',
        pageLoading   : 'app/pageLoading',
        updateLayout  : 'app/layout/updateLayout',
        clearAuthState: 'clearAuthData'
    };
    getters = {};
    requireAuth = false;

    constructor(store, router = null,) {
        this.store = store;
        this.router = router;
        this.mergeGetters({
            auth       : 'app/auth/Auth',
            isUserInit : 'app/auth/isUserInit',
            isTokenInit: 'app/auth/isTokenInit',
            userType   : 'app/auth/getUserType',
        });
        if (this.getters.isTokenInit && !this.getters.isUserInit) {
            this.initUser();
        }
    }

    mergeGetters(keyValue = {}, store = null) {
        const self = this;
        Object.keys(keyValue).forEach(key => {
            this.getters[key] = store === null ? self.store.getters[keyValue[key]] : store.getters[keyValue[key]];
        })
    }

    mergeEvents(events = {}) {
        if (Object.keys(events).length > 0) {
            this.events = { ...this.events, ...events };
        }

        return this;
    }

    initEvents(events = null) {
        if (events) {
            this.events = events
        }
        return this
    }

    isAuthenticated() {
        console.log('this.getters.isUserInit', this.getters.isUserInit)
        console.log('this.getters.isTokenInit', this.getters.isTokenInit)
        return this.getters.isUserInit && this.getters.isTokenInit;
    }

    dispatch(callback = () => {}) {
        return callback((typeKey, payload) => this.store.dispatch(typeKey, payload));
    }

    getter(key) {
        return this.store.getters[this.getters[key]];
    }

    setRequireAuth(requireAuth) {
        this.requireAuth = requireAuth;

        if (requireAuth === true && !this.isAuthenticated()) {
            if (this.router !== null) {
                this.router.push({ name: 'login' })
            }
        }

        return this;
    }

    initUser() {
        const isUserInit = this.getters.isUserInit;

        this.store.dispatch(this.events.initUser);
        this.store.dispatch(this.events.clearAuthState);

    }

    pageLoading(bool) {
        this.store.dispatch(this.events.pageLoading, bool);
    }

    updateTitle(title) {
        this.store.dispatch(this.events.updateTitle, title);
        return this;
    }

    updateLayout(layout) {
        this.store.dispatch(this.events.updateLayout, layout);
        return this;
    }

    clearAuth() {
        this.store.dispatch(this.events.clearAuthState);
        return this;
    }

}
