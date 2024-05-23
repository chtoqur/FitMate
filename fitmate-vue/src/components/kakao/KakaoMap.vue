<template>
  <div>
    <div class="container">
      <div id="map"></div>
      <div v-if="gyms.length !== 0" class="near-title">
        <h3>가까운 헬스장</h3>
        <ul>
          <li
            v-for="(gym, index) in gyms"
            :key="gym.id"
            @click="goToGymDetail(gym.id)"
            class="near-li"
          >
            <div class="gym-link">
              <div class="wrap-info">
                <span class="gym-idx">{{ index + 1 }}</span>
                <div class="wrap-title">
                  <span class="gym-title"
                    >{{ gym.place_name }} - {{ gym.address_name }}</span
                  >
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <button v-if="store.loginUser.id !== ''" @click="showPostCodeLocation">
      내 집 위치
    </button>
    <span v-if="store.loginUser.id !== ''"> | </span>
    <button v-if="store.loginUser.id !== ''" @click="searchGymsByPostCode">
      내 집 주변 헬스장 찾기
    </button>
    <span v-if="store.loginUser.id !== ''"> | </span>
    <button @click="initMap">내위치</button>
    <span> | </span>
    <button @click="searchNearbyGyms">내위치 주변 헬스장 찾기</button>
  </div>
</template>

<script setup>
import { onBeforeMount, onMounted, ref, toRaw } from "vue";
import { useUserStore } from "@/stores/user";

const store = useUserStore();

let map = null;
const gyms = ref([]);

const initMap = function () {
  let myCenter = new kakao.maps.LatLng(37.501294, 127.039604);
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition((position) => {
      // const lat = position.coords.latitude;
      // const lon = position.coords.longitude;
      // myCenter = new kakao.maps.LatLng(lat, lon);
      new kakao.maps.Marker({
        map,
        position: myCenter,
      });
      map.setCenter(myCenter);
    });
  }
  const container = document.getElementById("map");
  const options = {
    center: myCenter,
    level: 3,
  }; // 지도 객체를 등록합니다.
  map = new kakao.maps.Map(container, options);
  // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
  const mapTypeControl = new kakao.maps.MapTypeControl();

  // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

  // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
  const zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
};

//현재위치로 검색
const searchNearbyGyms = function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition((position) => {
      const lat = 37.501294;
      const lon = 127.039604;
      const coords = new kakao.maps.LatLng(lat, lon);

      const places = new kakao.maps.services.Places();
      places.keywordSearch(
        "헬스장",
        function (data, status) {
          if (status === kakao.maps.services.Status.OK) {
            const sortedData = data
              .sort((a, b) => a.distance - b.distance)
              .slice(0, 5);
            gyms.value = sortedData.map((gym) => ({
              id: gym.id,
              place_name: gym.place_name,
              address_name: gym.address_name,
              latlng: [gym.y, gym.x],
            }));

            const gymPositions = gyms.value.map((gym) => ({
              latlng: [gym.latlng[0], gym.latlng[1]],
              gymId: gym.id,
            }));
            displayMarker(gymPositions);
          } else {
            alert("헬스장을 찾을 수 없습니다.");
          }
        },
        { location: coords, radius: 5000 }
      );
    });
  } else {
    alert("현재 위치를 가져올 수 없습니다.");
  }
};

//주소로 검색
const searchGymsByPostCode = function () {
  const geocoder = new kakao.maps.services.Geocoder();
  geocoder.addressSearch(store.loginUser.address, function (result, status) {
    if (status === kakao.maps.services.Status.OK) {
      const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      const places = new kakao.maps.services.Places();
      places.keywordSearch(
        "헬스장",
        function (data, status) {
          if (status === kakao.maps.services.Status.OK) {
            const sortedData = data
              .sort((a, b) => a.distance - b.distance)
              .slice(0, 5);
            gyms.value = sortedData.map((gym) => ({
              id: gym.id,
              place_name: gym.place_name,
              address_name: gym.address_name,
              latlng: [gym.y, gym.x],
            }));

            const gymPositions = gyms.value.map((gym) => ({
              latlng: [gym.latlng[0], gym.latlng[1]],
              gymId: gym.id,
            }));
            displayMarker(gymPositions);
          } else {
            alert("헬스장을 찾을 수 없습니다.");
          }
        },
        { location: coords, radius: 5000 }
      );
    } else {
      alert("집 주소에 해당하는 위치를 찾을 수 없습니다.");
    }
  });
};

// 카카오맵 사이트에서 해당 헬스장 띄워버리기
const goToGymDetail = function (gymId) {
  const url = `https://place.map.kakao.com/${gymId}`;
  window.open(url, "_blank");
};

onMounted(() => {
  if (window.kakao && window.kakao.maps) {
    searchNearbyGyms();
  } else {
    const script = document.createElement("script");
    script.src = `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${
      import.meta.env.VITE_KAKAO_API_KEY
    }&libraries=services`;
    script.addEventListener("load", () => {
      kakao.maps.load(() => {
        initMap();
        searchNearbyGyms();
      });
    });
    document.head.appendChild(script);
  }
});

const myMarkerPosition = ref([[37.501294, 127.039604]]);

const markers = ref([]);

const displayMarker = function (markerPositions) {
  // 기존 마커 지우기
  if (markers.value.length > 0) {
    markers.value.forEach((marker) => marker.setMap(null));
  }

  const positions = markerPositions.map((position) => ({
    latlng: new kakao.maps.LatLng(...position.latlng),
    gymId: position.gymId,
  }));

  if (positions.length > 0) {
    markers.value = positions.map((position) => {
      const marker = new kakao.maps.Marker({
        map: toRaw(map),
        position: position.latlng,
      });

      kakao.maps.event.addListener(marker, "click", () => {
        goToGymDetail(position.gymId);
      });

      return marker;
    });

    const bounds = positions.reduce(
      (bounds, position) => bounds.extend(position.latlng),
      new kakao.maps.LatLngBounds()
    );

    toRaw(map).setBounds(bounds);
  }
};
</script>

<style scoped>
.container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  text-align: center;
  margin-top: 50px;
}

#map {
  width: 500px;
  height: 400px;
}

h3 {
  border: 1px solid black;
  border-radius: 7px;
  padding: 10px;
}

h3:hover {
  cursor: default;
}

.gym-link {
  display: flex;
  height: 50px;
  width: 100%;
  justify-content: space-between;
  align-items: center;
  color: black;
  text-decoration: none;
}

.near-li {
  display: flex;
  width: 500px;
  border-bottom: 1px solid rgb(206, 205, 205);
}

.near-li:hover {
  background-color: rgb(236, 236, 236);
}

.wrap-info {
  display: flex;
  width: 80%;
}

.wrap-title {
  display: flex;
  text-align: center;
  align-items: center;
}

.gym-idx {
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: bold;
  width: 45px;
}

.gym-title {
  line-height: 18px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  height: 1.1em;
  -webkit-box-orient: vertical;
  white-space: initial;
}
</style>
