<template>
  <div class="app__container">

    <header
        @scroll="(e) => console.log('SCROOLL', e)"
        class="sm-position-relative fixedHeader app__header"
    >
      <div class="container">
        <div class="row align-content-center">
          <div class="col-12 col-lg-12" style="width: 100%">
            <nav class="navbar navbar-expand-lg navbar-light p-0 navbar__header shadow-none">

              <div class="col-lg-2">
                <AppLogo @click="() => this.$router.push('/')" />
              </div>


            </nav>
          </div>
        </div>
      </div>
    </header>

    <div class="site__body">
      <transition-group name="fade" mode="out-in">
        <router-view key="id"/>
      </transition-group>
    </div>

  </div>
</template>

<script>
import AppHeader from "@/modules/app/modules/layout/components/AppHeader";
import AppLogo   from "@/modules/app/components/AppLogo";
export default {
  name: "LoginRegisterLayout",
  components: { AppLogo, AppHeader }
}
</script>

<style lang="scss" scoped>
.logo {
  max-height: 43px;
  transition-duration: 0.5s;
  margin-top: 0;
}

.app__header {
  width: 100%;
  background: #FFFFFF;
  box-shadow: 0px 2px 10px rgb(0 0 0 / 7%);
}

.navbar__header {
  padding: 20px 0 !important;
  margin-top: 0;
  align-items: center !important;
  font-weight: 500;
  position: relative;
  z-index: 2;
}

.nav__link__list {
  display: flex;
  flex-direction: row;
  margin-right: 12rem;
}

.special__nav__link {
  border-radius: 30px;
  padding: 10px 35px 11px !important;
  cursor: pointer;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  color: #2C3F34 !important;
}

.special__nav__link.bordered {
  border: 1px solid #A7D08E;
}

.sidentifier__link {
  font-style: normal;
  font-weight: 500 !important;
  font-size: 14px !important;
  line-height: 21px;
  text-align: left;
  text-transform: uppercase !important;
  color: #537E36 !important;
  margin-top: 2px;
}

.navbar__list__item {
  margin: 0 0 0 26px;
  list-style: none;
}

.register__button {
  background: linear-gradient(
          90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  color: #fff;
  font-size: 16px;
  line-height: 21px;
  padding: 8px 24px !important;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  -webkit-transition: all linear 400ms;
  transition: all linear 400ms;
  border: none;
  box-shadow: unset !important;
}
</style>

