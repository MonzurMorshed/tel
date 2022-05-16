<template>

  <div class="section__content__wrapper row">

    <div class="row justify-content-center text-center col-md-12">
      <div class="col-md-7 p-0">
        <h4 class="section__title">La médecine douce à portée de main</h4>

        <AppHomeMultisearch />
        <ul class="section__text__list">
          <li class="__item">Diagnostic de votre état en quelques minutes</li>
          <li class="__item">Consultation vidéo à distance</li>
          <li class="__item">Suivi personnalité de vos consultations</li>
        </ul>

        <div class="store__button__list">
          <a href="https://apps.apple.com/us/app/teletick/id1571031433">
            <img src="@/assets/app-store-french.png" alt="">
          </a>
          <a href="https://play.google.com/store/apps/details?id=fr.teletick" style="margin-left: 26px">
            <img src="@/assets/google-play-french.png" alt="">
          </a>
        </div>

      </div>
    </div>

  </div>

</template>

<script>
import AppHomeMultisearch from "@/modules/app/components/home/AppHomeMultisearch";
export default {
  name: "AppSearchSection",
  components: { AppHomeMultisearch }
}
</script>

<style scoped>
.section__content__wrapper {
  background-size: contain;
  background-repeat: no-repeat;
  margin-top: 60px;
  background-position: left center;
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
  background-image: url("~@/assets/home_page_.png");
}

.section__title {
  font-style: normal;
  font-weight: 600;
  font-size: 36px;
  line-height: 50px;
  color: #2C3F34;
  margin-bottom: 45px;
  margin-top: 140px;
}

.section__text__list {
  margin-top: 55px;
}

.section__text__list .__item {
  font-style: normal;
  font-weight: 300;
  font-size: 20px;
  line-height: 35px;
  color: #2C3F34;
  opacity: 0.8;
}
.store__button__list {
  margin-top: 35px;
  margin-bottom: 5px;
}
</style>
