<template>
  <div class="bookappointment_calendar">
    <b-container style="padding: 0; margin: 0 -30px; width: auto">
      <b-row class="bookappointment_calendar__header" align-h="between">
        <b-col align-self="center" cols="1">
          <span class="bookappointment_calendar__header__control">
            <i class="icon-prev" aria-hidden="true"></i>
          </span>
        </b-col>
        <b-col cols="10">
          <b-row>
            <b-col v-for="data in BookSpecialistGetter.schedule">
              <h3 class="lun-text">{{ getLongWeekday(data.date) }}</h3>
            </b-col>
            <b-col
                v-for="col in (new Array(4 - BookSpecialistGetter.schedule.length))"
            ></b-col>
          </b-row>
          <b-row>
            <b-col v-for="data in BookSpecialistGetter.schedule">
              <h4 class="mars-text">{{ getMonthAndDay(data.date) }}</h4>
            </b-col>

            <b-col
                v-for="col in (new Array(4 - BookSpecialistGetter.schedule.length))"
            ></b-col>
          </b-row>
        </b-col>
        <b-col align-self="center" cols="1">
          <span class="bookappointment_calendar__header__control" style="float: right;">
            <i class="icon-next" aria-hidden="true"></i>
          </span>
        </b-col>
      </b-row>

      <b-row>
        <b-col cols="1"></b-col>
        <b-col cols="10">
          <b-row class="bookappointment_calendar__body__times">

            <b-col cols="3" v-for="(data, dayIndex) in BookSpecialistGetter.schedule">

              <ul class="time_select morning-list-margin" v-if="data.list">
                <li
                    v-for="time in data.list"
                >
                  <input type="radio" :id="data.date + time" v-model="picked" :value="data.date + 'T' + time"
                         @click="() => updateFromTime(time)"
                  >
                  <label :for="data.date + time">{{ time }} </label>
                </li>
              </ul>

              <div class="text-center not-available-text" v-else>Non disponible</div>
            </b-col>
          </b-row>

        </b-col>
        <b-col cols="1"></b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import moment                     from 'moment';
import { ScheduleService } from '@/modules/app/modules/bookappointment/services/schedule';

export default {
  name: "SpecialistShedule",

  props: {
    daily_schedule: [],
    // time_range    : 60,
    // reason        : {},
  },

  data() {
    return {
      scheduleService   : new ScheduleService(),
      picked            : false,
      timeSelected      : '',
      specialistTimeDate: {
        data: [
          // {
          //   date: '2022-02-21',
          //   list: false
          // },
          // {
          //   date: '2022-02-22',
          //   list: false
          // },
          // {
          //   date: '2022-02-23',
          //   list: [ '17:00', '18:00', '19:00', '20:00' ]
          // },
          // {
          //   date: '2022-02-24',
          //   list: [ '17:10', '18:00', '18:50', '19:40' ]
          // }
        ],
        page: 1
      }
    }

  },

  computed: {
    ...mapGetters('app/bookappointment', [ 'BookSpecialistGetter' ]),

    schedule() {
      const self = this;

      // const res = this.scheduleService.schedule.filter(day => {
      //   return (day.reasons.filter(r => r.reason_id === self.BookSpecialistGetter.reason.reason_id)).length > 0
      // })

      // return res.splice(0, 4);


      // return this.scheduleService.schedule.splice(0, 4)
      return [];
    },
  },

  created() {
    // this.scheduleService.setSchedule(this.daily_schedule);
  },

  methods: {
    ...mapActions('app/bookappointment', ['updateFromTime']),
    hasSelectedReason(arr = []) {
      const self = this;
      if (arr.length > 0) {
        return (arr.filter(r => r.reason_id === self.BookSpecialistGetter.reason.reason_id)).length > 0
      }
      return false;
    },

    parseHrsMinTimestamp(str, divider = ':') {
      return {
        hours  : +str.split(divider)[0],
        minutes: +str.split(divider)[1],
      };
    },

    handleTimeSelected() {
      console.log('picked', this.picked);
      this.$emit('select', this.picked);
    },

    getLongWeekday(date) {
      // if ('lang' === 'en') {
      //   return new Intl.DateTimeFormat('en-US', {weekday: 'long'}).format(date).toUpperCase().slice(0, 3)
      // }
      // if ('lang' === 'fr') {
      return new Intl.DateTimeFormat('fr-FR', { weekday: 'long' }).format(new Date(date)).toUpperCase().slice(0, 3)
      // }
    },
    getMonthAndDay(date) {
      return new Intl.DateTimeFormat('fr-FR', { month: 'short' }).format(new Date(date)).toUpperCase().slice(0, 3)
          + ' ' +
          new Intl.DateTimeFormat('fr-FR', { day: 'numeric' }).format(new Date(date)).toUpperCase().slice(0, 3)
    },
  }
}
</script>

<style scoped>
.lun-text {
  font-style: normal;
  font-weight: 500;
  font-size: 16px;
  line-height: 24px;
  text-align: center;
  color: #2C3F34;
  margin-bottom: 3px;
  text-transform: uppercase;
}

.mars-text {
  font-weight: normal;
  font-size: 12px;
  line-height: 18px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
  opacity: 0.7;
  margin-bottom: 5px;
  text-transform: uppercase;
}

.bookappointment_calendar__header {
  background: rgba(242, 245, 251, 0.78);
  border: 2px solid #F2F5FB;
  width: 100%;
  padding: 10px 0;
}

.bookappointment_calendar__header + .row {
  border: 2px solid #ffffff00;
}

.bookappointment_calendar__header__control {
  color: #2C3F34;
  font-size: 14px;
}

.bookappointment_calendar__header__control i {
  opacity: 0.7;
}

.bookappointment_calendar__header__control i:before {
  content: '';
  display: block;
  background-repeat: no-repeat;
  background-size: contain;
  width: 20px;
  height: 17px;
  background-image: url("data:image/svg+xml,%3Csvg width='20' height='18' viewBox='0 0 20 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath opacity='0.7' d='M8.57716 0L0 8.57139L8.5743 17.1428L9.58429 16.1357L2.73429 9.28569H20V7.85714H2.73429L9.58715 1.00427L8.57716 0Z' fill='%232C3F34'/%3E%3C/svg%3E%0A");
}

.bookappointment_calendar__header__control i.icon-next:before {
  background-image: url("data:image/svg+xml,%3Csvg width='20' height='18' viewBox='0 0 20 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath opacity='0.7' d='M11.4228 0L20 8.57139L11.4257 17.1428L10.4157 16.1357L17.2657 9.28569H0V7.85714H17.2657L10.4128 1.00427L11.4228 0Z' fill='%232C3F34'/%3E%3C/svg%3E");
}

.row {
  margin: 0;
}

ul.time_select {
  /*width: 75px;*/
  /*margin-right: 0;*/
  padding: 0;
}

ul.time_select li {
  display: flex;
}

ul.time_select li input[type="radio"] {
  display: none;
  cursor: pointer;
}

ul.time_select li label {
  display: inline-block;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  border-radius: 4px;
  -webkit-border-radius: 4px;
  min-width: 70px;
  margin: 3px auto 10px;
  text-align: center;
  cursor: pointer;
  background-color: rgba(167, 208, 142, 0.15);
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  color: #537E36;
  padding: 6px 2px;
  box-shadow: 0 2px 7px rgb(44 63 52 / 7%);
}

ul.time_select li input[type="radio"]:checked + label {
  background-color: #A7D08E;
  color: #fff;
}

.bookappointment_calendar__body__times div {
  padding: 0;
}
</style>
