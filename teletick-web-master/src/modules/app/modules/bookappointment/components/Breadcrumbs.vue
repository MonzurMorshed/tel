<template>
  <div class="breadcrumbs__component__wrapper">
    <div class="content__wrapper">
      <div style="margin-right: 5px">
        <router-link :to="{ name: 'client' }" class="home__link">
          <h5 style="font-size: 13px; margin-bottom: 0">Home</h5>
        </router-link>
      </div>
      <i class="fa fa-angle-right angle-right" style="opacity: 50%; margin-top: 1px; margin-right: 5px"></i>
      <h5 class="reserve__text">Book an appointment</h5>
    </div>
  </div>
</template>

<script>
export default {
  name: "Breadcrumbs"
}
</script>

<style scoped>
.breadcrumbs__component__wrapper {
  width: 100%;
  margin-bottom: 10px;
  margin-top: 30px
}

.content__wrapper {
  display: flex;
  flex-basis: 80%;
  margin-left: 10%
}

.home__link {
  font-style: normal;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  margin-right: 3px;
  display: flex;
  align-items: center;
  color: #537E36 !important;
}

.reserve__text {
  font-style: normal;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  display: flex;
  align-items: center;
  color: #2C3F34;
  margin-bottom: 5px;
}
</style>
