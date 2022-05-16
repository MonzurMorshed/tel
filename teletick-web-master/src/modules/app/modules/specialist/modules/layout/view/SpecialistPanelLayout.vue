<template>
  <div>
    <Header :name="(Auth.user.firstname + ' ' + Auth.user.lastname)"></Header>

    <div class="dashboard__content__wrapper">
      <Sidebar></Sidebar>
      <div class="page__content">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Header         from "@/modules/app/modules/specialist/modules/layout/components/SpecialistHeader";
import Sidebar        from "@/modules/app/modules/specialist/modules/layout/components/SpecialistSidebar";
import '@/assets/scss/specialist/structure.css';
import { mapGetters } from "vuex";
import '@/assets/scss/specialist/custom_add_calender.css';
import '@/assets/scss/specialist/custom_calender_view.css';

export default {
  name: "SpecialistPanelLayout",
  components: { Header, Sidebar },

  computed: { ...mapGetters('app/auth', ['Auth']) }
}
</script>

<style scoped>
.dashboard__content__wrapper {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
}
.page__content {
  padding-top: 30px;
  padding-left: 30px;
  padding-right: 30px;
  margin-top: 70px;
  flex-basis: 100%;
  background: #f9f9f9;
}
</style>
