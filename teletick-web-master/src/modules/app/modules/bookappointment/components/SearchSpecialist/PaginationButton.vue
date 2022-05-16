<template>
  <a href="#" @click="handleButtonClick" :class="[isActive ? 'curPage' : '']">{{ title }}</a>
</template>

<script>
export default {
  name: "PaginationButton",

  props: {
    title: {
      type: String,
      required: true
    },
    value: {
      type: String,
      default: null
    },
    isActive: {
      type: Boolean,
    },
  },

  methods: {
    handleButtonClick() {
      if (this.isActive === true || this.value === null) {
        return null;
      }
      return this.$emit('handlePaginate', this.value)
    }
  },
}
</script>

<style scoped>

</style>
