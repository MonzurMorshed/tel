import specialistList from "@/modules/http/api/specialistList";
import initProfile    from "@/modules/app/modules/specialist/http/api/initProfile";
import SearchSpecialistActions from './SearchSpecialist/actions';
import BookSpecialistActions from './BookSpecialist/actions';


export default {
    ...SearchSpecialistActions, ...BookSpecialistActions,

    setStepperState({ commit }, step) {
        commit('setActiveStep', step);
    },
    setBookStep({ commit }, step) {
        commit('setActiveStep', step);
    },

    setStepsLength({ commit }, length) {
        commit('setStepsLength', length);
    },
    setStepIsActive({ commit }, { index, bool }) {
        commit('SET_STEP_IS_ACTIVE', { index, bool });
    },
    setDefaultState({ commit }) {
        commit('SET_DEFAULT_STATE');
    },
    initBookSpecialistsList({ commit }) {
        return specialistList().then(response => {
            commit('INIT_BOOK_SPECIALISTS_LIST', { list: response.specialist });
            commit('INIT_PRACTICES_LIST', {
                list: response.practice.map(practice => {
                    practice.name = practice.key.split('_').map(pName => pName[0].toUpperCase() + pName.slice(1)).join(' ')
                    return practice;
                })
            });
            return response;
        })
    },
    initSelectedBookSpecialist({ commit }, id) {
        return initProfile(id).then(specialist => {
            console.log('specialistspecialistspecialistspecialist', specialist[0])
            commit('INIT_SELECTED_BOOK_SPECIALIST', { specialist });
            return specialist
        });
    },
    setSelectedSpecialistInitId({ commit }, id) {
        commit('SET_SELECTED_SPECIALIST_INIT_ID', id);
    },
    setSelectedSpecialist({ commit }, specialist) {
        commit('SET_SELECTED_SPECIALIST', specialist);
        commit('SET_SELECTED_SPECIALIST_INIT_ID', specialist.id);
    },
    setActiveBookComponent({ commit, state }, componentName) {
        commit('SET_ACTIVE_BOOK_COMPONENT', componentName);
    },
    setDataSearchField({ commit }, { name, address, dialog }) {
        commit('SET_DATA_SEARCH_FIELDS', { name, address, dialog });
    },

    updateStepperState({ commit, state }, Stepper) {
        commit('SET_STEPPER_STATE', { ...state.Stepper, ...Stepper } )
    }
}
