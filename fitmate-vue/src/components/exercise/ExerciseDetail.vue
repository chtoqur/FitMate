<template>
  <div>
    <div class="exercise-name">
      <span>{{ exercise.name }}</span>
    </div>
    <div class="exercise-img">
      <img :src="exercise.gifSrc" alt="">
    </div>
    <div class="exercise-desc">
      <span v-html="exercise.description.replace(/\n/g, '<br>')"></span>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

defineProps({
  exercise: Object,
})
</script>

<style scoped>
.exercise-name {
  font-size: 30px;
  font-weight: 600;
}

.exercise-img, img {
  width: 500px;
  margin: 25px 0;
}

.exercise-desc {
  font-size: 22px;
  line-height: 40px;
  margin-bottom: 80px;
}
</style>