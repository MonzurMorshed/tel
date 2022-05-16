<template>
  <div class="search__wrapper">
    <div class="col-md-4">

      <!--      SEARCHBAR-->
      <span class="fa fa-search form-control-feedback"></span>
      <input
          type="text"
          class="form-control search__input__text"
          placeholder="spécialité, trouble, praticien..."

          v-model="inputs.searchName"
          @focus="() => setDialogOpen(true)"
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
                @click="() => handleSpecialistClick(specialist.id)"
            >
              <span class="list__item__text">{{ specialist.name }}</span>
            </div>
          </div>
        </div>
      </div>

    </div>

    <div class="col-md-3">
      <span id="search-icon-d" class="search__icon"></span>
      <input
          type="text"
          class="form-control search__address__input search__input__text"
          placeholder="Ville, code postal"
          v-model="inputs.searchAddress"
          @focus="() => setDialogOpen(true)"
      >
    </div>
    <div class="col-md-3 d-flex text-center">
      <button class="video__consult__button btn btn-primary btn-sm" @click="handleVideoClick">
        <div class="button__content">
          <div style="margin-left: 3px; margin-right: 3px; align-items: center; align-content: center; ">
            <b-checkbox
                v-model="isOnlineEnabled"
                class="is-online"
            >
              <label class="for-custom-checkbox"></label>
            </b-checkbox>
          </div>
          <label style="cursor: pointer">Consultation en vidéo</label>
        </div>
      </button>
    </div>
    <div class="col-md-2">
      <button @click="handleSearchClick" class="btn btn-primary search__button custom-mt-0 h-50">Rechercher</button>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  name: "Search",

  data() {
    return {
      isOnlineEnabled: false,
      inputs      : {
        searchName   : '',
        searchAddress: '',
        video        : false,
      },
      searchDialog: {
        isOpen          : false,
        practicesLimit  : 5,
        specialistsLimit: 5,
      },
      practices   : {
        list: [
          { name: 'Anxiety' },
          { name: 'Depression' },
          { name: 'Social' },
          { name: 'Relationship' },
          { name: 'Stress' },
          { name: 'Management' },
          { name: 'Negative and irrational thinking' },
          { name: 'Obession and compulsion' },
          { name: 'Emotional disorders' },
          { name: 'Fears & phobias' },
          { name: 'Sleep Disorder' },
          { name: 'Addiction' },
        ],
      },
      specialists : {
        list: [
          { name: 'Fanny Quentin', address: '2 allée Nicolas Poussin', id: 2, },
          {
            name   : 'Bénédicte Fulpin',
            id     : 5,
            address: '107 avenue charles de gaulle Résidence le jardin du cèdre - Apt B19\n'
          },
          { name: 'Djelou', id: 10, address: 'Paris' },
          { name: 'Anne-Sophie AMOUR', id: 22, address: 'New York park' },
          { name: 'Biesmans', address: 'Kremenchug', id: 123, },
          { name: 'MACKOWIAK', address: 'Paris', id: 55 },
          { name: 'Céline Quilez', address: 'Londor', id: 13 },
          { name: 'Barclais', address: 'Paris', id: 85 },
          { name: 'Thomas Standhaft', address: 'Paris', id: 40 },
        ],
      }
    }
  },

  mounted() {
    this.inputs.searchName = this.getSearchDataFields.name;
    this.inputs.searchAddress = this.getSearchDataFields.address;
    this.searchDialog.isOpen = this.getSearchDataFields.dialog;
  },

  computed: {
    specialistsList() {
      const [ self, result, search, address ] = [
        this, [], this.inputs.searchName.toLowerCase(), this.inputs.searchAddress.toLowerCase()
      ];

      return this.specialists.list.filter((spec) => {
        let namesMatched = (spec.name.toLowerCase().slice(0, search.length) === search.toLowerCase());
        let addressesMatched = (spec.address.toLowerCase().includes(address.toLowerCase()));

        if (search !== '') {
          return namesMatched && addressesMatched;
        }
        if (address !== '') {
          return addressesMatched;
        }
      })
    },

    practicesList() {
      const [ self, address, search ] = [ this, this.inputs.searchAddress.to, this.inputs.searchName.toLowerCase() ];

      return this.practices.list.filter((spec) => {
        return search === '' ? false : (spec.name.toLowerCase().slice(0, search.length) === search);
      });
    }
  },

  methods: {
    ...mapActions('app/bookappointment', ['setStepsLength']),
    setDialogOpen(bool) {
      this.searchDialog.isOpen = bool;
    },
    handleSearchClick() {

    },
    handleVideoClick() {
      console.log('VIDEOO::this.isOnlineEnabled ? 7 : 6', this.isOnlineEnabled ? 7 : 6)
      this.isOnlineEnabled = !this.isOnlineEnabled;
      this.setStepsLength(this.isOnlineEnabled ? 7 : 6);

    }
  },
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

<!--<style scoped>-->
<!--.search-display-flex {-->
<!--  display: flex;-->
<!--  align-items: center;-->
<!--  justify-content: space-between;-->
<!--  position: relative;-->
<!--  border-radius: 50px;-->
<!--  background-color: #fff;-->
<!--  padding: 10px;-->
<!--  box-shadow: 0 4px 30px rgb(158 158 158 / 10%);-->
<!--  border: 1px solid #F5F5F5;-->
<!--}-->

<!--.form-group {-->
<!--  margin-bottom: 1rem;-->
<!--}-->

<!--.has-search .form-control {-->
<!--  padding-left: 3.2rem;-->
<!--}-->

<!--.form-control {-->
<!--  display: block;-->
<!--  width: 100%;-->
<!--  height: calc(1.5em + 0.75rem + 2px);-->
<!--  padding: 0.375rem 0.75rem;-->
<!--  font-size: 1rem;-->
<!--  font-weight: 400;-->
<!--  line-height: 1.5;-->
<!--  color: #495057;-->
<!--  background-color: #fff;-->
<!--  background-clip: padding-box;-->
<!--  border: 1px solid #ced4da;-->
<!--  border-radius: 0.25rem;-->
<!--  transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;-->
<!--}-->

<!--.search-textbox {-->
<!--  background-color: #FFFFFF !important;-->
<!--  border: none;-->
<!--  box-sizing: border-box;-->
<!--  border-radius: 0;-->
<!--  height: 40px;-->
<!--  border-top-right-radius: 0;-->
<!--  border-bottom-right-radius: 0;-->
<!--  box-shadow: unset !important;-->
<!--  padding-left: 3.4rem;-->
<!--}-->

<!--.search-prompt_wrap {-->
<!--  display: none;-->
<!--  top: 65px;-->
<!--  position: absolute;-->
<!--  background: #FFFFFF;-->
<!--  z-index: 1;-->
<!--  box-shadow: 0 4px 30px rgb(158 158 158 / 15%);-->
<!--  width: 100%;-->
<!--  border-radius: 10px;-->
<!--}-->

<!--.search-prompt {-->
<!--  border: unset;-->
<!--  border-radius: 10px;-->
<!--  max-height: 535px;-->
<!--  overflow-y: scroll;-->
<!--  width: 100%;-->
<!--  text-align: left;-->
<!--}-->

<!--.has-search .form-control-feedback {-->
<!--  position: absolute;-->
<!--  z-index: 2;-->
<!--  font-size: 22px;-->
<!--  display: block;-->
<!--  line-height: 0;-->
<!--  text-align: center;-->
<!--  pointer-events: none;-->
<!--  color: #A7D08E;-->
<!--  top: 50%;-->
<!--  left: 15px;-->
<!--  transform: translate(-0%, -50%);-->
<!--  width: 17px;-->
<!--  height: 0;-->
<!--}-->

<!--.search_bar_address input.form-control {-->
<!--  border-right: 2px solid #E0E0E0;-->
<!--  border-left: 2px solid #E0E0E0;-->
<!--  padding-left: 2.2rem;-->
<!--}-->

<!--.type_btn {-->
<!--  width: 100%;-->
<!--}-->

<!--.video-consult {-->
<!--  border: unset;-->
<!--  margin-right: 0 !important;-->
<!--  margin-top: 0 !important;-->
<!--  position: relative;-->
<!--  padding: 11px 20px 10px 36px !important;-->
<!--  color: #FFFFFF;-->
<!--  background-color: #A7D08E !important;-->
<!--  border-radius: 4px;-->
<!--  max-width: 100%;-->
<!--  font-size: 13px;-->
<!--  line-height: 13px;-->
<!--  font-weight: normal;-->
<!--  max-width: 200px;-->
<!--}-->

<!--.video-consult.type_btn_active:before {-->
<!--  content: '';-->
<!--  background-image: url("data:image/svg+xml,%3Csvg width='16' height='16' viewBox='0 0 16 16' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Crect width='16' height='16' rx='2' fill='white'/%3E%3C/svg%3E%0A");-->
<!--}-->

<!--.video-consult:before {-->
<!--  content: '';-->
<!--  display: block;-->
<!--  position: absolute;-->
<!--  left: 9px;-->
<!--  top: 9px;-->
<!--  height: 16px;-->
<!--  width: 16px;-->
<!--  background-image: url("data:image/svg+xml,%3Csvg width='16' height='16' viewBox='0 0 16 16' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Crect width='16' height='16' rx='2' fill='white'/%3E%3Crect width='16' height='16' rx='2' fill='%23B4DB9D'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M11.877 6.12922C12.041 6.30151 12.041 6.58085 11.877 6.75314L7.95698 10.8708C7.79296 11.0431 7.52704 11.0431 7.36302 10.8708L5.12302 8.51784C4.95899 8.34555 4.95899 8.06621 5.12302 7.89392C5.28704 7.72163 5.55296 7.72163 5.71698 7.89392L7.66 9.93491L11.283 6.12922C11.447 5.95693 11.713 5.95693 11.877 6.12922Z' fill='white' stroke='white' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");-->
<!--}-->

<!--.video-consult:after {-->
<!--  content: '';-->
<!--  border-radius: 4px;-->
<!--  position: absolute;-->
<!--  right: -22px;-->
<!--  top: 2px;-->
<!--  width: 30px;-->
<!--  height: 30px;-->
<!--  background: #FCECDB url("data:image/svg+xml,%3Csvg width='15' height='10' viewBox='0 0 15 10' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M3.73645 0.230222C5.44221 0.0777067 7.15875 0.0910189 8.86194 0.269972L9.30254 0.316265C10.1435 0.404623 10.8203 1.04249 10.9611 1.87269L13.3379 0.609917C13.499 0.52434 13.6922 0.525222 13.8525 0.612265C14.0128 0.699308 14.1188 0.860916 14.1347 1.04261L14.1527 1.2484C14.355 3.55511 14.355 5.87509 14.1527 8.1818L14.1347 8.38759C14.1188 8.56929 14.0128 8.7309 13.8525 8.81794C13.6922 8.90498 13.499 8.90587 13.3379 8.82029L10.9611 7.55751C10.8203 8.38772 10.1435 9.02559 9.30255 9.11395L8.86195 9.16024C7.15875 9.3392 5.44221 9.35251 3.73645 9.19999L2.58966 9.09746C1.72553 9.02019 1.02734 8.36004 0.901832 7.50159C0.631681 5.65376 0.631681 3.77646 0.901832 1.92862C1.02734 1.07017 1.72553 0.410022 2.58965 0.332759L3.73645 0.230222ZM11.0952 6.4309C11.1534 6.44004 11.211 6.45885 11.266 6.48803L13.1183 7.47218C13.2498 5.63648 13.2498 3.79373 13.1183 1.95803L11.266 2.94218C11.211 2.97136 11.1534 2.99017 11.0952 2.99931C11.1968 4.14091 11.1968 5.2893 11.0952 6.4309Z' fill='%23FF9739'/%3E%3C/svg%3E") no-repeat center;-->
<!--}-->

<!--.top-button {-->
<!--  background: linear-gradient(90deg, #A7D08E 0%, #537E36 100%);-->
<!--  font-weight: 600;-->
<!--  color: #fff;-->
<!--  font-size: 16px;-->
<!--  line-height: 21px;-->
<!--  padding: 8px 24px !important;-->
<!--  border-radius: 30px;-->
<!--  text-transform: uppercase;-->
<!--  display: inline-block;-->
<!--  vertical-align: middle;-->
<!--  transform: perspective(1px) translateZ(0);-->
<!--  position: relative;-->
<!--  -webkit-transition: all linear 400ms;-->
<!--  transition: all linear 400ms;-->
<!--  border: none;-->
<!--  height: 50px;-->
<!--  box-shadow: unset !important;-->
<!--}-->
<!--</style>-->
