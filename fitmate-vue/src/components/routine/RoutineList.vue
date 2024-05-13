<template>
  <div>
    <div
      v-for="routine in store.routineList"
      :key="routine.id"
      @click="navigateToDetail(routine.id)"
      class="routine-card"
    >
      <div>
        <span>난이도 {{ routine.level }}</span>
      </div>
      <div>
        <span>{{ routine.title }}</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useRoutineStore } from '@/stores/routine';

const router = useRouter();
const store = useRoutineStore();

const navigateToDetail = function(routineId) {
  router.push({ name: 'routineDetail', params: { id: routineId }})
}
</script>

<style scoped>
.routine-card {
  border: 1px solid black;
}
</style>