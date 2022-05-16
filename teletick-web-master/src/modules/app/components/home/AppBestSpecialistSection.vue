<template>
  <div class="container">
    <div class="text-center section-heading">
      <h2 class="fifth-section-header">
        Nous sélectionnons uniquement les meilleurs spécialistes            </h2>
    </div>
    <div class="row" id="align-m-img">
      <div class="col-lg-4 col-md-4 sm-text-center sm-margin-20px-bottom">
        <img src="@/assets/content/fifth-section-img.png" alt="" id="fifth-sec-img">
      </div>
      <div class="col-8 d-flex align-items-center">
        <div class="row">
          <div class="col-md-12 fourth-section-li-padding">
            <div class="row">
              <div class="col-6">
                <div class="fourth-section-li-main-div">
                  <ul class="list-style m-0 p-0">
                    <li class="fifth-section-li">Présélection</li>
                  </ul>
                  <div class="">
                    <p class="fifth-section-li-content">Les spécialistes TeleTick sont sélectionnés en fonction de leurs expériences et qualifications</p>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="fourth-section-li-main-div">
                  <ul class="list-style m-0 p-0">
                    <li class="fifth-section-li">Vérification sur place</li>
                  </ul>
                  <div class="">
                    <p class="fifth-section-li-content">Chaque profil de spécialiste est vérifié physiquement par TeleTick</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-12 fourth-section-li-padding">
            <div class="row">
              <div class="col-6">
                <div class="pt-5 fourth-section-li-main-div">
                  <ul class="list-style m-0 p-0">
                    <li class="fifth-section-li">Entretien préalable</li>
                  </ul>
                  <div>
                    <p class="fifth-section-li-content">Un entretien préalable est tenu avec chaque spécialiste avant la mise en ligne du profil</p>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="pt-5 fourth-section-li-main-div">
                  <ul class="list-style m-0 p-0">
                    <li class="fifth-section-li">Certificat TeleTick</li>
                  </ul>
                  <div class="">
                    <p class="fifth-section-li-content">TeleTick forme l’ensemble des spécialistes et attribue une certification à la consultation vidéo</p>
                  </div>
                </div>
              </div>
            </div>


          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "AppBestSpecialistSection"
}
</script>

<style scoped>
.section-heading {
  margin-bottom: 60px;
}
.fifth-section-header {
  font-style: normal;
  font-size: 36px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
  margin-bottom: 70px!important;
}
.fourth-section-li-main-div {
  max-width: 85%;
  margin: 0 auto;
}
.fifth-section-li-content {
  font-style: normal;
  font-weight: 400;
  font-size: 14px;
  line-height: 24px;
  color: #2C3F34;
  opacity: 0.8;
  padding-left: 25px;
  padding-top: 8px;
}
.list-style li:last-child {
  margin-bottom: 0;
}
.list-style li:last-child {
  margin-bottom: 0;
}
.fifth-section-li {
  font-style: normal;
  font-weight: 600;
  font-size: 18px;
  color: #2C3F34;
  opacity: 0.8;
  line-height: 26px!important;
}
li:last-child {
  margin-bottom: 0;
}
.list-style li {
  position: relative;
  padding-left: 20px;
  -webkit-transition: all 0.3s ease 0s;
  -moz-transition: all 0.3s ease 0s;
  -o-transition: all 0.3s ease 0s;
  transition: all 0.3s ease 0s;
}
.list-style li:before {
  content: '';
  position: absolute;
  left: 2px;
  top: 7px;
  width: 7px;
  height: 7px;
  -webkit-border-radius: 100px;
  -moz-border-radius: 100px;
  border-radius: 100px;
  background: #537E36;
  background: linear-gradient(
      90deg
      , #A7D08E 0%, #537E36 100%);
}
</style>