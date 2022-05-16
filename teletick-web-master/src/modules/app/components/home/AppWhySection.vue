<template>
  <div class="container">
    <div class="text-center section-heading">
      <h2 class="fourth-section-header">Pourquoi utiliser TeleTick ?</h2>
      <div class="alt-font fourth-section-second-line margin-5px-bottom">
        Ce qui nous distingue            </div>
    </div>
    <div id="why-tel-desk">
      <div class="row">
        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-01.png" alt="">
            </div>
            <div class="item-text">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18">
                Prise rapide de rendez-vous                            </h3>
              <p class="fourth-section-p2 line-height-28">
                Consultez un spécialiste à votre rythme dans le confort de votre domicile, de votre bureau ou ailleurs sans attendre</p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-02.png" alt="">
            </div>
            <div class="item-text">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18 pt-1">
                Tarifs avantageux  </h3>
              <p class="fourth-section-p2 line-height-28">
                Bénéficiez de prix très attractif sur toutes les spécialités                            </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-03.png" alt="">
            </div>
            <div class="item-text">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18 pt-2">
                Disponibilité 24 h/ 24, 7 j/ 7                            </h3>
              <p class="fourth-section-p2 line-height-28">
                Parlez aux spécialistes toute la journée,
                y compris les week-ends et en vacances                            </p>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-06.png" alt="">
            </div>
            <div class="item-text">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18">
                Gardez le contrôle                            </h3>
              <p class="fourth-section-p2 line-height-28">
                Choisissez le canal de communication le plus confortable pour vous : en présentiel ou à distance                            </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-05.png" alt="">
            </div>
            <div class="item-text">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18">
                Suivi des consultations                            </h3>
              <p class="fourth-section-p2 line-height-28">
                Établissez une véritable relation avec un suivi personnalisé par vos spécialistes                             </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-12 sm-margin-20px-bottom">
          <div class="service-block2 text-center">
            <div class="item-icon margin-20px-bottom">
              <img class="front-icon" src="@/assets/content/homepage-icon-04.png" alt="">
            </div>
            <div class="item-text align-text-home">
              <h3 class="margin-10px-bottom fourth-section-p1 xs-font-size18 pt-2">
                Consultation sécurisée                            </h3>
              <p class="fourth-section-p2 line-height-28">
                Communiquez en toute sécurité grâce
                aux données cryptées et stockées par un hébergeur agréé                            </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AppWhySection"
}
</script>

<style scoped>
.section-heading {
  margin-bottom: 60px;
}
.fourth-section-second-line {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  padding-top: 25px;
  line-height: 20px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
  opacity: 0.8;
}
.service-block2 {
  position: relative;
  padding: 50px 20px;
  background: #fff;
  border-radius: 5px;
  margin-bottom: 10px;
}
.service-block2 p {
  max-width: 70%;
  margin: 0 auto;
}
.fourth-section-header {
  font-style: normal;
  font-size: 36px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
}
.fourth-section-p1 {
  font-style: normal;
  font-weight: 600;
  font-size: 18px;
  line-height: 26px;
  text-align: center;
  color: #2C3F34 !important;
  opacity: 0.8;
  margin-bottom: 15px;
}

.fourth-section-p2 {
  font-style: normal;
  font-size: 14px;
  line-height: 24px;
  text-align: center;
  color: #2C3F34;
  opacity: 0.8;
  font-weight: 400;
}
</style>