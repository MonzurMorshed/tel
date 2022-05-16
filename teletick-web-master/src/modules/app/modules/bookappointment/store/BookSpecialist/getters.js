import state from './state';

const defaults = { ...state }

export default {
    BookSpecialistGetter(state) {
        return state.BookSpecialist;
    },

    selectedSpecialist(state) {
        return state.BookSpecialist.specialist;
    }
}
