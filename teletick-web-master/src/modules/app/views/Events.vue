<template>
  <div class="bg-white">
    <div class="container pb-5">
      <div class="pt-5">
        <p>
          <router-link to="/" class="column-color-green">Home > </router-link>
          <span> Events</span>
        </p>
      </div>
      <div class="pt-4">
        <h2>Workshop</h2>
      </div>

      <h5 class="column-color-green pt-4">Upcoming</h5>
      <b-row class="mb-5 common-section-padding">
        <b-col class="row mt-3" v-for="event in 1" :key="event">
          <Event :type="'upcoming'" v-for="(row,key,index) in items" :items=row ></Event>
        </b-col>
      </b-row>
      <b-row id="all-events" >
        <b-col cols="12">
          <h5 class="column-color-green">All</h5>
        </b-col>
      </b-row>
      <b-row>
        <b-col
          cols="12"
          class="row mt-3"
        >
          <Event v-for="(row,key,index) in items" :items=row />
        </b-col>
      </b-row>
      <b-row align-h="center" class="mt-3 pagination-section">
        <b-col
          cols="6"
          md="3"
          class="mt-4"
          order-md="first"
        >
          <div class="back pointer" @click="backPage()">
            <span
              ><img class="me-2" src="~@/assets/icons/arrow-back.svg" alt="" />
              Back</span
            >
          </div>
        </b-col>
        <b-col cols="12" md="6" order="first">
          <b-pagination
            v-model="currentPage"
            :total-rows="items.length"
            :per-page="perPage"
            pills
            align="center"
            first-number
            last-number
            prev-class="hide-button"
            next-class="hide-button"
            aria-controls="all-events"
          ></b-pagination>
        </b-col>
        <b-col
          cols="6"
          md="3"
          order="last"
          class="text-right mt-4"
        >
          <div class="next pointer" @click="nextPage()">
            <span
              >Next
              <img class="ms-2" src="~@/assets/icons/arrow-next.svg" alt=""
            /></span>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import Event from '@/modules/app/components/event/Event';
import axios from 'axios';
export default {
  name: 'Events',
  components: { Event },
  computed: {
    allEvents() {
      return this.items.slice(
        (this.currentPage - 1) * this.perPage,
        this.currentPage * this.perPage
      );
    },
  },
  
  
  // created() {
  //   this.items = Array.from(Array(100).keys());
  // },
  

  created(){
    axios.get(`http://127.0.0.1:8000/api/v1/event`)
      .then(response => {
        // JSON responses are automatically parsed.
        this.items = response.data
        console.log(response.data);
      })
      .catch(e => {
        this.errors.push(e)
      })
  },

  data() {
    return {
      currentPage: 1,
      perPage: 6,
      items: [],
    };
  },

  methods: {

    backPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },

    nextPage() {
      if (this.currentPage < Math.ceil(this.items.length / this.perPage)) {
        this.currentPage++;
      }
    },

  },
};
</script>

<style scoped>
.pagination-section {
  margin-bottom: 100px;
}

.back,
.next {
  font-size: 18px;
  color: #537e36;
}
</style>
