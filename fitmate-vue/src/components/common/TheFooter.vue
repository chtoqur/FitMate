<template>
  <div class="footer-container">
    <div class="footer-wrap">
      <div class="footer-name">
        <img src="../../assets/img/logo-dark-crop.png" alt="">
      </div>
      <div class="footer-rights">
        ⓒ SSAFY Lee Kanghyun, Choi Iseo ALL RIGHTS RESERVED.
      </div>
      <div class="footer-policy">
        개인정보처리방침
      </div>
    </div>
  </div>
</template>

<script setup>

</script>

<style scoped>
.footer-container {
  display: flex;
  width: 100%;
  height: 200px;
  align-items: center;
  gap: 0.5em;
  margin-top: 60px;
  background-color: rgb(247, 247, 247);
}

.footer-wrap {
  margin: 0 19%;
}

.footer-name {
  display: flex;
  margin-bottom: 30px;
}

.footer-name img {
  width: 130px;
}

.footer-rights {
  font-size: 14px;
  color: rgb(99, 99, 99);
  margin-bottom: 10px;
}

.footer-policy {
  color: rgb(92, 92, 92);
  font-weight: 600;
}
</style>