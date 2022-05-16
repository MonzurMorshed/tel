<template>
  <div class="component__wrapper">
    <div class="card-body navbar__content">
      <div class="card__content__wrapper">
        <router-link :to="{ name: 'home' }">
          <AppLogo  />
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import AppLogo from "@/modules/app/components/AppLogo";
export default {
  name: "TopNavbar",
  components: { AppLogo },
  methods: {
    handleLogoClick() {
      this.$router.push({ name: 'home' })
    }
  }
}
</script>

<style scoped>
.component__wrapper {}
.card__content__wrapper {
  margin-left: 5%;
  margin-right: 5%;
  width: 90%;
}
.navbar__content {
  box-shadow: 0 2px 10px rgb(0 0 0 / 7%);
}
</style>
