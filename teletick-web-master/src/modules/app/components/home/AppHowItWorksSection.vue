<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1 style="color: black; text-align: center">Comment ça marche ?</h1>
      </div>

      <div class="col-md-12 text-center">
        <p class="play__video__button">
          Lire la vidéo
        </p>
      </div>

      <img src="@/assets/how_it_works_homepage.png" alt="how it works"
           style="display: block;height: auto;margin: -150px auto 0;width: 66%;vertical-align: middle;border-style: none;">
    </div>
  </div>
</template>

<script>
export default {
  name: "AppHowItWorksSection"
}
</script>

<style scoped>
.play__video__button {
  background: #A7D08E;
  box-shadow: 0 7px 20px rgb(83 126 54 / 30%);
  cursor: pointer;
  font-weight: 200;
  color: #fff !important;
  letter-spacing: 0.03em;
  font-size: 14px;
  line-height: 44px;
  padding: 5px 25px;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  margin-top: 22px;
  width: 100%;
  max-width: 230px;
  height: 50px;
}
</style>
