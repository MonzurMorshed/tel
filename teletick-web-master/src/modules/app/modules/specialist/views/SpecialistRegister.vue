<template>
  <div class="container page__container">

    <div class="breadcrumbs">
      <label>Home</label>
    </div>
    <div class="row card ">
      <div class="col-lg-10 card-body s-reg-wrap" >

        <div class="d-flex flex-column">

          <div class="mb-2">
            <Stepper :active="step.active" :length="step.length + 1"></Stepper>
          </div>
          <div style="min-height: 475px; border-top: 1px solid #EEF3EB;">
            <component :is="step.component[step.active]"></component>
          </div>
        </div>


        <div class="register__card__footer row justify-content-center" style="margin: 50px 0">
          <div class="col-md-6 text-start">
            <button class="btn form-previous-button next slick-next">
              <i class="fa fa-arrow-left" aria-hidden="true"></i>
              Prev
            </button>
          </div>

          <div class="col-md-6 text-end">
            <button class="btn form-next-button next slick-next">
              Next
            </button>
          </div>
        </div>

      </div>
    </div>


  </div>
</template>

<script>
import SpecifyDomainStep from "@/modules/app/modules/specialist/components/register/SpecifyDomainStep";
import Stepper           from "@/modules/app/modules/bookappointment/components/Stepper";

export default {
  name: "SpecialistRegister",
  components: {
    Stepper,
    SpecifyDomainStep,
  },

  data() {
    return {
      step: {
        active: 0,
        length: 3,
        component: {
          0: 'SpecifyDomainStep'
        }
      }
    };
  }
}
</script>

<style scoped>
.page__container {
  margin-top: 50px;
}
.breadcrumbs {
  margin-bottom: 15px;
}
.register__card__footer {

}
</style>
