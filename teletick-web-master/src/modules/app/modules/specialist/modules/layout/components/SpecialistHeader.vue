<template>
  <div class="header__container fixed-top">
    <header class="navbar navbar-expand-sm navbar__header__custom">
      <div class="row justify-content-end w-100">
        <div class="col-lg-2 mr-2 row justify-content-end">

          <a style="color: #515365;
    outline: none;text-decoration: none">

            <b-dropdown size="lg" variant="link" toggle-class="text-decoration-none" no-caret>
              <template #button-content>

                <img src="~@/assets/profile_logo.png" alt="prof logo" style="margin-right: 10px">

                <span style="font-style: normal;
    font-size: 15px;
    line-height: 18px;
    color: #2C3F34;
    letter-spacing: normal;">{{ name }}</span>
              </template>
              <b-dropdown-item href="#" @click="() => this.$router.push({ name: 'specialist.profile' })">
                <i class="fa fa-user fa-lg" aria-hidden="true"></i>
                &nbsp;&nbsp;View profile
              </b-dropdown-item>
              <b-dropdown-item href="#" @click="handleLogOutClick">
                &nbsp;&nbsp;Log out</b-dropdown-item>
            </b-dropdown>
          </a>

        </div>
      </div>
    </header>
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name : "SpecialistHeader",
  props: {
    name : String,
    image: String,
  },

  data() {
    return {}
  },

  methods: {
    ...mapActions('app/auth', [ 'clearAuthData' ]),

    handleLogOutClick() {
      this.clearAuthData();
      this.$router.push({ name: 'login' })
    }
  }
}
</script>

<style scoped>
.header__container {
  z-index: 1030;
}

.navbar__header__custom {
  border-bottom: 0.01rem solid #f1f2f3;
  background: #FFFFFF;
  transition: .3s ease all;
  min-height: 70px;
  box-shadow: 0 0 0 0;
}
</style>
