<template>
  <div id="container">
    <header>
      <nav>
        <RouterLink to="/">Home | </RouterLink>
        <RouterLink to="/video">Video | </RouterLink>
        <RouterLink to="/routine">Routine | </RouterLink>
        <RouterLink to="/community">Community | </RouterLink>
        <RouterLink to="/login" v-if="store.loginUser.id === ''"
          >Login |
        </RouterLink>
        <RouterLink to="/mypage" v-if="store.loginUser.id !== ''"
          >MyPage |
        </RouterLink>
        <a v-if="store.loginUser.id !== ''" @click="store.logout">Logout</a>
      </nav>
    </header>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";

const store = useUserStore();
</script>

<style scoped>
#container {
  font-size: large;
  text-align: center;
  background-color: grey;
  height: 33px;
}

nav a {
  font-weight: bold;
  text-decoration: none;
  color: white;
}

nav a.router-link-exact-active {
  color: black;
}

nav a:hover {
  cursor: pointer;
}

button {
  border: none;
  background-color: grey;
  color: black;
  font-size: large;
}
</style>
