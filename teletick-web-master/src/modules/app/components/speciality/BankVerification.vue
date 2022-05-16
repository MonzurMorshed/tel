<template>
  <div class="bank-verification pb-4 px-3">
    <h3 class="text-center">
      Vérification bancaire pour consultations vidéo (à distance)
    </h3>
    <b-form @submit.prevent>
      <b-row align-h="center" class="mb-5 mt-4">
        <b-col cols="12" md="10" lg="8" xl="6">
          <b-row>
            <b-col cols="12" class="mt-4">
              <b-form-input placeholder="Nom du spécialiste "></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-input
                placeholder="Adresse specialiste - Ligne 1 (exemple: 33 rue)*"
              ></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-input
                placeholder="Adresse specialiste - Ligne 2 (exemple: Residence, maison, etc)*"
              ></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-select class="form-control" v-model="country">
                <b-form-select-option :value="null"
                  >Country*</b-form-select-option
                >
                <b-form-select-option value="france"
                  >France</b-form-select-option
                >
              </b-form-select>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-select class="form-control" v-model="city">
                <b-form-select-option :value="null">City*</b-form-select-option>
                <b-form-select-option value="paris">Paris</b-form-select-option>
              </b-form-select>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input
                placeholder="Code departement (example: 75)*"
              ></b-form-input>
            </b-col>
            <b-col cols="12" md="6" class="mt-4">
              <b-form-input placeholder="Code postal*"></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-datepicker locale="fr"></b-form-datepicker>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-input
                placeholder="Nom du piece d’identite* "
              ></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-input placeholder="Nom du compte*"></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <b-form-input placeholder="IBAN - sans espace*"></b-form-input>
            </b-col>
            <b-col cols="12" class="mt-4">
              <div
                class="id-box text-center p-4 pointer"
                @click="pickFrontImage"
              >
                <div v-if="!front" class="attachment p-1 mb-2">
                  <img src="~@/assets/icons/attachment.svg" alt="" />
                </div>

                <b-badge v-else class="badge-green text-white"
                  >{{ front && front.name }}
                  <i
                    class="fa fa-times text-white ps-2"
                    @click="removeImage(1)"
                  ></i
                ></b-badge>

                <div>
                  <strong class="text-sm">Recto piece d’identite </strong>
                  <span class="text-gray text-sm">(format .jpg)*</span>
                </div>
              </div>
              <input
                type="file"
                style="display: none"
                accept="image/jpg, image/jpeg"
                ref="front"
                @change="onPickFront"
              />
            </b-col>
            <b-col cols="12" class="mt-4">
              <div
                class="id-box text-center p-4 pointer"
                @click="pickBackImage"
              >
                <div v-if="!back" class="attachment p-1 mb-2">
                  <img src="~@/assets/icons/attachment.svg" alt="" />
                </div>
                <b-badge v-else class="badge-green text-white"
                  >{{ back && back.name }}
                  <i
                    class="fa fa-times text-white ps-2"
                    @click="removeImage(2)"
                  ></i
                ></b-badge>
                <div>
                  <strong class="text-sm">Verso piece d’identite </strong>
                  <span class="text-gray text-sm">(format .jpg)*</span>
                </div>
              </div>
              <input
                type="file"
                style="display: none"
                ref="back"
                accept="image/jpg, image/jpeg"
                @change="onPickBack"
              />
            </b-col>

            <b-col cols="12">
              <div class="accept-conditions mt-3 p-3">
                <label class="checkbox-container">
                  <input type="checkbox" checked="checked" />
                  <strong class="text-sm ps-2">Vérifier  </strong>
                  <span class="checkmark"></span>
                </label>
              </div>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
      <div class="d-flex align-items-center justify-content-between mx-3">
        <div class="return">
          <div class="back pointer" @click="$emit('setStep', 3)">
            <span class="text-darkgreen text-uppercase"
              ><img
                class="me-2"
                src="~@/assets/icons/arrow-back.svg"
                alt="back"
              />
              retour</span
            >
          </div>
        </div>
        <div class="next">
          <div class="d-flex align-items-center">
            <span
              @click="$emit('setStep', 5)"
              class="text-darkgreen text-uppercase pointer pe-4 pt-3"
            >
              Passer</span
            >
            <button
              @click="$emit('setStep', 5)"
              type="button"
              class="custom-submit-button mt-3 text-white"
            >
              Suivant
              <img
                class="ms-2"
                src="~@/assets/icons/arrow-next.svg"
                alt="next"
              />
            </button>
          </div>
        </div>
      </div>
    </b-form>
  </div>
</template>

<script>
export default {
  name: 'BankVerification',
  data() {
    return {
      country: null,
      city: null,
      front: null,
      back: null,
    };
  },
  methods: {
    pickFrontImage() {
      if (!this.front) {
        this.$refs.front.click();
      }
    },
    pickBackImage() {
      if (!this.back) {
        this.$refs.back.click();
      }
    },
    onPickFront(e) {
      const file = e.target.files[0];
      if (file) {
        this.front = file;
      }
    },
    onPickBack(e) {
      const file = e.target.files[0];
      if (file) {
        this.back = file;
      }
    },
    removeImage(value) {
      let self = this;
      setTimeout(() => {
        if (value === 1) {
          self.front = null;
        }
        if (value === 2) {
          self.back = null;
        }
      }, 100);
    },
  },
};
</script>

<style scoped>
.id-box {
  background: rgba(167, 208, 142, 0.2);
  border-radius: 8px;
}

.id-box .attachment {
  background: #a7d08e;
  border-radius: 8px;
  width: 30px;
  height: 30px;
  margin: auto;
}

.badge-green {
  background: #a7d08e;
  font-size: 12px;
}

.badge-green i {
  font-size: 12px;
}

.file-info {
  background: #a7d08e;
  border-radius: 8px;
  margin: auto;
  min-width: 50px;
  max-width: 60%;
  text-align: center;
  padding: 5px 20px;
}

.accept-conditions {
  border: 1px solid #ecf0f9;
  box-sizing: border-box;
  border-radius: 8px;
}

.checkbox-container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  
  /* Hide the browser's default checkbox */
  .checkbox-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
  }
  
  /* Create a custom checkbox */
  .checkmark {
    position: absolute;
    top: 10px;
    left: 10px;
    height: 20px;
    width: 20px;
    background-color: #eee;
  }
  
  /* On mouse-over, add a grey background color */
  .checkbox-container:hover input ~ .checkmark {
    background-color: #ccc;
  }
  
  /* When the checkbox is checked, add a blue background */
  .checkbox-container input:checked ~ .checkmark {
    background-color: #a7d08e;
  }
  
  /* Create the checkmark/indicator (hidden when not checked) */
  .checkmark:after {
    content: '';
    position: absolute;
    display: none;
  }
  
  /* Show the checkmark when checked */
  .checkbox-container input:checked ~ .checkmark:after {
    display: block;
  }
  
  /* Style the checkmark/indicator */
  .checkbox-container .checkmark:after {
    left: 8px;
    top: 4px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  }
</style>
