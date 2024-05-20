<template>
  <div class="app-container">
    <TheHeaderNav class="header-nav" />
    <RouterView class="router-view" />
    <TheFooter class="footer-section" />
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import TheHeaderNav from "@/components/common/TheHeaderNav.vue";
import TheFooter from "@/components/common/TheFooter.vue";
</script>

<style scoped>
*::-webkit-scrollbar {
  display: none;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.header-nav {
  height: 100px;
}

.router-view {
  flex: 1;
}

.footer-section {
  height: 100px;
}
</style>
