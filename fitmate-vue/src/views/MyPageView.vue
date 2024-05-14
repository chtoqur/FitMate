<template>
  <div>
    <p>{{ store.loginUser.img }}</p>
    <p>{{ store.loginUser.id }}</p>
    <p>{{ store.loginUser.name }}</p>
    <p>{{ store.loginUser.nickname }}</p>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";

const store = useUserStore();
</script>

<style scoped></style>
