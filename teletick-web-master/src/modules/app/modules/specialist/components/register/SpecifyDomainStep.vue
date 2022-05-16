<template>
  <div class="row register-form justify-content-center text-center" style="margin-top: 70px">
    <div class="col-12">
      <h4>Veuillez compléter les informations ci-dessous ?</h4>
    </div>
    <div class="col-lg-6 ">
      <div class="row justify-content-center" style="margin-top: 35px">
        <div class="col-lg-6 ">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="First name*">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="Last name*">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="Email*">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="Confirm email*">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="Phone number*">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="s-reg-element">
            <div class="s-reg-input">
              <input type="text" class="form-control input__step" placeholder="Practice department number..">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SpecifyDomainStep"
}
</script>

<style scoped>
.input__step {
  background: #F9F9F9;
  border: 2px solid #F2F5FB;
  box-sizing: border-box;
  border-radius: 4px;
  min-height: 45px;
  margin-bottom: 20px;
  padding-left: 15px;
}
</style>
