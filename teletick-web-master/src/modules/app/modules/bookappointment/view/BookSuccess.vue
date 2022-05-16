<template>
  <div class="bookapintment__wrapper">
    <TopNavbar/>

    <div style="display: flex; flex-basis: 100%; flex-direction: column; justify-content: center; margin-top: 30px">

      <Breadcrumbs/>
      <div class="front__card">

        <div class="final-step__wrapper">
          <div class="row justify-content-center">
            <div class="p-0 col-7 text-center">
              <img src="@/assets/content/happy.png" alt="">
              <h3>Votre rendez-vous est pris</h3>
              <div class="happe_info">
                <h4>Confirmation de rendez-vous</h4>
                <p>Ceci confirme votre rendez-vous du lundi 9 mars 2020 à 10h00 avec Victor DUPON. Un e-mail de confirmation a été envoyé à </p>
                <a href="mailto:julesbekuti@gmail.com">julesbekuti@gmail.com</a>
              </div>
              <a href="#" class="to_print-btn" style="margin-right: 5px;">imprimer</a>
              <a href="#" class="add_to_cal-btn" id="btn_finalsubmit">Ajouter à mon agenda</a>
              <router-link :to="{ name: 'appointment.search' }" class="other_appoint-btn">Prendre un autre rendez-vous</router-link>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

</template>

<script>
import Breadcrumbs from "@/modules/app/modules/bookappointment/components/Breadcrumbs";
import TopNavbar                  from "@/modules/app/modules/bookappointment/components/TopNavbar";


export default {
  name: "BookSuccess",
  components: { Breadcrumbs, TopNavbar }
}
</script>

<style scoped>
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
  justify-content: center;
}
.final-step__wrapper {
  padding-top: 60px;
  padding-bottom: 60px;
  max-width: 67%;
  width: 100%;
  margin: 0 auto;
}

.final-step__wrapper h3 {
  font-weight: 600;
  font-size: 24px;
  line-height: 50px;
  color: #537E36;
  margin-top: 5px;
  margin-bottom: 15px;
}

.happe_info {
  padding: 30px 44px 25px;
  background: #F9F9F9;
  border: 2px solid #F2F5FB;
  border-radius: 4px;
  margin-bottom: 30px;
}

.to_print-btn {
  background: linear-gradient(90deg, #A7D08E 0%, #537E36 100%);
  border-radius: 30px;
  font-weight: 500;
  font-size: 14px;
  line-height: 14px;
  text-transform: uppercase;
  color: #FFFFFF;
  padding: 15px 26px;
  display: inline-block;
  min-width: 200px;
}

.add_to_cal-btn {
  border: 1px solid #A7D08E;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  color: rgba(44, 63, 52, 0.78);
  border-radius: 30px;
  padding: 10px 30px;
  display: inline-block;
}

.other_appoint-btn {
  font-weight: 500;
  font-size: 14px;
  line-height: 14px;
  text-transform: uppercase;
  color: #A7D08E;
  display: block;
  margin-top: 35px;
}

.happe_info h4 {
  font-weight: 600;
  font-size: 14px;
  line-height: 21px;
  color: #2C3F34;
  margin-bottom: 10px;
}

.happe_info p {
  font-weight: normal;
  font-size: 16px;
  line-height: 25px;
  color: rgba(44, 63, 52, 0.5);
  margin-bottom: 0;
}

.happe_info a {
  font-weight: normal;
  font-size: 16px;
  line-height: 25px;
  color: #2C3F34;
}
</style>
