<template>
  <div class="footer-container">
    <a href="#">개인정보처리방침</a>
    <a href="#">이용약관</a>
    <a href="#">오시는 길</a>
    <span>ⓒ SSAFY 이강현, 최이서</span>
  </div>
</template>

<script setup>

</script>

<style scoped>
.footer-container {
  display: flex;
  width: 100%;
  height: 100px;
  justify-content: center;
  align-items: center;
  gap: 0.5em;
  margin-top: 100px;

  border: 1px solid blue
}

a {
  text-decoration: none;
  color: black;
}
</style>