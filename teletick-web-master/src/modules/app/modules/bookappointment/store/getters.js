import SearchSpecialist from "./SearchSpecialist/getters";
import BookSpecialist   from "@/modules/app/modules/bookappointment/store/BookSpecialist/getters";

export default {
    ...SearchSpecialist, ...BookSpecialist,

    Stepper(state) {
        return state.Stepper;
    },

    getActiveStep(state) {
        return state.step.active;
    },

    getStepsLength(state) {
        return state.step.length;
    },

    getStepComponents(state) {
        return state.components.list;
    },

    getActiveComponent(state) {
        return state.components.active;
    },

    getActiveInitID(state) {
        return state.specialist.init_id;
    },

    getSpecialistsBookList(state) {
        return state.specialist.list;
    },

    getSelectedBookSpecialist(state) {
        return state.specialist?.selected;
    },
    getSelectedBookSpecialistAddress(state) {
        console.log('state.specialist.selected.address', state.specialist.selected.address);
        return state.specialist.selected.address;
    },
    getSearchDataFields(state) {
        return state.search;
    }
}
