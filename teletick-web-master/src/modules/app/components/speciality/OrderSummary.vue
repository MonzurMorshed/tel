<template>
  <div class="order-summary">
    <b-form @submit.prevent>
      <b-row align-h="center" class="mb-5 mt-4 px-3">
        <b-col cols="12" md="12" lg="12" xl="9">
          <h4>
            Paiement: <span class="column-color-green">Récapitulatif de la commande</span>
          </h4>
          <b-row class="mt-3">
            <b-col cols="12" md="6" lg="7" xl="7" class="mt-3">
              <div class="payment-info px-3 pb-3">
                <div
                  class="d-flex flex-wrap justify-content-between align-items-center pt-4"
                >
                  <div><strong class="text-sm">Abonement classic</strong></div>
                  <div class="d-flex align-items-top">
                    <span :class="!monthly ? 'text-sm text-bold' : 'text-sm'"
                      >Paiement annuel</span
                    >
                    <switches
                      v-model="monthly"
                      type-bold="true"
                      theme="bulma"
                      color="green"
                      class="mx-1 mt-1"
                    ></switches>
                    <span :class="monthly ? 'text-sm text-bold' : 'text-sm'"
                      >Paiement mensuel</span
                    >
                  </div>
                </div>

                <div class="d-flex flex-wrap mt-4 pb-4 border-bottom">
                  <div>
                    <img src="~@/assets/icons/user.svg" alt="Specialist" />
                    <span class="text-gray text-sm"> Spécialiste:</span>
                    <strong class="text-sm ps-1">Andrew Dumond</strong>
                  </div>
                  <div class="ms-0 ms-sm-3 ms-md-0 ms-lg-4">
                    <img src="~@/assets/icons/schedule.svg" alt="Schedule" />
                    <span class="text-gray text-sm ps-1">Programme:</span>
                    <strong class="text-sm ps-1"
                      >Mardi, 14:00, Jeudi 17:00</strong
                    >
                  </div>
                </div>
                <div
                  class="d-flex justify-content-between pb-4 pt-3 border-bottom"
                >
                  <span class="text-gray text-sm">Prix</span>
                  <strong>249 &euro;</strong>
                </div>
                <div class="d-flex justify-content-between mt-2 pt-3 pb-3">
                  <span class="text-black text-sm">VAT (20%)</span>
                  <strong>40,8 &euro;</strong>
                </div>
                <div class="d-flex justify-content-between pb-2">
                  <strong class="text-darkgreen text-sm">Total TTC</strong>
                  <strong class="text-darkgreen">289,8 &euro;</strong>
                </div>

                <div class="coupon">
                  <b-row class="mt-3 mb-3">
                    <b-col cols="12" md="10">
                      <b-input-group>
                        <b-form-input
                          placeholder="Code de réduction"
                        ></b-form-input>
                        <template #append>
                          <button class="coupon-btn px-4">Appliquer le code</button>
                        </template>
                      </b-input-group>
                    </b-col>
                  </b-row>
                </div>
              </div>
              <div class="accept-conditions mt-3 p-3">
                <label class="checkbox-container">
                  <input type="checkbox" checked="checked" />
                  <span class="text-sm text-gray ps-2">J’accepte les </span>
                  <strong class="text-sm text-underline"
                    >Conditions generale de vente</strong
                  >
                  <span class="checkmark"></span>
                </label>
              </div>
            </b-col>
            <b-col cols="12" md="6" lg="5" xl="5" class="mt-3">
              <div class="payment-section px-3 py-4">
                <strong class="text-white">Paiement sécurisé</strong>
                <b-row class="payment-form">
                  <b-col cols="12" class="mt-3">
                    <label class="pb-2" for="card_number">Numéro de carte</label>
                    <b-form-input
                      placeholder=".... .... .... ...."
                    ></b-form-input>
                  </b-col>
                  <b-col cols="12" class="mt-3" md="6">
                    <label class="pb-2" for="expiry_date">Date d'expiration</label>
                    <b-form-input placeholder="MM / AA"></b-form-input>
                  </b-col>
                  <b-col cols="12" class="mt-3" md="6">
                    <label class="pb-2" for="cvc">Cryptogramme</label>
                    <b-form-input placeholder="CVC"></b-form-input>
                  </b-col>
                </b-row>

                <div class="d-flex flex-wrap align-items-center mt-3 px-1">
                  <img src="~@/assets/icons/stripe.svg" alt="" />
                  &nbsp;&nbsp;<span class="text-sm text-white"
                    >100% sécurisé&nbsp;&nbsp;|&nbsp;&nbsp;</span
                  >
                  <span class="text-sm text-white"> Données protégées</span>
                </div>
              </div>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
      <div class="d-flex align-items-center justify-content-between mx-3 pb-5">
        <div class="return">
          <div class="back pointer" @click="$emit('setStep', 2)">
            <span class="text-darkgreen text-uppercase"
              ><img
                class="me-2"
                src="~@/assets/icons/arrow-back.svg"
                alt="back"
              />
              retour</span
            >
          </div>
        </div>
        <div class="next">
          <div>
            <button
              @click="$emit('setStep', 4)"
              type="button"
              class="custom-submit-button mt-3 text-white"
            >
              S’inscrire
              <img
                class="ms-2"
                src="~@/assets/icons/arrow-next.svg"
                alt="next"
              />
            </button>
          </div>
        </div>
      </div>
    </b-form>
  </div>
</template>

<script>
import Switches from 'vue-switches';
export default {
  name: 'OrderSummary',
  components: {
    Switches,
  },
  data() {
    return {
      monthly: true,
    };
  },
};
</script>

<style scoped>
.payment-info {
  border: 1px solid rgba(224, 224, 224, 0.5);
  box-sizing: border-box;
}
.payment-section {
  background: #a7d08e;
  border-radius: 15px;
}

.text-bold {
  font-weight: bold;
}

.payment-form .form-control {
  background: #9eca83 !important;
  border-color: #9eca83 !important;
  outline: none !important;
}

.payment-form .form-control:focus {
  background: #9eca83 !important;
  border-color: #9eca83 !important;
  outline: none !important;
  box-shadow: none !important;
}

label {
  color: #537e36 !important;
}

.accept-conditions {
  border: 1px solid #ecf0f9;
  box-sizing: border-box;
  border-radius: 8px;
}

.coupon-btn {
  background: #a7d08e;
  color: white;
  border-radius: 0px 4px 4px 0px;
  outline: none;
  border: none;
  height: 45px;
}

input.form-control:focus {
  box-shadow: none;
  outline: none;
}

.checkbox-container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  
  /* Hide the browser's default checkbox */
  .checkbox-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
  }
  
  /* Create a custom checkbox */
  .checkmark {
    position: absolute;
    top: 10px;
    left: 10px;
    height: 20px;
    width: 20px;
    background-color: #eee;
  }
  
  /* On mouse-over, add a grey background color */
  .checkbox-container:hover input ~ .checkmark {
    background-color: #ccc;
  }
  
  /* When the checkbox is checked, add a blue background */
  .checkbox-container input:checked ~ .checkmark {
    background-color: #a7d08e;
  }
  
  /* Create the checkmark/indicator (hidden when not checked) */
  .checkmark:after {
    content: '';
    position: absolute;
    display: none;
  }
  
  /* Show the checkmark when checked */
  .checkbox-container input:checked ~ .checkmark:after {
    display: block;
  }
  
  /* Style the checkmark/indicator */
  .checkbox-container .checkmark:after {
    left: 8px;
    top: 4px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  }
</style>
