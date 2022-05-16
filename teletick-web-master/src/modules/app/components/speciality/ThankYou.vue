<template>
  <div class="thank-you pb-4 mt-4 pb-5">
    <b-row align-h="center" class="mt-4">
      <b-col cols="12" md="8" lg="6">
        <div class="text-center">
          <img src="~@/assets/success.svg" alt="Success" />
          <h4 class="text-center text-darkgreen mt-4">
            Nous vous remercions d’avoir rempil le formulaire d’inscription
          </h4>
          <div class="info-box px-3 py-4 mt-4 mb-5">
            Votre demande a ete prise en compte, nous allons proceder a la verification des informations mentionnees et vous recevrez tres prochainement un mail sur les etapes a suivre.
          </div>
          <router-link to="/" class="participate-btn px-5">
            AccuEil
          </router-link>
        </div>
      </b-col>
    </b-row>
  </div>
</template>

<script>
export default {
  name: 'ThankYou',
};
</script>

<style scoped>
.info-box {
  background: #f9f9f9;
  border: 2px solid #f2f5fb;
  box-sizing: border-box;
  border-radius: 4px;
}
</style>
