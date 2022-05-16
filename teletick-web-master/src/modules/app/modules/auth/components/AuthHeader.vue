<template>
  <div class="component__wrapper">
    <div class="card-body navbar__content">
      <div class="card__content__wrapper">
        <div class="topnav__content">
          <router-link to="/" replace>
            <img alt="TeleTick logo"
                 @click="() => this.$router.push('/')"
                 src="@/assets/logo.png"
                 class="auth__logo">
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AppLogo from "@/modules/app/components/AppLogo";

export default {
  name      : "AuthHeader",
  components: { AppLogo }
}
</script>

<style scoped>
.component__wrapper {
}

.card__content__wrapper {
  margin-left: 5%;
  margin-right: 5%;
  width: 90%;
}

.navbar__content {
  box-shadow: 0 4px 6px 0 rgb(85 85 85 / 8%), 0 1px 20px 0 rgb(0 0 0 / 7%), 0px 1px 11px 0px rgb(0 0 0 / 7%);
  padding: 9px;
}

.auth__logo {
  padding: 7px 0;
  width: 131px;
  margin-left: 100px;
}
</style>
