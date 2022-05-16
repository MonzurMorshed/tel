<template>
  <div class="booking-page">
    <div class="container pb-5">
      <div class="pt-5">
        <p>
          <router-link to="/" class="column-color-green">Home > </router-link>
          <span> Vous êtes spécialiste > </span> <span> Rejoignez-nous</span>
        </p>
      </div>

      <div class="mb-5 common-section-padding bg-white pt-5 steps">
        <div class="md-stepper-horizontal orange mb-5 px-3 px-md-5 pb-3">
          <div :class="getClasses(1)">
            <div class="md-step-circle" v-if="step === 1">
              <div v-if="step === 1" class="inner-circle"></div>
            </div>
            <div v-if="step > 1" class="text-center check-icon">
              <img src="~@/assets/icons/check.svg" alt="">
            </div>
            <div class="md-step-bar-left"></div>
            <div class="md-step-bar-right"></div>
          </div>
          <div :class="getClasses(2)">
            <div v-if="step <= 2" class="md-step-circle">
              <div v-if="step === 2" class="inner-circle"></div>
            </div>
            <div v-if="step > 2" class="text-center check-icon">
              <img src="~@/assets/icons/check.svg" alt="">
            </div>
            <div class="md-step-bar-left"></div>
            <div class="md-step-bar-right"></div>
          </div>
          <div :class="getClasses(3)">
            <div v-if="step <= 3" class="md-step-circle">
              <div v-if="step === 3" class="inner-circle"></div>
            </div>
            <div v-if="step > 3" class="text-center check-icon">
              <img src="~@/assets/icons/check.svg" alt="">
            </div>
            <div class="md-step-bar-left"></div>
            <div class="md-step-bar-right"></div>
          </div>
          <div :class="getClasses(4)">
            <div v-if="step <= 4" class="md-step-circle">
              <div v-if="step === 4" class="inner-circle"></div>
            </div>
            <div v-if="step > 4" class="text-center mt-2 pt-2 check-icon">
              <img src="~@/assets/icons/check.svg" alt="">
            </div>
            <div class="md-step-bar-left"></div>
            <div class="md-step-bar-right"></div>
          </div>
        </div>
        <Information v-if="step === 2" @setStep="setStep" />
        <OrderSummary v-if="step === 3" @setStep="setStep" />
        <BankVerification v-if="step === 4" @setStep="setStep" />
        <ThankYou v-if="step === 5" @setStep="setStep" />
      </div>
    </div>
  </div>
</template>

<script>
import Information from '@/modules/app/components/speciality/Information';
import OrderSummary from '@/modules/app/components/speciality/OrderSummary';
import BankVerification from '@/modules/app/components/speciality/BankVerification';
import ThankYou from '@/modules/app/components/speciality/ThankYou';
export default {
  name: 'speciality-signUp',
  components: { Information, OrderSummary, BankVerification, ThankYou },

  data() {
    return {
      step: 2,
    };
  },
  methods: {
    getClasses(value) {
      if(this.step === value) {
        return 'md-step active'
      }
      if(this.step > value) {
        return 'md-step done'
      }
      return 'md-step'
    },
    setStep(value) {
      console.log(value)
      this.step = value
    }
  }
};
</script>

<style scoped>
.booking-page {
  background: rgba(226, 235, 221, 0.5);
  padding-bottom: 100px;
}

.md-stepper-horizontal {
  display: table;
  width: 100%;
  margin: 0 auto;
  background-color: #ffffff;
  /* box-shadow: 0 3px 8px -6px rgba(0, 0, 0, 0.5); */
  border-bottom: 1px solid #ddd;
}
.md-stepper-horizontal .md-step {
  display: table-cell;
  position: relative;
  padding: 24px;
}
/* .md-stepper-horizontal .md-step:hover,
.md-stepper-horizontal .md-step:active {
  background-color: rgba(0, 0, 0, 0.04);
} */
.md-stepper-horizontal .md-step:active {
  border-radius: 15% / 75%;
}
.md-stepper-horizontal .md-step:first-child:active {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.md-stepper-horizontal .md-step:last-child:active {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
/* .md-stepper-horizontal .md-step:hover .md-step-circle {
  background-color: #757575;
} */
.md-stepper-horizontal .md-step:first-child .md-step-bar-left,
.md-stepper-horizontal .md-step:last-child .md-step-bar-right {
  display: none;
}
.md-stepper-horizontal .md-step .md-step-circle {
  width: 30px;
  height: 30px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid #ddd;
  box-shadow: 0 3px 8px -6px rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  text-align: center;
  line-height: 30px;
  font-size: 16px;
  font-weight: 600;
  color: #ffffff;
}
.md-stepper-horizontal .md-step.active .md-step-circle {
  background-color: #FFFFFF;
}
.md-stepper-horizontal .md-step.done .md-step-circle {
  background-color: #A7D08E;
}

/* .md-stepper-horizontal .md-step.active .md-step-circle {
  background-color: rgb(33, 150, 243);
} */
/* .md-stepper-horizontal .md-step.done .md-step-circle:before {
  font-family: 'FontAwesome';
  font-weight: 100;
  content: '\f00c';
} */
.md-stepper-horizontal .md-step.done .md-step-circle * {
  display: none;
}
.md-stepper-horizontal .md-step.editable .md-step-circle {
  -moz-transform: scaleX(-1);
  -o-transform: scaleX(-1);
  -webkit-transform: scaleX(-1);
  transform: scaleX(-1);
}
/* .md-stepper-horizontal .md-step.editable .md-step-circle:before {
  font-family: 'FontAwesome';
  font-weight: 100;
  content: '\f040';
} */
.md-stepper-horizontal .md-step .md-step-bar-left,
.md-stepper-horizontal .md-step .md-step-bar-right {
  position: absolute;
  top: 36px;
  height: 1px;
  border-top: 1px solid #dddddd;
}
.md-stepper-horizontal .md-step .md-step-bar-right {
  right: 0;
  left: 50%;
  margin-left: 20px;
}
.md-stepper-horizontal .md-step .md-step-bar-left {
  left: 0;
  right: 50%;
  margin-right: 20px;
}

.md-stepper-horizontal .md-step.done .md-step-bar-left,
.md-stepper-horizontal .md-step.done .md-step-bar-right {
  position: absolute;
  top: 36px;
  height: 1px;
  border-top: 1px solid #A7D08E;
}

.inner-circle {
  width: 12px;
  height: 12px;
  background: #A7D08E;
  border-radius: 50%;
  margin: 8px auto 0 auto;
}

.check-icon img {
  margin-top: -25px !important;
}
</style>
