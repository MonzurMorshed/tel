<template>
  <div class="event-details mb-5">
    <div class="container pb-5 mb-5">
      <div class="pt-5">
        <p>
          <router-link to="/events" class="column-color-green"
            >Events >
          </router-link>
          <span> Event page</span>
        </p>
      </div>

      <b-row class="common-section-padding">
        <b-col cols="12" class="mt-3">
          <div class="event bg-white">
            <div class="title">
              <h2 class="text-white">
                The Health Care System Under French National Health Insurance
              </h2>
            </div>
            <div class="event-info d-flex flex-wrap align-data-center">
              <div class="mt-2">
                <img src="~@/assets/icons/calendar.svg" alt="Date" />
                <span class="text-white ps-2">{{data.created_at | formatDate }}</span>
              </div>
              <div class="mt-2">
                <img src="~@/assets/icons/clock.svg" alt="Time" />
                <span class="text-white ps-2">{{data.created_at | formatDateTime }}</span>
              </div>
              <div class="mt-2">
                <img src="~@/assets/icons/people.svg" alt="People" />
                <span class="text-white ps-2">27 People</span>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="bg-white mx-1 mb-5 px-3 px-md-5">
        <b-col cols="12" lg="6" class="mt-4">
          <div class="d-flex mt-2">
            <div>
              <img src="~@/assets/avatar.svg" alt="User" />
            </div>
            <div class="ms-3">
              <strong>{{data.name}}</strong>
              <div class="tags d-flex flex-wrap mt-2">
                <div class="event-tag">Ostéopathie</div>
                <div class="event-tag">Réflexologie</div>
                <div class="event-tag">Psychopraticien</div>
                <div class="event-tag">Méditation</div>
              </div>
            </div>
          </div>
          <div class="contact section-border mt-4">
            <span> Specialist’s contacts: </span>

            <div class="box mt-3">
              <img src="~@/assets/icons/phone-icon.svg" alt="Phone" />
              <span class="ms-3 text-grey">+123 456 789 0</span>
            </div>
            <div class="box mt-3 border-box">
              <img src="~@/assets/icons/location-icon.svg" alt="Address" />
              <span class="ms-3 text-grey">14 rue Gardon, 75018 Paris </span>
            </div>
            <div class="box mt-3 border-box">
              <img src="~@/assets/icons/location-icon.svg" alt="Address" />
              <span class="ms-3 text-grey"
                >5 rue saint-denis, 75008, Paris</span
              >
            </div>
          </div>
          <div class="description section-border mt-4">
            <strong>Event information</strong>
            <p class="text-grey mt-4 mb-0">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec
              faucibus cursus pharetra ultricies tellus donec pellentesque leo
              hac. Porta mattis turpis sit netus et posuere aliquet in. Vitae
              ornare vulputate urna sapien bibendum. Urna, tempus, dictumst in
              fermentum sodales purus porta. Sed enim eget volutpat pellentesque
              odio. Gravida leo lorem id mi odio nunc aliquam quis nulla. Nam
              arcu amet, dictumst urna enim scelerisque facilisis eget magna. Id
              quam pellentesque dui tellus blandit sed justo. Scelerisque morbi
              amet pellentesque amet, dolor tellus elementum id eu. Nam arcu
              amet, dictumst urna enim scelerisque facilisis eget magna. Id quam
              pellentesque dui tellus blandit sed justo. Scelerisque morbi amet
              pellentesque amet, dolor tellus elementum id eu.
            </p>
          </div>
          <div class="other-events mt-4">
            <b-row></b-row>
          </div>
        </b-col>
        <b-col cols="12" lg="6">
          <div class="book-event bg-white">
            <h5>Participer</h5>
            <div class="booking-info text-center">
              <div class="block">11:00</div>
              <h4 class="text-darkgreen mt-3">Mardi 17 février</h4>
              <span>de 11:00 a 12:00 (Europe / Paris) </span>
            </div>
            <b-row>
              <b-col cols="6">
                <div class="duration-info d-flex justify-content-between">
                  <img src="~@/assets/icons/duration-icon.svg" alt="Duration" />
                  <div>
                    <span
                      >Duration <br />
                      {{data.duration}} MIN</span
                    >
                  </div>
                </div>
              </b-col>
              <b-col cols="6">
                <div class="price-info d-flex justify-content-between">
                  <img src="~@/assets/icons/wallet-icon.svg" alt="Price" />
                  <div>
                    <span
                      >Price <br />
                      {{data.price}} &euro;</span
                    >
                  </div>
                </div>
              </b-col>
              <b-col cols="12">
                <router-link to="/speciality-signup" class="d-grid">
                  <button type="button" class="custom-submit-button mt-3">
                    Book
                  </button>
                </router-link>
              </b-col>
            </b-row>
          </div>
        </b-col>
        <b-col cols="12">
          <strong>Other events from this specialist</strong>
          <b-row class="mb-5">
            <b-col
              cols="12"
              md="6"
              class="mt-3"
              v-for="event in 2"
              :key="event"
            >
              <Event v-for="(row,key,index) in items" items=row />
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import Event from '@/modules/app/components/event/Event';
import axios from 'axios';
export default {
  name: 'event',
  components: { Event },
  created(){
    axios.get(`http://127.0.0.1:8000/api/v1/event/`+this.$route.params.id)
      .then(response => {

        this.data.book_event_id = response.data[0].book_event_id;
        this.data.consultation_type = response.data[0].consultation_type;
        this.data.created_at = response.data[0].created_at;
        this.data.duration = response.data[0].duration;
        this.data.education = response.data[0].education;
        this.data.expertise = response.data[0].expertise;
        this.data.fee = response.data[0].fee;
        this.data.follow = response.data[0].follow;
        this.data.name = response.data[0].name;
        this.data.price = response.data[0].price;
        this.data.prof_expertise = response.data[0].prof_expertise;
        this.data.prof_practice = response.data[0].prof_practice;
        this.data.specialist_id = response.data[0].specialist_id;
        
      })
      .catch(e => {
        this.errors.push(e)
      })
  },
    data(){
      return{
        items:'',
        data:{
          book_event_id: '',
          consultation_type: '' ,
          created_at: '' ,
          duration : '',
          education : '',
          expertise: '' ,
          fee: '',
          follow: '',
          name: '',
          price: '',
          prof_expertise: '',
          prof_practice: '',
          specialist_id: ''
        },
      }
    },
    method:{
      specialistEvent(id){
        // new for specialist event
        axios.get(`http://127.0.0.1:8000/api/v1/specialistevent/`+id)
          .then(result => {
              console.log( 'Specialist’s' + JSON.parse(result.data));
          })
          .catch(error => {
            console.log('SSSS' + response.data[0].specialist_id);
            this.errors.push(error)
          })
      }
    }
};
</script>

<style scoped>
.event-details {
  position: relative;
}
.event {
  position: relative;
  background-size: cover;
  background-repeat: no-repeat;
  height: 300px;
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
  background-image: url('~@/assets/events/event.svg');
}

.book-event {
  width: 400px;
  padding: 15px 20px;
  border: 2px solid rgba(224, 224, 224, 0.56);
  box-sizing: border-box;
  border-radius: 4px;
  margin: auto;
  margin-top: -150px;
  margin-bottom: 40px;
}

.booking-info {
  background: rgba(167, 208, 142, 0.2);
  border-radius: 8px;
  padding: 25px;
  margin-top: 20px;
}

.booking-info .block {
  background: #a7d08e;
  border-radius: 4px;
  width: 50px;
  margin: auto;
  color: white;
  font-weight: bold;
  padding: 7px 10px;
}

.duration-info,
.price-info {
  border: 1px solid rgba(167, 208, 142, 0.5);
  box-sizing: border-box;
  padding: 10px;
  border-radius: 4px;
  margin-top: 20px;
}

.event .title {
  position: absolute;
  width: 45%;
  bottom: 20%;
  left: 5%;
  line-height: 1;
  overflow-wrap: break-word;
}

.event-info {
  position: absolute;
  width: 100%;
  bottom: 10%;
  left: 5%;
}

.event-info div {
  margin-right: 5%;
}

.event-tag {
  background: #a7d08e;
  border-radius: 4px;
  color: white;
  padding: 4px 12px;
  text-align: center;
  margin-right: 8px;
  margin-top: 4px;
}

.box {
  padding: 4px 12px;
  width: 270px;
}

.box.border-box {
  border: 1px solid rgba(167, 208, 142, 0.15);
  box-sizing: border-box;
  border-radius: 4px !important;
}

.section-border {
  padding-bottom: 40px;
  border-bottom: 1px solid #eff7ea;
}

@media (max-width: 991px) {
  .book-event {
    margin-top: 10px;
  }
  .event .title {
    position: absolute;
    width: 100%;
  }
}
</style>
