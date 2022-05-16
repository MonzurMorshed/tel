<template>
  <header
      @scroll="(e) => console.log('SCROOLL', e)"
      class="sm-position-relative fixedHeader app__header"
  >
    <div class="container">
      <div class="row align-content-center">
        <div class="col-12 col-lg-12" style="width: 100%">
          <nav class="navbar navbar-expand-lg navbar-light p-0 navbar__header shadow-none">

            <div class="col-lg-2">
              <AppLogo/>
            </div>

            <div class="nav__link__list col-lg-5">
              <router-link :to="{ name: 'specialist' }" replace class="special__nav__link bordered">
                Offre spécialiste
              </router-link>
              <router-link :to="{ name: 'enterprise' }" class="special__nav__link"><label style="cursor: pointer">Offre
                entreprise</label></router-link>
            </div>

            <div v-if="this.isLoggedIn === false"
                 class="col-lg d-flex justify-content-end"
            >
              <router-link
                  :to="{ name: 'login' }"
                  @click="handleLoginClicked"
                  replace
                  class="sidentifier__link mt-auto mb-auto ml-2"
                  style="cursor: pointer">
                Connexion
              </router-link>
              <div class="mt-auto" style="margin-left: 10px">
                <button class="btn btn-primary top-button custom-mt-0 h-50 register__button">
                  S’inscrire
                </button>
              </div>
            </div>

            <div
                v-else
                class="col-lg d-flex justify-content-end mr-2"
            >
              <router-link
                  :to="{ name: `${ getUserType }.dashboard` }"
                  replace
                  class="sidentifier__link mt-auto mb-auto ml-2 text-decoration-none"
                  style="cursor: pointer">
                Dashboard
              </router-link>

              <b-dropdown size="lg" variant="link" toggle-class="text-decoration-none" no-caret>
                <template #button-content>
                  <button class="btn btn-primary profile__button">{{ fullName }}</button>
                </template>
                <b-dropdown-item
                    @click="() => this.$router.push({ name: `${this.getUserType}.profile` })"
                    class="mr-2"
                >View Profile
                </b-dropdown-item>

                <b-dropdown-divider/>

                <b-dropdown-item
                    @click="handleLogoutClick">Log out</b-dropdown-item>
              </b-dropdown>
            </div>

          </nav>
        </div>
      </div>
    </div>
  </header>
</template>

<script>

import { mapActions, mapGetters } from 'vuex';
import AppLogo                    from "@/modules/app/components/AppLogo";

export default {
  name      : "AppHeader",
  components: { AppLogo },
  data() {
    return {
      isActive: false,
    };
  },

  computed: {
    ...mapGetters('lang', [ 'getLangsList', 'selectedLang', 'texts' ]),
    ...mapGetters('app/auth', [ 'Auth' ]),

    getUserType() {
      return this.Auth.user.type;
    },
    isLoggedIn() {
      return this.Auth.token.token.length > 0
    },

    fullName() {
      return `${ this.Auth.user.firstname } ${ this.Auth.user.lastname }`
    }
  },

  methods: {
    ...mapActions('lang', [ 'changeLang' ]),
    ...mapActions('app/auth', [ 'clearAuthData' ]),

    handleLoginClicked() {
      this.$router.push({ name: 'login' });
    },

    handleLogoutClick() {
      this.clearAuthData();
      this.$router.push({ name: 'login' });
    }

  },
};
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

.profile__button {
  background: linear-gradient(
          90deg, #A7D08E 0%, #537E36 100%);
  border-radius: 30px;
  padding: 8px 40px !important;
  color: #fff !important;
  text-decoration: none;
  white-space: nowrap;

  position: relative;
  display: block;
  font-weight: 500;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  transition-duration: 500ms;
  border: none;
}

.profile__button:hover {
  opacity: 0.65;
  text-decoration: none;
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
