<template>
  <div class="auth__component_wrapper">
    <AuthHeader/>

    <div class="container login__container">
      <div class="row" style="margin-top: 80px">
        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
          <div class="login__widget pt-4 text-center">
            <h1 class="login__widget__title">CONNEXION</h1>

            <div class="widget__content px-5 pt-1 pb-1">

              <div class="form-group mb-4">
                <input
                    type="email"
                    placeholder="Email"
                    class="mb-4 form-control"
                    v-model="form.email"
                >
              </div>

              <div class="form-group mb-4">
                <input
                    type="password"
                    placeholder="Mot de passe"
                    class="mb-4 form-control"
                    v-model="form.password"
                >
              </div>

              <div class="text-center">
                <a class="password__forgot">
                  Mot de passe oublié?
                </a>
              </div>

              <div class="text-center pb-3 py-3 pt-5 mb-3">
                <button
                    type="button"
                    class="btn btn-primary btn-lg login-btn"
                    @click.prevent="onSubmit"
                >Connexion
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 pt-1">
          <img src="@/assets/loginpage/login_1.png" class="login-bg-img" alt="logo" style="position:absolute;right:0;">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AuthHeader                 from "@/modules/app/modules/auth/components/AuthHeader";
import { mapActions, mapGetters } from "vuex";
import router                     from "../../../../http/router";

export default {
  name      : "AuthIndex",
  components: { AuthHeader },

  data() {
    return {
      form: {
        sending : false,
        email   : '',
        password: ''
      }
    }
  },
  computed: {
    ...mapGetters('app/auth', ['Auth'])
  },

  methods: {
    ...mapActions('app/auth', [ 'login', 'initUser' ]),

    onSubmit(e) {
      const self = this;

      this.login({ login: self.form.email, password: self.form.password })
          .then(async (response) => {
            // const userResponse = response
            console.log('LOGIN_RESPONSE::', response);

            this.form.password = '';

            // await this.$router.push({ name: `${ (response) }.dashboard` })
            this.initUser(this.Auth.token.token).then(user => {

              console.log('USER RESPONSE::', user)
              this.$router.push({ name:  user.data.type + '.dashboard' })

            }).catch(e => console.log(e));
          });
      // console.log('LOGIN FORM SUBMIT::{email, pass}', { email: this.from.email, password: this.form.password })
    }
  }
}
</script>

<style scoped>
.auth__component_wrapper {
  display: flex;
  flex-direction: column;
  flex-basis: 100%;
}

.login__container {
  height: 100%;
}

.login__widget {
  background: #FFFFFF;
  border: 2px solid #F2F5FB;
}

.login__widget__title {
  font-style: normal;
  font-weight: 600;
  font-size: 30px;
  line-height: 30px;
  align-items: center;
  color: #2C3F34;
  text-align: center;
  padding: 10px;
  text-transform: uppercase;
}

.widget__content {
  position: relative;
  background-color: #fff;
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
  box-shadow: none
}

.password__forgot {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 18px;
  color: #2C3F34;
  opacity: 0.7;
}

.login-btn {
  width: 189px;
  height: 42px;

  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  font-size: 16px;
  line-height: 21px;
  padding: 8px 24px !important;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  margin-top: 15px;
  box-shadow: unset !important;
}

.form-control {
  border: 1px solid #bfc9d4;
  color: #3b3f5c;
  font-size: 15px;
  padding: 8px 8px;
  letter-spacing: 1px;
  height: calc(1.4em + 1.4rem + 2px);
  text-align: left!important;
  background: #F9F9F9;
  border-radius: 4px;
}
</style>
