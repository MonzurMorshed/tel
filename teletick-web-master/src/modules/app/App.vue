<template>
  <div class="App" >
    <component :is="layout" v-show="isPageLoading === false">
      <transition-group name="fade" mode="out-in">
        <slot/>
      </transition-group>
    </component>

    <AppLoader v-show="isPageLoading === true"/>
  </div>

</template>

<script>

import EmptyLayout             from "@/modules/app/modules/layout/views/EmptyLayout";
import CommonLayout            from "@/modules/app/modules/layout/views/CommonLayout";
import ClientPanelLayout       from "@/modules/app/modules/client/modules/layout/view/ClientPanelLayout";
import SpecialistPanelLayout   from "@/modules/app/modules/specialist/modules/layout/view/SpecialistPanelLayout";
import LoginRegisterLayout     from "@/modules/app/modules/layout/views/LoginRegisterLayout";
import HeaderWithProfileLayout from "@/modules/app/modules/layout/views/HeaderWithProfileLayout";

import { mapActions, mapGetters } from "vuex";


export default {
  name      : "App",
  components: {
    CommonLayout, EmptyLayout, SpecialistPanelLayout, ClientPanelLayout, LoginRegisterLayout, HeaderWithProfileLayout
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters('app', [ 'isPageLoading' ]),
    ...mapGetters('lang', [ 'selectedLang' ]),
    ...mapGetters('app/layout', [ 'layout' ]),

  },

  mounted() {
    console.log('MOUNTed')
    this.$store.watch(
        (state) => {
          return state.core.title;
        },
        (title) => {
          document.title = title.toString();
        },
        {
          deep: true,
        }
    );
  },

  // metaInfo() {
  //   return {
  //     title: this.getTitle['text_' + this.selectedLang] ?? process.env.VUE_APP_TITLE,
  //     meta: [{vmid: 'description', name: 'description', content: this.getDescription['text_' + this.selectedLang] ?? process.env.VUE_APP_DESCRIPTION},]
  //   }
  // },
};
</script>
<style lang="scss">
.App {
  flex: auto;
  display: flex;
  flex-direction: column;
  overflow-x: hidden;
}
</style>
