<template>
  <div>
    <h3 class="payment-invoice-text">Programmes </h3>

    <div class="row">
      <div class="col-lg-5">
        <div class="card">
          <div class="card-body">
            <div class="card-title mb-4">
              <h6>Upcoming appointments</h6>
            </div>

            <div class="card-body p-0">
              <div class="card__content__">
                {{ JSON.stringify(appointments) }}
              </div>
            </div>

          </div>
        </div>
      </div>

      <div class="col-lg-7">
        <div class="card">
          <div class="card-body">
            <div class="card__content__"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import getBooks       from "@/modules/http/api/getBooks";
import { mapActions } from "vuex";

export default {
  name: "ClientAppointments",

  data() {
    return {
      appointments: []
    };
  },

  created() {
    const self = this;
    getBooks().then(response => {
      self.appointments = response;
    }).catch(e => {
      if (+e.response.status === 401) {
        self.clearAuthData().then(() => {
          this.$router.push({ name: 'login' })
        });
      }
    })
  },

  methods: {
    ...mapActions('app/auth', ['clearAuthData'])
  },
}
</script>

<style scoped>
.card__content__ {
  background-color: #f6faf4; height: 240px
}
</style>
