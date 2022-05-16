<template>
  <div class="row">
    <h4>Consultation summary</h4>
    <div class="col-lg-12 card">
      <div class="card-body">
        <div class="row justify-content-center">
          <div class="col-lg-4">
            <input type="text" class="search__input form-control">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ClientConsultations"
}
</script>

<style scoped>
.search__input {
  background: #F9F9F9!important;
  border: 2px solid #F2F5FB!important;
}
.search__button {
  background: linear-gradient(
      90deg, #a7d08e 0%, #a7d08e 100%);
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  color: #fff;
  letter-spacing: 1px;
  font-size: 14px;
  line-height: 21px;
  padding: 8px 15px;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  margin-top: 0px;
  text-transform: uppercase;
}
</style>
