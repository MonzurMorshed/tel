export default {
    AddCalendarGetter(state) {
        return state.AddCalendar;
    },

    getListGetter(state) {
        console.log('getLsitGetter::state.AddCalendar.reason.list', state.AddCalendar.reason.list)
        return state.AddCalendar.reason.list;
    },
}
