<template>
  <img  alt="TeleTick logo" src="@/assets/logo.png" style="padding: 7px 0; cursor: pointer">
</template>

<script>
export default {
  name: "AppLogo",
  methods: {
    handleLogoClick() {
      this.$router.push({ name: 'home' })
    }
  }
}
</script>

<style scoped>

</style>
