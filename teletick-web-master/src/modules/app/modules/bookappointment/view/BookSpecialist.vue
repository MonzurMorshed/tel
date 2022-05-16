<template>
  <div class="bookapintment__wrapper">
    <TopNavbar/>

    <div style="display: flex; flex-basis: 100%; flex-direction: column; justify-content: center; margin-top: 30px">

      <Breadcrumbs/>
      <div class="front__card">
        <Stepper
            v-if="Stepper.active !== Stepper.length"
            style="margin-top: 13px; border-bottom: 1px solid #EEF3EB;"/>

        <div class="specialist-book__wrapper">
          <div class="row ">
            <div class="col-md-12">
              <div class="top-block d-flex">
                <div class="specialist-image">
                  <img class="specialist-image" alt="img"
                       src="http://docare.fr/uploadimages/16239353177994476081655068523.jpg">
                </div>
                <div class="victor_name_text">
                  <h4 class="victor-name">{{ `${ profile.firstname } ${ profile.lastname }` }}</h4>
                  <div class="d-flex">
                    <div style="margin-right: 5px"
                         v-for="practice in profile.practicies"
                    >
                      <h5 class="psycho-text"
                      >{{ practice.name }}</h5>
                    </div>
                  </div>
                  <div
                      class="d-flex flex-row justify-content-start">
                    <div
                        @click="handleContactClick"
                        class="phone__button" :style="{ border: isContactOpen ? '1px solid #A7D08E' : '' }">
                      <label style="margin: 5px 12px">{{
                          isContactOpen ? profile.phone_number : 'Contact'
                        }}</label>
                    </div>
                  </div>
                  <div class="d-flex flex-row flex-wrap" style="margin-top: 16px;"
                       v-if="+SearchSpecialist.multisearch.type !== 1"
                  >
                    <div class="address__block" v-for="(address) in selectedSpecialist.addess">
                      <label class="address__label">{{
                          `${ address.address } ${ address.postal_code } ${ address.city }`
                        }}</label>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="row justify-content-center">
            <div class="col-10" style="position: unset">
              <div class="row">
                <div class="col-md-6 pl-0 pt-3">
                  <div class="" id="available_b"
                       style="min-height:auto;overflow: hidden;height: 100%!important;display:block;">
                    <h3 class="terification-text mtb-10"> À partir de &nbsp;
                      <span class="pricing span-left">50 <i class="fa fa-eur" aria-hidden="true"
                                                            style="color: #537E36;"></i></span>
                    </h3>
                    <h3 class="terification-text mtb-10 lgt_blue" style="color: #598DCB;">
                      <span class="fl"> À partir de</span>&nbsp;
                      <span class="fr span-right" style="color: #598DCB;">30 min</span>
                    </h3>
                    <div class="row">
                      <div class="col-12">
                        <h2 class="client_info_profile">Informations pratiques</h2>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="">
                          <h3 class="expertise-text"
                              style="background-image: url('~@/assets/icons/expertise.svg')">
                            Compétence
                          </h3>
                          <h4 class="expertise-content expertise" style="white-space: pre-wrap;">
                            {{ selectedSpecialist.expertise || '' }}
                          </h4>
                        </div>
                        <div class="">
                          <h3 class="expertise-text"
                              style="background-image: url('~@/assets/icons/professional-status.svg')">
                            Pratique professionnelle
                          </h3>
                          <h4 class="expertise-content professional_practice" style="white-space: pre-wrap;">
                            {{ selectedSpecialist.prof_practice || '' }}
                          </h4>
                        </div>
                        <div class="">
                          <h3 class="expertise-text"
                              style="background-image: url('~@/assets/icons/education.svg')"> Formation
                            et certifications
                          </h3>
                          <h4 class="expertise-content diplomas_and_certifications" style="white-space: pre-wrap;">
                            Licence, Maitrise et DESS (Master professionnel) de Psychologie en 2001.
                            Actuellement en formation a l'EMDR
                          </h4>
                        </div>
                        <div class="">
                          <h3 class="expertise-text"
                              style="background-image: url('~@/assets/icons/experiences.svg')">
                            Expériences professionnelles
                          </h3>
                          <h4 class="expertise-content profesional_experiences" style="white-space: pre-wrap;">
                            {{ selectedSpecialist.prof_exp || '' }}
                          </h4>
                        </div>
                        <div class="">
                          <h3 class="expertise-text"
                              style="background-image: url('~@/assets/icons/galerie.svg')"> Ville </h3>
                          <h4 class="expertise-content practice_city">Strasbourg</h4>
                        </div>
                        <div class="accor">
                          <button class="slide-panel specialist_reviews"
                                  style="background-image: url('~@/assets/icons/reviews.svg')"
                                  type="button">Afficher les avis
                          </button>
                          <div class="panel-1 specialist_feedback" id="style-1">
                            <p>Aucun avis trouvé</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 pl-2" style="position: absolute; top: 75px; right: 10px;">
                  <div class="available_block"
                       style="min-height: 541px!important; overflow: hidden; height: 100%!important;width: 100%;">
                    <p class="choose_consult_type_txt">Choisir son type de consultation</p>
                    <label for="select-specialization">Consultation en présentiel</label>
                    <!--                    <select id="select-specialization" >-->
                    <!--                    </select>-->

                    <multiselect
                        style="margin-bottom: 20px"
                        id="select-specialization"
                        v-model="form.reason"
                        :options="profile.reasons || []"
                        label="name"
                        track-by="reason_id"
                        @select="(r) => handleReasonMultiselect(r)"
                    >

                    </multiselect>

                    <multiselect
                        v-model="form.address"
                        v-if="profile.addresses.length > 0"
                        :options="profile.addresses"
                        label="street_address"
                        track-by="address_id"
                    >

                    </multiselect>
                    <div class="confirm-main-div" style="display: none;">
                      <h3 class="confirm-text" id="to_confirm">
                        Confirmez-vous votre rendez de : Lundi 9 mars à 10h00
                      </h3>
                      <div class="confir-button-main-div">
                        <button type="button" class="btn btn-primary retour-button" id="btn_back_content2"> Retour
                        </button>
                      </div>
                    </div>
                    <div class="dans-main-div">
                     <span class="dans-text">
                     <img class="clock_icon"
                          src="~@/assets/booking/small_clock.png" alt="clock">
                     <span id="avilabeltext">
                     Pas disponible aujourd'hui
                     </span>
                     </span>
                    </div>

                    <SpecialistSchedule
                        :daily_schedule="daily_schedule"
                        style="margin-top: 20px"/>

                    <hr>
                    <div class="row">
                      <div class="col-6 p-2">
                        <h3 class="terification-text mtb-10" v-if="form.reason.duration">
                          <span class="duration span-left">Durée : </span>
                          <span class="span-right">{{ form.reason.duration }} min </span>
                        </h3>
                      </div>
                      <div class="col-6 p-2">
                        <h3 class="terification-text mtb-10 lgt_blue" v-if="form.reason.price">
                          <span class="fl"> Prix :</span>
                          <span class="price span-right">{{ form.reason.price }} € </span>
                        </h3>
                      </div>
                    </div>
                    <button @click="stepFinish" type="button" class="btn btn-primary retour-button confirmer-button"
                            id="btn_confirm_content2">
                      Book
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row" style="margin: 50px 0">
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
              <button @click="() => this.$emit('prevStep')" type="button"
                      class="btn form-previous-button next slick-next"><i
                  class="fa fa-arrow-left" aria-hidden="true"></i> Prev
              </button>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" style="text-align: right">
              <button @click="stepFinish" type="button" class="btn form-next-button next slick-next">Next
              </button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import initProfile                from "@/modules/app/modules/specialist/http/api/initProfile";
import Multiselect                from 'vue-multiselect';
import Breadcrumbs                from "@/modules/app/modules/bookappointment/components/Breadcrumbs";
import TopNavbar                  from "@/modules/app/modules/bookappointment/components/TopNavbar";
import DefaultState               from "@/modules/app/modules/bookappointment/store/BookSpecialist/state";
import SpecialistSchedule         from "@/modules/app/modules/bookappointment/components/SpecialistSchedule";
import Stepper                    from "@/modules/app/modules/bookappointment/components/Stepper";
import { SpecialistService }      from "@/modules/app/modules/specialist/services/specialist";
import { ScheduleService }        from "@/modules/app/modules/bookappointment/services/schedule";
import createBook                 from "@/modules/http/api/createBook";

const defaultState = DefaultState;

export default {
  name      : "BookSpecialist",
  components: { Multiselect, Breadcrumbs, TopNavbar, SpecialistSchedule, Stepper },

  data() {
    return {
      specialistService: new SpecialistService(),
      scheduleService  : new ScheduleService(),
      profile          : {},
      daily_schedule   : {},
      options          : {},
      form             : {
        address: null,
        reason : {},
        scheduleTime: '',
      },
      isLoading        : {
        specialist: true
      },
      isContactOpen    : false,
      specialist       : {
        user   : {
          firstname: '',
          lastname : '',
        },
        address: [
          { address: 'asdasd', id: '' }
        ],
      },
    }
  },
  computed: {
    /**
     * Vuex Mapped Getters
     */
    ...mapGetters('app/bookappointment', [
      /** BookSpecialist current page getters */
      'BookSpecialistGetter',

      /** Foreign Sourced getters */
      'selectedSpecialist', 'getActiveInitID', 'getSelectedBookSpecialistAddress', 'SearchSpecialist', 'Stepper', 'BookSpecialistGetter'
    ]),
    ...mapGetters('app/auth', [ 'Auth' ]),

    /**
     * Custom Getters
     */
  },


  created() {
    const boolSpecialistId = this.$router.currentRoute.params.specialistId;
    this.initUser(this.Auth.token.token).then(e => {
      console.log(e)
    });
    if (boolSpecialistId) {
      this.initProfile(boolSpecialistId);
    }
  },
  mounted() {
    // console.clear();
    console.log('BookSpecialist::mounted', this.$router.currentRoute.params.specialistId)
    console.log('this.BookSpecialistGetter', this.BookSpecialistGetter)
    this.specialist = this.BookSpecialistGetter.specialist;
  },
  methods: {
    /**
     * Vuex Mapped Action
     */
    ...mapActions('app/auth', ['initUser']),
    // ...mapActions('app/bookappointment', ['']),
    ...mapActions('app/bookappointment', [
      'setSelectedSpecialist', 'updatePaginationAction', 'initSelectedBookSpecialist', 'paginateAction',
      'updateStepperState',
      'fetchSpecialistAction', 'updateSelectedReason', 'updateSchedule', 'updateProfile'
    ]),


    handleReasonMultiselect(reason) {
      const self = this;
      this.scheduleService.getSchedule(reason.reason_id).then((response) => {
        console.log('RESPONSE', response)
        self.daily_schedule = response;
        self.updateSchedule(response);
      });

      this.updateSelectedReason(reason);
    },

    initProfile(id) {
      const self = this;

      this.specialistService.apiInitProfile(id).then(response => {
        console.log('specialistService.apiInitProfile::response', response)
        self.profile = response
        self.updateProfile(response)
      })
    },

    /**
     * Custom Methods
     */
    handleContactClick() {
      this.isContactOpen = !this.isContactOpen;
    },
    stepFinish() {
      console.log('this.SearchSpecialist.multisearch.type ', this.SearchSpecialist.multisearch.type)
      const onlineModeEnabled = +this.SearchSpecialist.multisearch.type === 1;
      const routeObj = { name: 'appointment.client.auth' };
      const payload =  {
        reason_id: this.BookSpecialistGetter.reason.reason_id,
        address: '',
        from: this.BookSpecialistGetter.from,
      }

      // if (!this.Auth.token.token?.length || ![ 'client', 'specialist' ].includes(this.Auth.user.type)) {
      //
      //   this.updateStepperState({ active: 3 })
      // }
      // if (onlineModeEnabled === false) {
      //   this.$router.push({ name: 'appointment.success' });
      // } else {
      //   this.updateStepperState({ active: 3 })
      //   this.$router.push({ name: 'appointment.success' });
      // }
      console.log('this.Auth.token.type.length', this.Auth.token.token);
      console.log('this.Auth.user.type', this.Auth.user.type);

      if (this.Auth.token.token.length > 0 && this.Auth.user.type === 'client') {
        routeObj.name = 'appointment.success';
        createBook(this.profile.user_id, payload).then((response) => {
          return this.$router.push(routeObj)
        })
      } else {
        return this.$router.push(routeObj)
      }
    }
  }
}
</script>

<style scoped>
.bookapintment__wrapper {
  display: flex;
  flex-direction: column;
  flex-basis: 100%;
  background: #f9f9f9 !important;
}

.front__card {
  max-width: 80%;
  margin-left: 10%;
  margin-right: 10%;
  min-height: 80%;
  background: #FFFFFF;
  display: flex;
  flex-direction: column;
}

.specialist-book__wrapper .top-block {
  background-color: rgba(167, 208, 142, 0.2);
  padding: 50px 125px 70px;
  justify-content: left;
}

.specialist-book__wrapper .specialist-image {
  width: 230px !important;
  margin-right: 20px;
}

.victor_name_text {
  display: flex;
  flex-direction: column;
  position: relative;
  padding: 15px 10px;
}

.address__label {
  padding: 2px 7px 2px 31px !important;
  border: 1px solid rgba(167, 208, 142, 0.15);
  border-radius: 4px;
  text-align: left;
  background-image: url('~@/assets/booking/location.png');
  background-position: 5px center;
  background-repeat: no-repeat;
  margin: 5px;
  display: inline-block;
  float: left;
  font-size: 14px;
  line-height: 24px;
  color: rgba(44, 63, 52, 0.6);
  clear: both;
}

.address__block {
  position: relative;
  border: 1px solid rgba(167, 208, 142, 0.15);
  box-sizing: border-box;
  border-radius: 4px;
  padding-left: 0;
}

.specialist-book__wrapper .victor-name {
  font-size: 22px;
  opacity: 1;
  font-weight: 600;
  line-height: 24px;
  margin-bottom: 20px;
}

.specialist-book__wrapper .psycho-text {
  margin: 0 0 15px 0;
}

.specialist-book__wrapper .location_icon {
  margin: 15px 0;
  min-height: 30px;
}

.specialist-book__wrapper a.btn_infobox_phone {
  color: #2C3F34;
  opacity: 0.6;
  font-size: 14px;
  line-height: 24px;
}

.video_camera {
  position: absolute;
  right: -30px;
  z-index: 999;
  top: 3px;
}

.video_camera img {
  width: 20px;
}

#available_b {
  width: 100%;
}

#available_b {

}

.specialist-book__wrapper .terification-text {
  background: rgba(167, 208, 142, 0.15);
  border-radius: 4px;
  padding: 13px;
  display: inline-flex;
  align-items: center;
  margin-right: 15px;
  font-weight: 500;
  font-size: 14px;
  line-height: 24px;
}

.specialist-book__wrapper .terification-text:before {
  background-repeat: no-repeat;
  background-position: left center;
  background-size: contain;
  height: 24px;
  width: 24px;
  background-image: url("data:image/svg+xml,%3Csvg width='25' height='25' viewBox='0 0 25 25' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M19.0706 7.13409C19.8485 7.13409 20.4791 6.50333 20.4791 5.72525C20.4791 4.94717 19.8485 4.31641 19.0706 4.31641C18.2927 4.31641 17.6621 4.94717 17.6621 5.72525C17.6621 6.50333 18.2927 7.13409 19.0706 7.13409Z' stroke='%23537E36' stroke-width='0.96' stroke-miterlimit='10' stroke-linecap='round'/%3E%3Cpath d='M22.8261 3.14282C22.8261 2.49427 22.3007 1.96875 21.6523 1.96875C21.5791 1.96875 14.6681 1.96969 14.6681 1.96969C14.0436 1.96969 13.4459 1.93682 13.0995 2.2834L2.42819 12.9571C2.08123 13.3037 2.08123 13.8663 2.42819 14.2129L10.5853 22.3723C10.9318 22.7188 11.4942 22.7188 11.8407 22.3723L22.5115 11.6981C22.858 11.3519 22.8251 10.7682 22.8251 10.1295C22.8251 10.1295 22.8261 3.21609 22.8261 3.14282Z' stroke='%23537E36' stroke-width='1.5' stroke-miterlimit='10' stroke-linecap='round'/%3E%3Cpath d='M15.782 12.2885C15.7768 11.5727 15.5862 11.0266 15.2106 10.6513C14.8247 10.2653 14.3406 10.1113 13.7594 10.1883C13.296 10.2498 12.8072 10.4508 12.2927 10.7908L14.4768 12.9755L13.7979 13.2381L11.7678 11.2074C11.7213 11.2435 11.6781 11.2825 11.6372 11.3238C11.5959 11.3652 11.5574 11.4037 11.5213 11.4394C11.4908 11.4704 11.4621 11.4985 11.4363 11.5248C11.4105 11.5507 11.387 11.5779 11.3668 11.6094L13.2889 13.532L12.6176 13.8026L10.9344 12.1189C9.99775 13.3959 9.93343 14.438 10.7414 15.2462C10.9879 15.4928 11.256 15.6637 11.5443 15.7557C11.7556 15.8234 12.0692 15.8633 12.4861 15.8793L11.6753 16.6903C11.1095 16.5668 10.6025 16.2813 10.1546 15.8337C8.89396 14.5723 8.90429 13.0845 10.1856 11.3703L9.59117 10.7758L10.2701 10.5128L10.6255 10.8683C10.6457 10.8373 10.6691 10.8091 10.6945 10.7833C10.7198 10.7575 10.7461 10.7316 10.772 10.7058C10.818 10.6598 10.8616 10.6161 10.903 10.5748C10.9443 10.5335 10.9851 10.4978 11.0269 10.4668L10.463 9.90368L11.1349 9.63318L11.5518 10.0502C12.3082 9.54066 13.0411 9.27579 13.7519 9.25512C14.5552 9.2246 15.2599 9.51248 15.8674 10.1197C16.3355 10.5884 16.6393 11.2163 16.7778 12.0043L15.782 12.2885Z' fill='%23537E36'/%3E%3C/svg%3E%0A")
}

.specialist-book__wrapper .terification-text.lgt_blue {
  background: rgba(145, 190, 255, 0.15);
  color: #598DCB;
}

.specialist-book__wrapper .terification-text.lgt_blue:before {
  height: 18px;
  width: 18px;
  background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M9.5 3.75C9.5 3.33579 9.16421 3 8.75 3C8.33579 3 8 3.33579 8 3.75V8.75C8 9.00859 8.13321 9.24895 8.3525 9.386L11.3525 11.261C11.7038 11.4805 12.1665 11.3738 12.386 11.0225C12.6055 10.6712 12.4988 10.2085 12.1475 9.989L9.5 8.33431V3.75Z' fill='%23598DCB'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M8.75 0C3.91751 0 0 3.91751 0 8.75C0 13.5825 3.91751 17.5 8.75 17.5C13.5825 17.5 17.5 13.5825 17.5 8.75C17.5 3.91751 13.5825 0 8.75 0ZM1.5 8.75C1.5 4.74594 4.74594 1.5 8.75 1.5C12.7541 1.5 16 4.74594 16 8.75C16 12.7541 12.7541 16 8.75 16C4.74594 16 1.5 12.7541 1.5 8.75Z' fill='%23598DCB'/%3E%3C/svg%3E");
}

.client_info_profile {
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  color: #2C3F34;
  margin-top: 10px;
  margin-bottom: 25px;
}

.slide-panel {
  background-color: transparent;
  cursor: pointer;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  transition: 0.4s;
  font-weight: 500;
  font-size: 14px;
  line-height: 24px;
  color: #2C3F34;
  padding: 9px 9px 9px 30px;
}


.panel-1 {
  padding: 0 5px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  height: 400px;
  overflow-y: auto;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 24px;
  color: #2C3F34;
}

.phone__button {
  color: #A7D08E;
  font-size: 14px;
  line-height: 24px;
  border-radius: 30px;
  background-color: rgba(100, 193, 43, 0.07);
  background-image: url("data:image/svg+xml,%3Csvg width='15' height='15' viewBox='0 0 15 15' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2.76532 6.00938L2.76531 6.00936L2.76509 6.00888L2.76504 6.00877L2.76487 6.0084L2.35434 5.10485C2.04488 4.42375 2.2584 3.61882 2.86462 3.18092L4.18079 2.23022C4.21763 2.2036 4.26885 2.21046 4.29741 2.24588L5.62972 3.8983C5.66029 3.93622 5.65315 3.99197 5.61407 4.02095L4.74688 4.66398C4.49845 4.84819 4.41215 5.18083 4.53962 5.46266C5.54266 7.68034 7.32367 9.46239 9.54009 10.466C9.82184 10.5936 10.1543 10.5072 10.3384 10.2586L10.9811 9.39094C11.0101 9.35184 11.0657 9.34474 11.1035 9.37528L12.7548 10.7082C12.7902 10.7368 12.7971 10.7881 12.7704 10.8251L11.8245 12.1349C11.3894 12.7375 10.5917 12.9523 9.91307 12.6498C9.91307 12.6498 9.91306 12.6498 9.91306 12.6498L9.34615 12.397L9.34616 12.397L9.34449 12.3963L9.33522 12.3923C6.42366 11.157 4.08152 8.87707 2.76532 6.00938ZM1.57133 6.55664L1.57133 6.55665C3.023 9.72019 5.60574 12.2355 8.81691 13.5997L9.37853 13.85C10.625 14.4057 12.09 14.011 12.8891 12.9044L13.835 11.5945C14.2705 10.9914 14.1582 10.1528 13.5794 9.68555L11.9282 8.35265C11.3093 7.8531 10.3993 7.96947 9.92592 8.60864L9.60852 9.03718C8.05761 8.21813 6.78629 6.94605 5.96773 5.39422L6.39607 5.0766C7.03487 4.60292 7.15113 3.69247 6.65192 3.07332L5.31961 1.4209C4.85279 0.841919 4.01486 0.729443 3.41202 1.16489L3.47058 1.24595L3.41202 1.16489L2.09586 2.11559C0.982538 2.91978 0.590495 4.39792 1.15875 5.6486L1.57031 6.55442L1.57046 6.55475L1.57133 6.55664Z' fill='%23A7D08E' stroke='%23A7D08E' stroke-width='0.2' stroke-linejoin='round'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: 10px center;
  padding: 3px 19px 3px 37px;
  margin-top: 11px;
  float: left;
}

.available_block {
  border: 2px solid rgba(224, 224, 224, 0.56);
  padding: 30px;
  border-radius: 4px;
  position: relative;
  background-color: #FFFFFF;
}

.choose_consult_type_txt {
  font-size: 15px;
  font-weight: 600;
}

.available_block label {
  color: #2C3F34;
  font-size: 11px;
  line-height: 16px;
  text-transform: uppercase;
  font-weight: normal;
  margin-bottom: 4px;
}

.consultation_type_dropdown, .cabinet_type_dropdown {
  font-size: 14px;
  line-height: 21px;
  color: #2C3F34;
  height: 40px;
  margin-bottom: 20px;
}

.cabinet_type_dropdown {
  margin-bottom: 50px;
}

.confirm-main-div {
  position: absolute;
  z-index: 999;
  width: 100%;
  padding: 113px 20px 0 20px;
  left: 0;
  top: 0;
  height: 100%;
  vertical-align: middle;
  background: #A7D08E;
  border-radius: 4px;
  text-align: center;
}

.confirm-text {
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 27px;
  text-align: center;
  color: #FFFFFF;
}

.confir-button-main-div {
  display: inline-flex;
}


.dans-main-div {
  background-color: rgba(255, 151, 57, 0.1);
  border-radius: 4px;
  color: #FF9739;
  text-align: left;
  padding: 0 10px;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  position: absolute;
  right: 0;
  top: 25px;
}

.dans-text {
  text-align: center;
  padding: 2px 0;
  display: inline-flex;
  align-items: center;
}

.dans-text {
  padding-left: 10px;
  color: #FF9739;
  text-align: left;
  background-image: url("data:image/svg+xml,%3Csvg width='4' height='4' viewBox='0 0 4 4' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Ccircle cx='2' cy='2' r='2' fill='%23FF9739'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: left center;
}

.clock_icon {
  top: 0;
  align-self: center;
  float: left;
  padding: 5px 0 0 0;
  display: none;
}

.dans-text .clock_icon {
  top: 0;
  margin-right: 7px;
  margin-top: -5px;
}

#avilabeltext {
  line-height: 28px;
}

.specialist-book__wrapper {
  position: relative;
  max-width: 100%;
}

.specialist-book__wrapper .available_block .terification-text {
  padding: 13px 23px;
  width: 100%;
  margin-right: 0;
  flex-direction: column;
  text-align: right;
  align-items: end;
  position: relative;
  color: #2C3F34;
  font-weight: 500;
  font-size: 12px;
  line-height: 24px;
}

.specialist-book__wrapper .available_block .terification-text:before {
  background-image: url("data:image/svg+xml,%3Csvg width='27' height='26' viewBox='0 0 27 26' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M14.6375 5.6249C14.6375 5.0228 14.1495 4.53469 13.5476 4.53469C12.9457 4.53469 12.4577 5.0228 12.4577 5.6249V12.893C12.4577 13.2689 12.6513 13.6183 12.97 13.8175L17.3296 16.543C17.84 16.8622 18.5124 16.7069 18.8315 16.1964C19.1505 15.6858 18.9953 15.0132 18.4849 14.694L14.6375 12.2888V5.6249Z' fill='%23A7D08E' fill-opacity='0.4'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M13.5476 0.173828C6.52499 0.173828 0.832031 5.8684 0.832031 12.893C0.832031 19.9176 6.52499 25.6122 13.5476 25.6122C20.5702 25.6122 26.2632 19.9176 26.2632 12.893C26.2632 5.8684 20.5702 0.173828 13.5476 0.173828ZM3.01184 12.893C3.01184 7.07262 7.72887 2.35426 13.5476 2.35426C19.3663 2.35426 24.0834 7.07262 24.0834 12.893C24.0834 18.7134 19.3663 23.4318 13.5476 23.4318C7.72887 23.4318 3.01184 18.7134 3.01184 12.893Z' fill='%23A7D08E' fill-opacity='0.4'/%3E%3C/svg%3E");
  position: absolute;
  left: 20px;
  top: 50%;
  transform: translate(0, -50%);
}

.specialist-book__wrapper .available_block .terification-text.lgt_blue:before {
  background-image: url("data:image/svg+xml,%3Csvg width='29' height='24' viewBox='0 0 29 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M18.9879 12C18.9879 10.8273 19.9377 9.87664 21.1094 9.87664C22.2811 9.87664 23.2309 10.8273 23.2309 12C23.2309 13.1727 22.2811 14.1233 21.1094 14.1233C19.9377 14.1233 18.9879 13.1727 18.9879 12Z' fill='%23598DCB' fill-opacity='0.18'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M25.9767 4.46072C25.0464 2.27273 22.9908 0.69986 20.5446 0.442229L19.6227 0.345128C14.9662 -0.145299 10.2695 -0.112959 5.62024 0.441546L5.00932 0.514408C2.64907 0.795906 0.778952 2.64153 0.464576 4.99963C-0.154859 9.64596 -0.154859 14.354 0.464576 19.0004C0.778952 21.3585 2.64907 23.2041 5.00933 23.4856L5.62024 23.5585C10.2695 24.113 14.9662 24.1453 19.6227 23.6549L20.5446 23.5578C22.9908 23.3001 25.0464 21.7273 25.9767 19.5393C27.4465 19.1013 28.5684 17.8259 28.7525 16.25C29.0825 13.4263 29.0825 10.5737 28.7525 7.74995C28.5684 6.17411 27.4465 4.89872 25.9767 4.46072ZM19.4007 2.45681C14.9015 1.98296 10.3635 2.0142 5.87127 2.54998L5.26035 2.62284C3.86184 2.78963 2.75373 3.88322 2.56746 5.28047C1.97287 9.7404 1.97287 14.2596 2.56746 18.7195C2.75373 20.1168 3.86184 21.2104 5.26036 21.3772L5.87127 21.45C10.3635 21.9858 14.9015 22.017 19.4007 21.5432L20.3226 21.4461C21.5256 21.3194 22.59 20.7259 23.3276 19.845C21.1945 19.9695 19.0331 19.9138 16.9254 19.6781C15.1301 19.4772 13.6782 18.0623 13.4664 16.25C13.1364 13.4263 13.1364 10.5737 13.4664 7.74995C13.6782 5.93766 15.1301 4.52275 16.9254 4.32192C19.0331 4.08615 21.1945 4.03052 23.3276 4.15502C22.59 3.27408 21.5256 2.68061 20.3226 2.55392L19.4007 2.45681ZM24.3304 6.35855C24.3313 6.36398 24.3321 6.36941 24.333 6.37485L24.3415 6.4299L24.6225 6.38623C24.7679 6.40063 24.913 6.41593 25.0578 6.43213C25.8886 6.52506 26.5502 7.18209 26.6454 7.99661C26.9562 10.6565 26.9562 13.3435 26.6454 16.0034C26.5502 16.8179 25.8886 17.4749 25.0578 17.5679C24.913 17.5841 24.7678 17.5994 24.6225 17.6138L24.3415 17.5701L24.333 17.6251C24.3321 17.6306 24.3313 17.636 24.3304 17.6414C21.9563 17.8564 19.5214 17.8319 17.1611 17.5679C16.3303 17.4749 15.6687 16.8179 15.5735 16.0034C15.2627 13.3435 15.2627 10.6565 15.5735 7.99661C15.6687 7.18209 16.3303 6.52506 17.1611 6.43213C19.5214 6.1681 21.9563 6.14357 24.3304 6.35855Z' fill='%23598DCB' fill-opacity='0.18'/%3E%3C/svg%3E");
  width: 28px;
  height: 24px;
}

.specialist-book__wrapper .available_block .terification-text span:nth-child(2) {
  font-weight: 600;
  font-size: 14px;
  line-height: 18px;
  color: #537E36;
  text-transform: uppercase;
}

.specialist-book__wrapper .available_block .terification-text.lgt_blue span:nth-child(2) {
  color: #598DCB;
}

.confirmer-button {
  color: #FFFFFF;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 14px;
  line-height: 14px;
  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  border-radius: 30px;
  text-align: center;
  width: 100%;
  height: 45px;
  margin-top: 10px;
}
</style>
