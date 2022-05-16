<template>
  <div>
    <Header></Header>

    <div class="dashboard__content__wrapper">
      <Sidebar></Sidebar>
      <div class="page__content">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Header  from "@/modules/app/modules/client/modules/layout/components/ClientHeader";
import Sidebar from "@/modules/app/modules/client/modules/layout/components/ClientSidebar";
import '@/assets/scss/client/structure.css';

export default {
  name: "ClientPanelLayout",
  components: { Header, Sidebar }
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
}
</style>
