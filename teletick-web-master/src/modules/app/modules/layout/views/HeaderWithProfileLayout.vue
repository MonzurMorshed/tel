<template>
  <div>
    <router-view/>
  </div>
</template>

<script>
import Header         from "@/modules/app/modules/specialist/modules/layout/components/SpecialistHeader";
import { mapGetters } from "vuex";

export default {
  name: "HeaderWithProfileLayout",

  components: { Header },

  computed: { ...mapGetters('app/auth', [ 'user' ]) }
}
</script>

<style scoped>

</style>
