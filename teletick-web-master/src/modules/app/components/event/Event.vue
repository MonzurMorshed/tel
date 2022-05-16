<template >
  <div class="event-item bg-light-grey col-sm-12 col-md-4" >
    <div
      :class=" type === 'upcoming' ? 'upcoming-image' : 'default-image'"
    >
      <div class="event-info d-flex flex-wrap align-items-center ps-4 pt-4" >
        <div class="pe-3 mt-2">
          <img src="~@/assets/icons/calendar.svg" alt="Date" />
          <span class="text-white ps-2">{{items.created_at | formatDate }}</span>
        </div>
        <div class="pe-3 mt-2">
          <img src="~@/assets/icons/clock.svg" alt="Time" />
          <span class="text-white ps-2">{{items.created_at | formatDateTime }} </span>
        </div>
        <div class="mt-2">
          <img src="~@/assets/icons/people.svg" alt="People" />
          <span class="text-white ps-2">27 People</span>
        </div>
      </div>
      <h2 v-if="type === 'upcoming'" class="text-white mx-4 mt-5">
        The Health Care System Under French National Health Insurance
      </h2>
      <h4
        v-if="type === 'default'"
        class="text-white mx-4 mt-5"
      >
        Comment s’épanouir pleinement en couple ?
      </h4>
    </div>
    <div
      class="py-4 px-4 d-flex flex-wrap justify-content-between align-items-center"
    >
      <div>
        <img src="~@/assets/profile_logo.png" alt="User" />
        <strong class="ms-2">{{items.name}}</strong>
      </div>

      <div class="">
        <router-link :to="{ name: 'event', params: { id: items.book_event_id }}" class="participate-btn"> Participer </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Event',
  // props: {
  //   type: {
  //     type: String,
  //     default: 'default',
  //   },
  // }
  props: ['items','type'],

};
</script>

<style scoped>
.upcoming-image {
  background-size: cover;
  background-repeat: no-repeat;
  height: 280px;
  border-top-right-radius: 8px;
  border-top-left-radius: 8px;
  background-image: url('~@/assets/events/upcoming1.svg');
}

.default-image {
  background-size: cover;
  background-repeat: no-repeat;
  height: 200px;
  border-top-right-radius: 8px;
  border-top-left-radius: 8px;
  background-image: url('~@/assets/events/upcoming1.svg');
}

.event-item {
  border-radius: 8px;
}

@media (max-width: 991px) {
  h2 {
    font-size: 25px;
  }

  h4 {
    font-size: 20px;
  }
}
</style>
