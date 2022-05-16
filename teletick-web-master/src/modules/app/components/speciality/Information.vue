<template>
  <div class="information pb-4">
    <h3 class="text-center">
      Veuillez compléter les informations ci-dessous ?
    </h3>
    <b-form @submit.prevent>
      <b-row align-h="center" class="mb-5 mt-4 px-3">
        <b-col cols="12" md="10" lg="8" xl="6">
          <b-row>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input placeholder="Prénom*"></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input placeholder="Nom de famille*"></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input placeholder="Email*" type="email"></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input
                placeholder="Confirmez votre email *"
                type="email"
              ></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input placeholder="Numéro de téléphone portable*"></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input
                placeholder="Numéro de département d’exer.."
              ></b-form-input>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
      <div class="d-flex align-items-center justify-content-between mx-3">
        <div class="return">
          <div class="back pointer" @click="$router.go(-1)">
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
              @click="$emit('setStep', 3)"
              type="button"
              class="custom-submit-button mt-3 text-white"
            >
              Suivant
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
export default {
  name: 'Information',
};
</script>
