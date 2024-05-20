<template>
  <div id="nav-container">
    <header>
      <div class="header-inner">
        <!-- logo -->
        <div class="nav-left">
          <RouterLink to="/" class="nav-left-el">
            <span>Home</span>
          </RouterLink>
        </div>
        <!-- navigation -->
        <nav>
          <ul class="nav-ul">
            <li>
              <RouterLink to="/video" class="nav-ul-el">
                <span>Training Guide</span>
              </RouterLink>
            </li>
            <li>
              <RouterLink to="/routine" class="nav-ul-el">
                <span>Routine</span>
              </RouterLink>
            </li>
            <li>
              <RouterLink to="/community" class="nav-ul-el">
                <span>Community</span>
              </RouterLink>
            </li>
          </ul>
        </nav>
        <!-- login/logout / mypage -->
        <div class="nav-right">
          <RouterLink to="/login" v-if="store.loginUser.id === ''" class="nav-right-el">
            <span class="mdi mdi-login">&nbsp;Login</span>
          </RouterLink>
          <RouterLink to="/mypage" v-if="store.loginUser.id !== ''" class="nav-right-el">
            <span class="mdi mdi-account-circle">&nbsp;Mypage</span>
          </RouterLink>
          <a v-if="store.loginUser.id !== ''" @click="store.logout" class="nav-right-el">
            <span class="mdi mdi-logout">&nbsp;Logout</span>
          </a>
        </div>
      </div>
    </header>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { onMounted, ref } from 'vue';

const store = useUserStore();
</script>

<style scoped>
* {
  text-decoration: none;
}

#nav-container {
  height: 100px;
  font-size: 17px;
  font-weight: 600;
  border-bottom: 1px solid black;
}

.mdi {
  margin-right: 5px;
}

header {
  height: 100%;
}

.header-inner {
  display: flex;
  height: 100%;
  justify-content: space-between;
  margin: 0 19%;
}

.nav-left, .nav-ul, .nav-right {
  display: flex;
  gap: 20px;
  align-items: center;
}

.nav-ul {
  height: 100%;
  gap: 40px;
}

.nav-left-el, .nav-left-el span, .nav-ul li, .nav-ul-el, .nav-ul-el span, .nav-right-el, .nav-right-el span {
  display: flex;
  height: 100%;
  align-items: center;
}

nav {
  display: flex;
  align-items: center;
}

.nav-left span, .nav-ul span, .nav-right span {
  color: black;
  text-decoration: none;
  transition: color 0.3s ease;
}

.nav-right {
  cursor: pointer;
}

.nav-left span:hover, .nav-ul span:hover, .nav-right span:hover {
  color: rgb(118, 159, 205);
}

button {
  border: none;
  background-color: grey;
  color: black;
}

.router-link-active span {
  color: rgb(118, 159, 205);
}

/* sticky */

.nav-sticky .nav-links {
position: fixed;
/* width: 90%; */

/* 필터 코드 */
/* -webkit-backdrop-filter: saturate(180%) blur(15px);
-moz-backdrop-filter: saturate(180%) blur(15px);
-o-backdrop-filter: saturate(180%) blur(15px);
backdrop-filter: saturate(180%) blur(15px); */
}
</style>
