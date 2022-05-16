export default {
    SET_SEARCH_SPECIALIST_STATE(state, SearchSpecialist) {
        state.SearchSpecialist = { ...state.SearchSpecialist, ...SearchSpecialist }
    }
}
