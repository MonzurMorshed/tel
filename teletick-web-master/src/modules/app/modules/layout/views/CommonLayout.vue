<template>
  <!--  <div class="main-app" v-if="isLoaded()">-->

  <div class="app__container">

    <AppHeader/>
    <div class="site__body">
      <transition-group name="fade" mode="out-in">
        <router-view key="id"/>
      </transition-group>
    </div>
    <app-footer></app-footer>

  </div>

  <!--  <AppLoader v-else/>-->
</template>

<script>
import AppHeader                  from '@/modules/app/modules/layout/components/AppHeader';
import AppFooter                  from "@/modules/app/modules/layout/components/AppFooter";
import AppLoader                  from '@/modules/app/modules/layout/components/AppLoader';
import { mapActions, mapGetters } from 'vuex';

export default {
  name      : 'CommonLayout',
  props     : { data: Object },
  components: { AppFooter, AppHeader, AppLoader },
  data() {
    return {};
  },
  methods : {
    isLoaded() {
      // return this.productLoading && this.textLoading && this.newsLoading
    }
  },
  computed: {
    // ...mapGetters('product', {productLoading: 'isLoading'}),
  },
  created() {
    // this.productsInit();
    // this.newsInit();
    // this.textsInit();
  },
};
</script>

<style lang="scss">
.app__container {
  display: flex;
  flex-direction: column;
  flex: auto;
}

.site__body {
  padding: 0px;
  flex: 1 0 auto; /*Три*/
}
</style>
