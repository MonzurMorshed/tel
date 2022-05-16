export default {
    SET_ADD_CALENDAR_STATE(state, AddCalendar) {
        state.AddCalendar = { ...state.AddCalendar, ...AddCalendar }
    },

    SET_CALENDAR_REASON_LIST(state, list) {
        state.AddCalendar.reason.list = list;
    }
}
