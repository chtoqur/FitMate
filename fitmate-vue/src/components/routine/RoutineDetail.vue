<template>
  <div>
    <h3>{{ store.routine.title }}</h3>
    <hr>
    <table>
      <thead>
        <tr>
          <th>운동이름</th>
          <th>세트</th>
          <th>횟수</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="course in store.routine.courses" :key="course.name">
          <td>{{ course.name }}</td>
          <td>{{ course.set }}</td>
          <td>{{ course.reps }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { useRoute } from 'vue-router';
import { useRoutineStore } from '@/stores/routine';
import { onMounted, ref } from 'vue';

const store = useRoutineStore();
const route = useRoute();

onMounted(() => {
  store.getRoutine(route.params.id);
})

</script>

<style scoped>

</style>