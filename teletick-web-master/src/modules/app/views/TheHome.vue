<template>
  <div>
    <div class="first__section">
      <AppSearchSection/>
    </div>

    <div class="second__section common-section-padding">
      <AppHowItWorksSection/>
    </div>

    <div class="common-section-padding">
      <AppReasonsSection/>
    </div>

    <div class="common-section-padding">
      <AppEventSection/>
    </div>
    <div class="common-section-padding" style="background-color: #fff;">
      <AppWhySection/>
    </div>
    <div class="common-section-padding" style="background-color: #F9F9F9;">
      <AppBestSpecialistSection/>
    </div>
    <div class="common-section-padding" style="background-color: #fff;">
      <AppBlogSection/>
    </div>
    <div class="common-section-padding testimonial-section" style="background-color: #F9F9F9;">
      <AppHighlightsSection/>
    </div>

  </div>
</template>

<script>
import {mapActions, mapGetters} from 'vuex';
import AppSearchSection from "@/modules/app/components/home/AppSearchSection";
import AppHowItWorksSection from "@/modules/app/components/home/AppHowItWorksSection";
import AppEventSection from "@/modules/app/components/home/AppEventSection";
import AppReasonsSection from "@/modules/app/components/home/AppReasonsSection";
import AppWhySection from "@/modules/app/components/home/AppWhySection";
import AppBestSpecialistSection from "@/modules/app/components/home/AppBestSpecialistSection";
import AppBlogSection from "@/modules/app/components/home/AppBlogSection";
import AppHighlightsSection from "@/modules/app/components/home/AppHighlightsSection";

export default {
  name: "AppHome",
  components: {
    AppBlogSection,
    AppBestSpecialistSection,
    AppWhySection,
    AppEventSection,
    AppReasonsSection,
    AppHowItWorksSection,
    AppSearchSection,
    AppHighlightsSection
  },
  data() {
    return {
      isMobile: false,
    };
  },

  computed: {
    ...mapGetters('product', {salesProduct: 'salesProduct', specialProduct: 'specialProduct'}),
    ...mapGetters('lang', ['selectedLang']),
  },

  methods: {
    ...mapActions('app/bookappointment', ['setStepsLength', 'initBookSpecialistsList']),
    getImage(images) {
      if (images?.length) {
        // return images[0].src
        return `storage/item-image/${images[0].title}`
      }
    },

    onResize() {
      this.isMobile = window.innerWidth <= 768;
    }
  },
  mounted() {

    // this.setStepsLength(5);
  },

  created() {
    this.onResize();

    window.addEventListener('resize', this.onResize);
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize);
  },
};
</script>

<style scoped lang="scss">
.first__section {
  padding-top: 90px;
  padding-bottom: 150px;
  background: #FFFFFF !important;
  overflow: visible;
}

.second__section {
  padding: 130px 0;
  text-align: center;
  position: relative;
  background: rgba(229, 241, 221, 0.2);
}

.showForm {
  cursor: pointer;
}

.common-section-padding {
  padding: 130px 0 110px!important;
}

.testimonial-section {
  margin-top: 25px;
  background-color: #F9F9F9!important;
  padding-bottom: 185px!important;
}
</style>
