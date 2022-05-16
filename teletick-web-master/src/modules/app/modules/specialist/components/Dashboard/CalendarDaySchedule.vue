<template>
  <div class="day_schedule">
    <b-form>
      <div class="row align-items-center" style="padding: 15px 0; ">
        <div class="col-md-3">
          <b-form-checkbox
              v-model="state.is_available"
              name="is_available"
              value="1"
              unchecked-value="0"
              class="custom-checkbox-day"
              :disabled="state.is_disabled"
              id="is_available"
          >
            <label class="for-custom-checkbox"></label>
            <span class="address_title">{{ dayNameByKey }}</span>
          </b-form-checkbox>
        </div>

        <div class="col-md-6 pl-0 row" style="">
          <b-form-checkbox
              v-model="state.consultation_type.physical"
              name="is_available"
              value="1"
              unchecked-value="0"
              class="available_time_interval day_selection"
              :disabled="state.is_disabled"
              style="width: auto"
          >
            <label class="for-custom-radio"></label>
            <span class="address_title">Rdv physique</span>
          </b-form-checkbox>

          <b-form-checkbox
              v-model="state.consultation_type.video"
              name="is_available"
              value="1"
              unchecked-value="0"
              class="available_time_interval day_selection"
              :disabled="state.is_disabled"
              style="width: auto"
          >
            <label class="for-custom-radio"></label>
            <span class="address_title">Rdv video</span>
          </b-form-checkbox>
        </div>
        <div class="col-md-3 text-right d-flex align-content-center">
          <div>
            <span class="modify-text text-uppercase" style="cursor: pointer;" v-on:click="state.is_disabled=false">
              Modifier
            </span>
          </div>
          <span style="padding-top: 3px; min-width: 10px" @click="handleDaySaving">
            <i class="fa fa-save fa-lg text-uppercase save__icon" aria-hidden="true"></i>
          </span>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-sm-12 col-12">
          <div class="default-text">Paramètrage par défaut</div>
        </div>
        <div class="col-md-6 col-sm-12 col-12 d-flex justify-content-end">
        </div>
      </div>
      <div class="row">
        <div class="col-8">
          <div class="row">
            <div class="col-md-4">
              <b-form-group class="form-group">
                <label>
                  Plage journalière:</label>
                <b-select class="form-control available_time_interval" name="fromtime"
                          v-model="state.working_time_range.from"
                          :disabled="state.is_disabled"
                          :options="state.time_options">
                </b-select>
              </b-form-group>
            </div>
            <div class="col-md-4 pl-0">
              <b-form-group>
                <label class="hide-calendor-label">
                  Plage journalière:</label>
                <b-select class="form-control available_time_interval" name="totime"
                          v-model="state.working_time_range.to"
                          :disabled="state.is_disabled"
                          :options="state.time_options">
                </b-select>
              </b-form-group>
            </div>
            <div class="col-md-4">
              <b-form-group>
                <label>Durée :</label>
                <b-select class="form-control available_time_interval" name="duration"
                          v-model="state.duration"
                          :disabled="state.is_disabled"
                          :options="state.hours_option">
                </b-select>
              </b-form-group>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-8">
          <div class="row">
            <div class="col-md-4">
              <b-form-group>
                <label>Pause:</label>
                <b-select class="form-control available_time_interval" name="break_start"
                          v-model="state.pause_time_range.from"
                          :disabled="state.is_disabled"
                          :options="state.break_option">
                </b-select>
              </b-form-group>
            </div>
            <div class="col-md-4 pl-0">
              <b-form-group>
                <label class="hide-calendor-label">Pause:</label>
                <b-select class="form-control available_time_interval" name="break_end_"
                          v-model="state.pause_time_range.to"
                          :disabled="state.is_disabled"
                          :options="state.break_option">
                </b-select>
              </b-form-group>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-8">
          <div class="row">
            <div class="col-4">
              <b-form-group>
                <b-form-checkbox class="available_time_interval"
                                 v-model="state.available_address.address_1"
                                 value="1"
                                 unchecked-value="0"
                                 :disabled="state.is_disabled">
                  <label class="for-custom-checkbox"></label>
                  <span class="address_title">Addresse 1</span>
                </b-form-checkbox>
              </b-form-group>
            </div>
            <div class="col-4">
              <b-form-group>
                <b-form-checkbox class="available_time_interval"
                                 v-model="state.available_address.address_2"
                                 value="1"
                                 unchecked-value="0"
                                 :disabled="state.is_disabled">
                  <label class="for-custom-checkbox"></label>
                  <span class="address_title">Addresse 2</span>
                </b-form-checkbox>
              </b-form-group>
            </div>
            <div class="col-4">
              <b-form-group>
                <b-form-checkbox class="available_time_interval"
                                 v-model="state.available_address.address_3"
                                 value="1"
                                 unchecked-value="0"
                                 :disabled="state.is_disabled">
                  <label class="for-custom-checkbox"></label>
                  <span class="address_title">Addresse 3</span>
                </b-form-checkbox>
              </b-form-group>
            </div>
          </div>
        </div>
      </div>
      <div class="row" style="margin-top: 20px; margin-bottom: 20px">
        <div class="col-12" v-if="!state.reasonsMultiselectDisplay">
          <a :aria-disabled="state.is_disabled" id="add_list_a_0" @click="() => handleReasonDisplay(true)"
             class="add-list_button add__reason">
            Ajouter une autre raison </a>
        </div>
        <div class="col-lg-7" v-else>
          <b-form-group>
            <div class="d-flex">
              <div><span><button
                  @click="() => handleReasonDisplay(false)" type="button" class="btn-close"
                  style="margin-bottom: 7px; margin-right: 5px" aria-label="Close"
              ></button></span></div>

              <label class="page__label">Type of Consultation</label>
            </div>
            <multiselect
                class="page__inp"
                v-model="day.reasons"
                :options="AddCalendarGetter.reason.list"
                placeholder="Select menu"
                label="name"
                track-by="name"
                :multiple="true"
                :taggable="true"
                @select="handleMultiselectSelected"
                @remove="handleMultisearchRemoved"
            ></multiselect>
          </b-form-group>
        </div>
      </div>
    </b-form>
  </div>
</template>

<script>
import saveDailySchedule from "@/modules/app/modules/specialist/http/api/schedule/saveDailySchedule";
import { mapGetters }    from "vuex";
import Multiselect       from 'vue-multiselect'
import getList           from "@/modules/http/api/specialist/weekly_schedule/getList";
import { ReasonService } from "@/modules/app/modules/specialist/services/reason";

export default {
  name      : "CalendarDaySchedule",
  components: { Multiselect },
  props     : {
    /**
     * Component Main entity
     */
    day      : {
      weekday_id: 0,
    },
    dailyData: {
      type   : Object,
      default: null
    }
  },
  data() {
    return {
      dayNames: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
      reasonService: new ReasonService(),
      state: {
        reasonsMultiselectDisplay: false,
        is_disabled              : true,
        consultation_type        : { physical: 0, online: 1 },
        working_time_range       : { from: "9:30", to: "19:00" },
        is_available             : "0",
        pause_time_range         : { from: "12:30", to: "12:30" },
        duration                 : "2",
        available_address        : { address_1: 1, address_2: 0, address_3: 1 },
        interval                 : "15",
        reasons                  : [],
        time_options             : [
          { value: "7:00", text: "7:00" },
          { value: "7:30", text: "7:30" },
          { value: "8:00", text: "8:00" },
          { value: "8:30", text: "8:30" },
          { value: "9:00", text: "9:00" },
          { value: "9:30", text: "9:30" },
          { value: "10:00", text: "10:00" },
          { value: "10:30", text: "10:30" },
          { value: "11:00", text: "11:00" },
          { value: "11:30", text: "11:30" },
          { value: "12:00", text: "12:00" },
          { value: "12:30", text: "12:30" },
          { value: "13:00", text: "13:00" },
          { value: "13:30", text: "13:30" },
          { value: "14:00", text: "14:00" },
          { value: "14:30", text: "14:30" },
          { value: "15:00", text: "15:00" },
          { value: "15:30", text: "15:30" },
          { value: "16:00", text: "16:00" },
          { value: "16:30", text: "16:30" },
          { value: "17:00", text: "17:00" },
          { value: "17:30", text: "17:30" },
          { value: "18:00", text: "18:00" },
          { value: "18:30", text: "18:30" },
          { value: "19:00", text: "19:00" },
          { value: "19:30", text: "19:30" },
          { value: "20:00", text: "20:00" },
          { value: "20:30", text: "20:30" },
          { value: "21:00", text: "21:00" },
          { value: "21:30", text: "21:30" },
          { value: "22:00", text: "22:00" },
          { value: "22:30", text: "22:30" },
          { value: "23:00", text: "23:00" },
          { value: "23:30", text: "23:30" },
          { value: "00:00", text: "00:00" },
        ],
        hours_option             : [
          { value: "0", text: "0 h" },
          { value: "1", text: "1 h" },
          { value: "2", text: "2 h" },
          { value: "5", text: "5 h" },
          { value: "10", text: "10 h" },
          { value: "15", text: "15 h" },
          { value: "24", text: "24 h" },
          { value: "48", text: "48 h" },
        ],
        break_option             : [
          { value: "12:00", text: "12:00" },
          { value: "12:30", text: "12:30" },
          { value: "13:00", text: "13:00" },
          { value: "13:30", text: "13:30" },
          { value: "14:00", text: "14:00" },
        ],
        minutes_option           : [
          { value: "0", text: "0 min" },
          { value: "5", text: "5 min" },
          { value: "10", text: "10 min" },
          { value: "15", text: "15 min" },
          { value: "20", text: "20 min" },
          { value: "25", text: "25 min" },
          { value: "30", text: "30 min" },
          { value: "35", text: "35 min" },
          { value: "40", text: "40 min" },
          { value: "45", text: "45 min" },
          { value: "50", text: "50 min" },
          { value: "55", text: "55 min" },
          { value: "60", text: "60 min" },
        ]
      },
    }
  },
  computed: {
    ...mapGetters('app/auth', [ 'Auth' ]),
    ...mapGetters('app/specialist', [ 'AddCalendarGetter' ]),

    dayNameByKey() {
      console.log('dayNameByKey::this.day', this.day)
      return this.dayNames[this.day.weekday_id];
    }
  },
  created() {

  },
  mounted() {

  },
  methods: {
    disabled(bool = null) {
      this.state.is_disabled = bool !== null ? bool : !this.state.is_disabled;
    },
    handleDaySaving() {
      this.disabled(true);

      saveDailySchedule(this.user.id, this.preparePostData()).then((response) => {
        console.log('RESPONSE', response)
      })
    },
    preparePostData() {
      const self = this;
      const data = {
        schedule          : {
          day          : self.dayName,
          status       : self.state.is_disabled === true ? 0 : 1,
          online_format: [ self.state.consultation_type.physical, self.state.consultation_type.online ],
        },
        working_time_range: { ...self.state.working_time_range },
        pause_time_range  : { ...self.state.pause_time_range },
      };
      return data;
    },
    handleMultiselectSelected(data) {
      console.log('handleMultiselectSelected::data', data);
      console.log('data.reason_id, this.day.daily_schedule_id', data.reason_id, this.day.daily_schedule_id);
      const self = this;

      this.reasonService.scheduleAttach(data.reason_id, this.day.daily_schedule_id).then((response) => {
        self.$emit('reload');
      })
    },
    handleMultisearchRemoved(data) {
      console.log('handleMultisearchRemove::data', data);
      const self = this;

      this.reasonService.scheduleDetach(data.reason_id, this.day.daily_schedule_id).then((response) => {
        self.$emit('reload');
      });
    },
    handleReasonDisplay(bool) {
      if (this.state.is_disabled === true) {
        return;
      }
      console.log('handleReasonDisplay', bool)
      this.state.reasonsMultiselectDisplay = bool;
    }
  },
}
</script>

<style>
.form-group input[type="text"] {
  border: 0 !important;
}

.day_schedule {
  border-bottom: 1px solid #D9E1F3;
  margin-bottom: 20px;
}

.add__reason:hover {
  color: #497e2c;
}

.save__icon {
  cursor: pointer;
  font-size: 1.5rem;
  font-style: normal;
  text-transform: uppercase !important;
  color: #537E36 !important;
  margin-top: 2px;
}

.default-text {
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  line-height: 30px;
  color: #2C3F34;
  margin-bottom: 25px !important;
  margin-top: 8px;
}

.modify-text {
  background-image: url('data:image/svg+xml,<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><path d="M8.70554 2.35824L11.5535 5.20613L4.3446 12.415L1.4983 9.5671L8.70554 2.35824ZM13.7145 1.67139L12.4444 0.401329C11.9536 -0.0895055 11.1566 -0.0895055 10.6641 0.401329L9.44747 1.61792L12.2954 4.46584L13.7145 3.04675C14.0952 2.66603 14.0952 2.05208 13.7145 1.67139ZM0.00792508 13.57C-0.0439033 13.8033 0.166693 14.0123 0.399973 13.9556L3.5735 13.1861L0.727197 10.3382L0.00792508 13.57Z" fill="url(%23paint0_linear_2239_524)"/> <defs> <linearGradient id="paint0_linear_2239_524" x1="7.01465" y1="34.3507" x2="21.4919" y2="28.8899" gradientUnits="userSpaceOnUse"> <stop stop-color="%23EEA647"/> <stop offset="1" stop-color="%23EE8C5D"/> </linearGradient> </defs> </svg> ');
  background-position: left center;
  background-repeat: no-repeat;
  background-position-x: 32px;
  padding: 9px 15px 9px 51px;
  margin-right: 15px;
}

.address_title {
  padding-left: 0;
  left: 7px;
  position: relative;
  top: -2px;
}

.form-control {
  appearance: auto;
}
</style>
