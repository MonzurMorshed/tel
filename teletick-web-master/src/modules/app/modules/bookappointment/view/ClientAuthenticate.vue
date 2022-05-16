<template>
  <div class="bookapintment__wrapper">
    <TopNavbar/>

    <div style="display: flex; flex-basis: 100%; flex-direction: column; justify-content: center; margin-top: 30px">

      <Breadcrumbs/>
      <div class="front__card">
        <Stepper
            v-if="Stepper.active !== Stepper.length"
            style="margin-top: 13px; border-bottom: 1px solid #EEF3EB;"/>

        <div class="client-authenticate__wrapper">
          <div id="content-step5" class="step-content active">
            <div class="row">
              <div class="col-md-7">
                <div class="contact_block"
                     style="min-height: 413px;height: 100%;border:0;padding-top:0;">
                  <ul class="nav nav-tabs" id="login-register-tabs">
                    <li class="active">
                      <a data-toggle="tab" href="#register" v-on:click="login=0"
                         v-bind:class="[login===0 ? 'active' : '']">
                        Créer un compte</a>
                    </li>
                    <li>
                      <a data-toggle="tab" href="#login" v-on:click="login=1"
                         v-bind:class="[login===1 ? 'active' : '']">J'ai deja un comptê</a>
                    </li>
                  </ul>
                  <div class="tab-content mt-4">
                    <div id="register" v-if="login===0" class="tab-pane fade in active show">
                      <div class="row pb-3">
                        <div class="col-md-12">
                          <span class="register-below-txt">
                            Il vous servira a acceder a votre espace personnel
                          </span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input id="register_fname" type="text" class="txtOnly" placeholder="Prénom*"
                                     name="register_fname" maxlength="100"
                                     v-model="user.firstname"
                              >
                            </div>
                          </div>

                        </div>
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input id="register_lname" name="register_lname" type="text" class="txtOnly"
                                     placeholder="Nom de famille" maxlength="100"
                                     v-model="user.lastname"
                              >
                              <p id="register_lname_error" class="error"></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input id="register_email" name="register_email" type="text" placeholder="Email"
                                     maxlength="200"
                                     v-model="user.email"
                              >
                              <p id="register_email_error" class="error"></p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input id="register_email_confirm" type="text" name="register_email_confirm"
                                     placeholder="Confirmez votre email"
                                     v-model="credential.email_confirm"
                              >
                              <p id="register_confirmemail_error" class="error"></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input type="text" name="password" id="password" placeholder="Mot de passe"
                                     v-model="user.password"
                              >
                              <span class="fa fa-fw fa-eye field_icon toggle-password"></span>
                              <span id="new_password_error" class="error"> </span>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input type="text" id="cpass" name="cpass" placeholder="Confirmez le mot de passe"
                                     v-model="credential.password_confirm"
                              >
                              <span class="fa fa-fw fa-eye field_icon toggle-password"></span>
                              <span id="new_confirmpass_error" class="error"> </span>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="quform-element form-group">
                            <div class="quform-input">
                              <input id="register_mobile" type="text" name="register_mobile" data-rule-minlength="10"
                                     data-msg-minlength="Numéro de portable La longueur est de 10"
                                     data-rule-number="true"
                                     data-msg-number="Veuillez saisir un numéro de mobile valide"
                                     placeholder="Numéro de téléphone portable" maxlength="10"
                                     v-model="user.phone_number"
                              >
                              <p id="register_mobile_error" class="error"></p>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="green-box">
                          <div class="col-md-1">
                            <label class="switch">
                              <input type="checkbox" checked="">
                              <span class="slider round"></span>
                            </label>
                          </div>
                          <div class="col-md-11">
                            <span>
                            En cochant, vous reconaissez avoir pris connaissance
                              <a href="https://www.teletick.fr/cguv" target="_blank">des conditions generales</a>et de
                              <a href="https://www.teletick.fr/politique-de-confidentialite" target="_blank">la politique de confidentialite</a>et les accepter                                   </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="login" class="tab-pane fade in active show" v-if="login===1">
                      <div class="row pb-3">
                        <div class="col-md-12">
                          <span class="register-below-txt"> Il vour servira a acceder a votre espace personnel</span>
                        </div>
                      </div>
                      <div class="quform-element form-group">
                        <div class="quform-input text-left">
                          <input type="text" name="username" id="login_username" placeholder="Email"
                                 v-model="loginForm.email"
                          >
                        </div>
                      </div>

                      <div class="quform-element form-group">
                        <div class="quform-input text-left">
                          <input id="login_password" type="password" name="password" placeholder="Mot de passe"
                                 v-model="loginForm.password"
                          >
                        </div>
                      </div>
                      <div class="text-left">
                        <button
                            @click="() => handleLoginSubmit()"
                            type="button" class="btn btn-primary top-button rejo-btn-bg" id="verify_login"> Se
                          connecter et finaliser rendez-vous
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-5">
                <div class="contact_block custom-adjust-box" style="min-height:525px;">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="only-flex">
                        <img class="specialist-image" alt="img"
                             style="height: 70px!important; width: 70px!important; margin: 30px; margin-right: 20px!important;"
                             src="https://www.teletick.fr/uploadimages/16402713774885243261157743409.jpg">
                        <div class="victor_name_text">
                          <h4 class="specialist-name" id="content5_name">Yann Baleine</h4>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row physical_address 1"
                       style="padding: 0 10px 0 10px !important;font-size: 14px !important;">
                    <div class="col-md-12">
                      <p style="font-style: normal;font-weight: 600;font-size: 11px;line-height: 16px;margin-bottom: 5px;display: flex;align-items: center;color: #2C3F34">
                        DATE
                      </p>
                      <p style="margin-bottom: 0 !important;font-style: normal;font-weight: 400;font-size: 14px;line-height: 24px;color:#3d3d3d;opacity:1;"
                         class="physical_city">TOULOUSE</p>
                    </div>
                    <div class="col-md-12" style="margin-top: 20px">
                      <p style="font-style: normal;font-weight: 600;font-size: 11px;line-height: 16px;margin-bottom: 5px;display: flex;align-items: center;color: #2C3F34;">
                        ADRESSE
                      </p>
                      <span
                          style="margin-bottom: 0 !important;font-style: normal;font-weight:400;font-size: 14px !important;line-height: 24px;color:#3d3d3d;opacity:1;"
                          class="physical_map_address"><a href="" class="location_icon"
                                                          style="height: 20px; margin: 3px -5px !important;"></a>  116 Route d'Espagne, Toulouse, France</span>
                    </div>
                  </div>


                  <div class="row" style="margin-top: 70px">
                    <div class="col-md-6"><h3 class="terification-text mtb-10"> Tarification : <span
                        class="pricing span-left">50<i class="fa fa-eur" aria-hidden="true" style="color: #537E36;"></i></span>
                    </h3></div>
                    <div class="col-md-6">
                      <h3 class="terification-text mtb-10 lgt_blue">
                        <span class="fl">Prix suivi :</span>
                        <span class="fr follow_up span-right" style="color: #598DCB;">50<i class="fa fa-eur"
                                                                                           aria-hidden="true"
                                                                                           style="color:#598DCB;"></i></span>
                      </h3>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            <div class="row next-button-row custom-div-m">
              <div class="col-md-6 col-sm-6 col-xs-6">
                <button type="button" class="btn form-previous-button prev"><i class="fa fa-arrow-left"
                                                                               aria-hidden="true"></i> RETOUR
                </button>
              </div>
              <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                <button type="button" class="btn form-next-button next slick-next"
                        @click.prevent="() => handleUserRegister()"
                >SUIVANT</button>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Stepper                    from "@/modules/app/modules/bookappointment/components/Stepper";
import Breadcrumbs                from "@/modules/app/modules/bookappointment/components/Breadcrumbs";
import TopNavbar                  from "@/modules/app/modules/bookappointment/components/TopNavbar";
import { mapActions, mapGetters } from "vuex";
import Auth                       from "@/modules/app/modules/auth/services/auth";
import createBook                 from "@/modules/http/api/createBook";

export default {
  name      : "ClientAuthenticate",
  components: { Stepper, Breadcrumbs, TopNavbar },

  data() {
    return {
      login     : 0,
      loginForm: {
        email: '',
        password: '',
      },
      credential: {
        email_confirm   : '',
        password_confirm: '',
      },
      user      : {
        id          : '',
        email       : '',
        firstname   : '',
        lastname    : '',
        type        : 'client',
        phone_number: '',
        password: '',
      },
    }
  },

  computed: {
    ...mapGetters('app/bookappointment', [ 'Stepper' ]),
    ...mapGetters('app/bookappointment', [ 'BookSpecialistGetter' ])
  },

  methods: {
    ...mapActions('app/auth', { loginAction: 'login' }),
    ...mapActions('app/auth', [ 'initUser' ]),

    handleUserRegister() {
      const self = this;
      Auth.register(this.user).then(async () => {
        alert('REGISTERED');
        await this.loginAction({ login: self.user.email, password: self.user.password })
      })
    },

    handleLoginSubmit() {
      const self = this;
      this.loginAction({ login: this.loginForm.email, password: this.loginForm.password }).then((response) => {
        console.log('RESPONSE', response);

        createBook(self.BookSpecialistGetter.profile.user_id, {
          reason: self.BookSpecialistGetter.reason,
          address: '',
          from: '',
        }).then((response) => {
          self.$router.push({ name: 'appointment.success' });
        })
      })
    }
  },
}
</script>

<style scoped>
a, a:active, a:focus {
  color: #6f6f6f;
  text-decoration: none;
  transition-timing-function: ease-in-out;
  -ms-transition-timing-function: ease-in-out;
  -moz-transition-timing-function: ease-in-out;
  -webkit-transition-timing-function: ease-in-out;
  -o-transition-timing-function: ease-in-out;
  transition-duration: .2s;
  -ms-transition-duration: .2s;
  -moz-transition-duration: .2s;
  -webkit-transition-duration: .2s;
  -o-transition-duration: .2s;
}

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

.client-authenticate__wrapper {
  min-height: auto;
  background: #fff;
  border-radius: 4px;
  padding: 0 10px 10px 10px;
  border-top: 0 solid #ccc;
  margin: 50px 120px 0 120px;
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

.tab-content input {
  filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
}

#login-register-tabs li.active {
  color: #b1d09e;
}

#login-register-tabs li {
  margin-right: 20px;
  margin-bottom: 10px;
}

#login-register-tabs li a.active {
  border-bottom: 3px solid #b1d09e;
}

#login-register-tabs li a.active {
  color: #b1d09e;
  padding-bottom: 10px;
}

.green-box {
  background: #A7D08E33;
  margin: 0px 16px;
  font-size: 13px;
  padding: 11px 0px;
  border-radius: 5px;
  display: flex;
  align-items: center;
}

.green-box span a {
  color: #537E36;
  text-decoration: underline;
}

input:checked + .slider {
  background: linear-gradient(90deg, #A7D08E 0%, #537E36 100%);
}

.toggle-password {
  position: absolute;
  right: 104px;
  top: 17px;
  color: #b9d9a5;
}

.terification-text {
  padding: 13px 23px;
  width: 100%;
  margin-right: 0;
  flex-direction: row;
  text-align: right;
  position: relative;
  color: #2C3F34;
  font-weight: 500;
  font-size: 12px;
  line-height: 24px;
  background: rgba(167, 208, 142, 0.15);
  display: inline-flex;
}

.terification-text:before {
  background-repeat: no-repeat;
  background-position: left center;
  background-size: contain;
  height: 24px;
  width: 24px;
  background-image: url("data:image/svg+xml,%3Csvg width='27' height='26' viewBox='0 0 27 26' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M14.6375 5.6249C14.6375 5.0228 14.1495 4.53469 13.5476 4.53469C12.9457 4.53469 12.4577 5.0228 12.4577 5.6249V12.893C12.4577 13.2689 12.6513 13.6183 12.97 13.8175L17.3296 16.543C17.84 16.8622 18.5124 16.7069 18.8315 16.1964C19.1505 15.6858 18.9953 15.0132 18.4849 14.694L14.6375 12.2888V5.6249Z' fill='%23A7D08E' fill-opacity='0.4'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M13.5476 0.173828C6.52499 0.173828 0.832031 5.8684 0.832031 12.893C0.832031 19.9176 6.52499 25.6122 13.5476 25.6122C20.5702 25.6122 26.2632 19.9176 26.2632 12.893C26.2632 5.8684 20.5702 0.173828 13.5476 0.173828ZM3.01184 12.893C3.01184 7.07262 7.72887 2.35426 13.5476 2.35426C19.3663 2.35426 24.0834 7.07262 24.0834 12.893C24.0834 18.7134 19.3663 23.4318 13.5476 23.4318C7.72887 23.4318 3.01184 18.7134 3.01184 12.893Z' fill='%23A7D08E' fill-opacity='0.4'/%3E%3C/svg%3E");
}

.terification-text.lgt_blue {
  background: rgba(145, 190, 255, 0.15);
}

.terification-text.lgt_blue:before {
  background-image: url("data:image/svg+xml,%3Csvg width='29' height='24' viewBox='0 0 29 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M18.9879 12C18.9879 10.8273 19.9377 9.87664 21.1094 9.87664C22.2811 9.87664 23.2309 10.8273 23.2309 12C23.2309 13.1727 22.2811 14.1233 21.1094 14.1233C19.9377 14.1233 18.9879 13.1727 18.9879 12Z' fill='%23598DCB' fill-opacity='0.18'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M25.9767 4.46072C25.0464 2.27273 22.9908 0.69986 20.5446 0.442229L19.6227 0.345128C14.9662 -0.145299 10.2695 -0.112959 5.62024 0.441546L5.00932 0.514408C2.64907 0.795906 0.778952 2.64153 0.464576 4.99963C-0.154859 9.64596 -0.154859 14.354 0.464576 19.0004C0.778952 21.3585 2.64907 23.2041 5.00933 23.4856L5.62024 23.5585C10.2695 24.113 14.9662 24.1453 19.6227 23.6549L20.5446 23.5578C22.9908 23.3001 25.0464 21.7273 25.9767 19.5393C27.4465 19.1013 28.5684 17.8259 28.7525 16.25C29.0825 13.4263 29.0825 10.5737 28.7525 7.74995C28.5684 6.17411 27.4465 4.89872 25.9767 4.46072ZM19.4007 2.45681C14.9015 1.98296 10.3635 2.0142 5.87127 2.54998L5.26035 2.62284C3.86184 2.78963 2.75373 3.88322 2.56746 5.28047C1.97287 9.7404 1.97287 14.2596 2.56746 18.7195C2.75373 20.1168 3.86184 21.2104 5.26036 21.3772L5.87127 21.45C10.3635 21.9858 14.9015 22.017 19.4007 21.5432L20.3226 21.4461C21.5256 21.3194 22.59 20.7259 23.3276 19.845C21.1945 19.9695 19.0331 19.9138 16.9254 19.6781C15.1301 19.4772 13.6782 18.0623 13.4664 16.25C13.1364 13.4263 13.1364 10.5737 13.4664 7.74995C13.6782 5.93766 15.1301 4.52275 16.9254 4.32192C19.0331 4.08615 21.1945 4.03052 23.3276 4.15502C22.59 3.27408 21.5256 2.68061 20.3226 2.55392L19.4007 2.45681ZM24.3304 6.35855C24.3313 6.36398 24.3321 6.36941 24.333 6.37485L24.3415 6.4299L24.6225 6.38623C24.7679 6.40063 24.913 6.41593 25.0578 6.43213C25.8886 6.52506 26.5502 7.18209 26.6454 7.99661C26.9562 10.6565 26.9562 13.3435 26.6454 16.0034C26.5502 16.8179 25.8886 17.4749 25.0578 17.5679C24.913 17.5841 24.7678 17.5994 24.6225 17.6138L24.3415 17.5701L24.333 17.6251C24.3321 17.6306 24.3313 17.636 24.3304 17.6414C21.9563 17.8564 19.5214 17.8319 17.1611 17.5679C16.3303 17.4749 15.6687 16.8179 15.5735 16.0034C15.2627 13.3435 15.2627 10.6565 15.5735 7.99661C15.6687 7.18209 16.3303 6.52506 17.1611 6.43213C19.5214 6.1681 21.9563 6.14357 24.3304 6.35855Z' fill='%23598DCB' fill-opacity='0.18'/%3E%3C/svg%3E");
  width: 28px;
  height: 24px;
}

.specialist-name {
  margin-top: 40px;
  font-style: normal;
  font-weight: 600;
  font-size: 14px;
  line-height: 24px;
}
</style>
