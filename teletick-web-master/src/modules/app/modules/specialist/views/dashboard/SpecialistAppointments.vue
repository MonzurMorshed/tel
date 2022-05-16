<template>
  <div>
    <div  class="row" style="margin-bottom: 20px">
      <h3>Appointments</h3>
    </div>
    <div class="row justify-content-around">
      <div class="col-lg-5 card page__card">
        <div class="card-body">

          <div>
            <div class="card-title">
              <h6>Upcoming appointments</h6>
            </div>

            <div class="card-body card__content mt-3 text-center align-middle">
              <p style="margin-top: 75px">You don't have an appointment right now</p>
            </div>
          </div>

          <div style="margin-top: 75px">
            <div class="card-title">
              <h6>Past appointments</h6>
            </div>

            <div class="card-body card__content mt-3 text-center align-middle">
              <p style="margin-top: 75px" v-if="!(appointments.length > 0)">You don't have an appointment right now</p>
              <div
                  v-else
              >
                {{ JSON.stringify(appointments) }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 card page__card" style="padding: 20px; max-height: 400px">
        <div class="card-body card__content text-center" >

          <div style="margin-top: 100px">
            <p>You don't have an appointment right now</p>
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
  name: "SpecialistAppointments",

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
.page__card{
  box-shadow: 0 4px 6px 0 rgb(85 85 85 / 9%), 0 1px 20px 0 rgb(0 0 0 / 8%), 0px 1px 11px 0px rgb(0 0 0 / 6%);
}
.card__content{
  width: 100%;
  height: 240px;
  background: #f6faf4;
}
</style>
