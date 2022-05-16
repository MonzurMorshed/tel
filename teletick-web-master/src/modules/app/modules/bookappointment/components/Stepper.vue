<template>
  <div class="component__wrapper">
    <div class="card-body step__wizard">
      <div class="progress step__wizard__content" style="width: 70%; max-width: 1000px;height: 100%;">
        <div class="progressBarDiv" style="left: 25%; width: 50%; max-width: 1000px;">
          <div class="progressbar empty"></div>
          <div id="prog" class="progressbar" :style="{width: (100 / (Stepper.length - 1)) * Stepper.active - 1 + '%'}"></div>
        </div>
        <div class="d-flex" style="height: 100%; flex: 1 1 auto; z-index: 1;">
          <div style="flex-basis: 100%;" v-for="(itm, index) in new Array(Stepper.length)">
            <div class="step__item">
              <div class="step__item__done" v-if="index < Stepper.active - 1"></div>
              <div class="step__item__content" v-if="index === Stepper.active - 1"></div>
              <div class="step__item__next" v-if="index > Stepper.active - 1"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "Stepper",

  props: {
    // Stepper: {
    //   type    : Object,
    //   required: true
    // },
  },

  computed: {
    ...mapGetters('app/bookappointment', [ 'Stepper' ])
  },
  data() {
    return {};
  }
}
</script>

<style scoped>
.component__wrapper {

}

.step__wizard {
  position: relative;
  width: 100%;
  height: 50px;
  border-radius: 10px !important;
  padding: 5px 0;
  text-align: center;
  background-color: #fff;
  margin-bottom: 5px;
  border: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-top: 30px;
  margin-bottom: 30px;
}

.step__item {
  text-align: center;
  display: inline-block;
  font-size: 14px;
  font-weight: bold;
  line-height: 27px;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  border-color: #FFF;
  color: transparent;
  box-shadow: 0 2px 7px rgb(44 63 52 / 15%);


}

.step__item__content {
  color: transparent;
  width: 30px;
  height: 30px;
  background: #FFFFFF;
  border: 2px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
}

.step__item__content:before {
  content: '';
  background: #A7D08E;
  width: 10px;
  height: 10px;
  display: block;
  transform: translate(83%, 83%);
  border-radius: 50%;
}

.step__wizard__content {
  background: #FFFFFF;
}

.step__item__done {
  color: white;
  background-color: #A7D08E;
  border-color: #A7D08E;
  border-radius: 50%;
  line-height: 27px;
  width: 30px;
  height: 30px;
}

.step__item__done:before {
  content: "\f00c";
  font-size: 15px;
  font-family: "Font Awesome 5 Free";
}

.step__item__next {
  color: transparent;
  width: 30px;
  height: 30px;
  background: #FFFFFF;
  border: 2px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
}

.progressBarDiv {
  position: absolute;
  top: calc(34% - -2px);
  margin: 0;
  height: 2px;
  background: #E6E6E6;
  display: flex;
  overflow: hidden;
  font-size: .75rem;
  border-radius: 0.25rem;
}

.progressbar.empty {
  opacity: 1;
  width: 100%;
  background: #d9e0e6;
}

.progressbar {
  position: absolute;
  background: #A7D08E;
  opacity: 1;
  height: 3px;
  width: 0;
  -webkit-transition: width 0.6s ease;
  -o-transition: width 0.6s ease;
  transition: width 0.6s ease;
}
</style>
