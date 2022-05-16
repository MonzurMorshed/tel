<template>
  <div>
    <h3>Calendar</h3>
    <div class="row flex-column">

      <!--      PROFILE INFO SECTION-->
      <div class="col-lg-12 card">
        <div class="card-body">

        </div>
      </div>


      <!--      CONTENT SECTION-->
      <div class="col-lg-12 page__body__container">
        <div class="row">
          <div class="col-lg-3" style="padding-left: 0">
            <div class="card">
              <div class="card-body" style="padding: 15px 20px;">

                <div class="row" style="border-bottom: 1px solid #D9E1F3">

                  <b-form-group class="col-lg-12">
                    <label class="page__label">Reason name</label>
                    <b-input type="text" class="page__inp" v-model="reason.data.name"></b-input>
                  </b-form-group>

                  <b-form-group class="col-lg-6">
                    <label class="page__label">Duration</label>
                    <b-input type="text" class="page__inp" :type="'number'" v-model="reason.data.duration"></b-input>
                  </b-form-group>
                  <b-form-group class="col-lg-6">
                    <label class="page__label">Price</label>
                    <b-input class="page__inp" :type="'number'" v-model="reason.data.price"></b-input>
                  </b-form-group>
                  <div class="col-lg-12 text-end mb-3">
                    <b-button variant="success" size="sm"
                              @click.prevent="handleReasonAdd"
                              :disabled="reasonAddButtonDisabled"
                    >Add
                    </b-button>
                  </div>
                </div>

                <div class="row mt-2">
                  <div class="col-lg-12 d-flex d-inline-flex justify-content-between mt-1"
                       v-for="(reason, index) in reason.list" :key="index"
                  >
                    <div><span>{{ reason.name }}</span></div>
                    <div><span>Duration: {{ reason.duration }}</span></div>
                    <div><span>Price: {{ reason.price }}</span></div>
                    <div>
                      <span>
                        <button
                            @click.prevent="() => removeReason({ reason, index })" type="button" class="btn-close"
                            style="margin-right: 10px" aria-label="Close"
                        ></button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-body" style="padding: 34px 50px;">
                <CalendarDaySchedule
                    v-for="(day, index) in schedule.days"
                    :day="day"
                    :key="index"
                />
                <!--                    @reload="() => initDailySchedule()"-->

              </div>
            </div>

          </div>
          <div class="col-lg-3" style="padding-right: 0">
            <div class="card">
              <div class="card-body">

              </div>
            </div>

          </div>
        </div>
        <!--      DATEPICKER CALENDAR CARD-->


        <!--      WEEKLY SCHEDULE CARD-->

        <!--      ALERTS CARD-->
      </div>
    </div>
  </div>
</template>

<script>
import Multiselect                from 'vue-multiselect'
import CalendarDaySchedule        from "@/modules/app/modules/specialist/components/Dashboard/CalendarDaySchedule";
import { mapActions, mapGetters } from "vuex";
import getList                    from '@/modules/http/api/specialist/weekly_schedule/getList'
import getDailySchedule           from '@/modules/app/modules/specialist/http/api/schedule/getDailySchedule';
import { ReasonService }          from '@/modules/app/modules/specialist/services/reason';

export default {
  name      : "SpecialistAddCalendar",
  components: { CalendarDaySchedule, Multiselect },
  data() {
    return {
      reasonAddButtonDisabled: false,
      reasonService          : new ReasonService(),
      schedule               : {

        days: [],
      },
      reason                 : {
        data: {
          name    : '',
          duration: '',
          price   : '',
        },
        list: [],
      },
    };
  },
  computed: {
    ...mapGetters('app/specialist', [ 'AddCalendarGetter', 'getListGetter' ]),
  },
  created() {

  },
  mounted() {
    this.initReasons();
    this.initDailySchedule();
  },

  methods: {
    ...mapActions('app/specialist', [
      'updateAddCalendarState', 'updateReasonState', 'getList', 'createReason', 'deleteReasonAction', 'updateReasonListAction'
    ]),
    ...mapActions('app/auth', [ 'initUser', 'clearAuthData' ]),

    removeReason({ reason, index }) {
      const self = this;
      console.log('removeReason::reason', reason);

      this.reasonService.deleteReason(reason.reason_id).then(response => {
        self.initReasons();
      })
    },

    initReasons() {
      const self = this;
      self.refreshReasonData();
      this.reasonService.getReasonList().then(response => {
        self.updateReasonListAction(response);
        self.reason.list = response
      });
    },

    initDailySchedule() {
      console.log('initDailySchedule!!!!!');

      const self = this;
      return getDailySchedule()
          .then((response) => {
            self.schedule.days = response;
          })
          .catch(e => {
            if (e.response?.status === 401) {
              this.clearAuthData().then(() => {
                this.$router.push({ name: 'login' })
              });
            }
          });
    },

    handleReasonAdd(e) {
      const self = this;
      const request = this.reasonService.createReasonApi(this.reason.data);
      request.then(response => {
        self.initReasons();
      })
    },

    refreshReasonData() {
      this.reason.data = {
        name    : '',
        duration: '',
        price   : '',
      };
    }

  }
}
</script>

<style scoped>

.page__body__container {
  margin-top: 30px;
  /*justify-content: space-between;*/
}

.alert_time-wrap .form-group {
  max-width: 250px;
  margin: 0 auto 1rem;
}

.days_section select,
.days_section input[name="addition_consult_price"] {
  margin-top: 4px;
  margin-bottom: 20px;
  max-width: 120px;
}

/* Hide the browser's default checkbox */
.checkbox-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
  border-radius: 50%;
}

span.chekmark {
  border-radius: 50% !important;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 13px;
  width: 13px;
  outline: 2px solid #767676;
  background: #fff;
}

/* On mouse-over, add a grey background color */
.checkbox-container:hover input ~ .checkmark {
  border: 2px solid #fff;
  background-color: #537E36;
  outline: 2px solid #537E36;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkbox-container:after {
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.checkbox-container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.checkbox-container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

.new_class label {
  width: auto;
}
</style>
