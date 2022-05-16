export default {
    SET_BOOK_SPECIALIST_STATE(state, BookSpecialist) {
        state.BookSpecialist = { ...state.BookSpecialist, ...BookSpecialist }
    }
}
