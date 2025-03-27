<script setup>
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

const route = useRoute();
const memoria = ref(null);

async function carregarMemoria() {
  try {
    const memoriasData = await import("@/data/memorias.json");
    memoria.value = memoriasData.default.find(p => p.id === Number(route.params.id));
    console.log(memoria.value)
  } catch (error) {
    console.error("Memória não encontrada!", error);
  }
}

onMounted(carregarMemoria);
</script>

<template>
  <div class="p-4 md:p-20">
    <div class="border-8 border-[#E9B86C] text-[#2E2E2E] space-y-6 flex flex-col">
      <div v-if="memoria" class="custom-bg p-6 flex flex-col">
        <h1 class="text-3xl font-bold">{{ memoria.titulo }}</h1>
        <p class="text-lg mt-2">{{ memoria.descricao }}</p>
        <!-- Carrossel de Imagens -->
        <Swiper :modules="[Navigation, Pagination]" :spaceBetween="10" :slidesPerView="1" :navigation="true"
          :pagination="true" class="mt-2 max-w-full max-h-[80vh] mx-auto">
          <SwiperSlide v-for="(imagem, index) in memoria.imagens" :key="index" class="flex items-center justify-center mt-6">
            <img :src="imagem" alt="Imagem da memória" class="w-max h-max object-contain rounded z-30" />
          </SwiperSlide>
        </Swiper>

        <p class="text-sm text-gray-500 mt-4">Data: {{ memoria.data }}</p>
      </div>
      <p v-else>Carregando memória...</p>
    </div>
  </div>
</template>

<style>
/* Estilizando as setas do Swiper */
.swiper-button-prev,
.swiper-button-next {
  color: #2e2e2e;
  /* Cor das setas */
  border-radius: 50%;
  /* Botões redondos */
  padding: 3vh;
  /* Espaçamento para tornar os botões maiores */
}

/* Efeito ao passar o mouse */
.swiper-button-prev:hover,
.swiper-button-next:hover {
  color: #000;
  /* Cor branca das setas no hover */
}

/* Estilo da paginação */
.swiper-pagination-bullet {
  background-color: #F6EFBD;
  /* Cor das bolinhas da paginação */
  border-color: 2px solid #000;
  opacity: 0.5;
}

.swiper-pagination-bullet-active {
  background-color: #E9B86C;
  /* Cor da bolinha ativa */
  opacity: 1;
}

.custom-bg {
  background-color: #F6EFBD !important;
  /* Override the gradient background */
}
</style>
