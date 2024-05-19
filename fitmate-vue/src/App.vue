<template>
  <div> 
    <TheHeaderNav class="header-nav, section"/>
    <RouterView class="router-view" />
    <TheFooter />
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import TheHeaderNav from "@/components/common/TheHeaderNav.vue";
import TheFooter from "@/components/common/TheFooter.vue";
</script>

<style scoped>
*::-webkit-scrollbar {
    display: none;
}

.header-nav {
  height: 100px;
}
</style>
