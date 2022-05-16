import state            from "./state";
import SearchSpecialist from "./SearchSpecialist/mutations";
import BookSpecialist from "./BookSpecialist/mutations";

const defaults = { ...state };

export default {
    ...SearchSpecialist, ...BookSpecialist,


    setActiveStep(state, step) {
        state.step.active = step;
    },

    setStepsLength(state, length) {
        state.step.length = length
    },

    SET_STEP_IS_ACTIVE(state, { index, bool }) {
        state.components[index].isActive = bool;
    },

    SET_DEFAULT_STATE(state) {
        state = { ...defaults }
    },
    INIT_BOOK_SPECIALISTS_LIST(state, { list }) {
        state.specialist.list = list;
    },
    INIT_PRACTICES_LIST(state, { list }) {
        state.practice.list = list
    },
    INIT_SELECTED_BOOK_SPECIALIST(state, { specialist }) {
        state.specialist.selected = specialist
    },
    SET_ACTIVE_BOOK_COMPONENT(state, componentName) {
        state.components.active = componentName;
    },
    SET_SELECTED_SPECIALIST_INIT_ID(state, id ) {
        console.log('setSelectedSpecialistInitId', id)

        state.specialist.init_id = id;
    },
    SET_DATA_SEARCH_FIELDS(state, { name, address, dialog }) {
        state.search = { ...state.search, name, address, dialog }
    },
    SET_SELECTED_SPECIALIST(state,  specialist) {
        state.specialist.selected = specialist;
    },

    SET_STEPPER_STATE(state, Stepper) {
        state.Stepper = { ...state.Stepper, ...Stepper }
    }

}
