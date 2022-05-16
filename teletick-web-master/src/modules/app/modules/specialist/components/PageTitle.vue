<template>
  <h3 class="specialist__page__title">{{ value }}</h3>
</template>

<script>
export default {
  name: "PageTitle",
  props: {
    value: {
      type: String,
      required: true
    }
  },
}
</script>

<style scoped>
.specialist__page__title {
  margin-bottom: 20px;
}
</style>
