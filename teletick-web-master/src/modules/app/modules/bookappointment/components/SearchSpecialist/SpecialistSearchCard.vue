<template>
  <div>
    <div class="col-lg-3 avatar__wrapper">
      <div class="avatar__content">
        <div>
          <img src="@/assets/specialist_avatar1.png" alt="Specialist-logo1" class="card__profile__logo">

<!--          <div class="logo__label__online"-->
<!--               v-if="specialist.consultation_type.length === 1 ? +specialist.consultation_type === 1 : true"-->
<!--          >-->
<!--            <svg width="17" height="11" viewBox="0 0 17 11" fill="none"-->
<!--                 xmlns="http://www.w3.org/2000/svg">-->
<!--              <path-->
<!--                  d="M10.9755 0.423828H1.18056C0.528791 0.424597 0.000768589 0.952619 0 1.60438V9.3733C0.000768589 10.0251 0.528791 10.5531 1.18056 10.5539H10.9755C11.6271 10.5531 12.1553 10.0251 12.156 9.3733V1.60438C12.1553 0.952619 11.6271 0.424597 10.9755 0.423828Z"-->
<!--                  fill="#FFFFFF"></path>-->
<!--              <path d="M12.9434 7.10512L17.0003 9.32005V1.68164L12.9434 3.89657V7.10512Z"-->
<!--                    fill="#FFFFFF"></path>-->
<!--            </svg>-->
<!--            <span-->
<!--                style="padding-left: 8px"-->
<!--            >Online</span>-->
<!--          </div>-->
        </div>

        <div class="d-flex">
          <h3 class="terification-text text-nowrap">
            <label>À partir de :</label>
            <span class="span-left">
                        <label>50</label>
                        <i class="fa fa-eur" aria-hidden="true" style="color:#537E36;"></i>
                      </span>
          </h3>

          <h3 class="d-none terification-text second_color">
            <label>Prix suivi :</label>
            <span class="span-right">
                        <label>50</label>
                        <i class="fa fa-eur" aria-hidden="true" style="color:#598DCB;"></i>
                      </span>
          </h3>
        </div>
      </div>
    </div>
    <div class="col-lg-9 d-flex flex-column flex-grow-1" style="padding: 0">

      <div class="row" style="margin-right: 0">
        <div class="col-lg-6" style="margin-top: 34px">
          <a class="specialist__card__name">{{
              `${specialist.firstname} ${specialist.lastname}`
            }}</a>
        </div>

        <div class="col-lg-6 d-flex justify-content-end align-items-end" style="padding-right: 0">
          <div class="card__time__warning">
            Pas disponible aujourd'hui
          </div>
        </div>
      </div>
      <div class="row">
        <div class="d-flex flex-row justify-content-start" style="padding-top: 14px">
          <button
              class="practice__button"
              v-for="(item, index) in specialist.practice"
              :key="index"
          >{{ item.name }}
          </button>
        </div>
        <div
            v-if="specialist.phone"
            class="d-flex flex-row justify-content-start">
          <div
              @click="handleContactClick"
              class="phone__button" :style="{ border: isContactOpen ? '1px solid #A7D08E' : '' }">
            <label style="margin: 5px 12px">{{ isContactOpen ? specialist.phone : 'Contact' }}</label>
          </div>
        </div>

        <div class="d-flex flex-wrap" style="margin-top: 16px">
          <div class="address__block" v-for="address in specialist.address">
            <label class="address__label">{{ `${address.address} ${address.postal_code} ${address.city}` }}</label>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "SpecialistSearchCard",

  props: {
    specialist: {
      phone: '',
      firstname: '',
      lastname: '',

    }
  },

  data() {
    return {
      isContactOpen: false
    };
  },
  methods: {
    handleContactClick() {
      this.isContactOpen = !this.isContactOpen;
    },
    handleSpecialistSelectClick() {
      console.log('handleSpecialistSelectClick')
      this.$emit('selectProfile', {...this.specialist})
    }
  }
}
</script>

<style scoped>
.address__label {
  padding: 2px 7px 2px 31px !important;
  border: 1px solid rgba(167, 208, 142, 0.15);
  border-radius: 4px;
  text-align: left;
  background-image: url('~@/assets/booking/location.png');
  background-position: 5px center;
  background-repeat: no-repeat;
  margin: 5px;
  display: inline-block;
  float: left;
  font-size: 14px;
  line-height: 24px;
  color: rgba(44, 63, 52, 0.6);
  clear: both;
}

.address__block {
  position: relative;
  border: 1px solid rgba(167, 208, 142, 0.15);
  box-sizing: border-box;
  border-radius: 4px;
  padding-left: 0;
}

.phone__button {
  color: #A7D08E;
  font-size: 14px;
  line-height: 24px;
  border-radius: 30px;
  background-color: rgba(100, 193, 43, 0.07);
  background-image: url("data:image/svg+xml,%3Csvg width='15' height='15' viewBox='0 0 15 15' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2.76532 6.00938L2.76531 6.00936L2.76509 6.00888L2.76504 6.00877L2.76487 6.0084L2.35434 5.10485C2.04488 4.42375 2.2584 3.61882 2.86462 3.18092L4.18079 2.23022C4.21763 2.2036 4.26885 2.21046 4.29741 2.24588L5.62972 3.8983C5.66029 3.93622 5.65315 3.99197 5.61407 4.02095L4.74688 4.66398C4.49845 4.84819 4.41215 5.18083 4.53962 5.46266C5.54266 7.68034 7.32367 9.46239 9.54009 10.466C9.82184 10.5936 10.1543 10.5072 10.3384 10.2586L10.9811 9.39094C11.0101 9.35184 11.0657 9.34474 11.1035 9.37528L12.7548 10.7082C12.7902 10.7368 12.7971 10.7881 12.7704 10.8251L11.8245 12.1349C11.3894 12.7375 10.5917 12.9523 9.91307 12.6498C9.91307 12.6498 9.91306 12.6498 9.91306 12.6498L9.34615 12.397L9.34616 12.397L9.34449 12.3963L9.33522 12.3923C6.42366 11.157 4.08152 8.87707 2.76532 6.00938ZM1.57133 6.55664L1.57133 6.55665C3.023 9.72019 5.60574 12.2355 8.81691 13.5997L9.37853 13.85C10.625 14.4057 12.09 14.011 12.8891 12.9044L13.835 11.5945C14.2705 10.9914 14.1582 10.1528 13.5794 9.68555L11.9282 8.35265C11.3093 7.8531 10.3993 7.96947 9.92592 8.60864L9.60852 9.03718C8.05761 8.21813 6.78629 6.94605 5.96773 5.39422L6.39607 5.0766C7.03487 4.60292 7.15113 3.69247 6.65192 3.07332L5.31961 1.4209C4.85279 0.841919 4.01486 0.729443 3.41202 1.16489L3.47058 1.24595L3.41202 1.16489L2.09586 2.11559C0.982538 2.91978 0.590495 4.39792 1.15875 5.6486L1.57031 6.55442L1.57046 6.55475L1.57133 6.55664Z' fill='%23A7D08E' stroke='%23A7D08E' stroke-width='0.2' stroke-linejoin='round'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: 10px center;
  padding: 3px 19px 3px 37px;
  margin-top: 11px;
  float: left;
}

.avatar__content {
  margin: 30px 30px 70px 30px;
}

.avatar__wrapper {
  padding: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.practice__button {

  background: #A7D08E;
  border: unset;
  margin-right: 12px;
  margin-top: 0;
  border-radius: 3px;

  padding: 6px 10px;
  font-style: normal;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  /* identical to box height */

  display: flex;
  align-items: center;
  text-align: center;
  color: #FFFFFF;
}

.card__time__warning {
  font-weight: 500;
  letter-spacing: 1px!important;
  vertical-align: middle;
  font-size: 12px;
  width: 100%;
  padding: 8px 0 8px 20px;
  background: #FF97391A url("data:image/svg+xml,%3Csvg width='4' height='4' viewBox='0 0 4 4' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Ccircle cx='2' cy='2' r='2' fill='%23FF9739'/%3E%3C/svg%3E") no-repeat 10px center;
  color: #FF9739;
}

.specialist__card__name {
  font-style: normal;
  font-weight: 600;
  font-size: 18px;
  line-height: 24px;
  color: #2C3F34;
  opacity: 0.8;
}

.card__profile__logo {
  max-width: 110px;
  max-height: 110px;
}

.logo__label__online {
  background: linear-gradient(88.65deg, #EEA647 8.78%, #EE8C5D 63.4%);
  border-radius: 5px;
  min-height: 30px;
  min-width: 100px;
  position: relative;
  padding: 6px;
  color: #FFFF;
  top: -15px;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
