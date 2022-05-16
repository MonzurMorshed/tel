<template>
  <div>
    <h3>Calendar</h3>
    <div class="card">
      <div class="card-body" style="min-height: 100%">
        <div class="row">
          <div class="row mb-3 justify-content-end">
            <div class="col-lg-1 text-end">

              <router-link :to="{ name: 'specialist.add_calendar' }">
                <svg width="25" height="25" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M17.4591 10.9725L15.8046 9.67876C15.8256 9.47925 15.8436 9.24602 15.8436 8.99926C15.8436 8.7525 15.8264 8.51927 15.8046 8.31976L17.4606 7.02527C17.7682 6.78227 17.8521 6.35101 17.6564 5.99179L15.9359 3.015C15.7521 2.67901 15.3494 2.5065 14.9406 2.65725L12.9884 3.44099C12.6141 3.17099 12.2219 2.943 11.8161 2.76075L11.5191 0.690012C11.4704 0.297 11.1284 0 10.7241 0H7.27416C6.8699 0 6.52867 0.297 6.48065 0.684L6.18291 2.76226C5.7899 2.93927 5.40367 3.16427 5.01291 3.4425L3.05541 2.65651C2.68862 2.51476 2.24987 2.67374 2.06762 3.00825L0.344897 5.98876C0.141659 6.33227 0.225647 6.77851 0.539909 7.02752L2.1944 8.32127C2.16814 8.57401 2.15541 8.79377 2.15541 9.00004C2.15541 9.2063 2.16817 9.42602 2.1944 9.67954L0.538397 10.974C0.230885 11.2178 0.147635 11.649 0.343385 12.0075L2.0639 14.9843C2.24766 15.3195 2.64665 15.4935 3.05914 15.342L5.0114 14.5583C5.3849 14.8275 5.77713 15.0555 6.18291 15.2385L6.47991 17.3085C6.52864 17.703 6.8699 18 7.2749 18H10.7249C11.1291 18 11.4711 17.703 11.5191 17.316L11.8169 15.2385C12.2099 15.0608 12.5954 14.8365 12.9869 14.5575L14.9444 15.3435C15.0389 15.3802 15.1371 15.399 15.2384 15.399C15.5294 15.399 15.7971 15.24 15.9321 14.9925L17.6601 12C17.8521 11.649 17.7681 11.2178 17.4591 10.9725ZM8.99914 12C7.34465 12 5.99915 10.6545 5.99915 9C5.99915 7.34551 7.34465 6.00001 8.99914 6.00001C10.6536 6.00001 11.9991 7.34551 11.9991 9C11.9991 10.6545 10.6536 12 8.99914 12Z" fill="#A7D08E"></path>
                </svg>
              </router-link>

            </div>
          </div>
        </div>
        <FullCalendar
            style="min-height: 100%"
            :options='calendarOptions'
            @toggle="handleToggle"
        >
        </FullCalendar>
      </div>
    </div>
  </div>
</template>


<script>
import FullCalendar from '@fullcalendar/vue'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import { INITIAL_EVENTS, createEventId } from './event-utils'

export default {
  name: "SpecialistCalendar",
  components: { FullCalendar, timeGridPlugin, interactionPlugin, dayGridPlugin },

  data: function() {
    return {
      calendarOptions: {
        plugins: [
          dayGridPlugin,
          timeGridPlugin,
          interactionPlugin // needed for dateClick
        ],
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        initialView: 'dayGridMonth',
        editable: true,
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,

        // weekends: true,
        select: this.handleDateSelect,
        eventClick: this.handleEventClick,
        eventsSet: this.handleEvents,
        /* you can update a remote database when these fire:
        eventAdd:
        eventChange:
        eventRemove:
        */
      },
      currentEvents: []
    }
  },
  mounted() {


  },
  methods: {
    handleWeekendsToggle() {
      this.calendarOptions.weekends = !this.calendarOptions.weekends // update a property
    },
    handleToggle() {
      console.log('this.currentEvents',this.currentEvents);
    },
    handleDateSelect(selectInfo) {
      let title = prompt('Please enter a new title for your event')
      let calendarApi = selectInfo.view.calendar
      calendarApi.unselect() // clear date selection
      if (title) {
        calendarApi.addEvent({
          id: createEventId(),
          title,
          start: selectInfo.startStr,
          end: selectInfo.endStr,
          allDay: selectInfo.allDay
        })
      }
    },
    handleEventClick(clickInfo) {
      if (confirm(`Are you sure you want to delete the event '${clickInfo.event.title}'`)) {
        clickInfo.event.remove()
      }
    },
    handleEvents(events) {
      this.currentEvents = events;
      console.log('this.currentEvents',this.currentEvents);

    }
  }

}
</script>

<style>

table a {
  color: #2C3F34!important;
}

</style>
