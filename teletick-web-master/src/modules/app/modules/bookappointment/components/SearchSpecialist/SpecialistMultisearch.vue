<template>
  <div class="search__wrapper">
    <div class="col-md-4">

      <!--      SEARCHBAR-->
      <span class="fa fa-search form-control-feedback"></span>
      <input
          type="text"
          class="form-control search__input__text"
          placeholder="spécialité, trouble, praticien..."

          v-model="multisearch.name"
          @focus="() => setDialogOpen(true)"
          @input="handleNameInput"
      >

    </div>

    <div class="col-md-3">
      <span id="search-icon-d" class="search__icon"></span>
      <input
          type="text"
          class="form-control search__address__input search__input__text"
          placeholder="Ville, code postal"
          v-model="multisearch.address"
          @focus="() => setDialogOpen(true)"
          @input="handleNameInput"
      >
      <div class="search__dialog__wrap" v-if="searchDialog.isOpen">
        <div class="search__list">
          <div class="practices__list__wrapper">
            <div class="d-flex flex-row">
              <h4 class="list__section__title">Spécialité</h4>

              <div style="display: flex; flex-direction: row; flex-basis: 100%;">
                <div style="flex-basis: 100%"></div>
                <button @click="() => setDialogOpen(false)" type="button" class="btn-close" style="margin-right: 10px"
                        aria-label="Close"></button>
              </div>
            </div>
            <div
                class="list__item"
                v-for="(practice, index) in practicesList"
                v-if="index < searchDialog.practicesLimit"
                @click=""
            >
              <span class="list__item__text">{{ practice.name }}</span>
            </div>
          </div>

          <div class="specialists__list__wrapper">
            <h4 class="list__section__title">Praticien</h4>
            <div
                class="list__item"
                v-for="(specialist, index) in specialistsList"
                v-if="index < searchDialog.specialistsLimit"
            >
              <span class="list__item__text">{{ `${ specialist.firstname } ${ specialist.lastname }` }}</span>
            </div>
<!--            <div-->
<!--                class="list__item"-->
<!--                @click="() => handleSpecialistClick()"-->
<!--            >-->
<!--              <img src="@/assets/specialist_avatar1.png" style="width: 32px;height: 32px;border-radius: 50%; margin-left: 10px">-->
<!--              <span class="list__item__text">Jules Bekuti</span>-->
<!--            </div>-->
          </div>
        </div>
      </div>

    </div>
    <div class="col-md-3 d-flex text-center">
      <button class="video__consult__button btn btn-primary btn-sm ">
        <div class="button__content">
          <div style="margin-left: 3px; margin-right: 3px; align-items: center; align-content: center; ">
            <b-checkbox
                v-model="isTypeOnlineCheckbox"
                class="is-online"
            >
              <label class="for-custom-checkbox"></label>
            </b-checkbox>
          </div>
          <label @click="handleTypeOnlineButtonClick" style="cursor: pointer">Consultation en vidéo</label>
        </div>
      </button>
    </div>
    <div class="col-md-2">
      <button @click="handleSearchButtonClick" class="btn btn-primary search__button custom-mt-0 h-50">Rechercher</button>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import initPractices              from "@/modules/app/modules/specialist/http/api/practice/initPractices";
import paginateSpecialists        from "@/modules/http/api/specialist/bookappointment/paginateSpecialists";

export default {
  name: "SpecialistMultisearch",

  props: {
    multisearch: {
      type: Object,
      required: true,
    }
  },

  data() {
    return {
      isTypeOnlineCheckbox: false,
      searchDialog: {
        isOpen          : false,
        practicesLimit  : 5,
        specialistsLimit: 5,
      },
      practices: [],
      dialogList: [],
      specialistsList: [],

    };
  },
  computed: {
    ...mapGetters('app/bookappointment', ['SearchSpecialist']),
    practicesList() {
      const [ self, address, search ] = [ this, this.multisearch.address, this.multisearch.name.toLowerCase() ];

      return this.practices.filter((spec) => {
        return search === '' ? false : (spec.name.toLowerCase().slice(0, search.length) === search);
      });
    }
  },
  created() {
    const self = this;
    initPractices().then((practices) => self.practices = practices)

  },

  methods: {
    ...mapActions('app/bookappointment', [ 'updateMultisearch', 'updateStepperState' ]),

    handleNameInput() {
      console.log('handleNameInput')
      const self = this;
      paginateSpecialists(this.multisearch.name, this.multisearch.address, 1, this.isTypeOnlineCheckbox ? '1' : '0', 5).then(
          (response) => {
            console.log('handleNameInput', response)
            self.specialistsList = response.list;
          }
      )
    },

    handleTypeOnlineButtonClick() {
      if (this.searchDialog.isOpen === true) {
        this.handleNameInput();
      }
      const self = this;
      this.isTypeOnlineCheckbox = !this.isTypeOnlineCheckbox;
      this.updateStepperState({ length: (self.isTypeOnlineCheckbox === false ? 5 : 6) });
      let type = this.isTypeOnlineCheckbox ? '1' : '0';
      this.$emit('multisearchChange', { type, name: self.multisearch.name, address: self.multisearch.address });
    },

    handleSearchButtonClick() {
      const type = this.isTypeOnlineCheckbox ? '1' : '0';
      const self = this;

      this.setDialogOpen(false);
      this.$emit('multisearchChange', { type, name: self.multisearch.name, address: self.multisearch.address });
    },

    setDialogOpen(bool) {
      if (this.searchDialog.isOpen === true) {
        this.handleNameInput();
      }
      this.searchDialog.isOpen = bool;
    }
  }
}
</script>

<style scoped>
.search__wrapper {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  position: relative;
  border-radius: 50px;
  background-color: #fff;
  padding: 10px;
  box-shadow: 0 4px 30px rgb(158 158 158 / 10%);
  border: 1px solid #F5F5F5;
}

.video__consult__button {
  border: unset;
  margin-right: 0 !important;
  margin-top: 0 !important;
  position: relative;
  color: #FFFFFF;
  background-color: #A7D08E !important;
  border-radius: 4px;
  font-size: 13px;
  line-height: 13px;
  font-weight: normal;
  max-width: 200px;
  cursor: pointer!important;
}

/*.video__consult__button:before {*/
/*}*/
.search__button {
  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  color: #fff;
  font-size: 16px;
  line-height: 21px;
  padding: 8px 24px !important;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  box-shadow: unset !important;
}

.search__input__text {
  padding-left: 2.2rem;
  background-color: #FFFFFF !important;
  border: none;
  box-sizing: border-box;
  height: 40px;
  border-radius: 0 0 0 0;
  box-shadow: unset !important;
}

.search__address__input {
  border-right: 2px solid #E0E0E0;
  border-left: 2px solid #E0E0E0;
  padding-left: 2.2rem;
}

.search__dialog__wrap {
  top: 75px;
  position: absolute;
  background: #FFFFFF;
  z-index: 1;
  box-shadow: 6px 8px 17px 7px rgb(195 195 195 / 41%);
  padding: 10px 0 14px 0;
  width: 100%;
  border-radius: 10px;
  max-width: 100%;
  text-align: left;
}

.practices__list__wrapper {
}

.list__section__title {
  margin-top: 20px;
  font-weight: 500;
  font-size: 12px;
  line-height: 26px;
  color: #2C3F34;
  opacity: 0.5;
  margin-bottom: 0;
  margin-left: 30px;
}

.list__item {
  border-radius: 5px;
  width: 90%;
  margin-left: 5%;
  margin-right: 5%;
}

.list__item:hover {
  background-color: #a7d08e;
}

.list__item__text {
  padding: 12px 0 !important;
  margin: 0 5px 0 15px;
  font-weight: 500;
  font-size: 14px;
  line-height: 26px;
  color: #2C3F34;
  display: block;
  border-bottom: 1px solid #E0E0E0;

}

.list__item__text:hover {
  border-bottom: 1px solid #a7d08e;
  color: #FFFFFF;
}

.button__content {
  margin: 5px 3px;
  display: flex;
  flex-direction: row;
  overflow: visible;
  align-items: center;
}

.form-control-feedback {
  position: absolute;
  z-index: 2;
  font-size: 22px;
  display: block;
  line-height: 0;
  text-align: center;
  pointer-events: none;
  color: #A7D08E;
  top: 50%;
  left: 25px;
  transform: translate(-0%, -50%);
  width: 17px;
  height: 0;
}

.video__consult__button:after {
  content: '';
  border-radius: 4px;
  position: absolute;
  right: -22px;
  top: 2px;
  width: 30px;
  height: 30px;
  background: #FCECDB url("data:image/svg+xml,%3Csvg width='15' height='10' viewBox='0 0 15 10' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M3.73645 0.230222C5.44221 0.0777067 7.15875 0.0910189 8.86194 0.269972L9.30254 0.316265C10.1435 0.404623 10.8203 1.04249 10.9611 1.87269L13.3379 0.609917C13.499 0.52434 13.6922 0.525222 13.8525 0.612265C14.0128 0.699308 14.1188 0.860916 14.1347 1.04261L14.1527 1.2484C14.355 3.55511 14.355 5.87509 14.1527 8.1818L14.1347 8.38759C14.1188 8.56929 14.0128 8.7309 13.8525 8.81794C13.6922 8.90498 13.499 8.90587 13.3379 8.82029L10.9611 7.55751C10.8203 8.38772 10.1435 9.02559 9.30255 9.11395L8.86195 9.16024C7.15875 9.3392 5.44221 9.35251 3.73645 9.19999L2.58966 9.09746C1.72553 9.02019 1.02734 8.36004 0.901832 7.50159C0.631681 5.65376 0.631681 3.77646 0.901832 1.92862C1.02734 1.07017 1.72553 0.410022 2.58965 0.332759L3.73645 0.230222ZM11.0952 6.4309C11.1534 6.44004 11.211 6.45885 11.266 6.48803L13.1183 7.47218C13.2498 5.63648 13.2498 3.79373 13.1183 1.95803L11.266 2.94218C11.211 2.97136 11.1534 2.99017 11.0952 2.99931C11.1968 4.14091 11.1968 5.2893 11.0952 6.4309Z' fill='%23FF9739'/%3E%3C/svg%3E") no-repeat center;
}
</style>

