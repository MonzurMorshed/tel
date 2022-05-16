<template>
  <div class="payment__wrapper">
    <TopNavbar/>

    <div style="display: flex; flex-basis: 100%; flex-direction: column; justify-content: center; margin-top: 30px">

      <Breadcrumbs/>
      <div class="front__card">
        <Stepper
            v-if="Stepper.active !== Stepper.length"
            style="margin-top: 13px; border-bottom: 1px solid #EEF3EB;"/>
        <div id="content-step5" class="step-content active">
          <div class="row">
            <div class="col-md-6">
              <div style="display: block; width: 100%; margin: 0;">
                <div class="uploadimages_area" style="min-height:294px;height:100%!important;">
                  <div class="resp-tabs-container hor_1">
                    <h2 class="resp-accordion hor_1 resp-tab-active" role="tab" aria-controls="hor_1_tab_item-0"
                        style="background: none;"><span class="resp-arrow"></span></h2>
                    <div class="resp-tab-content hor_1 resp-tab-content-active" style="display:block">
                      <div class="row me-profile">
                        <div class="col-md-12" id="profile_name_modifer">
                          <div class="only-flex">
                            <div class="content6_client_image" id="content6_client_image">
                              <img class="specialist-image" alt="img"
                                   style="height: 70px!important;width: 70px!important;"
                                   src="https://www.teletick.fr/uploadimages/default.jpg">
                            </div>
                            <div style="display: flex;align-items: center;">
                              <h4 class="victor-name-sec content6_client_name" id="new_update_name2"
                                  style="font-weight: 600;font-size: 18px;line-height: 24px;"> jules Test</h4>
                            </div>
                          </div>
                          <i class="fa fa-pencil modify-icon" aria-hidden="true">
                            <span class="modify-text" style="cursor:pointer;text-transform: uppercase;font-family: 'Poppins', serif;font-weight: 400;font-size: 12px;line-height: 26px;">Modifier</span>
                          </i>
                        </div>
                      </div>

                      <div class="row me-profile pt-3" style="margin-bottom: 0;">
                        <div class="col-md-12">
                          <span class="information_text" id="new_update_mobile2">06 18 32 70 88  </span>
                        </div>
                        <div class="col-md-12">
                          <span class="information_text" id="new_update_email2">ngueyajunior@gmail.com</span>
                        </div>
                      </div>
                      <div class="row me-profile" style="margin-top: 0;">
                        <div class="col-md-12">
                          <span class="information_text" id="new_update_age2">52 ans</span>
                        </div>
                        <div class="col-md-12">
                          <span class="information_text" id="new_update_city2">Aucune donnée</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="consultation_area" style="min-height:294px;height:100%!important;">
                <div class="row">
                  <div class="col-md-12">
                    <div class="only-flex">
                      <div class="specialist-image"><img class="specialist-image" alt="img"
                                                         src="https://www.teletick.fr/uploadimages/16402713774885243261157743409.jpg">
                      </div>
                      <div class="" style="display:flex;justify-content: center;">
                        <div style="display:block;">
                          <h4 class="victor-name" id="content6_specialist_name">YANN BALEINE</h4>
                          <h5 class="psycho-text" id="content6_spiciality">Préparation mentale et Réflexologue</h5>
                        </div>
                        <a href="" class="video_camera"
                           style="position: relative; left: 13px; top: -3px !important; display: none;"><img
                            src="https://www.teletick.fr/webassets/img/booking/video_camera.png" alt="video"></a>
                        <a href="" class="location_icon"
                           style="position: relative;z-index: 999;top:-3px;left: 11px;"><img
                            src="https://www.teletick.fr/webassets/img/booking/location.png" alt="video"
                            style="width: 20px;"></a>
                      </div>
                    </div>

                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="">
                      <h3 class="expertise-text"> Spécialité </h3>
                      <h4 class="expertise-content expertise" id="content-step7-expertise">Anxiété,Management du
                        stress,Désordre du sommeil,Problèmes d'image et d'estime de soi,Motivation,Gestion de
                        carrière,Bien
                        être en entreprise,Surmenage,Burn out,Sophrologie,Méditation,Mindfulness,Réflexologie</h4>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="">
                      <h3 class="expertise-text"> Type de consultation </h3>
                      <h4 class="expertise-content consultation_type_text">Consultation en présentiel</h4>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-8 sds">
                    <div class="terification-text mt-5 w-auto terification-text-custom-mb ">
                      <h3>Détail du rendez-vous : </h3>
                      <h4 id="fetch_appontment_detail">mardi 15 undefined à 13h00</h4>
                    </div>
                  </div>
                  <div class="col-md-4 sds pl-0 custom-box-align">
                    <div class="terification-text mt-5 w-auto terification-text-custom-mb">
                      <h3>Tarification </h3>
                      <h4 id="content6_price">50 <i class="fa fa-eur" aria-hidden="true" style="color: #FF9739;"></i>
                      </h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="online_payment_form" style="display: none;">
            <div class="row">
              <div class="col-md-12 pt-3">
                <div class="">
                  <h3 class="expertise-text  dddd credit-cards-head">AJOUTER UNE CARTE BANCAIRE </h3>
                </div>
              </div>
            </div>
            <div class="row me-profile" id="stripe_mobile">
              <div class="col-md-3 col-xs-12 col-sm-12 card-name">
                <input type="text" name="card_name" placeholder="Nom du titulaire de la carte" value=""
                       id="formcardname"
                       class="shadow-text" onblur="checkempty(this.value,'cardnameerror')">
                <span class="error" id="cardnameerror"></span>
              </div>
              <div class="col-md-3 col-xs-12 col-sm-12 card-number">
                <div id="card-number" class="stripe_d StripeElement StripeElement--empty">
                  <div class="__PrivateStripeElement"
                       style="margin: 0 !important; padding: 0 !important; border: none !important; display: block !important; background: transparent !important; position: relative !important; opacity: 1 !important;">
                    <input class="__PrivateStripeElement-input" aria-hidden="true" aria-label=" " autocomplete="false"
                           maxlength="1"
                           style="border: none !important; display: block !important; position: absolute !important; height: 1px !important; top: -1px !important; left: 0 !important; padding: 0 !important; margin: 0 !important; width: 100% !important; opacity: 0 !important; background: transparent !important; pointer-events: none !important; font-size: 16px !important;">
                  </div>
                </div>
              </div>
            </div>
            <label class="remember_my_card">Se souvenir de ma carte
              <input type="checkbox" id="remember_my_card" name="remember_my_card">
              <span class="checkmark"></span>
            </label>
          </div>
          <div class="row next-button-row">
            <div class="col-md-6">
              <button type="button" class="btn form-previous-button prev" id="last-back-btn"><i class="fa fa-arrow-left"
                                                                                                aria-hidden="true"></i>
                RETOUR
              </button>
            </div>
            <div class="col-md-6 text-right">
              <button type="button" class="btn form-next-button" id="btn_finalsubmit"><i
                  class="fa fa-paper-plane next-icon"
                  aria-hidden="true"></i> SOUMETTRE
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Stepper from "@/modules/app/modules/bookappointment/components/Stepper";
import Breadcrumbs from "@/modules/app/modules/bookappointment/components/Breadcrumbs";
import TopNavbar from "@/modules/app/modules/bookappointment/components/TopNavbar";
import {mapGetters} from "vuex";

export default {
  name: "OnlinePayment",
  components: {Stepper, Breadcrumbs, TopNavbar},
  computed: {
    ...mapGetters('app/bookappointment', ['Stepper'])
  },
}
</script>

<style scoped>
.step-content {
  max-width: 900px;
  width: 100%;
  min-width: 710px;
  margin: 0 auto;
}

.uploadimages_area, .consultation_area {
  float: left;
  border: 2px solid rgba(224, 224, 224, 0.56);
  border-radius: 4px;
  padding: 0 15px 32px;
  width: 100%;
}

.me-profile {
  margin-top: 10px;
  margin-bottom: 10px;
}

#profile_name_modifer {
  display: flex;
  justify-content: space-between;
}
</style>
