<template>
  <div id="nav-container">
    <nav :class="{ 'nav-sticky': isSticky }">
      <div class="header-inner">
        <!-- logo -->
        <div class="nav-left">
          <RouterLink to="/" class="nav-left-el">
            <img src= '../../assets/img/logo.png' alt="" class="nav-logo">
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
          <RouterLink
            to="/loginAndSignup"
            v-if="store.loginUser.id === ''"
            class="nav-right-el"
          >
            <span class="mdi mdi-login">&nbsp;Login</span>
          </RouterLink>
          <RouterLink
            to="/mypage"
            v-if="store.loginUser.id !== ''"
            class="nav-right-el"
          >
            <span class="mdi mdi-account-circle">&nbsp;Mypage</span>
          </RouterLink>
          <a
            v-if="store.loginUser.id !== ''"
            @click="store.logout"
            class="nav-right-el"
          >
            <span class="mdi mdi-logout">&nbsp;Logout</span>
          </a>
        </div>
      </div>
    </nav>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, onMounted, onUnmounted, computed } from "vue";
import { useRoute } from "vue-router";

const store = useUserStore();
const route = useRoute();

const isSticky = ref(false);
const isMainVue = computed(()=>{
  return window.location.pathname == "/";
})

const handleScroll = () => {
  isSticky.value = window.scrollY > 0;
};

const logoSrc = computed(()=>{
  // return isSticky.value ? '../../assets/img/logo-dark.png' : '../../assets/img/logo.png';
})

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
  handleScroll(); // 컴포넌트가 마운트될 때 초기 스크롤 위치 설정
  console.log(route.path);
  console.log(window.location.pathname);
});

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll);
});

</script>

<style scoped>
* {
  text-decoration: none;
}

#nav-container {
  position: fixed;
  width: 100%;
  height: 100px;
  font-size: 17px;
  font-weight: 600;
  border-bottom: 1px solid rgb(209, 209, 209);

  z-index: 100;
}

.mdi {
  margin-right: 5px;
}

nav {
  height: 100%;
}

.header-inner {
  display: flex;
  height: 100%;
  width: 100%;
  justify-content: space-between;
  margin: 0 19%;
}

.nav-left,
.nav-ul,
.nav-right {
  display: flex;
  gap: 20px;
  align-items: center;
}

.nav-logo {
  width: 150px;
}

.nav-ul {
  height: 100%;
  gap: 40px;
}

.nav-left-el,
.nav-left-el span,
.nav-ul li,
.nav-ul-el,
.nav-ul-el span,
.nav-right-el,
.nav-right-el span {
  display: flex;
  height: 100%;
  align-items: center;
}

nav {
  display: flex;
  align-items: center;
}

.nav-left span,
.nav-ul span,
.nav-right span {
  color: rgb(255, 255, 255);
  text-decoration: none;
  transition: color 0.3s ease;
  letter-spacing: 2px;
}

.nav-right {
  cursor: pointer;
}

.nav-left span:hover,
.nav-ul span:hover,
.nav-right span:hover {
  color: rgb(163, 200, 240);
  stroke: rgb(163, 200, 240);
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

.nav-sticky {
  position: fixed;
  height: 100px;
  width: 100%;
  background-color: white;
  border-bottom: 1px solid rgb(183, 183, 183);

  /* 필터 코드 */
  -webkit-backdrop-filter: saturate(180%) blur(15px);
  -moz-backdrop-filter: saturate(180%) blur(15px);
  -o-backdrop-filter: saturate(180%) blur(15px);
  backdrop-filter: saturate(180%) blur(15px);
}
.nav-sticky .nav-left span,
.nav-sticky .nav-ul span,
.nav-sticky .nav-right span
{
  color: rgb(100, 100, 100);
}

.nav-sticky .nav-left span:hover,
.nav-sticky .nav-ul span:hover,
.nav-sticky .nav-right span:hover
{
  color: rgb(118, 177, 240);
  stroke: rgb(134, 173, 213);
}
</style>
