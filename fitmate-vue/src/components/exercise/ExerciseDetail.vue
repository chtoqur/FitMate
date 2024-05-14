<template>
  <div>
    <h3>exercise.vue</h3>
    <h3>{{ exercise.name }}</h3>
    <h3>{{ exercise.part }}</h3>
    <img :src="exercise.gifSrc" alt="">
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

defineProps({
  exercise: Object,
})
</script>

<style scoped>

</style>