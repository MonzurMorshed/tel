import AddCalendarGetters from './AddCalendar/getters';

export default {
    ...AddCalendarGetters,

    products(state) {
        return state.products
    },

    salesProduct(state) {
        return state.salesProduct
    },

    specialProduct(state) {
        return state.specialProduct
    },

    isLoading(state) {
        return state.loading
    }
}
