<template>
  <div class="layout-px-spacing">
    <div class="row layout-top-spacing">
    </div>
    <div class="row">
      <div class="col-md-7 col-sm-12 col-12 layout-spacing">
        <h3 class="payment-invoice-text"> Mon profil </h3>
        <div class="widget-content widget-content-area br-6 custom-p-all-20 main-account">
          <div class="h-tab">
            <ul class="h-tab_tab-head">
              <li class="active" rel="tab1" id="btn_tab1"> Compte principal</li>
              <!--<li rel="tab2" class="" id="btn_tab2"> Compte de membre de famille</li> -->
              <li rel="tab3" class=""> Changer le mot de passe</li>

            </ul>
            <div class="h-tab_container">
              <div id="tab1" class="h-tab_content" style="display: block;">

                <div class="col-md-12 pt-3">
                  <h3 class="specialist-info-text tab-title-head"> Information patient </h3>
                  <form class="form-horizontal" method="post" id="form_profile" enctype="multipart/form-data" novalidate="novalidate">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="address" class="label-head">Prénom </label>
                          <input type="text" class="form-control mb-2" placeholder="Prénom" value="jules" name="client_first_name">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="address" class="label-head">Nom de famille </label>
                          <input type="text" class="form-control mb-2" placeholder="Nom de famille" value="Test" name="client_last_name">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="address" class="label-head">Pays </label>
                          <input type="text" class="form-control mb-2" placeholder="Pays" value="" name="country">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="address" class="label-head">Numéro de portable </label>
                          <input type="text" class="form-control mb-2" placeholder="Numéro de portable" value="0618327088" onkeyup="check_mobile(this.value)" name="mobile_number" maxlength="13">
                          <span id="mobile_error"></span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="location" class="label-head">Date de naissance </label>
                          <!-- <input type="text" class="form-control mb-2" id="location" placeholder="" value="06/11/1992" name="date_of_birth">-->
                          <input type="text" id="client_date_of_birth_1" name="client_date_of_birth" class="form-control mb-2 flatpickr flatpickr-input active" placeholder="Date de naissance" value="06/11/1992" readonly="readonly">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="location" class="label-head"> Adresse électronique</label>
                          <input type="text" class="form-control mb-2" id="patient_email" placeholder="Adresse électronique" value="ngueyajunior@gmail.com" onkeyup="check_email(this.value)" name="email_id">
                          <span id="email_id_error"></span>
                        </div>
                      </div>
                    </div>

                    <div class="row">

                      <div class="col-md-12 d-flex">
                        <div class="n-chk">
                          <label class="new-control new-radio new-radio-text radio-success">
                            <input type="radio" class="new-control-input" name="gender" value="male">
                            <span class="new-control-indicator"></span><span class="new-radio-content">Masculin</span>
                          </label>
                        </div>

                        <div class="n-chk">
                          <label class="new-control new-radio new-radio-text radio-success">
                            <input type="radio" class="new-control-input" name="gender" value="female">
                            <span class="new-control-indicator"></span><span class="new-radio-content">Féminin</span>
                          </label>
                        </div>
                      </div>
                      <!--  <div class="col-md-6">
                            <div class="form-group">
                                <label for="location" class="label-head"> Mot de passe  </label>
                                <input type="text" class="form-control mb-2" id="location" placeholder="Email Address" value="Tool.Tick01" name="password" readonly>
                            </div>
                        </div> -->
                      <div class="col-md-6 commmon-display-flex gender-margin">

                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-5">
                        <div class="upload pr-md-4">
                          <p class="mt-2" style="display: grid;">
                            <i class="flaticon-cloud-upload mr-1"></i>
                            Modifier la photo </p>
                          <div class="dropify-wrapper touch-fallback has-preview"><div class="dropify-message"><span class="file-icon"></span> <p>Click to Upload or Drag n Drop</p><p class="dropify-error">Ooops, something wrong appended.</p></div><div class="dropify-loader" style="display: none;"></div><div class="dropify-errors-container"><ul></ul></div><input type="file" id="input-file-max-fs" class="dropify text-center" data-default-file="http://docare.fr//uploadimages/default.jpg" data-max-file-size="2M" name="profile_pic"><button type="button" class="dropify-clear"><i class="flaticon-close-fill"></i></button><div class="dropify-preview" style="display: block;"><span class="dropify-render"><img src="http://docare.fr//uploadimages/default.jpg"></span><div class="dropify-infos"><div class="dropify-infos-inner"><p class="dropify-filename"><span class="file-icon"></span> <span class="dropify-filename-inner">default.jpg</span></p><p class="dropify-infos-message">Upload or Drag n Drop</p></div></div></div></div>

                          <input type="hidden" name="old_img" value="default.jpg">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-12 text-center">
                        <button type="submit" name="time" class="btn btn-primary custom-submit-button" id="btn-desk">   Soumettre</button>
                      </div>
                    </div>
                  </form></div>

              </div>
              <div id="tab2" class="h-tab_content" style="display: none;">

                <div class="col-md-12 pt-3">
                  <h3 class="specialist-info-text tab-title-head">informations de l'utilisateur </h3>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Prénom</label>
                        <input type="text" class="form-control mb-2" name="firstname_c" placeholder="Prénom" value="">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Nom de famille </label>
                        <input type="text" name="lastname_c" class="form-control mb-2" placeholder="Nom de famille" value="">
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Pays </label>
                        <input type="text" class="form-control mb-2" name="country_c" placeholder="Pays" value="">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head">  Numéro de portable </label>
                        <input type="text" class="form-control mb-2" name="mobile_no_c" placeholder="Numéro de portable" value="">
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="location" class="label-head"> Date de naissance </label>
                        <input type="text" class="form-control flatpickr-input" id="end_date" name="date_of_birth_c" placeholder="Date de naissance" value="01/01/1970" readonly="readonly"><div class="flatpickr-calendar animate inline" tabindex="-1"><div class="flatpickr-months"><span class="flatpickr-prev-month flatpickr-disabled"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17"><g></g><path d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z"></path></svg></span><div class="flatpickr-month"><div class="flatpickr-current-month"><select class="flatpickr-monthDropdown-months" tabindex="-1"><option class="flatpickr-monthDropdown-month" value="1" tabindex="-1">February</option><option class="flatpickr-monthDropdown-month" value="2" tabindex="-1">March</option><option class="flatpickr-monthDropdown-month" value="3" tabindex="-1">April</option><option class="flatpickr-monthDropdown-month" value="4" tabindex="-1">May</option><option class="flatpickr-monthDropdown-month" value="5" tabindex="-1">June</option><option class="flatpickr-monthDropdown-month" value="6" tabindex="-1">July</option><option class="flatpickr-monthDropdown-month" value="7" tabindex="-1">August</option><option class="flatpickr-monthDropdown-month" value="8" tabindex="-1">September</option><option class="flatpickr-monthDropdown-month" value="9" tabindex="-1">October</option><option class="flatpickr-monthDropdown-month" value="10" tabindex="-1">November</option><option class="flatpickr-monthDropdown-month" value="11" tabindex="-1">December</option></select><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div></div></div><span class="flatpickr-next-month"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17"><g></g><path d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z"></path></svg></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
      <span class="flatpickr-weekday">
        Sun</span><span class="flatpickr-weekday">Mon</span><span class="flatpickr-weekday">Tue</span><span class="flatpickr-weekday">Wed</span><span class="flatpickr-weekday">Thu</span><span class="flatpickr-weekday">Fri</span><span class="flatpickr-weekday">Sat
      </span>
                      </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay flatpickr-disabled" aria-label="January 30, 2022">30</span><span class="flatpickr-day prevMonthDay flatpickr-disabled" aria-label="January 31, 2022">31</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 1, 2022">1</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 2, 2022">2</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 3, 2022">3</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 4, 2022">4</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 5, 2022">5</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 6, 2022">6</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 7, 2022">7</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 8, 2022">8</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 9, 2022">9</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 10, 2022">10</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 11, 2022">11</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 12, 2022">12</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 13, 2022">13</span><span class="flatpickr-day flatpickr-disabled" aria-label="February 14, 2022">14</span><span class="flatpickr-day today" aria-label="February 15, 2022" aria-current="date" tabindex="-1">15</span><span class="flatpickr-day " aria-label="February 16, 2022" tabindex="-1">16</span><span class="flatpickr-day " aria-label="February 17, 2022" tabindex="-1">17</span><span class="flatpickr-day " aria-label="February 18, 2022" tabindex="-1">18</span><span class="flatpickr-day " aria-label="February 19, 2022" tabindex="-1">19</span><span class="flatpickr-day " aria-label="February 20, 2022" tabindex="-1">20</span><span class="flatpickr-day " aria-label="February 21, 2022" tabindex="-1">21</span><span class="flatpickr-day " aria-label="February 22, 2022" tabindex="-1">22</span><span class="flatpickr-day " aria-label="February 23, 2022" tabindex="-1">23</span><span class="flatpickr-day " aria-label="February 24, 2022" tabindex="-1">24</span><span class="flatpickr-day " aria-label="February 25, 2022" tabindex="-1">25</span><span class="flatpickr-day " aria-label="February 26, 2022" tabindex="-1">26</span><span class="flatpickr-day " aria-label="February 27, 2022" tabindex="-1">27</span><span class="flatpickr-day " aria-label="February 28, 2022" tabindex="-1">28</span><span class="flatpickr-day nextMonthDay" aria-label="March 1, 2022" tabindex="-1">1</span><span class="flatpickr-day nextMonthDay" aria-label="March 2, 2022" tabindex="-1">2</span><span class="flatpickr-day nextMonthDay" aria-label="March 3, 2022" tabindex="-1">3</span><span class="flatpickr-day nextMonthDay" aria-label="March 4, 2022" tabindex="-1">4</span><span class="flatpickr-day nextMonthDay" aria-label="March 5, 2022" tabindex="-1">5</span><span class="flatpickr-day nextMonthDay" aria-label="March 6, 2022" tabindex="-1">6</span><span class="flatpickr-day nextMonthDay" aria-label="March 7, 2022" tabindex="-1">7</span><span class="flatpickr-day nextMonthDay" aria-label="March 8, 2022" tabindex="-1">8</span><span class="flatpickr-day nextMonthDay" aria-label="March 9, 2022" tabindex="-1">9</span><span class="flatpickr-day nextMonthDay" aria-label="March 10, 2022" tabindex="-1">10</span><span class="flatpickr-day nextMonthDay" aria-label="March 11, 2022" tabindex="-1">11</span><span class="flatpickr-day nextMonthDay" aria-label="March 12, 2022" tabindex="-1">12</span></div></div></div></div></div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="location" class="label-head"> Adresse électronique </label>
                        <input type="text" class="form-control mb-2" name="email_id_c" placeholder="Adresse électronique" value="">
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="location" class="label-head"> Relation </label>
                        <input type="text" class="form-control mb-2" name="relation_c" placeholder="Relation" value="">
                      </div>
                    </div>
                    <div class="col-md-6 commmon-display-flex gender-margin">
                      <div class="n-chk">
                        <label class="new-control new-radio new-radio-text radio-success">
                          <input type="radio" class="new-control-input" name="gender_c" value="male">
                          <span class="new-control-indicator"></span><span class="new-radio-content">Masculin</span>
                        </label>
                      </div>

                      <div class="n-chk">
                        <label class="new-control new-radio new-radio-text radio-success">
                          <input type="radio" class="new-control-input" name="gender_c" value="female">
                          <span class="new-control-indicator"></span><span class="new-radio-content">Féminin</span>
                        </label>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-12 text-center pt-3">
                      <button type="submit" name="time" id="btn_child_reset" class="btn btn-primary custom-submit-button"> Soumettre   </button>
                    </div>
                  </div>
                </div>
              </div>
              <div id="tab3" class="h-tab_content" style="display: none;">

                <div class="col-md-12 pt-3">
                  <h3 class="specialist-info-text tab-title-head">Changer le mot de passe </h3>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Ancien mot de passe</label>
                        <input type="password" class="form-control mb-2" placeholder="Mot de passe" value="" id="old_password" name="old_password">
                        <span class="err_old_password"></span>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Nouveau mot de passe </label>
                        <input type="password" class="form-control mb-2" placeholder="Nouveau mot de passe" name="new_password" id="new_password" value="">
                        <span class="err_new_password"></span>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="address" class="label-head"> Confirmez le mot de passe </label>
                        <input type="password" class="form-control mb-2" placeholder="Confirmez le mot de passe" name="confirm_password" id="confirm_password" value="">
                        <span class="err_confirm_password"></span>
                      </div>
                    </div>

                  </div>

                  <div class="row">
                    <div class="col-md-12 text-center">
                      <button type="button" name="btn_password_reset " id="btn_password_reset" class="btn btn-primary custom-submit-button"> Soumettre   </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-5 col-sm-12 col-12 layout-spacing ">
        <div class="widget-content widget-content-area br-6 custom-p-all-20 add-info-mt main-account">
          <div class="col-md-12">
            <h3 class="specialist-info-text add_info">Information additionnelle</h3>
            <div id="user_addition_info">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head"> Taille </label>
                    <input type="number" class="form-control mb-2" name="height" placeholder="Taille(cm)" value="0">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head">Fumeur</label>
                    <input type="text" class="form-control mb-2" id="address" placeholder="Fumeur" value="" name="smoker">
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head">Poids </label>
                    <input type="number" class="form-control mb-2" id="address" placeholder="Poids(kg) " value="0" name="weight">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head"> Tension artérielle</label>
                    <input type="text" class="form-control mb-2" id="address" placeholder="Tension artérielle" value="" name="blood_pressure">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="location" class="label-head">Allergie</label>
                    <input type="text" class="form-control mb-2" id="location" placeholder="Allergie" value="" name="allergy">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="location" class="label-head">Autre information </label>
                    <input type="text" class="form-control mb-2" id="location" placeholder="Autre information" value="" name="disease_history">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 text-center">
                <button type="submit" name="time" class="btn btn-primary custom-submit-button" id="btn-mobile">   Soumettre</button>
              </div>
            </div>
            <!-- some one additiol info -->
            <div id="someone_addition_info" style="display: none;">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head"> Taille </label>
                    <input type="number" class="form-control mb-2" name="height_c" placeholder="Taille" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head">Fumeur</label>
                    <input type="text" class="form-control mb-2" placeholder="Fumeur" value="" name="smoker_c">
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head">Poids </label>
                    <input type="number" class="form-control mb-2" placeholder="Poids " value="" name="weight_c">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="address" class="label-head"> Tension artérielle</label>
                    <input type="text" class="form-control mb-2" placeholder="Tension artérielle" value="" name="blood_pressure_c">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="location" class="label-head">Allergie</label>
                    <input type="text" class="form-control mb-2" placeholder="Allergie" value="" name="allergy_c">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="location" class="label-head">Information additionnelle </label>
                    <input type="text" class="form-control mb-2" placeholder="Information additionnelle" value="" name="disease_history_c">
                  </div>
                </div>
              </div>
            </div>
            <!-- end -->

            <input type="hidden" name="csrf_teletick_tkn" value="63f25c48e9c54557b86e2765f4ad4029">

            <input type="hidden" name="clientprofile_id" value="77">

            <input type="hidden" name="userprofile_id_fk" value="309">

            <input type="hidden" name="user_id_fk" value="700">
            <input type="hidden" name="child_account_save" id="child_account_save" value="">
            <input type="hidden" name="clientfamily_id" value="">
            <input type="hidden" name="old_email" value="ngueyajunior@gmail.com" id="old_email">
            <input type="hidden" name="password" value="Tool.Tick01" id="password">
            <input type="hidden" name="old_mobile" value="0618327088" id="old_mobile">

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ClientProfile"
}
</script>

<style scoped>
.layout-spacing {
  padding-bottom: 25px;
}
.widget-content-area {
  -webkit-box-shadow: 0 4px 6px 0 rgb(85 85 85 / 9%), 0 1px 20px 0 rgb(0 0 0 / 8%), 0px 1px 11px 0px rgb(0 0 0 / 6%);
  -moz-box-shadow: 0 4px 6px 0 rgba(85, 85, 85, 0.09019607843137255), 0 1px 20px 0 rgba(0, 0, 0, 0.08), 0px 1px 11px 0px rgba(0, 0, 0, 0.06);
  box-shadow: 0 4px 6px 0 rgb(85 85 85 / 9%), 0 1px 20px 0 rgb(0 0 0 / 8%), 0px 1px 11px 0px rgb(0 0 0 / 6%);
}

.main-account {
  min-height: 745px;
}
label {
  margin-bottom: 0.5rem;
}
.form-control {
  padding: 8px 8px;
}
</style>