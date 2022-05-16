// import getProducts from "@/modules/app/modules/product/modules/http/api/getProducts";

import initProfile  from "@/modules/app/modules/specialist/http/api/initProfile";
import create       from "@/modules/app/modules/specialist/http/api/reason/create";
import getList      from "@/modules/app/modules/specialist/http/api/reason/getList";
import deleteReason from "@/modules/app/modules/specialist/http/api/reason/deleteReason";

export default {
    updateAddCalendarState({ commit, state }, AddCalendar) {
        commit('SET_ADD_CALENDAR_STATE', { ...state.AddCalendar, ...AddCalendar })
    },

    updateReasonState({ commit, state }, reason) {
        commit('SET_ADD_CALENDAR_STATE', { ...state.AddCalendar, ...{ reason: { ...state.AddCalendar.reason, ...reason } } })
    },

    getList({ commit, state }, user_id) {
        if (!!user_id === true) {
            return getList(user_id).then((response) => {
                commit('SET_CALENDAR_REASON_LIST', response)
            });
        }
    },

    updateReasonListAction({ commit, state }, reasons) {
        commit('SET_CALENDAR_REASON_LIST', reasons)
    },

    async createReason({ commit, state, dispatch }, reason) {
        const createResponse = await create(reason);

        await dispatch('app/specialist/getList', reason.specialist_id);
    },

    deleteReasonAction({ commit, state, dispatch }, index) {
        let id = state.AddCalendar.reason.list[index].id;
        const reasonListNew = state.AddCalendar.reason.list.filter((el, idx) => idx !== index)
        return deleteReason(id).then((response) => {
            dispatch('updateReasonState', { list: reasonListNew });
        });
    }
}
