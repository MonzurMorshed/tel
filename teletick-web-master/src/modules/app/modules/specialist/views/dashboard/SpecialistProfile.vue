<template>

  <div>

    <div class="row">
      <div class="col-lg-3 mb-4">
        <h2>My profile</h2>
      </div>
      <div class="col-lg-6"></div>
      <div class="col-lg-3 text-end">
        <label>Share my profile</label>
        <button type="button" @click="handleSaveClick" class="btn btn-primary save__button">Save Changes</button>
      </div>
    </div>


    <div class="row">

      <div class="col-lg-6 card">
        <div class="card-body">

          <ul class="nav nav-tabs">
            <li class="nav-item" v-for="(tabName, index) in tabs.list" :key="index">
              <a :class="index === tabs.active ? ['nav-link', 'active'] : ['nav-link']" aria-current="page"
                 @click="() => handleTabClick(index)"
              >{{ tabName }}</a>
            </li>
          </ul>


          <b-form v-if="this.tabs.active === 0" class="row mt-3 justify-content-center">

            <div class="row justify-content-center">
              <b-form-group class="col-lg-6">
                <label class="page__label">Firstname</label>
                <b-input type="text" class="page__inp" v-model="form.user.firstname"></b-input>
              </b-form-group>

              <b-form-group class="col-lg-6">
                <label class="page__label">Lastname</label>
                <b-input type="text" class="page__inp" v-model="form.user.lastname"></b-input>
              </b-form-group>

              <b-form-group class="col-lg-6">
                <label class="page__label">Type of Consultation</label>
                <multiselect
                    class="page__inp"
                    v-model="form.consultation_type"
                    :options="option.type"
                    placeholder="Select menu"
                    label="name"
                    track-by="value"
                    :multiple="true"
                    :taggable="true"
                ></multiselect>
              </b-form-group>

              <b-form-group class="col-lg-6">
                <label class="page__label">Category</label>
                <multiselect
                    class="page__inp"
                    v-model="form.specialisation"
                    :options="option.speciality"
                    placeholder="Select menu"
                    label="name"
                    track-by="id"
                    :multiple="true"
                    :taggable="true"
                ></multiselect>
              </b-form-group>

              <b-form-group class="col-lg-12">
                <label class="page__label">Speciality / Disorder</label>
                <multiselect
                    class="page__inp"
                    v-model="form.practices"
                    :options="option.practices"
                    placeholder="Select menu"
                    label="name"
                    track-by="id"
                    :multiple="true"
                    :taggable="true"
                    tag-placeholder="Add this as new tag"
                ></multiselect>
              </b-form-group>


              <b-form-group class="col-lg-6">
                <label class="page__label">Email</label>
                <b-input type="text" class="page__inp" v-model="form.user.email"></b-input>
              </b-form-group>


              <b-form-group class="col-lg-6">
                <label class="page__label">Phone number</label>
                <b-input type="text" class="page__inp" v-model="form.user.phone"></b-input>
              </b-form-group>
            </div>

            <div class="row align-items-center">
              <div class="col-6">
                <!--                <h2 class="address-line">Address section</h2>-->
              </div>
              <div class="col-6 text-right">
                <a href="#" @click="handleAddAddressClick" class="add-address_list">Adresse du propriétaire</a>
              </div>
            </div>

            <div class="row" v-for="(address, index) in form.address" :key="index">

              <h3 class="address-line">{{ 'Address ' + (+index + 1) }}</h3>

              <b-form-group class="col-lg-6 row justify-content-center">
                <label class="page__label">City</label>
                <b-input type="text" class="page__inp" v-model="form.address[index].city"></b-input>
              </b-form-group>


              <b-form-group class="col-lg-6 row justify-content-center">
                <label class="page__label">Street Address</label>
                <b-input type="text" class="page__inp" v-model="form.address[index].address"></b-input>
              </b-form-group>

              <b-form-group class="col-lg-6 row justify-content-center">
                <label class="page__label">Postal Code</label>
                <b-input type="text" class="page__inp" v-model="form.address[index].postal_code"></b-input>
              </b-form-group>

              <b-form-group class="col-lg-6 row justify-content-center">
                <label class="page__label">additional_info</label>
                <b-input type="text" class="page__inp" v-model="form.address[index].additional_info"></b-input>
              </b-form-group>

            </div>
          </b-form>

          <b-form v-if="this.tabs.active === 1" class="row mt-3 justify-content-start">

            <b-form-group class="col-lg-6 row justify-content-start">
              <label class="page__label">Old Password</label>
              <b-input type="text" class="page__inp" v-model="form.userCred.oldPassword"></b-input>
            </b-form-group>

            <b-form-group class="col-lg-6 row justify-content-center">
              <label class="page__label">New Password</label>
              <b-input type="text" class="page__inp" v-model="form.userCred.password"></b-input>
            </b-form-group>

            <b-form-group class="col-lg-6 row justify-content-center">
              <label class="page__label">Confirm Password</label>
              <b-input type="text" class="page__inp" v-model="form.userCred.confirmPassword"></b-input>
            </b-form-group>

            <div class="row justify-content-center">
              <div class="col-lg-3">
                <button class="btn btn-primary save__button">Submit</button>
              </div>
            </div>
          </b-form>

          <!--                    fee: '', follow: '', expertise: '',
                    education: '', prof_practice: '', prof_exp: '',-->
          <b-form v-if="this.tabs.active === 2" class="row mt-3 justify-content-center">

            <b-form-group class="col-lg-6 row justify-content-center">
              <label class="page__label">Fee</label>
              <b-input type="text" class="page__inp" v-model="form.user.fee"></b-input>
            </b-form-group>
            <b-form-group class="col-lg-6 row justify-content-center">
              <label class="page__label">Follow up</label>
              <b-input type="text" class="page__inp" v-model="form.user.follow"></b-input>
            </b-form-group>

            <b-form-group class="col-lg-12 row justify-content-center">
              <label class="page__label">Expertise</label>
              <b-textarea rows="6" cols="6" v-model="form.user.expertise"></b-textarea>
            </b-form-group>

            <b-form-group class="col-lg-12 row justify-content-center">
              <label class="page__label">Professions Practice</label>
              <b-textarea rows="6" cols="6" v-model="form.user.prof_practice"></b-textarea>
            </b-form-group>

            <b-form-group class="col-lg-12 row justify-content-center">
              <label class="page__label">Professions Expertise</label>
              <b-textarea rows="6" cols="6" v-model="form.user.prof_exp"></b-textarea>
            </b-form-group>

          </b-form>
        </div>

      </div>


    </div>

  </div>

</template>

<script>

import 'flatpickr/dist/flatpickr.css';
import { mapActions, mapGetters } from "vuex";
import Multiselect                from 'vue-multiselect'

import getAddress       from '@/modules/app/modules/specialist/http/api/getAddresses';
import saveProfile      from "@/modules/app/modules/specialist/http/api/saveProfile";
import initProfile      from "@/modules/app/modules/specialist/http/api/initProfile";
import initSpecialities from "@/modules/app/modules/specialist/http/api/initSpecialities";
import initPractices    from "@/modules/app/modules/specialist/http/api/practice/initPractices";


export default {
  name      : "SpecialistProfile",
  components: { Multiselect },
  data() {
    return {
      address_mock: { city: '', address: '', postal_code: '', additional_info: '' },
      date        : new Date(),
      tabs        : {
        list  : [ 'Informations de base', 'Changer le mot de passe', 'Additional information' ],
        active: 0
      },
      form        : {
        user             : {
          firstname: '',
          lastname : '',
          phone    : '',
          email    : '',
          fee      : '', follow: '', expertise: '',
          education: '', prof_practice: '', prof_exp: '',
        },
        userCred         : {
          oldPassword    : '',
          password       : '',
          confirmPassword: '',
        },
        consultation_type: [],
        specialisation   : [],
        practices           : [],

        address: [
          { city: 'test city', address: 'addresss', postal_code: '1234', additional_info: 'additional_info' }
        ],

      },
      value       : [],
      option      : {
        practices   : [],
        type      : [
          { name: 'Online', value: '0' }, { name: 'Face-To-Face', value: '1' }
        ],
        speciality: [],
      },
      // options: [],
      options    : [
        { title: 'Vue.js', code: 'vu' },
        { title: 'Javascript', code: 'js' },
        { title: 'Open Source', code: 'os' }
      ],
      config     : {
        inline       : false,
        dateFormat   : "d/m/Y",
        disableMobile: 'true',
        minDate      : "today",
        locale       : 'French'
      },
      addressMock: { city: '', postal_code: '', street_address: '', additional_info: '' },
      userForm   : {
        addresses: [
          { city: '', postal_code: '', street_address: '', additional_info: '' }
        ],
        firstname: '',
        lastname : '',
        email    : '',
        phone    : '',

      },
    }
  },

  methods : {
    ...mapActions('app/auth', [ 'initUser' ]),

    handleAddAddressClick() {
      const self = this;
      this.form.address.reverse().push({ ...self.address_mock });
    },

    handleTabClick(index) {
      this.tabs.active = index;
    },

    handleSaveClick() {
      const self = this;
      const data = {
        user: self.form.user,
      };

      console.log('DATA::', data)
      saveProfile(data.user.id, data).then(response => {
        console.log('saveProfile::response', response);
      });
    }
  },
  computed: {
    ...mapGetters('app/auth', [ 'user' ])
  },
  created() {
    initProfile(this.user.id).then(profile => {
      this.form.user = profile;
    })

    initSpecialities().then(list => {
      this.option.speciality = list;
    })

    initPractices().then(list => {
      this.option.practices = list;
    })

  },
  mounted() {
  }
}
</script>

<style>
.form-group input[type="text"] {
  border: 0!important;
}
.save__button {
  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  font-size: 14px;
  line-height: 21px;
  margin-left: 1rem;
  padding: 8px 25px;
  border-radius: 30px;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  height: 45px;
}

.page__label {
  color: #2C3F34;
  margin-bottom: 3px;
}

.page__inp {
  width: 100%;
}
.page__inp input {
  border: 0!important;
}
</style>
