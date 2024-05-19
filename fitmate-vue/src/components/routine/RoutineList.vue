<template>
  <div>
    <div class="routine-title">
      <h4>부위와 난이도를 선택해 <br>
        오늘의 루틴을 시작해보세요
      </h4>
    </div>
    <div class="routine-select">
      <div class="routine-part">
        <v-combobox
          multiple
          label="운동 부위를 선택하세요"
          :items="['어깨', '팔', '가슴', '복근', '등', '하체']"
          variant="solo"
          v-model="selectedParts"
          @update:modelValue="selectPart"
        ></v-combobox>
      </div>
      <div class="routine-level">
        <div class="rating">
          <input type="radio" id="star-3" name="star-radio" value="star-3"
            @click="selectLevel(3)" v-model="selectedLevel">
          <label for="star-3">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path pathLength="360" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path></svg>
          </label>
          <input type="radio" id="star-2" name="star-radio" value="star-2"
            @click="selectLevel(2)" v-model="selectedLevel">
          <label for="star-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path pathLength="360" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path></svg>
          </label>
          <input type="radio" id="star-1" name="star-radio" value="star-1"
            @click="selectLevel(1)" v-model="selectedLevel">
          <label for="star-1">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path pathLength="360" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path></svg>
          </label>
        </div>
      </div>
    </div>
    <div class="routine-card">
      <div
        v-for="routine in routineList" :key="routine.id"
      >
        <RoutineCard :routine="routine"/>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch } from 'vue';
import { useRouter } from 'vue-router';
import { useRoutineStore } from '@/stores/routine';
import { useUserStore } from '@/stores/user';
import RoutineCard from "@/components/routine/RoutineCard.vue";

const router = useRouter();
const store = useRoutineStore();
const userStore = useUserStore();

const routineList = ref([]);
const selectedParts = ref([]);
const selectedLevel = ref("");

const selectPart = (part) => {
  if (selectedParts.value.length === 0 && selectedLevel.value === "") { // 부위 미선택 && 난이도 미선택: 전체 출력
    routineList.value = store.routineList;
  } else if (selectedParts.value.length !== 0 && selectedLevel.value === ""){ // 부위 선택 && 난이도 미선택
    routineList.value = store.routineList.filter((el) => selectedParts.value.includes(el.part));
  } else if (selectedParts.value.length !== 0 && selectLevel.value !== "") { // 부위 선택 && 난이도 선택
    routineList.value = store.routineList.filter((el) => el.level == selectedLevel.value.charAt(5)).filter((el) => selectedParts.value.includes(el.part));
  } else { // 부위 미선택 && 난이도 선택
    routineList.value = store.routineList.filter((el) => el.level == selectedLevel.value.charAt(5)).filter((el) => el.part == defaultTxt.value);
  }
}

const selectLevel = function(level) {
  if (selectedParts.value.length == 0) {
    routineList.value = store.routineList.filter((el) => el.level == level);
  } else {
    routineList.value = store.routineList.filter((el) => el.level == level).filter((el) => selectedParts.value.includes(el.part));
  }
}

onMounted(() => {
  routineList.value = store.routineList;
})
</script>

<style scoped>
.routine-title {
  display: flex;
  height: 200px;
  width: 100%;
  align-items: center;
  justify-content: center;
  margin-top: 4rem;
  margin-bottom: 1rem;
  font-size: 40px;
  line-height: 60px;
  text-align: center;
}

.routine-select {
  display: flex;
  width: 100%;
  height: 100px;
  justify-content: center;
  margin-bottom: 5rem;
}

.routine-part {
  display: flex;
  width: 400px;
  margin-right: 50px;
}

.routine-level {
  display: flex;
  margin-top: 10px;
  justify-content: center;
}

.routine-card {
  display: flex;
  margin: 0 19%;
  justify-content: center;
  flex-wrap: wrap;
  gap: 5rem;
}

/* import */

.select {
  width: fit-content;
  cursor: pointer;
  position: relative;
  transition: 300ms;
  color: white;
  overflow: hidden;
}

.selected {
  background-color: #2a2f3b;
  padding: 5px;
  margin-bottom: 3px;
  border-radius: 5px;
  position: relative;
  z-index: 100000;
  font-size: 15px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.arrow {
  position: relative;
  right: 0px;
  height: 10px;
  transform: rotate(-90deg);
  width: 25px;
  fill: white;
  z-index: 100000;
  transition: 300ms;
}

.options {
  display: flex;
  flex-direction: column;
  border-radius: 5px;
  padding: 5px;
  background-color: #2a2f3b;
  position: relative;
  top: -100px;
  opacity: 0;
  transition: 300ms;
}

.select:hover > .options {
  opacity: 1;
  top: 0;
}

.select:hover > .selected .arrow {
  transform: rotate(0deg);
}

.option {
  border-radius: 5px;
  padding: 5px;
  transition: 300ms;
  background-color: #2a2f3b;
  width: 150px;
  font-size: 15px;
}
.option:hover {
  background-color: #323741;
}

.options input[type="radio"] {
  display: none;
}

.options label {
  display: inline-block;
}
.options label::before {
  content: attr(data-txt);
}

/* .options input[type="radio"]:checked + label {
  display: none;
}

.options input[type="radio"]#all:checked + label {
  display: none;
} */

.select:has(.options input[type="radio"]#all:checked) .selected::before {
  content: attr(data-default);
}
.select:has(.options input[type="radio"]#option-1:checked) .selected::before {
  content: attr(data-one);
}
.select:has(.options input[type="radio"]#option-2:checked) .selected::before {
  content: attr(data-two);
}
.select:has(.options input[type="radio"]#option-3:checked) .selected::before {
  content: attr(data-three);
}

.rating {
  display: flex;
  flex-direction: row-reverse;
  gap: 0.3rem;
  --stroke: #666;
  --fill: #ffc73a;
}

.rating input {
  appearance: unset;
}

.rating label {
  cursor: pointer;
}

.rating svg {
  width: 3rem;
  height: 3rem;
  overflow: visible;
  fill: transparent;
  stroke: var(--stroke);
  stroke-linejoin: bevel;
  stroke-dasharray: 12;
  animation: idle 4s linear infinite;
  transition: stroke 0.2s, fill 0.5s;
}

@keyframes idle {
  from {
    stroke-dashoffset: 24;
  }
}

.rating label:hover svg {
  stroke: var(--fill);
}

.rating input:checked ~ label svg {
  transition: 0s;
  animation: idle 4s linear infinite, yippee 0.75s backwards;
  fill: var(--fill);
  stroke: var(--fill);
  stroke-opacity: 0;
  stroke-dasharray: 0;
  stroke-linejoin: miter;
  stroke-width: 8px;
}

@keyframes yippee {
  0% {
    transform: scale(1);
    fill: var(--fill);
    fill-opacity: 0;
    stroke-opacity: 1;
    stroke: var(--stroke);
    stroke-dasharray: 10;
    stroke-width: 1px;
    stroke-linejoin: bevel;
  }

  30% {
    transform: scale(0);
    fill: var(--fill);
    fill-opacity: 0;
    stroke-opacity: 1;
    stroke: var(--stroke);
    stroke-dasharray: 10;
    stroke-width: 1px;
    stroke-linejoin: bevel;
  }

  30.1% {
    stroke: var(--fill);
    stroke-dasharray: 0;
    stroke-linejoin: miter;
    stroke-width: 8px;
  }

  60% {
    transform: scale(1.2);
    fill: var(--fill);
  }
}
</style>